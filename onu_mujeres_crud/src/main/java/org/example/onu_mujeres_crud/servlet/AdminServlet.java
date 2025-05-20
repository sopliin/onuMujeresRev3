package org.example.onu_mujeres_crud.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.onu_mujeres_crud.beans.Distrito;
import org.example.onu_mujeres_crud.beans.Rol;
import org.example.onu_mujeres_crud.beans.Usuario;
import org.example.onu_mujeres_crud.beans.Zona;
import org.example.onu_mujeres_crud.daos.DistritoDAO;
import org.example.onu_mujeres_crud.daos.UsuarioAdminDao;
import org.example.onu_mujeres_crud.daos.ZonaDAO;

import java.io.IOException;
import java.sql.SQLException;
//Hola :D
@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        RequestDispatcher view;
        UsuarioAdminDao usuarioDAO = new UsuarioAdminDao();
        DistritoDAO distritoDAO = new DistritoDAO();
        ZonaDAO zonaDAO = new ZonaDAO();
        switch (action) {
            case "lista":
                request.setAttribute("listaUsuarios", usuarioDAO.listarUsuariosAsAdmin());
                view = request.getRequestDispatcher("admin/lista.jsp");
                view.forward(request, response);
                break;
            case "agregar":
                request.setAttribute("listaCoordinadores",usuarioDAO.listarUsuariosAsAdmin());
                request.setAttribute("listaZonas", zonaDAO.obtenerListaZonas());
                request.setAttribute("listaDistritos", distritoDAO.obtenerListaDistritos());
                view = request.getRequestDispatcher("admin/formularioNuevo.jsp");
                view.forward(request, response);
                break;
            case "desactivar":
                if(request.getParameter("id") != null) {
                    int usuarioId = 0;
                    try {
                        usuarioId = Integer.parseInt(request.getParameter("id"));
                    }
                    catch(NumberFormatException e) {
                        response.sendRedirect("AdminServlet");
                    }

                    if(usuarioId != 0) {
                        usuarioDAO.desactivarUsuario(usuarioId);
                    }
                }
                response.sendRedirect("AdminServlet");
                break;
            case "activar":
                if(request.getParameter("id") != null) {
                    int usuarioId = 0;
                    try {
                        usuarioId = Integer.parseInt(request.getParameter("id"));
                    }
                    catch(NumberFormatException e) {
                        response.sendRedirect("AdminServlet");
                    }

                    if(usuarioId != 0) {
                        usuarioDAO.activarUsuario(usuarioId);
                    }
                }
                response.sendRedirect("AdminServlet");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        UsuarioAdminDao usuarioDAO = new UsuarioAdminDao();
        Usuario usuario = new Usuario();

        usuario.setNombre(request.getParameter("nombre"));
        usuario.setApellidoPaterno(request.getParameter("apellidoPaterno"));
        usuario.setApellidoMaterno(request.getParameter("apellidoMaterno"));
        usuario.setDni(request.getParameter("dni"));
        usuario.setCorreo(request.getParameter("correo"));

        Rol rol = new Rol();
        rol.setRolId(2);    //Rol de Coordinador
        usuario.setRol(rol);

        //Capturar zona-id desde el form
        Zona zona = new Zona();
        zona.setZonaId(Integer.parseInt(request.getParameter("zonaId")));
        usuario.setZona(zona);

        //Capturar Distrito-id desde el form
        Distrito distrito = new Distrito();
        distrito.setDistritoId(Integer.parseInt(request.getParameter("distritoId")));
        usuario.setDistrito(distrito);

        try {
            //Validar dni unico
            if(usuarioDAO.existeDNI(usuario.getDni())) {
                request.setAttribute("error", "Ya existe un Coordinador Interno con ese DNI.");
                request.getRequestDispatcher("admin/formularioNuevo.jsp").forward(request, response);
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al registrar nuevo coordinador");
            request.getRequestDispatcher("admin/formularioNuevo.jsp").forward(request, response);
        }

        switch (action) {
            case "guardar":
                usuarioDAO.registrarCoordinador(usuario);
                response.sendRedirect("AdminServlet");
                break;
        }

    }
}
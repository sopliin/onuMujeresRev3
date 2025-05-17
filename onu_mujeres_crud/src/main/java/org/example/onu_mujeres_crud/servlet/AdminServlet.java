package org.example.onu_mujeres_crud.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.onu_mujeres_crud.beans.Distrito;
import org.example.onu_mujeres_crud.beans.Rol;
import org.example.onu_mujeres_crud.beans.Usuario;
import org.example.onu_mujeres_crud.daos.UsuarioDAO;

import java.io.IOException;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        RequestDispatcher view;
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        switch (action) {
            case "lista":
                request.setAttribute("listaUsuarios", usuarioDAO.listarUsuariosAsAdmin());
                view = request.getRequestDispatcher("admin/lista.jsp");
                view.forward(request, response);
                break;
            case "agregar":
                request.setAttribute("listaCoordinadores",usuarioDAO.listarUsuariosAsAdmin());
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
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = new Usuario();
        usuario.setNombre(request.getParameter("nombre"));
        usuario.setApellidoPaterno(request.getParameter("apellidoPaterno"));
        usuario.setApellidoMaterno(request.getParameter("apellidoMaterno"));
        usuario.setDni(request.getParameter("dni"));
        usuario.setCorreo(request.getParameter("correo"));

        Rol rol = new Rol();
        rol.setRolId(Integer.parseInt(request.getParameter("rolId")));
        usuario.setRol(rol);
    }
}
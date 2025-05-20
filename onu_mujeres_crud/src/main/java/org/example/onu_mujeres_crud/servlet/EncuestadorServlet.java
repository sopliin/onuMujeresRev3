package org.example.onu_mujeres_crud.servlet;

import org.mindrot.jbcrypt.BCrypt;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.util.*;

import org.example.onu_mujeres_crud.beans.Distrito;
import org.example.onu_mujeres_crud.beans.Rol;
import org.example.onu_mujeres_crud.beans.Usuario;
import org.example.onu_mujeres_crud.beans.Zona;
import org.example.onu_mujeres_crud.daos.DistritoDAO;
import org.example.onu_mujeres_crud.daos.EncuestadorDao;
import org.example.onu_mujeres_crud.daos.UsuarioAdminDao;
import org.example.onu_mujeres_crud.daos.ZonaDAO;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EncuestadorServlet", value = "/EncuestadorServlet")
public class EncuestadorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "listar";
        EncuestadorDao usuarioDAO = new EncuestadorDao();
        DistritoDAO distritoDAO = new DistritoDAO();
        RequestDispatcher view;

        switch (action) {
            case "nuevo":
                ArrayList<Distrito> distritos = distritoDAO.obtenerListaDistritos();
                request.setAttribute("distritos", distritos);
                view = request.getRequestDispatcher("encuestador/nuevoUsuario.jsp");

                view.forward(request, response);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Usuario usuarioEditar = usuarioDAO.obtenerUsuario(idEditar);
                if (usuarioEditar != null) {
                    // Obtener lista de distritos para el select
                    ArrayList<Distrito> distritosEditar = distritoDAO.obtenerListaDistritos();
                    request.setAttribute("distritos", distritosEditar);
                    request.setAttribute("usuario", usuarioEditar);
                    view = request.getRequestDispatcher("encuestador/editarUsuario.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/EncuestadorServlet");
                }
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                usuarioDAO.eliminarUsuario(idEliminar);
                response.sendRedirect(request.getContextPath() + "/EncuestadorServlet");
                break;
            case "ver":
                int idVer = Integer.parseInt(request.getParameter("id"));
                Usuario usuarioVer = usuarioDAO.obtenerUsuario(idVer);
                if (usuarioVer != null) {
                    request.setAttribute("usuario", usuarioVer);
                    view = request.getRequestDispatcher("encuestador/verUsuario.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/EncuestadorServlet");
                }
                break;

            default: // listar
                ArrayList<Usuario> listaUsuarios = usuarioDAO.listarUsuarios();
                request.setAttribute("lista", listaUsuarios);
                view = request.getRequestDispatcher("encuestador/listaUsuarios.jsp");
                view.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        EncuestadorDao usuarioDAO = new EncuestadorDao();

        if ("guardar".equals(action)) {
            // Lógica para crear o actualizar usuario
            Usuario usuario = new Usuario();

            // Solo para edición
            if (request.getParameter("usuario_id") != null && !request.getParameter("usuario_id").isEmpty()) {
                usuario.setUsuarioId(Integer.parseInt(request.getParameter("usuario_id")));
            }

            // Campos comunes
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellidoPaterno(request.getParameter("apellido_paterno"));
            usuario.setApellidoMaterno(request.getParameter("apellido_materno"));
            usuario.setDni(request.getParameter("dni"));
            usuario.setCorreo(request.getParameter("email"));
            usuario.setDireccion(request.getParameter("direccion"));

            // Solo para nuevo usuario
            if ("nuevo".equals(request.getParameter("tipo"))) {
                if (usuario.getRol() == null) {
                    usuario.setRol(new Rol());
                }

                // Ahora es seguro llamar a setRolId()
                usuario.getRol().setRolId(Integer.parseInt(request.getParameter("rol_id")));
                usuario.setContrasenaHash(hashPassword(request.getParameter("contrasena")));
            }

            // Solo para edición de contraseña
            if (request.getParameter("cambiar_contrasena") != null &&
                    request.getParameter("cambiar_contrasena").equals("1") &&
                    !request.getParameter("nueva_contrasena").isEmpty()) {
                usuario.setContrasenaHash(hashPassword(request.getParameter("nueva_contrasena")));
            }

            // Distrito


            String distritoIdParam = request.getParameter("distrito_id");
            if (distritoIdParam != null && !distritoIdParam.isEmpty()) {
                Distrito distrito = new Distrito();
                distrito.setDistritoId(Integer.parseInt(distritoIdParam));
                usuario.setDistrito(distrito);
            }

            // Guardar en BD
            if (usuario.getUsuarioId() == 0) {
                usuarioDAO.crearUsuario(usuario);
            } else {
                usuarioDAO.actualizarUsuario(usuario);
            }

        }

        response.sendRedirect(request.getContextPath() + "/EncuestadorServlet");

    }

    private String hashPassword(String password) {
        // Usar BCrypt para hashear la contraseña
        return BCrypt.hashpw(password, BCrypt.gensalt(12));
    }
}
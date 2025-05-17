package org.example.onu_mujeres_crud.servlet;

import org.example.onu_mujeres_crud.beans.Usuario;
import org.example.onu_mujeres_crud.daos.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AuthServlet", value = "/auth")
public class AuthServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        String url = "jdbc:mysql://localhost:3306/onu_mujeres?serverTimezone=America/Lima";
        String user = "root";
        String pass = "root";
        usuarioDAO = new UsuarioDAO(url, user, pass);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            // Redirigir a la página de inicio de sesión por defecto
            response.sendRedirect("login.jsp");
            return;
        }

        switch (action) {
            case "logout":
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                response.sendRedirect("login.jsp?logout=true");
                break;
            default:
                response.sendRedirect("login.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        switch (action) {
            case "login":
                String correoLogin = request.getParameter("correo");
                String contrasenaLogin = request.getParameter("contrasena");
                Usuario usuario = usuarioDAO.iniciarSesion(correoLogin, contrasenaLogin);

                if (usuario != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("usuarioId", usuario.getUsuarioId());
                    session.setAttribute("rolId", usuario.getRolId());
                    session.setAttribute("nombreUsuario", usuario.getNombre());

                    // Redirigir según el rol del usuario
                    switch (usuario.getRolId()) {
                        case 1: // Coordinador
                            response.sendRedirect("coordinador_encuestas.jsp");
                            break;
                        case 2: // Administrador
                            response.sendRedirect("administrador_coordinadores.jsp");
                            break;
                        case 3: // Encuestador
                            response.sendRedirect("encuestador_encuestas.jsp");
                            break;
                        default:
                            response.sendRedirect("iniciar_sesion.jsp"); // Página por defecto si el rol no coincide
                            break;
                    }
                } else {
                    request.setAttribute("errorLogin", "Correo o contraseña incorrectos");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                break;

            case "register":
                String nombreRegistro = request.getParameter("nombre");
                String correoRegistro = request.getParameter("correo");
                String contrasenaRegistro = request.getParameter("contrasena");

                if (usuarioDAO.registrarUsuario(nombreRegistro, correoRegistro, contrasenaRegistro)) {
                    request.setAttribute("registroExito", "Registro exitoso. Ahora puedes iniciar sesión.");
                    request.getRequestDispatcher("registro.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorRegistro", "Error al registrar el usuario.");
                    request.getRequestDispatcher("registro.jsp").forward(request, response);
                }
                break;

            default:
                response.sendRedirect("login.jsp");
                break;
        }
    }
}
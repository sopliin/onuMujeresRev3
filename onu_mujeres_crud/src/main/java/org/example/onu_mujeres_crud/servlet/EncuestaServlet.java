package org.example.onu_mujeres_crud.servlet;

import org.example.onu_mujeres_crud.beans.Respuesta;
import org.example.onu_mujeres_crud.daos.EncuestaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EncuestaServlet", value = "/encuesta")
public class EncuestaServlet extends HttpServlet {

    private EncuestaDAO encuestaDAO;

    @Override
    public void init() throws ServletException {
        String url = "jdbc:mysql://localhost:3306/onu_mujeres?serverTimezone=America/Lima";
        String user = "root";
        String pass = "root";
        encuestaDAO = new EncuestaDAO(url, user, pass);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            // Redirigir a una página por defecto o mostrar un error
            response.getWriter().println("Acción no especificada");
            return;
        }

        switch (action) {
            case "cargarPreguntas":
                cargarPreguntasEncuesta(request, response);
                break;
            default:
                response.getWriter().println("Acción no válida");
                break;
        }
    }

    private void cargarPreguntasEncuesta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioId") == null || session.getAttribute("rolId") == null) {
            response.sendRedirect("login.jsp"); // Redirigir si no hay sesión activa
            return;
        }

        Integer usuarioId = (Integer) session.getAttribute("usuarioId");
        Integer rolId = (Integer) session.getAttribute("rolId");

        // Verificar si el usuario tiene permiso para cargar preguntas (ej: rol de encuestador o coordinador)
        if (rolId == 3 || rolId == 2) {
            String encuestaIdParam = request.getParameter("encuestaId");
            String dniEncuestado = request.getParameter("dniEncuestado");
            String asignacionIdParam = request.getParameter("asignacionId");

            if (encuestaIdParam != null && !encuestaIdParam.isEmpty() && dniEncuestado != null && !dniEncuestado.isEmpty() && asignacionIdParam != null && !asignacionIdParam.isEmpty()) {
                try {
                    int encuestaId = Integer.parseInt(encuestaIdParam);
                    int asignacionId = Integer.parseInt(asignacionIdParam);

                    // 1. Crear una nueva respuesta en la tabla 'respuestas'
                    Respuesta nuevaRespuesta = encuestaDAO.crearRespuesta(encuestaId, usuarioId, dniEncuestado, asignacionId);

                    if (nuevaRespuesta != null) {
                        int respuestaId = nuevaRespuesta.getRespuestaId();

                        // 2. Obtener las preguntas asociadas a la encuesta desde 'preguntas_encuesta'
                        List<Integer> preguntaIds = encuestaDAO.obtenerPreguntasDeEncuesta(encuestaId);

                        // 3. Guardar la relación entre la respuesta y cada pregunta en 'respuestas_detalle'
                        for (Integer preguntaId : preguntaIds) {
                            encuestaDAO.guardarRespuestaDetalle(respuestaId, preguntaId);
                        }

                        // Redirigir a la página donde se mostrarán las preguntas para responder
                        response.sendRedirect("responder_encuesta.jsp?respuestaId=" + respuestaId + "&encuestaId=" + encuestaId);

                    } else {
                        request.setAttribute("error", "Error al iniciar la encuesta.");
                        // Redirigir o mostrar un mensaje de error
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }

                } catch (NumberFormatException e) {
                    request.setAttribute("error", "ID de encuesta o asignación no válido.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Parámetros de encuesta o DNI faltantes.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            response.getWriter().println("No tiene permisos para realizar esta acción.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Aquí se manejarían las acciones de guardar las respuestas de la encuesta
        // (esto requerirá otro método en el DAO y lógica en el Servlet)
        response.getWriter().println("Manejo de guardado de respuestas (POST)");
    }
}
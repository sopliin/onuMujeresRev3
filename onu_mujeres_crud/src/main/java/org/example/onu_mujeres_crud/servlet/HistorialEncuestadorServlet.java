package org.example.onu_mujeres_crud.servlet;

import org.example.onu_mujeres_crud.daos.HistorialAccionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HistorialEncuestadorServlet", value = "/encuestador/historial")
public class HistorialEncuestadorServlet extends HttpServlet {

    private HistorialAccionDAO historialAccionDAO;

    @Override
    public void init() throws ServletException {
        String url = "jdbc:mysql://localhost:3306/onu_mujeres?serverTimezone=America/Lima";
        String user = "root";
        String pass = "root";
        historialAccionDAO = new HistorialAccionDAO(url, user, pass);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioId") == null || (Integer) session.getAttribute("rolId") != 3) {
            response.sendRedirect("../login.jsp"); // Redirigir si no hay sesión activa o no es encuestador
            return;
        }

        int encuestadorId = (Integer) session.getAttribute("usuarioId");
        List<Object[]> historialPerfil = historialAccionDAO.obtenerHistorialPerfilEncuestador(encuestadorId);
        List<Object[]> historialEncuestas = historialAccionDAO.obtenerHistorialEncuestasRealizadasEncuestador(encuestadorId);

        List<String[]> historialPerfilFormateado = new ArrayList<>();
        for (Object[] logEntry : historialPerfil) {
            String accion = (String) logEntry[0];
            String entidad = (String) logEntry[1];
            String detalle = (String) logEntry[2];
            LocalDateTime fechaLog = (LocalDateTime) logEntry[3];
            String tiempoTranscurrido = historialAccionDAO.calcularTiempoTranscurrido(fechaLog);
            historialPerfilFormateado.add(new String[]{accion, entidad, detalle, tiempoTranscurrido});
        }

        List<String[]> historialEncuestasFormateado = new ArrayList<>();
        for (Object[] encuestaInfo : historialEncuestas) {
            String nombreEncuesta = (String) encuestaInfo[0];
            String estado = (String) encuestaInfo[1];
            LocalDateTime fechaEnvio = (LocalDateTime) encuestaInfo[2];
            String tiempoTranscurrido = fechaEnvio != null ? historialAccionDAO.calcularTiempoTranscurrido(fechaEnvio) : "Sin fecha de envío";
            historialEncuestasFormateado.add(new String[]{nombreEncuesta, estado, tiempoTranscurrido});
        }

        request.setAttribute("historialPerfil", historialPerfilFormateado);
        request.setAttribute("historialEncuestas", historialEncuestasFormateado);
        request.getRequestDispatcher("historial_encuestador.jsp").forward(request, response);
    }

    // No se espera un doPost para ver el historial (solo lectura)
}
package org.example.onu_mujeres_crud.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class HistorialAccionDAO {

    private String url;
    private String user;
    private String pass;

    public HistorialAccionDAO(String url, String user, String pass) {
        this.url = url;
        this.user = user;
        this.pass = pass;
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, pass);
    }

    public List<Object[]> obtenerHistorialPerfilEncuestador(int encuestadorId) {
        List<Object[]> historial = new ArrayList<>();
        String sql = "SELECT accion, entidad, detalle, fecha_log " +
                "FROM logs_actividades " +
                "WHERE usuario_id = ? AND (accion LIKE 'Update%' OR entidad = 'usuarios') " +
                "ORDER BY fecha_log DESC";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, encuestadorId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Object[] logEntry = new Object[4];
                    logEntry[0] = rs.getString("accion");
                    logEntry[1] = rs.getString("entidad");
                    logEntry[2] = rs.getString("detalle");
                    logEntry[3] = rs.getTimestamp("fecha_log").toLocalDateTime();
                    historial.add(logEntry);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historial;
    }

    public String calcularTiempoTranscurrido(LocalDateTime fechaLog) {
        LocalDateTime ahora = LocalDateTime.now();
        Duration diferencia = Duration.between(fechaLog, ahora);
        long segundos = diferencia.toSecondsPart();
        long minutos = diferencia.toMinutesPart();
        long horas = diferencia.toHoursPart();
        long dias = diferencia.toDaysPart();

        StringBuilder tiempoTranscurrido = new StringBuilder();
        if (dias > 0) {
            tiempoTranscurrido.append(dias).append(" día").append(dias > 1 ? "s " : " ");
        }
        if (horas > 0) {
            tiempoTranscurrido.append(horas).append(" hora").append(horas > 1 ? "s " : " ");
        }
        if (minutos > 0) {
            tiempoTranscurrido.append(minutos).append(" minuto").append(minutos > 1 ? "s " : " ");
        }
        if (dias == 0 && horas == 0 && minutos == 0) {
            tiempoTranscurrido.append(segundos).append(" segundo").append(segundos > 1 ? "s" : "");
        }

        return tiempoTranscurrido.toString().trim() + " atrás";
    }

    public List<Object[]> obtenerHistorialEncuestasRealizadasEncuestador(int encuestadorId) {
        List<Object[]> historial = new ArrayList<>();
        String sql = "SELECT e.nombre AS nombre_encuesta, r.estado, r.fecha_envio " +
                "FROM respuestas r " +
                "JOIN encuestas e ON r.encuesta_id = e.encuesta_id " +
                "WHERE r.encuestador_id = ? " +
                "ORDER BY r.fecha_envio DESC";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, encuestadorId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Object[] encuestaInfo = new Object[3];
                    encuestaInfo[0] = rs.getString("nombre_encuesta");
                    encuestaInfo[1] = rs.getString("estado");
                    encuestaInfo[2] = rs.getTimestamp("fecha_envio") != null ? rs.getTimestamp("fecha_envio").toLocalDateTime() : null;
                    historial.add(encuestaInfo);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historial;
    }
}
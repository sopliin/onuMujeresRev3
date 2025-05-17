package org.example.onu_mujeres_crud.daos;

import org.example.onu_mujeres_crud.beans.Respuesta;
import org.example.onu_mujeres_crud.beans.RespuestaDetalle;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EncuestaDAO {

    private String url;
    private String user;
    private String pass;

    public EncuestaDAO(String url, String user, String pass) {
        this.url = url;
        this.user = user;
        this.pass = pass;
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, pass);
    }

    // Método para crear una nueva respuesta para una encuesta
    public Respuesta crearRespuesta(int encuestaId, int encuestadorId, String dniEncuestado, int asignacionId) {
        Respuesta respuesta = null;
        String sql = "INSERT INTO respuestas (encuesta_id, encuestador_id, dni_encuestado, asignacion_id) VALUES (?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, encuestaId);
            pstmt.setInt(2, encuestadorId);
            pstmt.setString(3, dniEncuestado);
            pstmt.setInt(4, asignacionId);

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        respuesta = new Respuesta();
                        respuesta.setRespuestaId(generatedKeys.getInt(1));
                        respuesta.setEncuestaId(encuestaId);
                        respuesta.setEncuestadorId(encuestadorId);
                        respuesta.setDniEncuestado(dniEncuestado);
                        respuesta.setAsignacionId(asignacionId);
                        // Otros campos se inicializarán con los valores por defecto de la BD
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return respuesta;
    }

    // Método para obtener las preguntas de una encuesta desde la tabla preguntas_encuesta
    public List<Integer> obtenerPreguntasDeEncuesta(int encuestaId) {
        List<Integer> preguntaIds = new ArrayList<>();
        String sql = "SELECT pregunta_id FROM preguntas_encuesta WHERE encuesta_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, encuestaId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    preguntaIds.add(rs.getInt("pregunta_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return preguntaIds;
    }

    // Método para guardar la asignación de una pregunta a una respuesta (en respuestas_detalle)
    public boolean guardarRespuestaDetalle(int respuestaId, int preguntaId) {
        String sql = "INSERT INTO respuestas_detalle (respuesta_id, pregunta_id) VALUES (?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, respuestaId);
            pstmt.setInt(2, preguntaId);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para obtener el ID de la última respuesta creada (podría ser útil en algunos casos)
    public Integer obtenerUltimoRespuestaId() {
        Integer ultimoId = null;
        String sql = "SELECT MAX(respuesta_id) FROM respuestas";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                ultimoId = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ultimoId;
    }
}
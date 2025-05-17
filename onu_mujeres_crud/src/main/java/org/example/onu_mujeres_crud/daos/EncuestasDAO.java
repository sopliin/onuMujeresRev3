package org.example.onu_mujeres_crud.daos;

import org.example.onu_mujeres_crud.beans.EncuestaAsignada;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class EncuestasDAO {

    // Método para obtener una encuesta asignada por su asignacion_id
    public EncuestaAsignada obtenerEncuestaAsignadaPorId(int asignacionId) throws SQLException {
        EncuestaAsignada encuestaAsignada = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/onu_mujeres?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT asignacion_id, encuesta_id, encuestador_id, coordinador_id, " +
                    "estado, fecha_asignacion, fecha_completado " +
                    "FROM onu_mujeres.encuestas_asignadas WHERE asignacion_id = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, asignacionId); // Establecer el valor del parámetro

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                encuestaAsignada = new EncuestaAsignada();
                encuestaAsignada.setAsignacionId(resultSet.getInt("asignacion_id"));
                encuestaAsignada.setEncuestaId(resultSet.getInt("encuesta_id"));
                encuestaAsignada.setEncuestadorId(resultSet.getInt("encuestador_id"));
                encuestaAsignada.setCoordinadorId(resultSet.getInt("coordinador_id"));
                encuestaAsignada.setEstado(resultSet.getString("estado"));
                encuestaAsignada.setFechaAsignacion(resultSet.getObject("fecha_asignacion", LocalDateTime.class));
                encuestaAsignada.setFechaCompletado(resultSet.getObject("fecha_completado", LocalDateTime.class));
            }

        } catch (ClassNotFoundException e) {
            System.err.println("Error: No se encontró el driver de MySQL.");
            e.printStackTrace();
            throw new SQLException("Error al cargar el driver de MySQL", e);
        } catch (SQLException e) {
            System.err.println("Error al conectar o consultar la base de datos.");
            e.printStackTrace();
            throw e; // Relanzar la excepción para que la capa superior la maneje
        } finally {
            // Cerrar los recursos en el bloque finally para asegurar que se cierren
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {}
            if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) {}
            if (connection != null) try { connection.close(); } catch (SQLException e) {}
        }

        return encuestaAsignada;
    }

    // Nuevo método para obtener todas las encuestas asignadas
    public List<EncuestaAsignada> obtenerTodasLasEncuestasAsignadas() throws SQLException {
        List<EncuestaAsignada> listaEncuestasAsignadas = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/onu_mujeres?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT asignacion_id, encuesta_id, encuestador_id, coordinador_id, " +
                    "estado, fecha_asignacion, fecha_completado FROM onu_mujeres.encuestas_asignadas";

            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                EncuestaAsignada encuestaAsignada = new EncuestaAsignada();
                encuestaAsignada.setAsignacionId(resultSet.getInt("asignacion_id"));
                encuestaAsignada.setEncuestaId(resultSet.getInt("encuesta_id"));
                encuestaAsignada.setEncuestadorId(resultSet.getInt("encuestador_id"));
                encuestaAsignada.setCoordinadorId(resultSet.getInt("coordinador_id"));
                encuestaAsignada.setEstado(resultSet.getString("estado"));
                encuestaAsignada.setFechaAsignacion(resultSet.getObject("fecha_asignacion", LocalDateTime.class));
                encuestaAsignada.setFechaCompletado(resultSet.getObject("fecha_completado", LocalDateTime.class));
                listaEncuestasAsignadas.add(encuestaAsignada);
            }

        } catch (ClassNotFoundException e) {
            System.err.println("Error: No se encontró el driver de MySQL.");
            e.printStackTrace();
            throw new SQLException("Error al cargar el driver de MySQL", e);
        } catch (SQLException e) {
            System.err.println("Error al conectar o consultar la base de datos.");
            e.printStackTrace();
            throw e;
        } finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {}
            if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) {}
            if (connection != null) try { connection.close(); } catch (SQLException e) {}
        }

        return listaEncuestasAsignadas;
    }
}
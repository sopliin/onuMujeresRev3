package org.example.onu_mujeres_crud.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioUpdateDAO {

    private String url;
    private String user;
    private String pass;

    public UsuarioUpdateDAO(String url, String user, String pass) {
        this.url = url;
        this.user = user;
        this.pass = pass;
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, pass);
    }

    public boolean actualizarDatosUsuario(int usuarioId, String nombre, String correo, String foto) {
        String sql = "UPDATE usuarios SET nombre = ?, correo = ?, foto = ? WHERE usuario_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, correo);
            pstmt.setString(3, foto); // Asumiendo que 'foto' es la ruta o nombre del archivo
            pstmt.setInt(4, usuarioId);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Sobrecarga del método si no se desea actualizar la foto
    public boolean actualizarDatosUsuario(int usuarioId, String nombre, String correo) {
        String sql = "UPDATE usuarios SET nombre = ?, correo = ? WHERE usuario_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, correo);
            pstmt.setInt(3, usuarioId);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
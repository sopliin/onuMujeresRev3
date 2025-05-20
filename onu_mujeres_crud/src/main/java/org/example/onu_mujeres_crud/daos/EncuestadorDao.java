package org.example.onu_mujeres_crud.daos;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.example.onu_mujeres_crud.beans.Distrito;
import org.example.onu_mujeres_crud.beans.Usuario;
import java.sql.*;

public class EncuestadorDao extends BaseDAO {
    public ArrayList<Usuario> listarUsuarios() {
        ArrayList<Usuario> lista = new ArrayList<>();
        String sql = "SELECT usuario_id, nombre, apellido_paterno,apellido_materno, correo FROM usuarios where rol_id=1 ";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setUsuarioId(rs.getInt("usuario_id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellidoPaterno(rs.getString("apellido_paterno"));
                usuario.setApellidoMaterno(rs.getString("apellido_materno"));
                usuario.setCorreo(rs.getString("correo"));
                lista.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Método para obtener un usuario por ID
    public Usuario obtenerUsuario(int id) {
        String sql = "SELECT u.*, d.nombre as nombre_distrito FROM usuarios u " +
                "LEFT JOIN distritos d ON u.distrito_id = d.distrito_id " +
                "WHERE u.usuario_id = ?";
        Usuario usuario = null;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setUsuarioId(rs.getInt("usuario_id"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellidoPaterno(rs.getString("apellido_paterno"));
                    usuario.setApellidoMaterno(rs.getString("apellido_materno"));
                    usuario.setDni(rs.getString("dni"));
                    usuario.setCorreo(rs.getString("correo"));
                    usuario.setDireccion(rs.getString("direccion"));
                    Distrito distrito = new Distrito();
                    distrito.setDistritoId(rs.getInt("distrito_id"));
                    distrito.setNombre(rs.getString("nombre_distrito"));
                    usuario.setDistrito(distrito);


                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    // Método para guardar (crear/actualizar) usuario


    // Método para eliminar usuario
    public void eliminarUsuario(int id) {
        String sql = "DELETE FROM usuarios WHERE usuario_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public boolean crearUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios (rol_id, nombre, apellido_paterno, apellido_materno, " +
                "dni, correo, contrasena_hash, direccion, distrito_id, zona_id, " +
                "codigo_unico_encuestador, estado, correo_verificado) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Setear parámetros
            pstmt.setInt(1, usuario.getRol().getRolId());
            pstmt.setString(2, usuario.getNombre());
            pstmt.setString(3, usuario.getApellidoPaterno());
            pstmt.setString(4, usuario.getApellidoMaterno());
            pstmt.setString(5, usuario.getDni());
            pstmt.setString(6, usuario.getCorreo());
            pstmt.setString(7, usuario.getContrasenaHash());
            pstmt.setString(8, usuario.getDireccion());

            if (usuario.getDistrito() != null) {
                pstmt.setInt(9, usuario.getDistrito().getDistritoId());

                // Obtener zona_id del distrito
                String sqlZona = "SELECT zona_id FROM distritos WHERE distrito_id = ?";
                try (PreparedStatement pstmtZona = conn.prepareStatement(sqlZona)) {
                    pstmtZona.setInt(1, usuario.getDistrito().getDistritoId());
                    try (ResultSet rsZona = pstmtZona.executeQuery()) {
                        if (rsZona.next()) {
                            pstmt.setInt(10, rsZona.getInt("zona_id"));
                        } else {
                            pstmt.setNull(10, Types.INTEGER);
                        }
                    }
                }
            } else {
                pstmt.setNull(9, Types.INTEGER);
                pstmt.setNull(10, Types.INTEGER);
            }

            // Solo para encuestadores
            if (usuario.getRol().getRolId() == 1) { // 1 = encuestador
                String codigoUnico = "ENC-" + new SimpleDateFormat("yyyy").format(new Date()) +
                        "-" + String.format("%03d", obtenerProximoNumeroEncuestador());
                pstmt.setString(11, codigoUnico);
            } else {
                pstmt.setNull(11, Types.VARCHAR);
            }

            pstmt.setString(12, usuario.getEstado() != null ? usuario.getEstado() : "activo");
            pstmt.setBoolean(13, usuario.isCorreoVerificado() != true ? usuario.isCorreoVerificado() : false);

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                return false;
            }

            // Obtener el ID generado
            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    usuario.setUsuarioId(generatedKeys.getInt(1));
                }
            }

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private int obtenerProximoNumeroEncuestador() {
        String sql = "SELECT MAX(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(codigo_unico_encuestador, '-', -1), ' ', -1) AS UNSIGNED)) + 1 AS next_num " +
                "FROM usuarios WHERE codigo_unico_encuestador LIKE 'ENC-%'";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt("next_num");
            }
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return 1;
        }
    }


    public boolean actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE usuarios SET " +
                "direccion = ?, " +
                "distrito_id = ?, " +
                "zona_id = ?, " +
                (usuario.getContrasenaHash() != null ? "contrasena_hash = ?, " : "") +
                "estado = ?, " +
                "correo_verificado = ? " +
                "WHERE usuario_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int paramIndex = 1;

            // Setear parámetros comunes
            pstmt.setString(paramIndex++, usuario.getDireccion());

            if (usuario.getDistrito() != null) {
                pstmt.setInt(paramIndex++, usuario.getDistrito().getDistritoId());

                // Obtener zona_id del distrito
                String sqlZona = "SELECT zona_id FROM distritos WHERE distrito_id = ?";
                try (PreparedStatement pstmtZona = conn.prepareStatement(sqlZona)) {
                    pstmtZona.setInt(1, usuario.getDistrito().getDistritoId());
                    try (ResultSet rsZona = pstmtZona.executeQuery()) {
                        if (rsZona.next()) {
                            pstmt.setInt(paramIndex++, rsZona.getInt("zona_id"));
                        } else {
                            pstmt.setNull(paramIndex++, Types.INTEGER);
                        }
                    }
                }
            } else {
                pstmt.setNull(paramIndex++, Types.INTEGER);
                pstmt.setNull(paramIndex++, Types.INTEGER);
            }

            // Si hay nueva contraseña
            if (usuario.getContrasenaHash() != null) {
                pstmt.setString(paramIndex++, usuario.getContrasenaHash());
            }

            pstmt.setString(paramIndex++, usuario.getEstado() != null ? usuario.getEstado() : "activo");
            pstmt.setBoolean(paramIndex++, usuario.isCorreoVerificado() != true ? usuario.isCorreoVerificado() : false);
            pstmt.setInt(paramIndex++, usuario.getUsuarioId());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
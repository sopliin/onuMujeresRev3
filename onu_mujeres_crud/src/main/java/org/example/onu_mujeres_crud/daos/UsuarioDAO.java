package org.example.onu_mujeres_crud.daos;

import org.example.onu_mujeres_crud.beans.Distrito;
import org.example.onu_mujeres_crud.beans.Rol;
import org.example.onu_mujeres_crud.beans.Usuario;
import org.example.onu_mujeres_crud.beans.Zona;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioDAO extends BaseDAO{

    //Para admin, listar todos los usuarios
    public ArrayList<Usuario> listarUsuariosAsAdmin() {
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();

        String sql = "select * from onu_mujeres.usuarios u\n" +
                    "left join onu_mujeres.roles r on (u.rol_id = r.rol_id)\n" +
                    "left join onu_mujeres.distritos d on (u.distrito_id = d.distrito_id)\n" +
                    "left join onu_mujeres.zonas z on (u.zona_id = z.zona_id)";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)){
            while (rs.next()) {
                Usuario usuario = fetchUsuarioData(rs);
                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaUsuarios;
    }

    public Usuario obtenerUsuario(int usuarioId) {

        Usuario usuario = null;

        String sql = "select * from onu_mujeres.usuarios u\n" +
                    "left join onu_mujeres.roles r on u.rol_id = r.rol_id\n" +
                    "left join onu_mujeres.distritos d on u.distrito_id = d.distrito_id\n" +
                    "left join onu_mujeres.zonas z on u.zona_id = z.zona_id\n" +
                    "where u.rol_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, usuarioId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = fetchUsuarioData(rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usuario;
    }

    //Registrar usuario para admin (crear coordinadores mediante el ingreso de nombre, apellido, DNI, Correo y zona)
    public void registrarCoordinador(Usuario usuario) {
        String sql = "INSERT INTO onu_mujeres.usuarios (rol_id, nombre, apellido_paterno, apellido_materno, dni, correo, zona_id)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            setCoordinadorData(usuario, pstmt);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //"Desactivar a los usuarios tipo coordi o encuestador"
    public void desactivarUsuario(int usuarioid) {

        String sql = "update onu_mujeres.usuarios set estado = 'inactivo' where usuario_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, usuarioid);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private Usuario fetchUsuarioData(ResultSet rs) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setUsuarioId(rs.getInt("usuario_id"));
        usuario.setNombre(rs.getString("u.nombre"));
        usuario.setApellidoPaterno(rs.getString("apellido_paterno"));
        usuario.setApellidoMaterno(rs.getString("apellido_materno"));
        usuario.setDni(rs.getString("dni"));
        usuario.setCorreo(rs.getString("correo"));
        usuario.setDireccion(rs.getString("direccion"));
        usuario.setFechaRegistro(rs.getString("fecha_registro"));
        usuario.setEstado(rs.getString("estado"));

        Zona zona = new Zona();
        zona.setNombre(rs.getString("z.nombre"));
        usuario.setZona(zona);

        Rol rol = new Rol();
        rol.setNombre(rs.getString("r.nombre"));
        usuario.setRol(rol);

        Distrito distrito = new Distrito();
        distrito.setNombre(rs.getString("d.nombre"));
        usuario.setDistrito(distrito);

        //Si el atributo no es nulo:
        if(rs.getInt("codigo_unico_encuestador") != 0){
            //Es encuestador
            usuario.setCodigoUnicoEncuestador(rs.getString("codigo_unico_encuestador"));
        }
        return usuario;
    }

    //Setear Coordi para Admin
    private void setCoordinadorData(Usuario usuario, PreparedStatement pstmt) throws SQLException {
        pstmt.setString(2, usuario.getNombre());
        pstmt.setString(6, usuario.getCorreo());

        if (usuario.getRol() == null) {
            pstmt.setNull(1, Types.INTEGER);
        } else {
            pstmt.setInt(1, usuario.getRol().getRolId());
        }
        if (usuario.getApellidoPaterno() == null) {
            pstmt.setNull(3, Types.VARCHAR);
        } else {
            pstmt.setString(3, usuario.getApellidoPaterno());
        }
        if (usuario.getApellidoMaterno() == null) {
            pstmt.setNull(4, Types.VARCHAR);
        } else {
            pstmt.setString(4, usuario.getApellidoMaterno());
        }
        if (usuario.getDni() == null) {
            pstmt.setNull(5, Types.CHAR);
        } else {
            pstmt.setString(5, usuario.getDni());
        }
        if (usuario.getZona() == null) {
            pstmt.setNull(7, Types.INTEGER);
        } else {
            pstmt.setInt(7, usuario.getZona().getZonaId());
        }
    }
}
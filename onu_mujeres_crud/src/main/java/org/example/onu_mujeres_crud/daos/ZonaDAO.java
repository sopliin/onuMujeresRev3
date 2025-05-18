package org.example.onu_mujeres_crud.daos;

import org.example.onu_mujeres_crud.beans.Zona;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ZonaDAO extends BaseDAO{

    public ArrayList<Zona> obtenerListaZonas() {
        ArrayList<Zona> listaZonas = new ArrayList<>();
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM onu_mujeres.zonas")){

            while (rs.next()) {
                Zona zona = new Zona();
                zona.setZonaId(rs.getInt(1));
                zona.setNombre(rs.getString(2));
                listaZonas.add(zona);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaZonas;
    }
}

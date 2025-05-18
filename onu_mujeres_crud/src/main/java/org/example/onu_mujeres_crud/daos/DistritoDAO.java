package org.example.onu_mujeres_crud.daos;

import org.example.onu_mujeres_crud.beans.Distrito;
import org.example.onu_mujeres_crud.beans.Zona;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DistritoDAO extends BaseDAO{

    public ArrayList<Distrito> obtenerListaDistritos() {
        ArrayList<Distrito> listaDistritos = new ArrayList<>();
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM onu_mujeres.distritos")){

            while (rs.next()) {
                Distrito distrito = new Distrito();
                distrito.setDistritoId(rs.getInt(1));
                distrito.setNombre(rs.getString(2));
                distrito.setZonaId(rs.getInt(3));

                listaDistritos.add(distrito);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaDistritos;
    }
}

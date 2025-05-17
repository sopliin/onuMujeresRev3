package org.example.onu_mujeres_crud.beans;

public class Rol {
    private int rolId;
    private String nombre; // ENUM('encuestador', 'coordinador', 'administrador')

    public int getRolId() {
        return rolId;
    }

    public void setRolId(int rolId) {
        this.rolId = rolId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
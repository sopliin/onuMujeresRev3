package org.example.onu_mujeres_crud.beans;

public class EncuestaAsignada {
    private int asignacionId;
    private int encuestaId;
    private int encuestadorId;
    private int coordinadorId;
    private String estado; // ENUM('activo', 'revocado', 'completado')
    private String fechaAsignacion;
    private String fechaCompletado;

    public int getAsignacionId() {
        return asignacionId;
    }

    public void setAsignacionId(int asignacionId) {
        this.asignacionId = asignacionId;
    }

    public int getEncuestaId() {
        return encuestaId;
    }

    public void setEncuestaId(int encuestaId) {
        this.encuestaId = encuestaId;
    }

    public int getEncuestadorId() {
        return encuestadorId;
    }

    public void setEncuestadorId(int encuestadorId) {
        this.encuestadorId = encuestadorId;
    }

    public int getCoordinadorId() {
        return coordinadorId;
    }

    public void setCoordinadorId(int coordinadorId) {
        this.coordinadorId = coordinadorId;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFechaAsignacion() {
        return fechaAsignacion;
    }

    public void setFechaAsignacion(String fechaAsignacion) {
        this.fechaAsignacion = fechaAsignacion;
    }

    public String getFechaCompletado() {
        return fechaCompletado;
    }

    public void setFechaCompletado(String fechaCompletado) {
        this.fechaCompletado = fechaCompletado;
    }
}
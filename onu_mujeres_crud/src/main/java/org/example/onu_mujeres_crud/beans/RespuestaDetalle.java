package org.example.onu_mujeres_crud.beans;

public class RespuestaDetalle {
    private int detalleId;
    private int respuestaId;
    private int preguntaId;
    private int opcionId;
    private String respuestaTexto;
    private String fechaContestacion;

    public int getDetalleId() {
        return detalleId;
    }

    public void setDetalleId(int detalleId) {
        this.detalleId = detalleId;
    }

    public int getRespuestaId() {
        return respuestaId;
    }

    public void setRespuestaId(int respuestaId) {
        this.respuestaId = respuestaId;
    }

    public int getPreguntaId() {
        return preguntaId;
    }

    public void setPreguntaId(int preguntaId) {
        this.preguntaId = preguntaId;
    }

    public int getOpcionId() {
        return opcionId;
    }

    public void setOpcionId(int opcionId) {
        this.opcionId = opcionId;
    }

    public String getRespuestaTexto() {
        return respuestaTexto;
    }

    public void setRespuestaTexto(String respuestaTexto) {
        this.respuestaTexto = respuestaTexto;
    }

    public String getFechaContestacion() {
        return fechaContestacion;
    }

    public void setFechaContestacion(String fechaContestacion) {
        this.fechaContestacion = fechaContestacion;
    }
}
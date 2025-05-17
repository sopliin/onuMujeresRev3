<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.onu_mujeres_crud.beans.EncuestaAsignada" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Encuestas Asignadas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h1>Lista de Encuestas Asignadas</h1>
    <%--
        Esta página se accede a través de EncuestaAsignadaServlet
        y muestra la lista de encuestas (acción "lista" por defecto).
    --%>
    <%
        ArrayList<EncuestaAsignada> listaEncuestasAsignadas = (ArrayList<EncuestaAsignada>) request.getAttribute("listaEncuestasAsignadas");
        if (listaEncuestasAsignadas != null && !listaEncuestasAsignadas.isEmpty()) {
    %>
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID Asignación</th>
            <th>ID Encuesta</th>
            <th>ID Encuestador</th>
            <th>ID Coordinador</th>
            <th>Estado</th>
            <th>Fecha Asignación</th>
            <th>Fecha Completado</th>
        </tr>
        </thead>
        <tbody>
        <% for (EncuestaAsignada encuesta : listaEncuestasAsignadas) { %>
        <tr>
            <td><%= encuesta.getAsignacionId() %></td>
            <td><%= encuesta.getEncuestaId() %></td>
            <td><%= encuesta.getEncuestadorId() %></td>
            <td><%= encuesta.getCoordinadorId() %></td>
            <td><%= encuesta.getEstado() %></td>
            <td><%= encuesta.getFechaAsignacion() %></td>
            <td><%= encuesta.getFechaCompletado() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p class="alert alert-info">No hay encuestas asignadas para mostrar.</p>
    <%
        }
    %>

    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger" role="alert">
        Error: <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <a href="<%= request.getContextPath() %>/Servlet?action=lista" class="btn btn-secondary">Refrescar Lista</a>
    <a href="<%= request.getContextPath() %>/Servlet" class="btn btn-secondary">Regresar</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhG5nwlLhlOBGNLHe9PXFfZaJgoIiI" crossorigin="anonymous"></script>
</body>
</html>
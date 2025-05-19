<%@page import="java.util.ArrayList"%>
<%@page import="org.example.onu_mujeres_crud.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Encuestadores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1>Lista de Usuarios</h1>
    <a href="<%= request.getContextPath() %>/EncuestadorServlet?action=nuevo" class="btn btn-primary mb-3">Nuevo Usuario</a>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Usuario> lista = (ArrayList<Usuario>) request.getAttribute("lista");
            if (lista != null && !lista.isEmpty()) {
                for (Usuario usuario : lista) {
        %>
        <tr>
            <td><%= usuario.getUsuarioId() %></td>
            <td><%= usuario.getNombre() %></td>
            <td><%= usuario.getCorreo() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/EncuestadorServlet?action=ver&id=<%= usuario.getUsuarioId() %>"
                   class="btn btn-info">Ver</a>
                <a href="<%= request.getContextPath() %>/EncuestadorServlet?action=editar&id=<%= usuario.getUsuarioId() %>" class="btn btn-warning">Editar</a>
                <a href="<%= request.getContextPath() %>/EncuestadorServlet?action=eliminar&id=<%= usuario.getUsuarioId() %>" class="btn btn-danger">Eliminar</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="4" class="text-center">No hay Encuestadores registrados</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
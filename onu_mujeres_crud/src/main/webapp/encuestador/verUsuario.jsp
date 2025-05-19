<%@page import="org.example.onu_mujeres_crud.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Perfil de Usuario</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h1>Perfil de Encuestador</h1>

  <%
    Usuario usuario = (Usuario) request.getAttribute("usuario");
    if (usuario != null) {
  %>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Información del Usuario</h5>
      <p class="card-text"><strong>ID:</strong> <%= usuario.getUsuarioId() %></p>
      <p class="card-text"><strong>Nombre:</strong> <%= usuario.getNombre() %></p>
      <p class="card-text"><strong>Dni:</strong> <%= usuario.getDni() %></p>
      <p class="card-text"><strong>Direccion:</strong> <%= usuario.getDireccion() %></p>
      <p class="card-text"><strong>Distrito:</strong> <%= usuario.getDistrito().getNombre() %></p>
      <p class="card-text"><strong>Correo:</strong> <%= usuario.getCorreo() %></p>
      <div class="mt-3">
        <a href="<%= request.getContextPath() %>/EncuestadorServlet?action=editar&id=<%= usuario.getUsuarioId() %>"
           class="btn btn-warning">Editar</a>
        <a href="<%= request.getContextPath() %>/EncuestadorServlet"
           class="btn btn-secondary">Volver</a>
      </div>
    </div>
  </div>
  <%
    } else {
      response.sendRedirect(request.getContextPath() + "/EncuestadorServlet");
    }
  %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
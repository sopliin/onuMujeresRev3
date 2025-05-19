<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.example.onu_mujeres_crud.beans.Distrito"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Nuevo Encuestador</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h1>Nuevo Encuestador</h1>
  <%
    ArrayList<Distrito> distritos = (ArrayList<Distrito>) request.getAttribute("distritos");
    if (distritos != null) {
  %>
  <form action="<%= request.getContextPath() %>/EncuestadorServlet" method="post">
    <input type="hidden" name="action" value="guardar">
    <input type="hidden" name="tipo" value="nuevo">
    <div class="mb-3">
      <label for="rol_id" class="form-label">Rol</label>
      <select class="form-select" id="rol_id" name="rol_id" required>
        <option value="">-- Seleccionar Rol --</option>
        <option value="1">Encuestador</option>
        <option value="2">Coordinador</option>
        <option value="3">Administrador</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="nombre" class="form-label">Nombre</label>
      <input type="text" class="form-control" id="nombre" name="nombre" required>
    </div>
    <div class="mb-3">
      <label for="apellido_paterno" class="form-label">Apellido Paterno</label>
      <input type="text" class="form-control" id="apellido_paterno" name="apellido_paterno" required>
    </div>
    <div class="mb-3">
      <label for="apellido_materno" class="form-label">Apellido Materno</label>
      <input type="text" class="form-control" id="apellido_materno" name="apellido_materno" required>
    </div>
    <div class="mb-3">
      <label for="dni" class="form-label">DNI</label>
      <input type="text" class="form-control" id="dni" name="dni" pattern="[0-9]{8}" required>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email" required>
    </div>
    <div class="mb-3">
      <label for="direccion" class="form-label">Dirección</label>
      <input type="text" class="form-control" id="direccion" name="direccion">
    </div>

    <div class="mb-3">
      <label for="distrito_id" class="form-label">Distrito</label>
      <select class="form-select" id="distrito_id" name="distrito_id">
        <option value="">-- Seleccionar Distrito --</option>
        <% for (Distrito distrito : distritos) { %>
        <option value="<%= distrito.getDistritoId() %>"><%= distrito.getNombre() %></option>
        <% } %>
      </select>
    </div>

    <div class="mb-3">
      <label for="contrasena" class="form-label">Contraseña</label>
      <input type="password" class="form-control" id="contrasena" name="contrasena" required>
    </div>

    <button type="submit" class="btn btn-primary">Guardar</button>
    <a href="<%= request.getContextPath() %>/EncuestadorServlet" class="btn btn-secondary">Cancelar</a>
  </form>
  <%
    } else {
      response.sendRedirect(request.getContextPath() + "/EncuestadorServlet");
    }
  %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
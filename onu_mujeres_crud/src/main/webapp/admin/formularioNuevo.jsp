<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Registrar Nuevo Coordinador</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="form-container">
      <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
      %>
      <div class="alert alert-danger text-center"><%= error %></div>
      <%
        }
      %>

      <form action="AdminServlet" method="post">
        <div class="row mb-3">
          <label class="form-label">Nombre:</label>
          <input type="text" name="nombre" class="form-control" required>
        </div>
        <div class="row mb-3">
          <label class="form-label">Apellido Paterno:</label>
          <input type="text" name="apellidoPaterno" class="form-control" required>
        </div>

        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label">Apellido Materno:</label>
            <input type="text" name="apellidoMaterno" class="form-control">
          </div>
          <div class="col-md-6">
            <label class="form-label">DNI:</label>
            <input type="text" name="dni" class="form-control" pattern="[0-9]{8}" required>
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label">Correo Electrónico:</label>
          <input type="email" name="correo" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Zona Asignada:</label>
          <select name="zona" class="form-select" required>
            <option value="" disabled selected>Seleccione una zona</option>
            <option value="1">Norte</option>
            <option value="2">Sur</option>
            <option value="3">Este</option>
            <option value="4">Oeste</option>
          </select>
        </div>

        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-primary btn-submit">Registrar Coordinador</button>
          <a href="AdminServlet" class="btn btn-secondary">Cancelar</a>
        </div>
      </form>
    </div>
</body>
</html>

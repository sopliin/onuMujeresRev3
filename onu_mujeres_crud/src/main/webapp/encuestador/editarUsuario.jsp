<%@page import="org.example.onu_mujeres_crud.beans.Usuario"%>
<%@page import="org.example.onu_mujeres_crud.beans.Distrito"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
    <div class="container mt-4">
      <h1>Editar Usuario</h1>

      <%
        Usuario usuario = (Usuario) request.getAttribute("usuario");
        ArrayList<Distrito> distritos = (ArrayList<Distrito>) request.getAttribute("distritos");
        if (usuario != null && distritos != null) {
      %>
      <form action="<%= request.getContextPath() %>/EncuestadorServlet" method="post">
        <input type="hidden" name="action" value="guardar">
        <input type="hidden" name="usuario_id" value="<%= usuario.getUsuarioId() %>">

        <div class="mb-3">
          <label class="form-label">Nombre: <%= usuario.getNombre() %></label>
        </div>

        <div class="mb-3">
          <label class="form-label">Apellido Paterno: <%= usuario.getApellidoPaterno() %></label>
        </div>

        <div class="mb-3">
          <label class="form-label">Apellido Materno: <%= usuario.getApellidoMaterno() %></label>
        </div>

        <div class="mb-3">
          <label class="form-label">DNI: <%= usuario.getDni() %></label>
        </div>

        <div class="mb-3">
          <label class="form-label">Correo: <%= usuario.getCorreo() %></label>
        </div>

        <div class="mb-3">
          <label for="direccion" class="form-label">Dirección</label>
          <input type="text" class="form-control" id="direccion" name="direccion"
                 value="<%= usuario.getDireccion() != null ? usuario.getDireccion() : "" %>">
        </div>

        <div class="mb-3">
          <label for="distrito_id" class="form-label">Distrito</label>
          <select class="form-select" id="distrito_id" name="distrito_id">
            <option value="">-- Seleccionar Distrito --</option>
            <% for (Distrito distrito : distritos) { %>
            <option value="<%= distrito.getDistritoId() %>"
                    <%= usuario.getDistrito().getDistritoId() == distrito.getDistritoId() ? "selected" : "" %>>
              <%= distrito.getNombre() %>
            </option>
            <% } %>
          </select>
        </div>

        <div class="mb-3">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="cambiar_contrasena" name="cambiar_contrasena" value="1">
            <label class="form-check-label" for="cambiar_contrasena">Cambiar contraseña</label>
          </div>
          <input type="password" class="form-control mt-2" id="nueva_contrasena" name="nueva_contrasena"
                 placeholder="Nueva contraseña" disabled>
        </div>

        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        <a href="<%= request.getContextPath() %>/EncuestadorServlet?action=ver&id=<%= usuario.getUsuarioId() %>"
           class="btn btn-secondary">Cancelar</a>
      </form>

      <script>
        // Habilitar campo de contraseña cuando se marca el checkbox
        document.getElementById('cambiar_contrasena').addEventListener('change', function() {
          document.getElementById('nueva_contrasena').disabled = !this.checked;
        });
      </script>
      <%
        } else {
          response.sendRedirect(request.getContextPath() + "/EncuestadorServlet");
        }
      %>
    </div>
  </body>
</html>
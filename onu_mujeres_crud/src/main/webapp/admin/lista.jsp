<%@page import="java.util.ArrayList" %>
<%@ page import="org.example.onu_mujeres_crud.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Administrador - Lista de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h2 class="mb-4">Usuarios Registrados</h2>
    <%
        String success = (String) request.getParameter("success");
        if (success != null) {
    %>
    <div class="alert alert-success">Coordinador registrado exitosamente!</div>
    <%
        }
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
    <div class="alert alert-danger"><%= error %></div>
    <%
        }
    %>
    <a href="AdminServlet?action=agregar" class="btn btn-primary mb-4">Nuevo Coordinador</a>
    <div class="table-container">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Rol</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>DNI</th>
                <th>Correo</th>
                <th>Zona</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");
            if (listaUsuarios != null) {
                for (Usuario usuario : listaUsuarios) {
        %>
                    <tr>
                        <td><%=usuario.getRol().getNombre()%></td>
                        <td><%=usuario.getNombre()%></td>
                        <td><%=usuario.getApellidoPaterno()%> <%=usuario.getApellidoMaterno()%></td>
                        <td><%=usuario.getDni()%></td>
                        <td><%=usuario.getCorreo()%></td>
                        <td><%=usuario.getZona().getNombre()%></td>
                        <td>
                        <%
                            if(usuario.getEstado().equalsIgnoreCase("activo")){
                        %>
                                <a href="AdminServlet?action=desactivar&id=<%=usuario.getUsuarioId()%>" class="btn btn-dark btn-sm text-white">Desactivar</a>
                        <%
                            } else if(usuario.getEstado().equalsIgnoreCase("inactivo")) {
                        %>
                                <a href="AdminServlet?action=activar&id=<%=usuario.getUsuarioId()%>" class="btn btn-success btn-sm text-white">Activar</a>
                        <%
                            }
                        %>
                        </td>
                    </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
    </div>
</body>
</html>

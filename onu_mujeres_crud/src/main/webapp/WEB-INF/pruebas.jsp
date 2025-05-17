<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Encuestas Asignadas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<h1>Lista de Encuestas Asignadas</h1>

<c:if test="${not empty error}">
    <p class="error-message">Error: ${error}</p>
</c:if>

<c:if test="${not empty listaEncuestasAsignadas}">
    <table>
        <thead>
        <tr>
            <th>Asignación ID</th>
            <th>Encuesta ID</th>
            <th>Encuestador ID</th>
            <th>Coordinador ID</th>
            <th>Estado</th>
            <th>Fecha Asignación</th>
            <th>Fecha Completado</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="encuesta" items="${listaEncuestasAsignadas}">
            <tr>
                <td><c:out value="${encuesta.asignacionId}"/></td>
                <td><c:out value="${encuesta.encuestaId}"/></td>
                <td><c:out value="${encuesta.encuestadorId}"/></td>
                <td><c:out value="${encuesta.coordinadorId}"/></td>
                <td><c:out value="${encuesta.estado}"/></td>
                <td><c:out value="${encuesta.fechaAsignacion}"/></td>
                <td><c:out value="${encuesta.fechaCompletado}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${empty listaEncuestasAsignadas && empty error}">
    <p>No hay encuestas asignadas para mostrar.</p>
</c:if>

</body>
</html>
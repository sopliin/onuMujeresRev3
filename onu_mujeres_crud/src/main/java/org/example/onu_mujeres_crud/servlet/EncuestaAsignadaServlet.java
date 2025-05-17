package org.example.onu_mujeres_crud.servlet;

import org.example.onu_mujeres_crud.daos.EncuestasDAO;
import org.example.onu_mujeres_crud.beans.EncuestaAsignada;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/EncuestaAsignadaServlet")
public class EncuestaAsignadaServlet extends HttpServlet {
    private final EncuestasDAO encuestaAsignadaDAO = new EncuestasDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "lista"; // Acción por defecto si no se proporciona ninguna
        }

        RequestDispatcher view;

        switch (action) {
            case "lista":
                try {
                    List<EncuestaAsignada> listaEncuestas = encuestaAsignadaDAO.obtenerTodasLasEncuestasAsignadas();
                    request.setAttribute("listaEncuestasAsignadas", listaEncuestas);
                    view = request.getRequestDispatcher("listarEncuestasAsignadas.jsp"); // Nombre de tu JSP para listar
                    view.forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Error al obtener la lista de encuestas asignadas.");
                    view = request.getRequestDispatcher("error.jsp"); // Página de error
                    view.forward(request, response);
                }
                break;
            default:
                request.setAttribute("error", "Acción no reconocida.");
                view = request.getRequestDispatcher("error.jsp"); // Página de error
                view.forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Puedes agregar lógica para otras acciones (crear, editar, eliminar) aquí
        // si es necesario y manejarlas con otro case en un switch.
    }
}
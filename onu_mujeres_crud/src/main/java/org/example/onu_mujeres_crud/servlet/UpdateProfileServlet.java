package org.example.onu_mujeres_crud.servlet;

import org.example.onu_mujeres_crud.daos.UsuarioUpdateDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet(name = "UpdateProfileServlet", value = "/profile/update")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5,      // 5 MB
        maxRequestSize = 1024 * 1024 * 10)    // 10 MB
public class UpdateProfileServlet extends HttpServlet {

    private UsuarioUpdateDAO usuarioUpdateDAO;
    private String uploadDirectory; // Directorio donde se guardarán las fotos

    @Override
    public void init() throws ServletException {
        String url = "jdbc:mysql://localhost:3306/onu_mujeres?serverTimezone=America/Lima";
        String user = "root";
        String pass = "root";
        usuarioUpdateDAO = new UsuarioUpdateDAO(url, user, pass);

        // Obtener la ruta del directorio de despliegue de la aplicación
        String deploymentDirectory = getServletContext().getRealPath("");
        uploadDirectory = deploymentDirectory + File.separator + "uploads" + File.separator + "profile_pics";

        // Crear el directorio de carga si no existe
        File dir = new File(uploadDirectory);
        if (!dir.exists()) {
            dir.mkdirs();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioId") == null) {
            response.sendRedirect("../login.jsp"); // Redirigir si no hay sesión activa
            return;
        }

        int usuarioId = (Integer) session.getAttribute("usuarioId");
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        Part fotoPart = request.getPart("foto");
        String fotoFileName = null;

        if (fotoPart != null && fotoPart.getSize() > 0) {
            String submittedFileName = fotoPart.getSubmittedFileName();
            if (submittedFileName != null && !submittedFileName.isEmpty()) {
                String fileExtension = submittedFileName.substring(submittedFileName.lastIndexOf('.'));
                fotoFileName = "user_" + usuarioId + "_" + System.currentTimeMillis() + fileExtension;
                try (InputStream fileContent = fotoPart.getInputStream()) {
                    Files.copy(fileContent, Paths.get(uploadDirectory, fotoFileName), StandardCopyOption.REPLACE_EXISTING);
                } catch (IOException e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Error al guardar la foto.");
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                    return;
                }
            }
        }

        boolean actualizado;
        if (fotoFileName != null) {
            actualizado = usuarioUpdateDAO.actualizarDatosUsuario(usuarioId, nombre, correo, "uploads/profile_pics/" + fotoFileName);
        } else {
            actualizado = usuarioUpdateDAO.actualizarDatosUsuario(usuarioId, nombre, correo);
            // Si no se subió una nueva foto, podríamos querer mantener la foto existente.
            // Esto requeriría obtener la ruta de la foto actual del usuario desde la base de datos
            // y pasarla al DAO si no se subió una nueva. Para simplificar, si no hay nueva foto,
            // el campo 'foto' en la base de datos se actualizará a NULL o se mantendrá su valor anterior
            // dependiendo de cómo se maneje en el formulario y en el caso del DAO sin foto.
        }

        if (actualizado) {
            // Actualizar los datos en la sesión si es necesario
            session.setAttribute("nombreUsuario", nombre);
            request.setAttribute("mensaje", "Datos actualizados correctamente.");
        } else {
            request.setAttribute("error", "Error al actualizar los datos.");
        }

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
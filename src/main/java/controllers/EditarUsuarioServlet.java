package controllers;

import dto.UserRequestDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/EditarUsuarioServlet")
public class EditarUsuarioServlet extends HttpServlet {

    private static final String BASE_URL = "http://localhost:8081/api/users";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String documento = request.getParameter("documento");
        String rol = request.getParameter("rol");
        String clave = request.getParameter("clave");
        String claveNueva = request.getParameter("claveNueva");
        String confirmarClaveNueva = request.getParameter("confirmarClaveNueva");


        String passwordFinal = (claveNueva != null && !claveNueva.isEmpty()) ? claveNueva : clave;

        if (claveNueva != null && !claveNueva.isEmpty()) {
            if (!claveNueva.equals(confirmarClaveNueva)) {
                request.setAttribute("error", "Las contraseñas nuevas no coinciden.");
                request.getRequestDispatcher("jsp/user-management.jsp").forward(request, response);
                return;
            }
        }

        Long roleId = switch (rol.toUpperCase()) {
            case "ADMIN" -> 1L;
            case "TEACHER" -> 2L;
            case "STUDENT" -> 3L;
            default -> null;
        };

        if (roleId == null) {
            request.setAttribute("error", "Rol inválido.");
            request.getRequestDispatcher("jsp/user-management.jsp").forward(request, response);
            return;
        }

        Long userId = getUserIdByDocument(documento);
        if (userId == null) {
            request.setAttribute("error", "No se encontró un usuario con ese documento.");
            request.getRequestDispatcher("jsp/user-management.jsp").forward(request, response);
            return;
        }

        ObjectMapper mapper = new ObjectMapper();
        UserRequestDTO dto = new UserRequestDTO(
                nombre,
                apellido,
                correo,
                passwordFinal,
                true,
                roleId,
                documento
        );

        URL url = new URL(BASE_URL + "/" + userId);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("PUT");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        OutputStream os = conn.getOutputStream();
        mapper.writeValue(os, dto);
        os.flush();
        os.close();

        int status = conn.getResponseCode();
        conn.disconnect();

        if (status == 200) {
            response.sendRedirect("jsp/user-management.jsp?actualizacionExitosa=true");
        } else {
            request.setAttribute("error", "Error al actualizar el usuario.");
            request.getRequestDispatcher("jsp/user-management.jsp").forward(request, response);
        }
    }

    private Long getUserIdByDocument(String documentNumber) {
        try {
            URL url = new URL(BASE_URL + "/document/" + documentNumber);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            int status = conn.getResponseCode();
            if (status == 200) {
                ObjectMapper mapper = new ObjectMapper();
                InputStream is = conn.getInputStream();
                JsonNode responseJson = mapper.readTree(is);
                is.close();
                conn.disconnect();
                return responseJson.get("id").asLong();
            }
            conn.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

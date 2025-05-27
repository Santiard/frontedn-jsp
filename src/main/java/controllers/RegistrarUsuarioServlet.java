package controllers;

import com.google.gson.Gson;
import dto.UserRequestDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.Base64;

@WebServlet("/RegistrarUsuarioServlet")
public class RegistrarUsuarioServlet extends HttpServlet {

    private static final String API_URL = "http://localhost:8081/api/users";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String documento = request.getParameter("documento");
        String correo = request.getParameter("correo");
        String rol = request.getParameter("rol");
        String clave = request.getParameter("clave");

        // Autenticación básica
        String encodedAuth = Base64.getEncoder().encodeToString("admin:admin".getBytes());

        // Verificar si ya existe el usuario por documento
        URL url = new URL(API_URL + "/document/" + documento);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Authorization", "Basic " + encodedAuth);

        int statusCode = connection.getResponseCode();

        if (statusCode == 200) {
            request.setAttribute("errorRegistro", "El documento ya está registrado.");
            request.setAttribute("nombre", nombre);
            request.setAttribute("documento", documento);
            request.setAttribute("correo", correo);
            request.setAttribute("rol", rol);
            request.getRequestDispatcher("jsp/user-management.jsp").forward(request, response);
            return;
        }

        // Dividir nombre en firstName y lastName
        String[] partesNombre = nombre.trim().split("\\s+");
        String firstName = partesNombre[0];
        String lastName = (partesNombre.length > 1)
                ? String.join(" ", Arrays.copyOfRange(partesNombre, 1, partesNombre.length))
                : "";

        // Mapear rol a ID (ajústalo según tu backend)
        Long roleId = switch (rol.toUpperCase()) {
            case "ADMIN" -> 1L;
            case "TEACHER" -> 2L;
            case "STUDENT" -> 3L;
            default -> 0L;
        };


        UserRequestDTO nuevoUsuario = new UserRequestDTO(
                firstName,
                lastName,
                correo,
                clave,
                true,
                roleId,
                documento
        );

        // Serializar a JSON
        Gson gson = new Gson();
        String json = gson.toJson(nuevoUsuario);

        // Hacer POST a la API
        URL postUrl = new URL(API_URL);
        HttpURLConnection postConn = (HttpURLConnection) postUrl.openConnection();
        postConn.setRequestMethod("POST");
        postConn.setRequestProperty("Content-Type", "application/json");
        postConn.setRequestProperty("Authorization", "Basic " + encodedAuth);
        postConn.setDoOutput(true);

        try (OutputStream os = postConn.getOutputStream()) {
            byte[] input = json.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int postStatus = postConn.getResponseCode();

        if (postStatus == 201 || postStatus == 200) {
            response.sendRedirect("jsp/user-management.jsp?registroExitoso=true");
        } else {
            // Leer mensaje de error del backend si lo hay
            BufferedReader br = new BufferedReader(new InputStreamReader(postConn.getErrorStream(), "utf-8"));
            StringBuilder errorResponse = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                errorResponse.append(line.trim());
            }

            request.setAttribute("errorRegistro", "Ocurrió un error al registrar el usuario. Detalle: " + errorResponse.toString());
            request.getRequestDispatcher("jsp/user-management.jsp").forward(request, response);
        }
    }
}
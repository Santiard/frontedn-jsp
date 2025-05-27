package controllers;

import dto.UsuarioDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

@WebServlet("/BuscarUsuarioServlet")
public class BuscarUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String documento = request.getParameter("documento");

        String urlStr = "http://localhost:8081/api/users/document-with-password/" + documento;
        HttpURLConnection connection = null;

        try {
            URL url = new URL(urlStr);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            String auth = "admin:admin";
            String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes());
            connection.setRequestProperty("Authorization", "Basic " + encodedAuth);

            int statusCode = connection.getResponseCode();

            if (statusCode == 200) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder responseBody = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    responseBody.append(line);
                }
                reader.close();

                JSONObject json = new JSONObject(responseBody.toString());

                UsuarioDTO usuarioDTO = new UsuarioDTO();
                usuarioDTO.setId(json.getLong("id"));
                usuarioDTO.setFirstName(json.getString("firstName"));
                usuarioDTO.setLastName(json.getString("lastName"));
                usuarioDTO.setDocumentNumber(json.getString("documentNumber"));
                usuarioDTO.setEmail(json.getString("email"));
                usuarioDTO.setPassword(json.optString("password", ""));
                usuarioDTO.setRoleId(json.getLong("roleId"));

                // Convertir roleId a nombre de rol
                String roleName;
                switch (json.getInt("roleId")) {
                    case 1: roleName = "ADMIN"; break;
                    case 2: roleName = "TEACHER"; break;
                    case 3: roleName = "STUDENT"; break;
                    default: roleName = "DESCONOCIDO"; break;
                }
                usuarioDTO.setRoleName(roleName);

                request.setAttribute("usuarioBuscado", usuarioDTO);

            } else {
                request.setAttribute("mensajeError", "Usuario no encontrado.");
            }

        } catch (Exception e) {
            request.setAttribute("mensajeError", "Error al conectar con el servidor de autenticación.");
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }

        request.getRequestDispatcher("jsp/user-management.jsp").forward(request, response);
    }
}

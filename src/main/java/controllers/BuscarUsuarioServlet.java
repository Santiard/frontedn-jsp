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

        String urlStr = "http://localhost:8081/api/users/document/" + documento;
        HttpURLConnection connection = null;

        try {
            URL url = new URL(urlStr);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            String auth = "admin:admin";
            String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes());
            connection.setRequestProperty("Authorization", "Basic " + encodedAuth);

            int status = connection.getResponseCode();

            if (status == 200) {
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
                usuarioDTO.setNombre(json.getString("firstName") + " " + json.getString("lastName"));
                usuarioDTO.setDocumento(documento); // el que usaste para buscar
                usuarioDTO.setCorreo(json.getString("email"));
                usuarioDTO.setRol(json.getString("roleName"));

                request.setAttribute("usuarioBuscado", usuarioDTO);

            } else {
                request.setAttribute("mensajeError", "Usuario no encontrado.");
            }

        } catch (Exception e) {
            request.setAttribute("mensajeError", "Error al conectar con el servidor.");
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }

        request.getRequestDispatcher("jsp/user-management.jsp").forward(request, response);
    }
}

package controllers;

import dto.UsuarioDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet("/ViewUsuariosServlet")
public class ViewUsuariosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String urlStr = "http://localhost:8081/api/users";
        HttpURLConnection connection = null;

        try {
            URL url = new URL(urlStr);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            // Autenticación básica
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

                JSONArray jsonArray = new JSONArray(responseBody.toString());
                List<UsuarioDTO> usuarios = new ArrayList<>();

                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject json = jsonArray.getJSONObject(i);
                    UsuarioDTO usuarioDTO = new UsuarioDTO();
                    usuarioDTO.setId(json.getLong("id"));
                    usuarioDTO.setFirstName(json.getString("firstName"));
                    usuarioDTO.setLastName(json.getString("lastName"));
                    usuarioDTO.setEmail(json.getString("email"));
                    usuarioDTO.setDocumentNumber(json.optString("documentNumber", ""));
                    usuarioDTO.setRoleId(json.getLong("roleId"));

                    // Convertir roleId a nombre de rol
                    String roleName;
                    switch (usuarioDTO.getRoleId().intValue()) {
                        case 1: roleName = "ADMIN"; break;
                        case 2: roleName = "TEACHER"; break;
                        case 3: roleName = "STUDENT"; break;
                        default: roleName = "DESCONOCIDO"; break;
                    }
                    usuarioDTO.setRoleName(roleName);

                    usuarios.add(usuarioDTO);
                }

                request.setAttribute("usuarios", usuarios);

            } else {
                request.setAttribute("mensajeError", "No se pudieron obtener los usuarios.");
            }

        } catch (Exception e) {
            request.setAttribute("mensajeError", "Error al conectar con el servidor.");
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }

        request.getRequestDispatcher("jsp/view-user.jsp").forward(request, response);
    }
}

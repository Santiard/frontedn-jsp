package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@WebServlet("/RegistrarDocenteServlet")
public class RegistrarDocenteServlet extends HttpServlet { ;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String documento = request.getParameter("documento");
        String departamento = request.getParameter("departamento");
        String codigoInstitucional = request.getParameter("codigoInstitucional");
        boolean statusContrato = Boolean.parseBoolean(request.getParameter("statusContrato"));

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest userRequest = HttpRequest.newBuilder()
                .uri(URI.create("http://localhost:8080/api/users/documento/" + documento))
                .GET()
                .build();

        try {
            HttpResponse<String> userResponse = client.send(userRequest, HttpResponse.BodyHandlers.ofString());

            if (userResponse.statusCode() == 200) {
                JSONObject userJson = new JSONObject(userResponse.body());

                String roleName = userJson.getString("roleName");

                if (!"DOCENTE".equalsIgnoreCase(roleName)) {
                    request.setAttribute("error", "El usuario no tiene rol de docente.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    return;
                }

                // Crear JSON del docente
                JSONObject teacherJson = new JSONObject();
                teacherJson.put("firstName", userJson.getString("firstName"));
                teacherJson.put("lastName", userJson.optString("lastName", ""));
                teacherJson.put("email", userJson.getString("email"));
                teacherJson.put("status", userJson.getString("status"));
                teacherJson.put("roleName", userJson.getString("roleName"));
                teacherJson.put("password", userJson.getString("password"));
                teacherJson.put("documentNumber", userJson.getString("documentNumber"));
                teacherJson.put("specialization", departamento);
                teacherJson.put("institutionalCode", codigoInstitucional);
                teacherJson.put("statusContract", statusContrato);

                // Enviar a backend
                HttpRequest teacherRequest = HttpRequest.newBuilder()
                        .uri(URI.create("http://localhost:8080/api/teachers"))
                        .header("Content-Type", "application/json")
                        .POST(HttpRequest.BodyPublishers.ofString(teacherJson.toString()))
                        .build();

                HttpResponse<String> teacherResponse = client.send(teacherRequest, HttpResponse.BodyHandlers.ofString());

                if (teacherResponse.statusCode() == 200 || teacherResponse.statusCode() == 201) {
                    response.sendRedirect("panelDocente.jsp?registroExitoso=true");
                } else {
                    request.setAttribute("error", "No se pudo registrar al docente. Verifica si ya existe.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("error", "No se encontró el usuario con ese documento.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt(); // buena práctica
            throw new ServletException("La operación fue interrumpida", e);
        }
    }



}

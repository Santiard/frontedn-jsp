package controllers;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Debe ingresar su correo y contraseña.");
            request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
            return;
        }

        try {
            URL url = new URL("http://localhost:8081/api/authentications/login");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            String auth = "admin:admin";
            String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes(StandardCharsets.UTF_8));
            connection.setRequestProperty("Authorization", "Basic " + encodedAuth);

            String body = "email=" + URLEncoder.encode(email, "UTF-8") +
                    "&password=" + URLEncoder.encode(password, "UTF-8");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            // Enviar los parámetros al backend
            try (OutputStream os = connection.getOutputStream()) {
                os.write(body.getBytes(StandardCharsets.UTF_8));
            }

            int status = connection.getResponseCode();

            InputStream responseStream = (status >= 200 && status < 300)
                    ? connection.getInputStream()
                    : connection.getErrorStream();

            if (responseStream == null) {
                throw new IOException("No se pudo obtener respuesta del servidor. Código HTTP: " + status);
            }

            StringBuilder responseContent = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(responseStream))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    responseContent.append(line);
                }
            }

            if (status == HttpURLConnection.HTTP_OK) {
                org.json.JSONObject json = new org.json.JSONObject(responseContent.toString());

                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("userId", json.getLong("userId"));
                session.setAttribute("sessionToken", json.getString("sessionToken"));
                session.setAttribute("expirationDate", json.getString("expirationDate"));
                session.setAttribute("nombre", json.getString("nombre"));
                session.setAttribute("rol", json.getString("rol"));

                response.sendRedirect(request.getContextPath() + "/jsp/home.jsp");

            } else {
                String mensajeError = responseContent.toString().isBlank()
                        ? "Correo o contraseña incorrectos."
                        : responseContent.toString();

                request.setAttribute("error", mensajeError);
                request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al conectar con el servidor de autenticación: " + e.getMessage());
            request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        }
    }
}

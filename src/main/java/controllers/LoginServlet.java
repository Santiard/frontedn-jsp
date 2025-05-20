package controllers;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirigir a login.jsp dentro de la carpeta jsp
        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            URL url = new URL("http://localhost:8081/login");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            String body = "email=" + URLEncoder.encode(email, "UTF-8") +
                    "&password=" + URLEncoder.encode(password, "UTF-8");

            try (OutputStream os = connection.getOutputStream()) {
                os.write(body.getBytes());
            }

            int status = connection.getResponseCode();

            if (status == HttpURLConnection.HTTP_OK) {
                // Éxito: guardar datos y redirigir al home o dashboard
                request.getSession().setAttribute("email", email);
                response.sendRedirect(request.getContextPath() + "/home"); // o tu página principal
            } else {
                // Error de autenticación
                request.setAttribute("error", "Correo o contraseña incorrectos.");
                request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al conectar con el servidor de autenticación.");
            request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        }
    }

}
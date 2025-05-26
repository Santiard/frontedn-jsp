package controllers;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
    }

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
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder responseContent = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    responseContent.append(inputLine);
                }
                in.close();

                org.json.JSONObject json = new org.json.JSONObject(responseContent.toString());


                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("userId", json.getLong("userId"));
                session.setAttribute("sessionToken", json.getString("sessionToken"));
                session.setAttribute("expirationDate", json.getString("expirationDate"));


                response.sendRedirect(request.getContextPath() + "/jsp/home.jsp");
            } else {

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
package controllers;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

@WebServlet("/ViewUsuariosServlet")
public class ViewUsuariosServlet extends HttpServlet {

    private static final String API_URL = "http://localhost:8081/api/users";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        URL url = new URL(API_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        int status = conn.getResponseCode();

        if (status == 200) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder jsonBuilder = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }

            reader.close();

            // Convertir JSON a Lista de Map<String, Object>
            Gson gson = new Gson();
            Type listType = new TypeToken<List<Map<String, Object>>>() {}.getType();
            List<Map<String, Object>> usuarios = gson.fromJson(jsonBuilder.toString(), listType);

            // Enviar al JSP
            request.setAttribute("usuarios", usuarios);
            request.getRequestDispatcher("jsp/view-users.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "No se pudieron obtener los usuarios");
            request.getRequestDispatcher("jsp/view-users.jsp").forward(request, response);
        }
    }
}

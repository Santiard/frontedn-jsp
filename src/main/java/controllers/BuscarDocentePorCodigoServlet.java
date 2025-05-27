package controllers;

import com.google.gson.Gson;
import dto.TeacherDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/BuscarDocentePorCodigoServlet")
public class BuscarDocentePorCodigoServlet extends HttpServlet {

    private static final String API_URL = "http://localhost:8081/api/teachers/codigo/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        if (codigo == null || codigo.trim().isEmpty()) {
            request.setAttribute("error", "Debe ingresar un código institucional.");
            request.getRequestDispatcher("panel-docente.jsp").forward(request, response);
            return;
        }

        URL url = new URL(API_URL + codigo);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");

        int status = con.getResponseCode();

        if (status == 200) {
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            con.disconnect();

            Gson gson = new Gson();
            TeacherDTO teacher = gson.fromJson(content.toString(), TeacherDTO.class);

            request.setAttribute("teacher", teacher);
        } else {
            request.setAttribute("error", "Docente no encontrado con el código institucional proporcionado.");
        }

        request.getRequestDispatcher("jsp/teacher-management.jsp").forward(request, response);
    }
}

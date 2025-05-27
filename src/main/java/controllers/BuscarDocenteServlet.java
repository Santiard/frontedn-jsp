package controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
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

@WebServlet("/BuscarDocenteServlet")
public class BuscarDocenteServlet extends HttpServlet {

    private static final String API_URL = "http://localhost:8081/api/teachers/documento/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String documento = request.getParameter("documento");

        if (documento == null || documento.isEmpty()) {
            request.setAttribute("error", "Debe ingresar un número de documento.");
            request.getRequestDispatcher("/resultadoBusquedaDocente.jsp").forward(request, response);
            return;
        }


        URL url = new URL(API_URL + documento);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Accept", "application/json");

        int status = connection.getResponseCode();

        if (status == 200) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder responseStr = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                responseStr.append(line);
            }
            reader.close();


            ObjectMapper mapper = new ObjectMapper();
            TeacherDTO docente = mapper.readValue(responseStr.toString(), TeacherDTO.class);

            request.setAttribute("docenteBuscado", docente);
        } else {
            request.setAttribute("error", "No se encontró el docente con documento: " + documento);
        }

        connection.disconnect();
        request.getRequestDispatcher("/jsp/teacher-management.jsp").forward(request, response);
}}

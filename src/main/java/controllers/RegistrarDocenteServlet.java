package controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.TeacherDTO;
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
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@WebServlet("/RegistrarDocenteServlet")
public class RegistrarDocenteServlet extends HttpServlet {

    private static final String USER_API_URL = "http://localhost:8081/api/users/document/";
    private static final String TEACHER_API_URL = "http://localhost:8081/api/teachers";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String document = request.getParameter("documento");
        String specialization = request.getParameter("departamento");
        String institutionalCode = request.getParameter("codigoInstitucional");
        String statusContratoStr = request.getParameter("statusContrato");

        URL userUrl = new URL(USER_API_URL + document);
        HttpURLConnection userConnection = (HttpURLConnection) userUrl.openConnection();
        userConnection.setRequestMethod("GET");
        userConnection.setRequestProperty("Accept", "application/json");

        int userStatus = userConnection.getResponseCode();

        if (userStatus != 200) {
            request.setAttribute("error", "Usuario no encontrado con documento: " + document);
            request.getRequestDispatcher("/jsp/teacher-management.jsp").forward(request, response);
            return;
        }

        BufferedReader userReader = new BufferedReader(new InputStreamReader(userConnection.getInputStream()));
        StringBuilder userResponseStr = new StringBuilder();
        String line;
        while ((line = userReader.readLine()) != null) {
            userResponseStr.append(line);
        }
        userReader.close();

        ObjectMapper mapper = new ObjectMapper();
        UsuarioDTO usuario = mapper.readValue(userResponseStr.toString(), UsuarioDTO.class);

        if (!"TEACHER".equalsIgnoreCase(usuario.getRoleName())) {
            request.setAttribute("error", "El usuario no tiene rol de docente.");
            request.getRequestDispatcher("/jsp/teacher-management.jsp").forward(request, response);
            return;
        }

        TeacherDTO docente = new TeacherDTO();
        docente.setFirstName(usuario.getFirstName());
        docente.setLastName(usuario.getLastName());
        docente.setEmail(usuario.getEmail());
        docente.setPassword(usuario.getPassword());
        docente.setDocumentNumber(usuario.getDocumentNumber());
        docente.setRoleName(usuario.getRoleName());
        docente.setStatus(usuario.getStatus());
        docente.setSpecialization(specialization);
        docente.setInstitutionalCode(institutionalCode);
        docente.setStatusContract(Boolean.parseBoolean(statusContratoStr));

        URL teacherUrl = new URL(TEACHER_API_URL);
        HttpURLConnection teacherConnection = (HttpURLConnection) teacherUrl.openConnection();
        teacherConnection.setRequestMethod("POST");
        teacherConnection.setRequestProperty("Content-Type", "application/json");
        teacherConnection.setDoOutput(true);

        String jsonDocente = mapper.writeValueAsString(docente);
        try (OutputStream os = teacherConnection.getOutputStream()) {
            byte[] input = jsonDocente.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int teacherStatus = teacherConnection.getResponseCode();
        if (teacherStatus == 200 || teacherStatus == 201) {
            request.setAttribute("success", "Docente registrado correctamente.");
        } else {
            request.setAttribute("error", "Error al registrar docente.");
        }

        teacherConnection.disconnect();
        request.getRequestDispatcher("/jsp/teacher-management.jsp").forward(request, response);
    }
}
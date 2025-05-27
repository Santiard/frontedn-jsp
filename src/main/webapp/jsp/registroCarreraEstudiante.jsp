
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Register Carrer Apocalipsis</title>
  <style>
    .form-container {
      background-color: #f8f9fa;
      padding: 20px;
      border-radius: 10px;
      margin: 15px;
      flex: 1;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .row-container {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
    }
    .full-width-container {
      margin: 20px;
    }
    form label {
      font-weight: 600;
    }
    input, select, button {
      margin-bottom: 10px;
      width: 100%;
      padding: 8px;
    }
    button {
      background-color: #007BFF;
      border: none;
      color: white;
      border-radius: 5px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>

</head>
<body>

<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<div class="page-wrapper">
  <div class="form-container">
    <h2>Registro de Estudiante en Carrera</h2>

    <!-- Buscar estudiante -->
    <form action="BuscarEstudianteServlet" method="get">
      <label for="documento">Documento del Estudiante:</label>
      <input type="text" id="documento" name="documento" required>

      <button type="submit">Buscar Estudiante</button>
    </form>

    <br>

    <!-- Registrar en carrera -->
    <form action="RegistrarCarreraEstudianteServlet" method="post">
      <label for="idEstudiante">ID del Estudiante:</label>
      <input type="text" id="idEstudiante" name="idEstudiante" required>

      <label for="carrera">Carrera:</label>
      <select id="carrera" name="idCarrera" required>
        <option value="">-- Selecciona una carrera --</option>
        <option value="1">Ingeniería de Sistemas</option>
        <option value="2">Administración de Empresas</option>
        <option value="3">Contaduría Pública</option>
        <option value="4">Psicología</option>

      </select>

      <button type="submit">Registrar en Carrera</button>
    </form>
  </div>
</div>

</body>

<%@ include file="footer.jsp" %>
</html>

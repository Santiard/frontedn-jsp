
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Register Carrer Apocalipsis</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleUser-management.css" />
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

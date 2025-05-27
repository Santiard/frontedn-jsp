<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Gestión de Semestres</title>
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
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>
<body>
<div class="page-wrapper">

  <div class="full-width-container">
    <div class="form-container">
      <h2>Buscar Semestre</h2>
      <form action="BuscarSemestreServlet" method="get">
        <label for="codigo">Código del semestre:</label>
        <input type="text" id="codigo" name="codigo" required>
        <button type="submit">Buscar</button>
      </form>
    </div>
  </div>

  <div class="row-container">
    <div class="form-container">
      <h2>Registrar Semestre</h2>
      <form action="RegistrarSemestreServlet" method="post">

        <label for="anio">Año:</label>
        <input type="number" id="anio" name="anio" required>

        <label for="periodo">Periodo:</label>
        <select id="periodo" name="periodo">
          <option value="1">A</option>
          <option value="2">B</option>
        </select>

        <button type="submit">Registrar</button>
      </form>
    </div>

    <div class="form-container">
      <h2>Editar Semestre</h2>
      <form action="EditarSemestreServlet" method="post">

        <label for="anioEditar">Año:</label>
        <input type="number" id="anioEditar" name="anio">

        <label for="periodoEditar">Periodo:</label>
        <select id="periodoEditar" name="periodo">
          <option value="1">A</option>
          <option value="2">B</option>
        </select>

        <button type="submit">Actualizar</button>
      </form>
    </div>
  </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>

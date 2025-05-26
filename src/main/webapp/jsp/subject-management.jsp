<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Gestión de Materias</title>
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
      <h2>Buscar Materia</h2>
      <form action="BuscarMateriaServlet" method="get">
        <label for="codigoMateria">Código de la materia:</label>
        <input type="text" id="codigoMateria" name="codigo" required>
        <button type="submit">Buscar</button>
      </form>
    </div>
  </div>

  <div class="row-container">
    <div class="form-container">
      <h2>Registrar Materia</h2>
      <form action="RegistrarMateriaServlet" method="post">
        <label for="nombreMateria">Nombre de la materia:</label>
        <input type="text" id="nombreMateria" name="nombre" required>

        <label for="creditos">Créditos:</label>
        <input type="number" id="creditos" name="creditos" min="1" max="10" required>

        <button type="submit">Registrar</button>
      </form>
    </div>

    <div class="form-container">
      <h2>Editar Materia</h2>
      <form action="EditarMateriaServlet" method="post">
        <label for="codigoMateriaEditar">Código de la materia:</label>
        <input type="text" id="codigoMateriaEditar" name="codigo" required>

        <label for="nombreMateriaEditar">Nombre:</label>
        <input type="text" id="nombreMateriaEditar" name="nombre">

        <label for="creditosEditar">Créditos:</label>
        <input type="number" id="creditosEditar" name="creditos" min="1" max="10">

        <button type="submit">Actualizar</button>
      </form>
    </div>
  </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>

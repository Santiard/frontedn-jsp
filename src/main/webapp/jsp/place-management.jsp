<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Gestión de Espacios</title>
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
      <h2>Buscar Espacio</h2>
      <form action="BuscarEspacioServlet" method="get">
        <label for="codigoEspacio">Código del espacio:</label>
        <input type="text" id="codigoEspacio" name="codigo" required>
        <button type="submit">Buscar</button>
      </form>
    </div>
  </div>

  <div class="row-container">
    <div class="form-container">
      <h2>Registrar Espacio</h2>
      <form action="RegistrarEspacioServlet" method="post">
        <label for="nombreEspacio">Nombre del espacio:</label>
        <input type="text" id="nombreEspacio" name="nombre" required>

        <label for="capacidad">Capacidad:</label>
        <input type="number" id="capacidad" name="capacidad" min="1" required>

        <button type="submit">Registrar</button>
      </form>
    </div>

    <div class="form-container">
      <h2>Editar Espacio</h2>
      <form action="EditarEspacioServlet" method="post">
        <label for="codigoEspacioEditar">Código del espacio:</label>
        <input type="text" id="codigoEspacioEditar" name="codigo" required>

        <label for="nombreEspacioEditar">Nombre:</label>
        <input type="text" id="nombreEspacioEditar" name="nombre">

        <label for="capacidadEditar">Capacidad:</label>
        <input type="number" id="capacidadEditar" name="capacidad" min="1">

        <button type="submit">Actualizar</button>
      </form>
    </div>
  </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>

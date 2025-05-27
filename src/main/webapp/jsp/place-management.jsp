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
        <label for="codigoReserva">Código del espacio:</label>
        <input type="text" id="codigoReserva" name="codigo" required>

        <label for="capacidad">Capacidad:</label>
        <input type="number" id="capacidad" name="capacidad" min="1" required>

        <label for="tipoEspacio">Tipo de espacio:</label>
        <select id="tipoEspacio" name="tipo" required>
          <option value="Estudio">Estudio</option>
          <option value="Laboratorio">Laboratorio</option>
          <option value="Evento">Evento</option>
          <option value="Reunión">Reunión</option>
          <option value="Comedor">Comedor</option>
          <option value="Deporte">Deporte</option>
          <option value="Práctica">Práctica</option>
          <option value="Multimedia">Multimedia</option>
          <option value="Computación">Computación</option>
          <option value="Sala gamer">Sala gamer</option>
        </select>

        <label for="disponibilidad">Disponibilidad:</label>
        <select id="disponibilidad" name="available" required>
          <option value="1">Disponible</option>
          <option value="0">En Obras</option>
        </select>

        <button type="submit">Registrar</button>
      </form>
    </div>

    <div class="form-container">
      <h2>Editar Espacio</h2>
      <form action="EditarEspacioServlet" method="post">
        <label for="codigoReservaEditar">Código del espacio:</label>
        <input type="text" id="codigoReservaEditar" name="codigo" required>

        <label for="capacidadEditar">Capacidad:</label>
        <input type="number" id="capacidadEditar" name="capacidad" min="1">

        <label for="tipoEspacioEditar">Tipo de espacio:</label>
        <select id="tipoEspacioEditar" name="tipo">
          <option value="Estudio">Estudio</option>
          <option value="Laboratorio">Laboratorio</option>
          <option value="Evento">Evento</option>
          <option value="Reunión">Reunión</option>
          <option value="Comedor">Comedor</option>
          <option value="Deporte">Deporte</option>
          <option value="Práctica">Práctica</option>
          <option value="Multimedia">Multimedia</option>
          <option value="Computación">Computación</option>
          <option value="Sala gamer">Sala gamer</option>
        </select>

        <label for="disponibilidadEditar">Disponibilidad:</label>
        <select id="disponibilidadEditar" name="available">
          <option value="1">Disponible</option>
          <option value="0">En Obras</option>
        </select>

        <button type="submit">Actualizar</button>
      </form>

    </div>
  </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Gestión de Préstamos de Materiales</title>
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
      <h2>Buscar Préstamo</h2>
      <form action="BuscarPrestamoServlet" method="get">
        <label for="idPrestamo">ID del préstamo:</label>
        <input type="text" id="idPrestamo" name="id" required>
        <button type="submit">Buscar</button>
      </form>
    </div>
  </div>

  <div class="row-container">
    <div class="form-container">
      <h2>Registrar Préstamo</h2>
      <form action="RegistrarPrestamoServlet" method="post">

        <label for="Prestamo">ID del préstamo:</label>
        <input type="text" id="Prestamo" name="id" required>

        <label for="solicitante">Nombre del solicitante:</label>
        <input type="text" id="solicitante" name="solicitante" required>

        <label for="material">Material solicitado:</label>
        <input type="text" id="material" name="material" required>

        <label for="fechaPrestamo">Fecha de préstamo:</label>
        <input type="datetime-local" id="fechaPrestamo" name="fechaPrestamo" required>

        <label for="fechaDevolucion">Fecha de devolución:</label>
        <input type="datetime-local" id="fechaDevolucion" name="fechaDevolucion" required>

        <label for="estado">Estado del préstamo:</label>
        <select id="estado" name="status" required>
          <option value="PENDING">Pendiente</option>
          <option value="RETURNED">Devuelto</option>
        </select>

        <label for="userId">ID del usuario responsable:</label>
        <input type="number" id="userId" name="user_id" required>

        <label for="studentId">ID del estudiante (opcional):</label>
        <input type="number" id="studentId" name="student_id" value="0">

        <label for="observaciones">Observaciones:</label>
        <textarea id="observaciones" name="observaciones" rows="3"></textarea>

        <button type="submit">Registrar</button>
      </form>

    </div>

    <div class="form-container">
      <h2>Editar Préstamo</h2>
      <form action="EditarPrestamoServlet" method="post">
        <label for="idPrestamoEditar">ID del préstamo:</label>
        <input type="text" id="idPrestamoEditar" name="id" required>

        <label for="solicitanteEditar">Nombre del solicitante:</label>
        <input type="text" id="solicitanteEditar" name="solicitante">

        <label for="materialEditar">Material solicitado:</label>
        <input type="text" id="materialEditar" name="material">

        <label for="fechaPrestamoEditar">Fecha de préstamo:</label>
        <input type="datetime-local" id="fechaPrestamoEditar" name="fechaPrestamo">

        <label for="fechaDevolucionEditar">Fecha de devolución:</label>
        <input type="datetime-local" id="fechaDevolucionEditar" name="fechaDevolucion">

        <label for="estadoEditar">Estado del préstamo:</label>
        <select id="estadoEditar" name="status">
          <option value="PENDING">Pendiente</option>
          <option value="RETURNED">Devuelto</option>
        </select>

        <label for="userIdEditar">ID del usuario responsable:</label>
        <input type="number" id="userIdEditar" name="user_id">

        <label for="studentIdEditar">ID del estudiante:</label>
        <input type="number" id="studentIdEditar" name="student_id">

        <label for="observacionesEditar">Observaciones:</label>
        <textarea id="observacionesEditar" name="observaciones" rows="3"></textarea>

        <button type="submit">Actualizar</button>
      </form>

    </div>
  </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>

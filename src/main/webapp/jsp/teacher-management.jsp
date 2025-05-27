<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Gestión de Docentes | Apocalipsis</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        .page-wrapper {
            padding: 30px;
        }

        .full-width-container {
            margin-bottom: 40px;
            display: flex;
            justify-content: center;
        }

        .form-container {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }

        .form-container h2 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #0056b3;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .row-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }

        .equal-panel {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
        }
    </style>
</head>

<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<body>
<div class="page-wrapper">


    <div class="full-width-container">
        <div class="form-container">
            <h2>Buscar Docente</h2>
            <form action="BuscarDocenteServlet" method="get">
                <label for="buscarDocumento">Documento:</label>
                <input type="text" id="buscarDocumento" name="documento" required>
                <button type="submit">Buscar</button>
            </form>
            <form action="BuscarDocenteServlet" method="get">
                <label for="buscarCodigo">Codigo Institucional:</label>
                <input type="text" id="buscarCodigo" name="codigo" required>
                <button type="submit">Buscar</button>
            </form>


            <c:if test="${not empty error}">
                <p style="color:red">${error}</p>
            </c:if>
        </div>
    </div>

    <div class="row-container">
        <div class="form-container equal-panel">
            <h2>Registrar Docente</h2>
            <form action="RegistrarDocenteServlet" method="post">

                <label for="documento">Documento del Usuario:</label>
                <input type="text" id="documento" name="documento" required>

                <label for="departamento">Departamento / Especialización:</label>
                <input type="text" id="departamento" name="departamento" required>

                <label for="codigoInstitucional">Código Institucional:</label>
                <input type="text" id="codigoInstitucional" name="codigoInstitucional" required>

                <label for="statusContrato">¿Contrato activo?</label>
                <select id="statusContrato" name="statusContrato" required>
                    <option value="true">Sí</option>
                    <option value="false">No</option>
                </select>

                <button type="submit">Registrar Docente</button>
            </form>
        </div>


        <div class="form-container equal-panel">
            <h2>Editar Docente</h2>
            <form action="EditarDocenteServlet" method="post">

                <!-- ID oculto -->
                <input type="hidden" name="id" value="${docenteBuscado.id}" />

                <!-- Nombre (editable) -->
                <label for="nombreEditar">Nombre:</label>
                <input type="text" id="nombreEditar" name="nombre"
                       value="${docenteBuscado.firstName} ${docenteBuscado.lastName}"
                       <c:if test="${empty docenteBuscado}">readonly</c:if> />

                <!-- Correo (no editable, solo informativo) -->
                <label for="correoEditar">Correo:</label>
                <input type="email" id="correoEditar" name="correo"
                       value="${docenteBuscado.email}" readonly />

                <!-- Código Institucional (no editable) -->
                <label for="codigoInstitucionalEditar">Código Institucional:</label>
                <input type="text" id="codigoInstitucionalEditar" name="codigoInstitucional"
                       value="${docenteBuscado.institutionalCode}" readonly />

                <!-- Departamento / Especialización -->
                <label for="departamentoEditar">Departamento / Especialización:</label>
                <input type="text" id="departamentoEditar" name="departamento"
                       value="${docenteBuscado.specialization}"
                       <c:if test="${empty docenteBuscado}">readonly</c:if> />

                <!-- Contrato Activo (sí/no) -->
                <label for="statusContratoEditar">¿Contrato activo?</label>
                <select id="statusContratoEditar" name="statusContrato"
                        <c:if test="${empty docenteBuscado}">disabled</c:if>>
                    <option value="true" ${docenteBuscado.statusContract ? 'selected' : ''}>Sí</option>
                    <option value="false" ${!docenteBuscado.statusContract ? 'selected' : ''}>No</option>
                </select>

                <!-- Botón de actualizar -->
                <button type="submit" <c:if test="${empty docenteBuscado}">disabled</c:if>>Actualizar</button>
            </form>
        </div>
    </div>
</div>
</body>

<%@ include file="footer.jsp" %>

</html>

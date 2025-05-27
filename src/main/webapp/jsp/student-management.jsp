<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Gestión de Estudiantes | Apocalipsis</title>
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

    <!-- Buscar estudiante -->
    <div class="full-width-container">
        <div class="form-container">
            <h2>Buscar Estudiante</h2>
            <form action="BuscarEstudianteServlet" method="get">
                <label for="buscarDocumento">Documento:</label>
                <input type="text" id="buscarDocumento" name="documento" required>
                <button type="submit">Buscar</button>
            </form>
        </div>
    </div>

    <!-- Registrar y Editar estudiante -->
    <div class="row-container">
        <div class="form-container equal-panel">
            <h2>Registrar Estudiante</h2>
            <form action="RegistrarEstudianteServlet" method="post">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>

                <label for="codigo">Código de Estudiante:</label>
                <input type="text" id="codigo" name="codigo" required>

                <label for="documento">Documento:</label>
                <input type="text" id="documento" name="documento" required>

                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" required>

                <label for="programa">Programa Académico:</label>
                <input type="text" id="programa" name="programa" required>

                <label for="estado">Estado del Estudiante:</label>
                <select id="estado" name="estado" required>
                    <option value="">-- Selecciona un estado --</option>
                    <option value="activo">Activo</option>
                    <option value="inactivo">Inactivo</option>
                </select>

                <label for="telefono">Número de Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" required pattern="[0-9]{10}" placeholder="Ej: 3001234567">

                <label for="fechaRegistro">Fecha de Registro:</label>
                <input type="date" id="fechaRegistro" name="fechaRegistro" required>

                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" required>

                <label for="clave">Contraseña:</label>
                <input type="password" id="clave" name="clave" required>

                <button type="submit">Registrar</button>
            </form>
        </div>

        <div class="form-container equal-panel">
            <h2>Editar Estudiante</h2>

            <form action="EditarEstudianteServlet" method="post">

            <label for="nombreEditar">Nombre:</label>
            <input type="text" id="nombreEditar" name="nombre">

                <label for="codigoEditar">Código de Estudiante:</label>
                <input type="text" id="codigoEditar" name="codigo">

            <label for="documentoEditar">Documento:</label>
            <input type="text" id="documentoEditar" name="documento">

            <label for="correoEditar">Correo:</label>
            <input type="email" id="correoEditar" name="correo">

            <label for="programaEditar">Programa Académico:</label>
            <input type="text" id="programaEditar" name="programa">

            <label for="estadoEditar">Estado del Estudiante:</label>
            <select id="estadoEditar" name="estado" required>
                <option value="">-- Selecciona un estado --</option>
                <option value="activo">Activo</option>
                <option value="inactivo">Inactivo</option>
            </select>

            <label for="telefonoEditar">Número de Teléfono:</label>
            <input type="tel" id="telefonoEditar" name="telefono" pattern="[0-9]{10}" placeholder="Ej: 3001234567">

            <label for="fechaRegistroEditar">Fecha de Registro:</label>
            <input type="date" id="fechaRegistroEditar" name="fechaRegistro">

            <label for="direccionEditar">Dirección:</label>
            <input type="text" id="direccionEditar" name="direccion">

            <label for="claveEditar">Contraseña:</label>
            <input type="password" id="claveEditar" name="clave">

            <button type="submit">Actualizar</button>
        </form>

        </div>
    </div>
</div>
</body>

<%@ include file="footer.jsp" %>

</html>

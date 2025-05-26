<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Gestión de Estudiantes | Apocalipsis</title>
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

                <label for="documento">Documento:</label>
                <input type="text" id="documento" name="documento" required>

                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" required>

                <label for="programa">Programa Académico:</label>
                <input type="text" id="programa" name="programa" required>

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

                <label for="documentoEditar">Documento:</label>
                <input type="text" id="documentoEditar" name="documento">

                <label for="correoEditar">Correo:</label>
                <input type="email" id="correoEditar" name="correo">

                <label for="programaEditar">Programa Académico:</label>
                <input type="text" id="programaEditar" name="programa">

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

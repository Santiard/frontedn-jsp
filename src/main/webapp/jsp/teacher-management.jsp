<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Gestión de Docentes | Apocalipsis</title>
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

    <!-- Buscar docente -->
    <div class="full-width-container">
        <div class="form-container">
            <h2>Buscar Docente</h2>
            <form action="BuscarDocenteServlet" method="get">
                <label for="buscarDocumento">Documento:</label>
                <input type="text" id="buscarDocumento" name="documento" required>
                <button type="submit">Buscar</button>
            </form>
        </div>
    </div>

    <div class="row-container">
        <div class="form-container equal-panel">
            <h2>Registrar Docente</h2>
            <form action="RegistrarDocenteServlet" method="post">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>

                <label for="documento">Documento:</label>
                <input type="text" id="documento" name="documento" required>

                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" required>

                <label for="specialization">Espacializacion:</label>
                <input type="text" id="specialization" name="specialization" required>

                <label for="clave">Contraseña:</label>
                <input type="password" id="clave" name="clave" required>

                <button type="submit">Registrar</button>
            </form>
        </div>

        <div class="form-container equal-panel">
            <h2>Editar Docente</h2>
            <form action="EditarDocenteServlet" method="post">

                <label for="nombreEditar">Nombre:</label>
                <input type="text" id="nombreEditar" name="nombre">

                <label for="documentoEditar">Documento:</label>
                <input type="text" id="documentoEditar" name="documento">

                <label for="correoEditar">Correo:</label>
                <input type="email" id="correoEditar" name="correo">

                <label for="specializationEditar">Especializacion:</label>
                <input type="text" id="specializationEditar" name="specialization">

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

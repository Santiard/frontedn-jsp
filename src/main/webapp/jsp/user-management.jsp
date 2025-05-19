<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>user management Apocalipsis</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleUser-management.css" />
</head>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>
<body>
<div class="page-wrapper">

    <!-- Buscar usuario: centrado y ancho completo -->
    <div class="full-width-container">
        <div class="form-container">
            <h2>Buscar Usuario</h2>
            <form action="BuscarUsuarioServlet" method="get">
                <label for="buscarDocumento">Documento:</label>
                <input type="text" id="buscarDocumento" name="documento" required>
                <button type="submit">Buscar</button>
            </form>
        </div>
    </div>

    <!-- Registrar y Editar usuario: uno al lado del otro -->
    <div class="row-container">
        <div class="form-container equal-panel">
            <h2>Registrar Usuario</h2>
            <form action="RegistrarUsuarioServlet" method="post">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>

                <label for="documento">Documento:</label>
                <input type="text" id="documento" name="documento" required>

                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" required>

                <label for="rol">Rol:</label>
                <select id="rol" name="rol">
                    <option value="ADMIN">Admin</option>
                    <option value="DOCENTE">Docente</option>
                    <option value="ESTUDIANTE">Estudiante</option>
                </select>

                <label for="clave">Contraseña:</label>
                <input type="password" id="clave" name="clave" required>

                <button type="submit">Registrar</button>
            </form>
        </div>

        <div class="form-container equal-panel">
            <h2>Editar Usuario</h2>
            <form action="EditarUsuarioServlet" method="post">

                <label for="nombreEditar">Nombre:</label>
                <input type="text" id="nombreEditar" name="nombre">

                <label for="documentoEditar">Documento:</label>
                <input type="text" id="documentoEditar" name="documento">

                <label for="correoEditar">Correo:</label>
                <input type="email" id="correoEditar" name="correo">

                <label for="rolEditar">Rol:</label>
                <select id="rolEditar" name="rol">
                    <option value="ADMIN">Admin</option>
                    <option value="DOCENTE">Docente</option>
                    <option value="ESTUDIANTE">Estudiante</option>
                </select>

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
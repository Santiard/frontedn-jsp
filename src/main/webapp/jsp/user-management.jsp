<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Gestión de Usuarios - Apocalipsis</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleUser-management.css" />
</head>

<body>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<div class="page-wrapper">

    <!-- Formulario de Búsqueda -->
    <div class="full-width-container">
        <div class="form-container">
            <h2>Buscar Usuario</h2>
            <form action="BuscarUsuarioServlet" method="get">
                <label for="buscarDocumento">Documento:</label>
                <input type="text" id="buscarDocumento" name="documento" required>
                <button type="submit">Buscar</button>
            </form>

            <!-- Mensaje de error si no se encuentra usuario -->
            <c:if test="${not empty mensajeError}">
                <p style="color: red;">${mensajeError}</p>
            </c:if>
        </div>
    </div>

    <div class="row-container">

        <!-- Formulario de Registro -->
        <div class="form-container equal-panel">
            <h2>Registrar Usuario</h2>
            <c:if test="${not empty errorRegistro}">
                <p style="color:red;">${errorRegistro}</p>
            </c:if>

            <c:if test="${param.registroExitoso eq 'true'}">
                <p style="color:green;">Usuario registrado exitosamente.</p>
            </c:if>
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
                    <option value="TEACHER">Docente</option>
                    <option value="STUDENT">Estudiante</option>
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
                <input type="text" id="nombreEditar" name="nombre"
                       value="${usuarioBuscado.nombre}"
                       <c:if test="${empty usuarioBuscado}">readonly</c:if> />

                <label for="documentoEditar">Documento:</label>
                <input type="text" id="documentoEditar" name="documento"
                       value="${usuarioBuscado.documento}"
                       <c:if test="${empty usuarioBuscado}">readonly</c:if> />

                <label for="correoEditar">Correo:</label>
                <input type="email" id="correoEditar" name="correo"
                       value="${usuarioBuscado.correo}"
                       <c:if test="${empty usuarioBuscado}">readonly</c:if> />

                <label for="rolEditar">Rol:</label>
                <select id="rolEditar" name="rol">
                    <option value="ADMIN" ${fn:toUpperCase(usuarioBuscado.rol) eq 'ADMIN' ? 'selected="selected"' : ''}>Admin</option>
                    <option value="TEACHER" ${fn:toUpperCase(usuarioBuscado.rol) eq 'TEACHER' ? 'selected="selected"' : ''}>Docente</option>
                    <option value="STUDENT" ${fn:toUpperCase(usuarioBuscado.rol) eq 'STUDENT' ? 'selected="selected"' : ''}>Estudiante</option>
                </select>

                <label for="claveEditar">Contraseña:</label>
                <input type="password" id="claveEditar" name="clave"
                       value=""
                       <c:if test="${empty usuarioBuscado}">readonly</c:if> />

                <button type="submit" <c:if test="${empty usuarioBuscado}">disabled</c:if>>Actualizar</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
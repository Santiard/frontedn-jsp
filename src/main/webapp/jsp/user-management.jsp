

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Gestión de Usuarios - Apocalipsis</title>
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

<body>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<div class="page-wrapper">

    <!-- Formulario de Búsqueda -->
    <div class="full-width-container">
        <div class="form-container">
            <h2>Buscar Usuario</h2>
            <form action="${pageContext.request.contextPath}/BuscarUsuarioServlet" method="get">
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

        <div class="form-container equal-panel">
            <h2>Registrar Usuario</h2>
            <c:if test="${not empty errorRegistro}">
                <p style="color:red;">${errorRegistro}</p>
            </c:if>

            <c:if test="${param.registroExitoso eq 'true'}">
                <p style="color:green;">Usuario registrado exitosamente.</p>
            </c:if>
            <form action="${pageContext.request.contextPath}/RegistrarUsuarioServlet" method="post">
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
            <form id="editarUsuarioForm" action="${pageContext.request.contextPath}/EditarUsuarioServlet" method="post">

                <!-- Nombre -->
                <label for="nombreEditar">Nombre completo:</label>
                <input type="text" id="nombreEditar" name="nombre"
                       value="${usuarioBuscado.firstName} ${usuarioBuscado.lastName}"
                       <c:if test="${empty usuarioBuscado}">readonly</c:if> />

                <!-- Documento -->
                <label for="documentoEditar">Número de Documento:</label>
                <input type="text" id="documentoEditar" name="documento"
                       value="${usuarioBuscado.documentNumber}"
                       <c:if test="${empty usuarioBuscado}">readonly</c:if> />

                <!-- Correo -->
                <label for="correoEditar">Correo Electrónico:</label>
                <input type="email" id="correoEditar" name="correo"
                       value="${usuarioBuscado.email}"
                       <c:if test="${empty usuarioBuscado}">readonly</c:if> />

                <!-- Rol -->
                <label for="rolEditar">Rol:</label>
                <select id="rolEditar" name="rol">
                    <option value="ADMIN" ${fn:toUpperCase(usuarioBuscado.roleName) eq 'ADMIN' ? 'selected="selected"' : ''}>Admin</option>
                    <option value="TEACHER" ${fn:toUpperCase(usuarioBuscado.roleName) eq 'TEACHER' ? 'selected="selected"' : ''}>Docente</option>
                    <option value="STUDENT" ${fn:toUpperCase(usuarioBuscado.roleName) eq 'STUDENT' ? 'selected="selected"' : ''}>Estudiante</option>
                </select>

                <!-- Clave oculta (original) -->
                <input type="hidden" id="claveOriginal" name="claveOriginal" value="${usuarioBuscado.password}" />

                <!-- Contraseña actual (no editable de ninguna forma) -->
                <label for="claveEditar">Contraseña Actual:</label>
                <input type="password" id="claveEditar" name="clave"
                       value="********"
                       readonly disabled
                       onfocus="this.blur();" />

                <!-- Nueva contraseña -->
                <label for="nuevaClave">Nueva Contraseña:</label>
                <input type="password" id="nuevaClave" name="nuevaClave" />

                <!-- Confirmar contraseña -->
                <label for="confirmarClave">Confirmar Nueva Contraseña:</label>
                <input type="password" id="confirmarClave" name="confirmarClave" />

                <!-- Botón actualizar -->
                <button type="submit" <c:if test="${empty usuarioBuscado}">disabled</c:if>>Actualizar</button>
            </form>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/ViewUsuariosServlet">
        <button>Ver Usuarios Registrados</button>
    </a>

</div>

<%@ include file="footer.jsp" %>
</body>

<script>
    document.getElementById('editarUsuarioForm').addEventListener('submit', function (e) {
        const nuevaClave = document.getElementById('nuevaClave').value.trim();
        const confirmarClave = document.getElementById('confirmarClave').value.trim();

        if (nuevaClave || confirmarClave) {
            if (nuevaClave !== confirmarClave) {
                alert("La nueva contraseña y la confirmación no coinciden.");
                e.preventDefault();
                return;
            }

            const confirmar = confirm("¿Está seguro de que desea cambiar la contraseña?");
            if (!confirmar) {
                e.preventDefault();
            }
        } else {

            document.getElementById('claveEditar').value = document.getElementById('claveOriginal').value;
        }
    });
</script>
</html>


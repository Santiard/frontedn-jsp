<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Usuarios</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar-brand, .nav-link, h2, label, .btn {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Registrar Nuevo Usuario</h2>

    <c:if test="${not empty errorRegistro}">
        <div class="alert alert-danger">${errorRegistro}</div>
    </c:if>
    <c:if test="${param.registroExitoso eq 'true'}">
        <div class="alert alert-success">Usuario registrado exitosamente.</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/RegistrarUsuarioServlet" method="post">
        <div class="form-group">
            <label for="nombre">Nombre completo:</label>
            <input type="text" class="form-control" name="nombre" id="nombre" value="${nombre != null ? nombre : ''}" required>
        </div>
        <div class="form-group">
            <label for="documento">Documento:</label>
            <input type="text" class="form-control" name="documento" id="documento" value="${documento != null ? documento : ''}" required>
        </div>
        <div class="form-group">
            <label for="correo">Correo electrónico:</label>
            <input type="email" class="form-control" name="correo" id="correo" value="${correo != null ? correo : ''}" required>
        </div>
        <div class="form-group">
            <label for="clave">Contraseña:</label>
            <input type="password" class="form-control" name="clave" id="clave" required>
        </div>
        <div class="form-group">
            <label for="rol">Rol:</label>
            <select class="form-control" name="rol" id="rol" required>
                <option value="">Seleccionar Rol</option>
                <option value="ADMIN" ${rol == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                <option value="TEACHER" ${rol == 'TEACHER' ? 'selected' : ''}>TEACHER</option>
                <option value="STUDENT" ${rol == 'STUDENT' ? 'selected' : ''}>STUDENT</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Registrar</button>
    </form>

    <hr class="my-4">

    <div class="text-right">
        <a href="${pageContext.request.contextPath}/verUsuarios" class="btn btn-outline-info">
            Ver Usuarios Registrados
        </a>
    </div>
</div>

</body>
</html>

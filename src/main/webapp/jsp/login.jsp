<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Login Apocalipsis</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesLogin.css" />
</head>
<body>
<%@ include file="header.jsp" %>

<div class="login-wrapper">
    <div class="login-container">
        <h2>Iniciar sesión</h2>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form action="login" method="post">
            <label for="username">Usuario:</label>
            <input type="text" name="username" id="username" required />

            <label for="password">Contraseña:</label>
            <input type="password" name="password" id="password" required />

            <input type="submit" value="Entrar" />
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>


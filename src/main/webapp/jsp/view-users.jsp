<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Listado de Usuarios</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<div class="container">
    <h2>Listado de Usuarios Registrados</h2>

    <table border="1" cellpadding="10">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre completo</th>
            <th>Email</th>
            <th>Rol</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="usuario" items="${usuarios}">
            <tr>
                <td>${usuario.id}</td>
                <td>${usuario.nombre}</td>
                <td>${usuario.email}</td>
                <td>${usuario.rol}</td>
                <td>
                    <c:choose>
                        <c:when test="${usuario.status == true}">
                            Activo
                        </c:when>
                        <c:otherwise>
                            Inactivo
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <br>
    <a href="user-management.jsp">← Volver al registro</a>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>


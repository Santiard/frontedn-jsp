<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Detalles del Usuario - Apocalipsis</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .page-wrapper {
            max-width: 600px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .user-info {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .user-info div {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #ecf0f1;
            border-radius: 5px;
        }

        .user-info div span:first-child {
            font-weight: bold;
            color: #2c3e50;
        }

        .back-link {
            display: block;
            margin-top: 30px;
            text-align: center;
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<div class="page-wrapper">
    <h2>Información del Usuario</h2>

    <div class="user-info">
        <div>
            <span>ID:</span>
            <span>${usuario.id}</span>
        </div>
        <div>
            <span>Nombre:</span>
            <span>${usuario.firstName} ${usuario.lastName}</span>
        </div>
        <div>
            <span>Email:</span>
            <span>${usuario.email}</span>
        </div>
        <div>
            <span>Rol:</span>
            <span>${usuario.role.name}</span>
        </div>
        <div>
            <span>Estado:</span>
            <span>
                <c:choose>
                    <c:when test="${usuario.status}">
                        Activo
                    </c:when>
                    <c:otherwise>
                        Inactivo
                    </c:otherwise>
                </c:choose>
            </span>
        </div>
    </div>

    <a class="back-link" href="user-management.jsp">← Volver al listado</a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>

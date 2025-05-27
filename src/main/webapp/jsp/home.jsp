<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesHome.css" />

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f4f6f9;
        margin: 0;
        padding: 0;
    }

    .home-wrapper {
        display: flex;
        justify-content: center;
        padding: 40px 20px;
    }

    .dashboard {
        max-width: 1200px;
        width: 100%;
        display: flex;
        gap: 30px;
        flex-wrap: wrap;
    }

    .left-panel, .right-panel, .form-container {
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.06);
        padding: 25px;
    }

    .left-panel {
        flex: 2;
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
        gap: 20px;
    }

    .right-panel {
        flex: 1;
    }

    .module {
        text-align: center;
        padding: 15px;
        background-color: #ecf0f1;
        border-radius: 10px;
        transition: transform 0.2s ease;
        text-decoration: none;
        color: #2c3e50;
    }

    .module:hover {
        transform: translateY(-5px);
        background-color: #dfe6e9;
    }

    .module img {
        width: 40px;
        height: 40px;
        margin-bottom: 10px;
    }

    .module span {
        display: block;
        font-size: 16px;
        font-weight: 600;
    }

    .user-card {
        border-left: 5px solid #3498db;
        padding-left: 15px;
    }

    .user-card h3 {
        margin-top: 0;
        color: #2c3e50;
    }

    .user-card p {
        margin: 8px 0;
        font-size: 15px;
        color: #34495e;
    }

    .user-card p strong {
        width: 90px;
        display: inline-block;
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


<div class="home-wrapper">
    <div class="dashboard">

        <!-- Panel izquierdo con módulos -->
        <div class="left-panel">
            <a href="#" class="module">
                <img src="${pageContext.request.contextPath}/images/icon-students.png" alt="Estudiantes">
                <span>Estudiantes</span>
            </a>
            <a href="#" class="module">
                <img src="${pageContext.request.contextPath}/images/icon-teachers.png" alt="Docentes">
                <span>Docentes</span>
            </a>
            <a href="#" class="module">
                <img src="${pageContext.request.contextPath}/images/icon-subjects.png" alt="Asignaturas">
                <span>Asignaturas</span>
            </a>
            <a href="#" class="module">
                <img src="${pageContext.request.contextPath}/images/icon-rooms.png" alt="Salones">
                <span>Salones</span>
            </a>
        </div>

        <!-- Panel derecho con info de usuario -->
        <div class="right-panel">
            <div class="user-card">
                <h3>Bienvenido</h3>
                <p><strong>Nombre:</strong> ${sessionScope.nombre}</p>
                <p><strong>Correo:</strong> ${sessionScope.correo}</p>
                <p><strong>Rol:</strong> ${sessionScope.rol}</p>
                <p><strong>Último acceso:</strong> ${sessionScope.ultimoAcceso}</p>
            </div>
        </div>

    </div>
</div>

<%@ include file="footer.jsp" %>

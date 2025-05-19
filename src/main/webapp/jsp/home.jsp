<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-wrapper">
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesHome.css" />

<!-- Contenido principal -->
<div class="home-container">
    <!-- Columna izquierda -->
    <div class="left-column">
        <div class="module-grid">
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
    </div>

    <!-- Columna derecha -->
    <div class="right-column">
        <div class="user-info">
            <h3>Bienvenido</h3>
            <p><strong>Nombre:</strong> ${usuario.nombre}</p>
            <p><strong>Rol:</strong> ${usuario.rol}</p>
        </div>
    </div>
</div>
</div>
<%@ include file="footer.jsp" %>

<script>
    function toggleDropdown() {
        const dropdown = document.getElementById("userDropdown");
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }

    window.onclick = function(event) {
        if (!event.target.matches('.user-name')) {
            const dropdown = document.getElementById("userDropdown");
            if (dropdown && dropdown.style.display === "block") {
                dropdown.style.display = "none";
            }
        }
    }
</script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleNavbar.css" />


<!--
<div class="nav-options">
<a href="#">Inicio</a>

<a href="#">Estudiantes</a>

<c:if test="${usuario.rol == 'admin'}">
    <a href="#">Docentes</a>
    <a href="#">Asignaturas</a>
</c:if>

<c:if test="${usuario.rol == 'docente'}">
    <a href="#">Asignaturas</a>
</c:if>

<c:if test="${usuario.rol == 'admin' or usuario.rol == 'docente'}">
    <a href="#">Salones</a>
</c:if>
</div>
-->



<div class="nav-banner">
    <div class="nav-options">
        <a href="#">Inicio</a>
        <a href="jsp/usuarios">Usuarios</a>
        <a href="#">Estudiantes</a>
        <a href="#">Docentes</a>
        <a href="#">Asignaturas</a>
        <a href="#">Salones</a>
    </div>
    <div class="nav-right">
        <a href="#">
            <img src="${pageContext.request.contextPath}/images/salir.png" alt="Salir" class="nav-icon" />
        </a>
        <span class="notification-icon">🔔</span>
        <div class="user-menu">
            <span class="user-name" onclick="toggleDropdown()">${usuario.nombre}</span>
            <div class="dropdown" id="userDropdown">
                <a href="#">Perfil</a>
                <a href="#">Configuración</a>
                <form action="logout" method="post">
                    <button type="submit">Salir</button>
                </form>
            </div>
        </div>
    </div>
</div>

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
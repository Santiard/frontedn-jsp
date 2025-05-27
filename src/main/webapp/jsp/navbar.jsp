<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>header</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleNavbar.css" />
</head>

<div class="nav-banner">
    <div class="nav-options">

        <c:if test="${sessionScope.rol == 'ADMIN'}">
            <a href="${pageContext.request.contextPath}/usuarios">Gestion Usuarios</a>
            <a href="${pageContext.request.contextPath}/teacher-management.jsp">Gestion Docentes</a>
            <a href="${pageContext.request.contextPath}/student-management.jsp">Gestion Estudiantes</a>
            <a href="${pageContext.request.contextPath}/semester-management.jsp">Gestion Semestres</a>
            <a href="${pageContext.request.contextPath}/subject-management.jsp">Gestion Materias</a>
            <a href="${pageContext.request.contextPath}/place-management.jsp">Gestion Espacios</a>
            <a href="${pageContext.request.contextPath}/loans-management.jsp">Gestion Prestamos</a>
            <a href="${pageContext.request.contextPath}/registroCarreraEstudiante.jsp">Registro estudiante-carrera</a>
        </c:if>

        <c:if test="${sessionScope.rol == 'TEACHER'}">
            <a href="#">Gestion Notas</a>
            <a href="#">Gestion Asistencias</a>
            <a href="#">Gestion Evaluaciones</a>
        </c:if>

        <c:if test="${sessionScope.rol == 'STUDENT'}">
            <a href="#">Gestion Materias</a>
            <a href="#">Gestion Excusas</a>
            <a href="#">Record Academico</a>
            <a href="#">Horario</a>
        </c:if>
    </div>
    <div class="nav-right">
        <a href="#">
            <img src="${pageContext.request.contextPath}/images/exit.png" alt="Salir" class="nav-icon" />
        </a>
        <a href="#">
            <img src="${pageContext.request.contextPath}/images/notification.png" alt="Notificacion" class="nav-icon" />
        </a>
        <a href="#">
            <img src="${pageContext.request.contextPath}/images/user.png" alt="Perfil" class="nav-icon" />
        </a>
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
</html>

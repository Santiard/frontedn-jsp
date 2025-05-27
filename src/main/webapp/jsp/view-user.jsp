<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Usuarios - Apocalipsis</title>
    <style>

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        /* Layout Containers */
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
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

        /* Form Elements */
        form label {
            font-weight: 600;
        }

        input,
        select,
        button {
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

        /* Accordion Styles */
        .accordion {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            margin-bottom: 15px;
            overflow: hidden;
        }

        .accordion-header {
            background-color: #2c3e50;
            color: white;
            cursor: pointer;
            padding: 12px 18px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            text-align: left;
            outline: none;
            width: 100%;
            transition: background-color 0.3s ease;
            letter-spacing: 0.03em;
            border-left: 5px solid #3498db;
        }

        .accordion-header:hover {
            background-color: #1f2a38;
        }

        .accordion-content {
            padding: 0 20px 15px 20px;
            display: none;
            background-color: #ecf0f1;
        }

        /* User Cards and Details */
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

        .user-detail {
            padding: 10px 0;
            border-bottom: 1px solid #ccc;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-detail span.label {
            font-weight: 600;
            color: #2c3e50;
            min-width: 140px;
            display: inline-block;
        }

        .user-detail:last-child {
            border-bottom: none;
        }

        .password-wrapper {
            display: flex;
            align-items: center;
        }

        .password-text {
            margin-right: 10px;
            font-family: monospace;
        }

        .toggle-password-btn {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
            color: #3498db;
            user-select: none;
        }

        .toggle-password-btn:hover {
            color: #2980b9;
        }
    </style>

</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<div class="container">
    <h2>Lista de Usuarios</h2>

    <div class="accordion">
        <button class="accordion-header" onclick="toggleAccordion(this)">
            Juan Pérez
        </button>
        <div class="accordion-content">
            <div class="user-detail">
                <span class="label">Nombre :</span>
                <span>Juan Pérez</span>
            </div>
            <div class="user-detail">
                <span class="label">Número de documento:</span>
                <span>12345678</span>
            </div>
            <div class="user-detail">
                <span class="label">Correo:</span>
                <span>juan.perez@example.com</span>
            </div>
            <div class="user-detail">
                <span class="label">Rol:</span>
                <span>Estudiante</span>
            </div>
            <div class="user-detail password-wrapper">
                <span class="label">Contraseña:</span>
                <span id="passwordText1" class="password-text">••••••••</span>
                <button class="toggle-password-btn" onclick="togglePassword('passwordText1')">👁️</button>
            </div>
        </div>
    </div>

    <div class="accordion">
        <button class="accordion-header" onclick="toggleAccordion(this)">
            María Gómez
        </button>
        <div class="accordion-content">
            <div class="user-detail">
                <span class="label">Nombre :</span>
                <span>María Gómez</span>
            </div>
            <div class="user-detail">
                <span class="label">Número de documento:</span>
                <span>87654321</span>
            </div>
            <div class="user-detail">
                <span class="label">Correo:</span>
                <span>maria.gomez@example.com</span>
            </div>
            <div class="user-detail">
                <span class="label">Rol:</span>
                <span>Admin</span>
            </div>
            <div class="user-detail password-wrapper">
                <span class="label">Contraseña:</span>
                <span id="passwordText2" class="password-text">••••••••</span>
                <button class="toggle-password-btn" onclick="togglePassword('passwordText2')">👁️</button>
            </div>
        </div>
    </div>

</div>

<script>
    function toggleAccordion(button) {
        const content = button.nextElementSibling;
        content.style.display = (content.style.display === "block") ? "none" : "block";
    }

    const passwords = {
        passwordText1: 'juanPass123',
        passwordText2: 'adminSecret456'
    };

    function togglePassword(id) {
        const passwordText = document.getElementById(id);
        if (passwordText.textContent === '••••••••') {
            passwordText.textContent = passwords[id];
        } else {
            passwordText.textContent = '••••••••';
        }
    }
</script>

<%@ include file="footer.jsp" %>
</body>
</html>

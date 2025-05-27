<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Login Apocalipsis</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesLogin.css" />
    <style>
        body {
            background: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(15px);
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            padding: 2rem;
            max-width: 400px;
            width: 100%;
        }

        .card-title {
            font-weight: 700;
            color: #007bff;
        }

        .form-label {
            font-weight: 600;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 0.5rem;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .alert {
            border-radius: 0.5rem;
        }

        .card-footer {
            background-color: transparent;
            border-top: none;
            font-size: 0.9rem;
        }

        .input-group-text {
            background-color: #f0f0f0;
            border-right: 0;
        }

        .form-control {
            border-left: 0;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #007bff;
        }
    </style>

</head>
<body>
<%@ include file="header.jsp" %>

<div class="d-flex justify-content-center align-items-center vh-100">
    <div class="login-card">
        <h3 class="card-title text-center mb-4">
            <i class="bi bi-person-circle me-2"></i> Iniciar sesión
        </h3>

        <c:if test="${not empty error}">
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Correo electronico</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                    <input
                            type="text"
                            id="email"
                            name="email"
                            class="form-control"
                            placeholder="Ingresa tu correo"
                            required
                    />
                </div>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                    <input
                            type="password"
                            id="password"
                            name="password"
                            class="form-control"
                            placeholder="Ingresa tu contraseña"
                            required
                    />
                </div>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-box-arrow-in-right me-1"></i> Entrar
                </button>
            </div>
        </form>

        <div class="card-footer text-center mt-4">
            <small class="text-muted">&copy; 2025 Tu Aplicación - Todos los derechos reservados</small>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<%@ include file="footer.jsp" %>
</body>
</html>


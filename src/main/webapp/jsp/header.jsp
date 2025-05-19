<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #f8f9fa; /* gris claro */
        padding: 10px 20px;
        border-bottom: 1px solid #ddd;
        font-family: Arial, sans-serif;
        color: #333;
        font-size: 14px;
    }
    .header-left img {
        height: 50px;
    }
    .header-right {
        text-align: right;
        color: #007BFF; /* azul */
        font-weight: 600;
        line-height: 1.2;
        font-size: 14px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .header-right .title {
        font-size: 18px;
        font-weight: 700;
        margin-bottom: 4px;
        color: #0056b3; /* azul más oscuro */
    }
</style>

<div class="header">
    <div class="header-left">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" />
    </div>
    <div class="header-right">
        <div class="title">Apocalipsis</div>
        <div>Sistema de información educativa</div>
        <div>2025</div>
    </div>
</div>
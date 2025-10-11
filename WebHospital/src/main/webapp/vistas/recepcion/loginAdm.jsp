<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String errorLogin = (String) request.getAttribute("errorLogin");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login Administración</title>
    <link rel="icon" href="<%=request.getContextPath()%>/img/icono.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.6)),
                        url('<%= request.getContextPath() %>/img/fondo.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            width: 360px;
            text-align: center;
            animation: popUp 0.6s ease;
        }

        @keyframes popUp {
            0% { transform: scale(0.95); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        .login-container h2 {
            color: #0d6efd;
            margin-bottom: 25px;
            font-size: 26px;
        }

        .error {
            color: #dc3545;
            font-weight: bold;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            font-weight: 600;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border 0.3s ease;
        }

        .form-group input:focus {
            border-color: #0d6efd;
            outline: none;
        }

        .form-group i {
            margin-right: 8px;
            color: #0d6efd;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 12px;
            margin-top: 20px;
        }

        .login-container input[type="submit"],
        .login-container button {
            flex: 1;
            background-color: #0d6efd;
            color: white;
            padding: 10px 0;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .login-container input[type="submit"]:hover,
        .login-container button:hover {
            background-color: #0b5ed7;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2><i class="fas fa-user-shield"></i> Iniciar Sesión</h2>

    <% if (errorLogin != null) { %>
        <p class="error"><i class="fas fa-exclamation-circle"></i> <%= errorLogin %></p>
    <% } %>

    <form action="<%= request.getContextPath() %>/vistas/logeo/validarAdm.jsp" method="post">
        <div class="form-group">
            <label for="dni"><i class="fas fa-id-card"></i><strong>DNI:</strong> </label>
            <input type="text" name="dni" id="dni" required
                   placeholder="Ingrese DNI" maxlength="8"
                   oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                   value="<%= request.getAttribute("filtro") != null ? request.getAttribute("filtro") : "" %>">
        </div>

        <div class="form-group">
            <label for="clave"><i class="fas fa-lock"></i><strong>Contraseña:</strong></label>
            <input type="password" name="clave" placeholder="Ingrese Contraseña" required>
        </div>

        <div class="button-group">
            <input type="submit" value="Ingresar">
            <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/vistas/logeo/login.jsp'">
                Regresar
            </button>
        </div>
    </form>
</div>
</body>
</html>

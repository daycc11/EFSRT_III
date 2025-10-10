<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Login</title>
	<link rel="icon" href="<%=request.getContextPath()%>/img/icono.png" type="image/x-icon">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">

<style>
    html, body {
        height: 100%;
        margin: 0;
        background: linear-gradient(to right, #e9f1ff, #ffffff);
        animation: fadeInBody 1s ease-in;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .row.no-gutters {
        height: 100vh;
    }

    .left-panel {
        padding: 0;
        height: 100%;
        animation: slideInLeft 1.2s ease-out;
    }

    .left-panel img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
    }

    .form-container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        height: 100vh;
        padding: 40px 30px;
        background-color: #f8f9fa;
        animation: slideInRight 1.2s ease-out;
    }

    .titulo-sistema {
        font-size: 3rem;
        font-weight: bold;
        color: #0b5ed7;
        margin-bottom: 40px;
        animation: fadeInTitulo 1.2s ease-out;
    }

    .form-container select.form-control {
        height: 45px;
        font-size: 1rem;
        transition: transform 0.3s ease;
    }

    .form-container select.form-control:hover {
        transform: scale(1.03);
    }

    .form-container .icon-title {
        font-size: 4rem;
        color: #0d6efd;
        margin-bottom: 10px;
        animation: fadeInTitulo 1s ease-out;
    }

    @keyframes fadeInBody {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    @keyframes slideInLeft {
        from { transform: translateX(-100px); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
    }

    @keyframes slideInRight {
        from { transform: translateX(100px); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
    }

    @keyframes fadeInTitulo {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

</style>
</head>
<body>

<div class="container-fluid">
    <div class="row no-gutters">
    
        <div class="col-md-6 left-panel">
            <img src="<%=request.getContextPath()%>/img/login.png" alt="Login Illustration">
        </div>

        <div class="col-md-6 form-container">
            <div class="text-center mb-5">
                <div class="icon-title"><i class="bi bi-person-lock"></i></div>
                <h1 class="titulo-sistema">Sistema de Registro de Incidencias Estudiantiles</h1>
                <h4 class="text-dark">Por favor, selecciona tu tipo de acceso</h4>
            </div>

            <form>
                <div class="form-group mb-4">
                    <label for="tipoAcceso" class="form-label">Tipo de acceso</label>
                    <select class="form-control" id="tipoAcceso" name="tipoAcceso" required onchange="redirigir()">
                        <option value="">--- SELECCIONE UNA OPCIÓN ---</option>
                        <option value="${pageContext.request.contextPath}/vistas/administracion/loginAdm.jsp">Administración</option>
                        <option value="${pageContext.request.contextPath}/vistas/docente/loginDoc.jsp">Docente</option>
                        <option value="${pageContext.request.contextPath}/vistas/estudiante/loginEst.jsp">Estudiante</option>
                    </select>
                </div>

                <p class="text-danger mt-3">
                    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </p>
            </form>
        </div>
    </div>
</div>

<script>
    function redirigir() {
        const seleccion = document.getElementById("tipoAcceso").value;
        if (seleccion) {
            window.location.href = seleccion;
        }
    }
</script>

</body>
</html>

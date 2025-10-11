<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Inicio</title>
    <link rel="icon" href="<%=request.getContextPath()%>/img/icono.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e9f1ff, #ffffff);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .banner {
            width: 100%;
            height: 140px;
            overflow: hidden;
            display: flex;
            align-items: center;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 0.5rem 1rem;
        }

	     .banner img {
	         height: 100%;
	         width: 100%;
	         object-fit: contain;
	     }

        .welcome-text {
            text-align: end;
            margin-top: 10px;
            font-size: 1.1rem;
            color: #333;
        }

        .card-option {
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .card-option:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .card-icon {
            font-size: 2.5rem;
            color: #0d6efd;
            margin-bottom: 0.5rem;
        }

        .img-banner-docente {
            width: 100%;
            max-height: 460px;
            object-fit: cover;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="container mt-4">

    <div class="banner mb-3">
        <img src="<%=request.getContextPath()%>/img/cibertec.png" alt="Banner">
    </div>

    <div class="welcome-text text-end">
        <strong><i class="bi bi-person-circle"></i> Doctor:</strong> <%= session.getAttribute("nombres") %> <%= session.getAttribute("apellidos") %>
    </div>

    <div class="row mt-4 g-3">
        <div class="col-md-4">
            <div class="card card-option text-center p-3">
                <i class="bi bi-journal-plus card-icon"></i>
                <h5 class="card-title">Proximas Citas</h5>
                <a href="<%=request.getContextPath()%>/CitaServlet?accion=add" class="stretched-link"></a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card card-option text-center p-3">
                <i class="bi bi-clipboard-data card-icon"></i>
                <h5 class="card-title">Reporte Pacientes</h5>
                <a href="<%=request.getContextPath()%>/PacienteServlet?accion=listar&origen=docente" class="stretched-link"></a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card card-option text-center p-3">
                <i class="bi bi-box-arrow-right card-icon"></i>
                <h5 class="card-title text-danger">Cerrar Sesión</h5>
                <a href="<%=request.getContextPath()%>/login.jsp" class="stretched-link"></a>
            </div>
        </div>
    </div>
    
    <div class="mt-4">
        <img src="<%=request.getContextPath()%>/img/docente_banner.png" 
             alt="Bienvenido Docente"
             class="img-banner-docente">
    </div>
</div>

</body>
</html>

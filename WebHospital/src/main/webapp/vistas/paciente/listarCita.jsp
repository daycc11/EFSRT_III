<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Modelo.Cita"%>
<%
HttpSession sesion = request.getSession(false);
Integer idPacienteSesion = (Integer) sesion.getAttribute("idPaciente");

if (idPacienteSesion == null) {
    response.sendRedirect(request.getContextPath() + "/vistas/paciente/loginPac.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Mis Citas</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/iconoHospital.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<style>
body {
    background: linear-gradient(to right, #e9f1ff, #ffffff);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
.banner {
    width: 100%;
    height: 200px;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}
.banner img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.section-title {
    background-color: #254aa5;
    color: white;
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
}
.card {
    border: none;
    border-radius: 10px;
    margin-bottom: 1rem;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
.card-body {
    padding: 1rem 1.25rem;
}
.status {
    font-size: 0.8rem;
    font-weight: 500;
    padding: 0.3rem 0.6rem;
    border-radius: 10px;
}
.status-Atendida {
    background-color: #d1f7e3;
    color: #1a7f4c;
}
.status-Pendiente {
    background-color: #fff3cd;
    color: #856404;
}
.status-Cancelada {
    background-color: #f8d7da;
    color: #842029;
}
</style>
</head>
<body>
<%@ include file="/vistas/social/redesSociales.jsp" %>
<div class="container mt-4 mb-5">
    <div class="banner mb-3">
        <img src="<%=request.getContextPath()%>/img/banner.jpeg" alt="Banner">
    </div>

    <div class="text-end mb-3">
        <strong><i class="bi bi-person-circle"></i> Paciente:</strong>
        <%=session.getAttribute("nombres")%> <%=session.getAttribute("apellidos")%>
    </div>

    <div class="d-flex mb-4">
        <a href="<%=request.getContextPath()%>/CitaServlet?accion=listarPorPac" class="btn btn-light me-2">
            <i class="bi bi-calendar"></i> Mis Citas
        </a>
        <a href="<%=request.getContextPath()%>/vistas/logeo/login.jsp" class="btn btn-light">
            <i class="bi bi-box-arrow-right text-danger"></i> Cerrar sesión
        </a>
    </div>

    <div class="section-title text-center mb-4">
        <h5><i class="bi bi-calendar-check"></i> Mis Citas</h5>
    </div>

    <%
    List<Cita> lista = (List<Cita>) request.getAttribute("citas");
    if (lista != null && !lista.isEmpty()) {
        for (Cita c : lista) {
            String estado = c.getEstado();
    %>
    <div class="card">
        <div class="card-body">
            <div class="d-flex justify-content-between">
                <small class="text-primary fw-semibold">
                    <%= c.getFechaProgramada() %> - <%= c.getHoraProgramada() %>
                </small>
                <span class="status status-<%= estado %>"><%= estado %></span>
            </div>
            <p class="fw-semibold mb-0 mt-1"><%= c.getNombreDoctor() %></p>
            <small class="text-muted">Registrada: <%= c.getFechaRegistrada() %> - <%= c.getHoraRegistrada() %></small>
            <p class="mt-2 mb-0 text-secondary">Descripción: <%= c.getDescripcion() %></p>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <div class="alert alert-info text-center" role="alert">
        <i class="bi bi-info-circle-fill"></i> No tienes citas registradas.
    </div>
    <%
    }
    %>
</div>
</body>
</html>

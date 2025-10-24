<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Modelo.Cita"%>
<%
HttpSession sesion = request.getSession(false);
Integer idDoctorSesion = (Integer) sesion.getAttribute("idDoctor");

if (idDoctorSesion == null) {
	response.sendRedirect(request.getContextPath() + "/vistas/logeo/login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Mis Citas Programadas</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/iconoHospital.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

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
	object-position: center;
	display: block;
}

.welcome-text {
	text-align: end;
	margin-top: 10px;
	font-size: 1.1rem;
	color: #333;
}

.btn-light {
	transition: all 0.3s ease;
	background-color: #f8f9fa;
	border: 1px solid #dee2e6;
}
.btn-light:hover {
	transform: scale(1.05);
	background-color: #e2e6ea;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

.section-title {
	background-color: #254aa5;
	color: white;
	padding: 10px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
	text-align: center;
	margin-bottom: 1rem;
}

/* ====== Tarjetas de Cita ====== */
.cita-card {
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 1.2rem;
	transition: transform 0.2s ease, box-shadow 0.2s ease;
	height: 100%;
}
.cita-card:hover {
	transform: scale(1.02);
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
}
.cita-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 0.5rem;
}
.cita-header h5 {
	margin: 0;
	font-weight: 600;
	color: #254aa5;
}
.cita-detalle {
	font-size: 0.95rem;
	color: #333;
	margin-bottom: 4px;
}

/* ====== Estados visuales ====== */
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

/* ====== Combo mejorado ====== */
.form-select-custom {
	border: 1px solid #d0d7de;
	border-radius: 8px;
	padding: 0.4rem 1.2rem;
	font-size: 0.9rem;
	background-color: #f9fafc;
	transition: all 0.2s ease-in-out;
	color: #333;
}
.form-select-custom:focus {
	border-color: #254aa5;
	box-shadow: 0 0 0 0.15rem rgba(37, 74, 165, 0.25);
	background-color: #fff;
}
.form-select-custom:hover {
	background-color: #eef3ff;
}
</style>
</head>

<body>
<%@ include file="/vistas/social/redesSociales.jsp" %>

<div class="container mt-4 mb-4">

	<div class="banner mb-3">
		<img src="<%=request.getContextPath()%>/img/banner.jpeg" alt="Banner">
	</div>

	<div class="welcome-text mb-3">
		<strong><i class="fas fa-user-md"></i> Doctor:</strong>
		<%=sesion.getAttribute("nombres")%> <%=sesion.getAttribute("apellidos")%>
	</div>

	<div class="mb-4 d-flex flex-wrap gap-2">
		<a href="<%=request.getContextPath()%>/CitaServlet?accion=listarPorDoc" class="btn btn-light">
			<i class="bi bi-calendar-check"></i> Citas Próximas
		</a>
		<a href="<%=request.getContextPath()%>/PacienteServlet?accion=listar&origen=doctor" class="btn btn-light">
			<i class="bi bi-people"></i> Reporte Pacientes
		</a>
		<a href="<%=request.getContextPath()%>/vistas/logeo/login.jsp" class="btn btn-light text-danger">
			<i class="bi bi-box-arrow-right text-danger"></i> Cerrar sesión
		</a>
	</div>

	<div class="section-title">
		<h5><i class="bi bi-calendar2-heart"></i> Mis Citas Programadas</h5>
	</div>

	<div class="row g-4">
	<%
	List<Cita> lista = (List<Cita>) request.getAttribute("citas");
	if (lista != null && !lista.isEmpty()) {
		for (Cita c : lista) {
			String estado = c.getEstado();
			String claseEstado = "status-" + estado;
	%>

		<div class="col-md-4">
			<div class="cita-card">
				<div class="cita-header">
					<h5><i class="bi bi-person-circle"></i> <%=c.getNombrePaciente()%></h5>
					<span class="status <%=claseEstado%>"><%=estado%></span>
				</div>

				<div class="cita-detalle"><strong>Fecha Programada:</strong> <%=c.getFechaProgramada()%> - <%=c.getHoraProgramada()%></div>
				<div class="cita-detalle"><strong>Fecha Registrada:</strong> <%=c.getFechaRegistrada()%> - <%=c.getHoraRegistrada()%></div>
				<div class="cita-detalle"><strong>Descripción:</strong> <%=c.getDescripcion()%></div>

				<form action="<%=request.getContextPath()%>/CitaServlet" method="post" class="mt-2">
					<input type="hidden" name="accion" value="actualizarEstado">
					<input type="hidden" name="idCita" value="<%=c.getIdCita()%>">
					<select name="estado" class="form-select form-select-custom" onchange="this.form.submit()">
						<option value="Pendiente" <%=estado.equals("Pendiente") ? "selected" : ""%>>Pendiente</option>
						<option value="Atendida" <%=estado.equals("Atendida") ? "selected" : ""%>>Atendida</option>
						<option value="Cancelada" <%=estado.equals("Cancelada") ? "selected" : ""%>>Cancelada</option>
					</select>
				</form>
			</div>
		</div>

	<%
		}
	} else {
	%>
		<div class="col-12">
			<div class="alert alert-info text-center" role="alert">
				<i class="bi bi-info-circle-fill"></i> No tienes citas registradas.
			</div>
		</div>
	<%
	}
	%>
	</div>
</div>

</body>
</html>

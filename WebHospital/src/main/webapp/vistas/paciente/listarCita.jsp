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
<title>Mis Citas Programadas</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/iconoHospital.png"
	type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #e9f1ff, #ffffff);
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

.thead-azul-oscuro {
	background-color: #254aa5;
	color: white;
}

.section-title {
	background-color: #254aa5;
	color: white;
	padding: 10px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
}

.table td, .table th {
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="container mt-4">
		<div class="banner mb-3">
			<img src="<%=request.getContextPath()%>/img/cibertec.png"
				alt="Banner">
		</div>

		<div class="welcome-text">
			<strong><i class="fas fa-user"></i> Paciente:</strong>
			<%=session.getAttribute("nombres")%>
			<%=session.getAttribute("apellidos")%>
		</div>

		<div class="mt-3 mb-3 d-flex">
			<a href="<%=request.getContextPath()%>/CitaServlet?accion=listarPorPac"
				class="btn btn-light me-2"> <i class="bi bi-calendar-plus"></i>
				Mis Citas
			</a> <a href="<%=request.getContextPath()%>/vistas/logeo/login.jsp"
				class="btn btn-light me-2"> <i
				class="bi bi-box-arrow-right text-danger"></i> Cerrar sesión
			</a>
		</div>

		<div class="section-title text-center mb-4">
			<h5>
				<i class="bi bi-calendar-check"></i> Mis Citas Programadas
			</h5>
		</div>

		<div class="table-responsive">
			<%
			List<Cita> lista = (List<Cita>) request.getAttribute("citas");
			if (lista != null && !lista.isEmpty()) {
			%>
			<table class="table table-bordered text-center">
				<thead class="thead-azul-oscuro">
					<tr>
						<th>ID</th>
						<th>Doctor</th>
						<th>Fecha Registrada</th>
						<th>Hora Registrada</th>
						<th>Fecha Programada</th>
						<th>Hora Programada</th>
						<th>Descripción</th>
						<th>Estado</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Cita c : lista) {
					%>
					<tr>
						<td><%=c.getIdCita()%></td>
						<td><%=c.getNombreDoctor()%></td>
						<td><%=c.getFechaRegistrada()%></td>
						<td><%=c.getHoraRegistrada()%></td>
						<td><%=c.getFechaProgramada()%></td>
						<td><%=c.getHoraProgramada()%></td>
						<td><%=c.getDescripcion()%></td>
						<td><%=c.getEstado()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			} else {
			%>
			<div class="alert alert-info text-center" role="alert">
				<i class="bi bi-info-circle-fill"></i> No tienes citas registradas.
			</div>
			<%
			}
			%>
		</div>

	</div>

	<script src="https://kit.fontawesome.com/a076d05399.js"
		crossorigin="anonymous"></script>
</body>
</html>

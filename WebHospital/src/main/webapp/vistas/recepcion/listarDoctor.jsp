<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, Modelo.Doctor"%>
<%
HttpSession sesion = request.getSession(false);
Integer idRecepcion = (Integer) sesion.getAttribute("idRecepcion");
if (idRecepcion == null) {
	response.sendRedirect(request.getContextPath() + "/vistas/logeo/loginRec.jsp");
	return;
}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Listado de Doctores</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/iconoHospital.png"
	type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet">
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
	padding: 0;
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
	text-align: center;
	margin-bottom: 1rem;
}

.table td, .table th {
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="container mt-4">

		<div class="banner mb-3">
			<img src="<%=request.getContextPath()%>/img/banner.jpeg"
				alt="Banner">
		</div>

		<div class="welcome-text mb-3">
			<strong><i class="bi bi-person-badge-fill"></i> Recepcionista:</strong>
			<%=sesion.getAttribute("nombres")%> <%=sesion.getAttribute("apellidos")%>
		</div>

		<div class="mb-4 d-flex flex-wrap gap-2">
			<a href="<%=request.getContextPath()%>/CitaServlet?accion=listar"
				class="btn btn-light"> <i class="bi bi-calendar-check"></i>
				Reporte Citas
			</a> 
			<a href="<%=request.getContextPath()%>/DoctorServlet?accion=listar"
				class="btn btn-light"> <i class="bi bi-person-badge"></i>
				Reporte Doctores
			</a> 
			<a href="<%=request.getContextPath()%>/PacienteServlet?accion=listar"
				class="btn btn-light"> <i class="bi bi-people"></i> Reporte
				Pacientes
			</a> 
			<a href="<%=request.getContextPath()%>/CitaServlet?accion=add"
				class="btn btn-light"> <i class="bi bi-pencil-square"></i>
				Registrar Citas
			</a> 
			<a href="<%=request.getContextPath()%>/vistas/recepcion/loginRec.jsp"
				class="btn btn-light text-danger"> <i
				class="bi bi-box-arrow-right text-danger"></i> Cerrar sesión
			</a>
		</div>

		<div class="section-title">
			<h5>
				<i class="bi bi-list-ul"></i> Listado de Doctores
			</h5>
		</div>

		<div class="table-responsive">
			<%
			List<Doctor> doctores = (List<Doctor>) request.getAttribute("doctores");
			if (doctores != null && !doctores.isEmpty()) {
			%>
			<table class="table table-bordered text-center">
				<thead class="thead-azul-oscuro">
					<tr>
						<th>DNI</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Correo</th>
						<th>Teléfono</th>
						<th>Especialidad</th>
						<th>Nro. Colegiatura</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Doctor d : doctores) {
					%>
					<tr>
						<td><%=d.getDni()%></td>
						<td><%=d.getNombres()%></td>
						<td><%=d.getApellidos()%></td>
						<td><%=d.getCorreo()%></td>
						<td><%=d.getTelefono()%></td>
						<td><%=d.getEspecialidad()%></td>
						<td><%=d.getNroColegiatura()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			} else {
			%>
			<div class="alert alert-info text-center mt-3">
				<i class="bi bi-info-circle-fill"></i> No se encontraron doctores
				registrados.
			</div>
			<%
			}
			%>
		</div>

	</div>
</body>
</html>

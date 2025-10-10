<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Registrar Incidencia</title>
	<link rel="icon" href="<%=request.getContextPath()%>/img/icono.png" type="image/x-icon">
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
			box-shadow: 0 2px 6px rgba(0,0,0,0.2);
		}
	    .btn-guardar {
	        background-color: #254aa5;
	        color: white;
	        transition: all 0.3s ease;
	        border: none;
	    }
	
	    .btn-guardar:hover {
	        background-color: #1e3e8a;
	        transform: scale(1.05);
	        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	    }
	</style>
</head>
<body>
	<div class="container mt-4">

		<div class="banner mb-3">
			<img src="<%=request.getContextPath()%>/img/cibertec.png" alt="Banner">
		</div>

		<div class="text-end mb-3">
			<strong><i class="bi bi-person-circle"></i> Docente:</strong> <%=session.getAttribute("nombres")%> <%=session.getAttribute("apellidos")%>
		</div>

		<div class="mb-4 d-flex flex-wrap gap-2">
			<a href="<%=request.getContextPath()%>/IncidenciaServlet?accion=add" class="btn btn-light">
				<i class="bi bi-journal-plus"></i> Registrar Incidencia
			</a>
			<a href="<%=request.getContextPath()%>/EstudianteServlet?accion=listar&origen=docente" class="btn btn-light">
				<i class="bi bi-people"></i> Reporte Estudiante
			</a>
			<a href="<%=request.getContextPath()%>/login.jsp" class="btn btn-light">
				<i class="bi bi-box-arrow-right text-danger"></i> Cerrar sesión
			</a>
		</div>

		<div class="section-title text-center mb-4">
			<h5><i class="bi bi-pencil-square"></i> Registrar Incidencia</h5>
		</div>

		<% if (request.getAttribute("mensajeExito") != null) { %>
		    <div class="alert alert-success text-center" id="mensajeExito">
		        <%=request.getAttribute("mensajeExito")%>
		    </div>
		    <script>
		        setTimeout(() => {
		            const form = document.getElementById("formRegistro");
		            if (form) {
		                Array.from(form.elements).forEach(input => {
		                    if (input.name !== "idDocente" && input.name !== "fechaActual" && input.type !== "hidden") {
		                        input.value = "";
		                    }
		                });
		            }
		            document.getElementById('mensajeExito').style.display = 'none';
		        }, 3000);
		    </script>
		<% } else if (request.getAttribute("mensajeError") != null) { %>
		    <div class="alert alert-danger text-center">
		        <%=request.getAttribute("mensajeError")%>
		    </div>
		<% } %>
		
		<div class="card shadow-sm mb-5">
			<div class="card-body">
				<form id="formRegistro" action="<%=request.getContextPath()%>/IncidenciaServlet" method="post">
					<input type="hidden" name="accion" value="Guardar">

					<div class="row g-3">
						<div class="col-md-4">
					        <label class="form-label"><strong>ID Estudiante</strong></label>
					        <input type="text" name="idEstudiante" class="form-control"
					               value="<%= request.getParameter("idEstudiante") != null ? request.getParameter("idEstudiante") : "" %>" required>
					    </div>
					
					    <div class="col-md-4">
					        <label class="form-label"><strong>Tipo</strong></label>
					        <input type="text" name="tipo" class="form-control"
					               value="<%= request.getParameter("tipo") != null ? request.getParameter("tipo") : "" %>" required>
					    </div>
					
					    <div class="col-md-4">
					        <label class="form-label"><strong>Sede</strong></label>
					        <input type="text" name="sede" class="form-control"
					               value="<%= request.getParameter("sede") != null ? request.getParameter("sede") : "" %>" required>
					    </div>
					
					    <div class="col-md-4">
					        <label class="form-label"><strong>Código Aula</strong></label>
					        <input type="text" name="codigoAula" class="form-control"
					               value="<%= request.getParameter("codigoAula") != null ? request.getParameter("codigoAula") : "" %>" required>
					    </div>
					
					    <div class="col-md-4">
							<label class="form-label"><strong>ID Docente</strong></label>
							<input type="text" name="idDocente" class="form-control" value="<%= session.getAttribute("idDocente") %>" readonly required>
						</div>
						
						<%
						    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
						    String fechaHoy = sdf.format(new java.util.Date());
						%>
						<div class="col-md-4">
							<label class="form-label"><strong>Fecha</strong></label>
							<input type="text" name="fechaActual" class="form-control" value="<%= fechaHoy %>" readonly>
						</div>
						
					    <div class="col-md-12">
					        <label class="form-label"><strong>Descripción</strong></label>
					        <textarea name="descripcion" class="form-control" rows="4" required><%= request.getParameter("descripcion") != null ? request.getParameter("descripcion") : "" %></textarea>
					    </div>
					
					</div>

					<div class="text-center mt-4">
					    <button type="submit" class="btn btn-guardar px-4">
					        <i class="bi bi-save"></i> Guardar
					    </button>
					</div>
				</form>
			</div>
		</div>

	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>

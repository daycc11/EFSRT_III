<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, Modelo.Docente" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Docentes</title>
    <link rel="icon" href="<%=request.getContextPath()%>/img/icono.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">

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

        .thead-azul-oscuro {
            background-color: #254aa5;
            color: white;
        }

        .btn-buscar {
		    background-color: #254aa5;
		    border: none;
		    transition: all 0.3s ease;
		    color: white;
		}
		
		.btn-buscar:hover {
		    background-color: #1e3e8a;
		    transform: scale(1.05);
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
		}
        .btn-light, a.btn-light {
            transition: all 0.3s ease;
        }

        .btn-light:hover, a.btn-light:hover {
            transform: scale(1.05);
            background-color: #e9ecef;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .section-title {
            background-color: #254aa5;
            color: white;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container mt-4">

    <!-- Banner -->
    <div class="banner mb-3">
        <img src="<%=request.getContextPath()%>/img/cibertec.png" alt="Banner">
    </div>

    <!-- Admin -->
    <div class="text-end mb-3">
        <strong><i class="bi bi-person-badge-fill"></i> Administrador:</strong>
        <%= session.getAttribute("nombres") %> <%= session.getAttribute("apellidos") %>
    </div>

    <div class="mb-4 d-flex flex-wrap gap-2">
        <a href="<%=request.getContextPath()%>/IncidenciaServlet?accion=listar" class="btn btn-light">
            <i class="bi bi-journal-text"></i> Reporte Incidencia
        </a>
        <a href="<%=request.getContextPath()%>/EstudianteServlet?accion=listar&origen=admin" class="btn btn-light">
            <i class="bi bi-people"></i> Reporte Estudiante
        </a>
        <a href="<%=request.getContextPath()%>/DocenteServlet?accion=listar" class="btn btn-light">
            <i class="bi bi-person-lines-fill"></i> Reporte Docente
        </a>
        <a href="<%=request.getContextPath()%>/login.jsp" class="btn btn-light">
            <i class="bi bi-box-arrow-right text-danger"></i> Cerrar sesión
        </a>
    </div>

    <div class="section-title text-center mb-3">
        <h5><i class="bi bi-search"></i> Buscar Docente</h5>
    </div>

    <form method="get" action="<%=request.getContextPath()%>/DocenteServlet">
	    <input type="hidden" name="accion" value="buscar">
	    <div class="row mb-3">
	        <div class="col-md-4">
	            <label><strong>Buscar por DNI</strong></label>
	            <input type="text" name="filtro" class="form-control" 
	                   placeholder="Ingrese DNI" maxlength="8"
	                   oninput="this.value = this.value.replace(/[^0-9]/g, '')"
	                   value="<%= request.getAttribute("filtro") != null ? request.getAttribute("filtro") : "" %>">
	        </div>
	        <div class="col-md-2 d-flex align-items-end">
	            <button type="submit" class="btn btn-primary btn-buscar w-100">
	                <i class="bi bi-search"></i> Buscar
	            </button>
	        </div>
	        <div class="col-md-2 d-flex align-items-end">
	            <a href="<%=request.getContextPath()%>/DocenteServlet?accion=listar" class="btn btn-primary btn-buscar w-100">
	                <i class="bi bi-arrow-clockwise"></i> Refrescar
	            </a>
	        </div>
	    </div>
	</form>

    <%
        String mensajeError = (String) request.getAttribute("mensajeError");
        if (mensajeError != null) {
    %>
    <div class="alert alert-danger text-center mt-3" role="alert">
        <i class="bi bi-exclamation-triangle-fill"></i> <%= mensajeError %>
    </div>
    <%
        }
    %>

    <!-- Título listado -->
    <div class="section-title text-center mb-3">
        <h5><i class="bi bi-list-ul"></i> Listado de Docentes</h5>
    </div>

    <!-- Tabla -->
    <div class="table-responsive mt-3">
        <%
            List<Docente> docentes = (List<Docente>) request.getAttribute("docentes");
            if (docentes != null && !docentes.isEmpty()) {
        %>
        <table class="table table-bordered text-center">
            <thead class="thead-azul-oscuro">
                <tr>
                    <th>ID Docente</th>
                    <th>DNI</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Correo</th>
                    <th>Especialidad</th>
                </tr>
            </thead>
            <tbody>
                <% for (Docente d : docentes) { %>
                <tr>
                    <td><%= d.getIdDocente() %></td>
                    <td><%= d.getDni() %></td>
                    <td><%= d.getNombres() %></td>
                    <td><%= d.getApellidos() %></td>
                    <td><%= d.getCorreo() %></td>
                    <td><%= d.getEspecialidad() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <div class="alert alert-info text-center">
            <i class="bi bi-info-circle-fill"></i> No se encontraron docentes registrados.
        </div>
        <% } %>
    </div>
</div>
</body>
</html>

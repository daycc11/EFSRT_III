<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, Modelo.Estudiante" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Estudiantes</title>
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
            color: white;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-buscar:hover {
            background-color: #1e3e8a;
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-light, a.btn-light {
            transition: all 0.3s ease;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
        }

        .btn-light:hover, a.btn-light:hover {
            transform: scale(1.05);
            background-color: #e2e6ea;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .section-title {
            background-color: #254aa5;
            color: white;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .table {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.08);
        }
    </style>
</head>
<body>

<div class="container mt-4">

    <div class="banner mb-3">
        <img src="<%=request.getContextPath()%>/img/cibertec.png" alt="Banner">
    </div>

    <div class="text-end mb-2">
        <strong><i class="bi bi-person-circle"></i> Docente:</strong> <%= session.getAttribute("nombres") %> <%= session.getAttribute("apellidos") %>
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

    <div class="section-title mb-3">
        <h5><i class="bi bi-search"></i> Buscar Estudiante</h5>
    </div>

    <form method="get" action="<%=request.getContextPath()%>/EstudianteServlet">
        <input type="hidden" name="accion" value="buscar">
        <input type="hidden" name="origen" value="docente">
        <div class="row mb-3">
            <div class="col-md-4">
                <label><strong>DNI</strong></label>
                <input type="text" name="filtro" class="form-control" maxlength="8"
                       placeholder="Ingrese DNI"
                       oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                       value="<%= request.getAttribute("filtro") != null ? request.getAttribute("filtro") : "" %>">
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <button type="submit" class="btn btn-buscar w-100">
                    <i class="bi bi-search"></i> Buscar
                </button>
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <a href="<%=request.getContextPath()%>/EstudianteServlet?accion=listar&origen=docente" class="btn btn-buscar w-100">
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
            <%= mensajeError %>
        </div>
    <%
        }
    %>

    <div class="section-title mt-5 mb-3">
        <h5><i class="bi bi-list-ul"></i> Listado de Estudiantes</h5>
    </div>

    <div class="table-responsive">
        <%
            List<Estudiante> estudiantes = (List<Estudiante>) request.getAttribute("estudiantes");
            if (estudiantes != null && !estudiantes.isEmpty()) {
        %>
        <table class="table table-bordered text-center">
            <thead class="thead-azul-oscuro">
                <tr>
                    <th>ID</th>
                    <th>DNI</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Correo</th>
                    <th>Teléfono</th>
                    <th>Carrera</th>
                    <th>Ciclo</th>
                </tr>
            </thead>
            <tbody>
                <% for (Estudiante e : estudiantes) { %>
                <tr>
                    <td><%= e.getIdEstudiante() %></td>
                    <td><%= e.getDni() %></td>
                    <td><%= e.getNombres() %></td>
                    <td><%= e.getApellidos() %></td>
                    <td><%= e.getCorreo() %></td>
                    <td><%= e.getTelefono() %></td>
                    <td><%= e.getCarrera() %></td>
                    <td><%= e.getCiclo() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
            <div class="alert alert-info text-center mt-3">
                No se encontraron estudiantes registrados.
            </div>
        <% } %>
    </div>

</div>
</body>
</html>

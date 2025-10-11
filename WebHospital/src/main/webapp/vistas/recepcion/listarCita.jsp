<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Modelo.Cita"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Listar Incidencia</title>
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

    .btn-buscar, .btn-primary {
        background-color: #254aa5;
        border: none;
        transition: all 0.3s ease;
    }

    .btn-buscar:hover, .btn-primary:hover {
        background-color: #1e3e8a;
        transform: scale(1.05);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .btn-light, a.btn-light {
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        transition: all 0.3s ease;
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
        margin-bottom: 1rem;
    }
</style>
</head>
<body>

<div class="container mt-4">

    <div class="banner mb-3">
        <img src="<%=request.getContextPath()%>/img/cibertec.png" alt="Banner">
    </div>

    <div class="text-end mb-2">
        <strong><i class="bi bi-person-badge-fill"></i> Administrador:</strong> <%= session.getAttribute("nombres") %> <%= session.getAttribute("apellidos") %>
    </div>

    <div class="mb-4 d-flex flex-wrap gap-2">
        <a href="<%=request.getContextPath()%>/IncidenciaServlet?accion=listar" class="btn btn-light"><i class="bi bi-journal-text"></i> Reporte Incidencia</a>
        <a href="<%=request.getContextPath()%>/EstudianteServlet?accion=listar&origen=admin" class="btn btn-light"><i class="bi bi-people"></i> Reporte Estudiante</a>
        <a href="<%=request.getContextPath()%>/DocenteServlet?accion=listar" class="btn btn-light"><i class="bi bi-person-lines-fill"></i> Reporte Docente</a>
        <a href="<%=request.getContextPath()%>/login.jsp" class="btn btn-light"><i class="bi bi-box-arrow-right text-danger"></i> Cerrar sesión</a>
    </div>

    <div class="section-title">
        <h5><i class="bi bi-search"></i> Buscar Incidencia por Fecha</h5>
    </div>

    <form method="get" action="<%=request.getContextPath()%>/IncidenciaServlet">
	    <input type="hidden" name="accion" value="buscarPorFecha">
	    <div class="row align-items-end mb-4">
	        <div class="col-md-4">
	            <label><strong>Fecha</strong></label>
	            <input type="date" class="form-control" name="fecha" required value="<%= request.getAttribute("fechaBuscar") != null ? request.getAttribute("fechaBuscar") : "" %>">
	        </div>
	        <div class="col-md-2">
	            <label>&nbsp;</label>
	            <button type="submit" class="btn btn-primary btn-buscar w-100">
	                <i class="bi bi-search"></i> Buscar
	            </button>
	        </div>
	        <div class="col-md-2">
	            <label>&nbsp;</label>
	            <a href="<%=request.getContextPath()%>/IncidenciaServlet?accion=listar" class="btn btn-primary btn-buscar w-100">
	                <i class="bi bi-arrow-clockwise"></i> Refrescar
	            </a>
	        </div>
	    </div>
	</form>
	
    <div class="section-title">
        <h5><i class="bi bi-list-ul"></i> Listado de Incidencias</h5>
    </div>

    <div class="table-responsive">
        <%
        List<Incidencia> lista = (List<Incidencia>) request.getAttribute("incidencias");
        if (lista != null && !lista.isEmpty()) {
        %>
        <table class="table table-bordered text-center">
            <thead class="thead-azul-oscuro">
                <tr>
                    <th>ID Estudiante</th>
                    <th>Fecha</th>
                    <th>Tipo</th>
                    <th>Descripción</th>
                    <th>Sede</th>
                    <th>Código Aula</th>
                    <th>ID Docente</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <% for (Incidencia i : lista) { %>
                <tr>
                    <td><%= i.getIdEstudiante() %></td>
                    <td><%= i.getFecha() %></td>
                    <td><%= i.getTipo() %></td>
                    <td><%= i.getDescripcion() %></td>
                    <td><%= i.getSede() %></td>
                    <td><%= i.getCodigoAula() %></td>
                    <td><%= i.getIdDocente() %></td>
                    <td><%= i.getEstado() %></td>
                    <td>
                        <form action="<%=request.getContextPath()%>/IncidenciaServlet" method="get">
                            <input type="hidden" name="accion" value="edit">
                            <input type="hidden" name="id" value="<%= i.getIdIncidencia() %>">
                            <button class="btn btn-primary btn-sm">Editar</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <div class="alert alert-info text-center" role="alert">
            <i class="bi bi-info-circle-fill"></i> No se encontraron incidencias registradas para la fecha seleccionada.
        </div>
        <% } %>
    </div>

    <%
        Integer paginaActual = (Integer) request.getAttribute("paginaActual");
        Integer totalPaginas = (Integer) request.getAttribute("totalPaginas");
        String fechaBuscar = (String) request.getAttribute("fechaBuscar");

        if (paginaActual == null) paginaActual = 1;
        if (totalPaginas == null) totalPaginas = 1;

        String baseUrl = request.getContextPath() + "/IncidenciaServlet?accion=" +
                         (fechaBuscar != null ? "buscarPorFecha&fecha=" + fechaBuscar : "listar");
    %>

    <div class="d-flex justify-content-center mt-4 mb-4 gap-3">
        <% if (paginaActual > 1) { %>
            <a href="<%= baseUrl %>&pagina=<%= paginaActual - 1 %>" class="btn btn-primary">
                <i class="bi bi-arrow-left-circle"></i> Anterior
            </a>
        <% } else { %>
            <button class="btn btn-secondary" disabled>
                <i class="bi bi-arrow-left-circle"></i> Anterior
            </button>
        <% } %>

        <span class="align-self-center fw-bold text-primary">
            Página <%= paginaActual %> de <%= totalPaginas %>
        </span>

        <% if (paginaActual < totalPaginas) { %>
            <a href="<%= baseUrl %>&pagina=<%= paginaActual + 1 %>" class="btn btn-primary">
                Siguiente <i class="bi bi-arrow-right-circle"></i>
            </a>
        <% } else { %>
            <button class="btn btn-secondary" disabled>
                Siguiente <i class="bi bi-arrow-right-circle"></i>
            </button>
        <% } %>
    </div>

</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Modelo.Incidencia" %>
<%
    Incidencia inc = (Incidencia) request.getAttribute("incidencia");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Incidencia</title>
    <link rel="icon" href="<%=request.getContextPath()%>/img/icono.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #e9f1ff, #ffffff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .titulo-seccion {
            background-color: #254aa5;
            color: white;
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .btn-primary {
            background-color: #254aa5;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #1e3e8a;
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-secondary:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="container mt-5">

    <div class="titulo-seccion">
        <h3><i class="bi bi-pencil-square"></i> Editar Incidencia</h3>
    </div>

    <% if (request.getAttribute("mensajeExito") != null) { %>
        <div class="alert alert-success text-center" id="mensajeExito">
            <%= request.getAttribute("mensajeExito") %>
        </div>
        <script>
            setTimeout(() => {
                window.location.href = '<%= request.getContextPath() %>/IncidenciaServlet?accion=listar';
            }, 3000);
        </script>
    <% } %>

    <% if (request.getAttribute("mensajeError") != null) { %>
        <div class="alert alert-danger text-center" id="mensajeError">
            <%= request.getAttribute("mensajeError") %>
        </div>
    <% } %>

    <form action="<%=request.getContextPath()%>/IncidenciaServlet" method="post">
        <input type="hidden" name="accion" value="Actualizar">
        <input type="hidden" name="idIncidencia" value="<%= inc.getIdIncidencia() %>">

        <div class="mb-3">
            <label class="form-label"><strong>ID Incidencia</strong></label>
            <input type="text" class="form-control" value="<%= inc.getIdIncidencia() %>" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Fecha</strong></label>
            <input type="text" class="form-control" value="<%= inc.getFecha() %>" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Tipo</strong></label>
            <input type="text" class="form-control" name="tipo" value="<%= inc.getTipo() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Descripción</strong></label>
            <textarea class="form-control" name="descripcion" rows="3" required><%= inc.getDescripcion() %></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Estado</strong></label>
            <select class="form-select" name="estado" required>
                <option value="Sin resolver" <%= "Sin resolver".equals(inc.getEstado()) ? "selected" : "" %>>Sin resolver</option>
                <option value="Resuelto" <%= "Resuelto".equals(inc.getEstado()) ? "selected" : "" %>>Resuelto</option>
                <option value="Cancelado" <%= "Cancelado".equals(inc.getEstado()) ? "selected" : "" %>>Cancelado</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Sede</strong></label>
            <input type="text" class="form-control" name="sede" value="<%= inc.getSede() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Código Aula</strong></label>
            <input type="text" class="form-control" name="codigoAula" value="<%= inc.getCodigoAula() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>ID Estudiante</strong></label>
            <input type="number" class="form-control" name="idEstudiante" value="<%= inc.getIdEstudiante() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>ID Docente</strong></label>
            <input type="number" class="form-control" name="idDocente" value="<%= inc.getIdDocente() %>" required>
        </div>

        <div class="d-flex justify-content-between mt-4 mb-5">
            <a href="<%=request.getContextPath()%>/IncidenciaServlet?accion=listar" class="btn btn-secondary">
                <i class="bi bi-x-circle"></i> Cancelar
            </a>
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-save"></i> Guardar Cambios
            </button>
        </div>
    </form>
</div>
</body>
</html>

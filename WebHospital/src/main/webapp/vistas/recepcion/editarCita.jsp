<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Modelo.Cita" %>
<%
    Cita cita = (Cita) request.getAttribute("cita");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Cita</title>
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
        <h3><i class="bi bi-pencil-square"></i> Editar Cita</h3>
    </div>

    <% if (request.getAttribute("mensajeExito") != null) { %>
        <div class="alert alert-success text-center" id="mensajeExito">
            <%= request.getAttribute("mensajeExito") %>
        </div>
        <script>
            setTimeout(() => {
                window.location.href = '<%= request.getContextPath() %>/CitaServlet?accion=listar';
            }, 3000);
        </script>
    <% } %>

    <% if (request.getAttribute("mensajeError") != null) { %>
        <div class="alert alert-danger text-center" id="mensajeError">
            <%= request.getAttribute("mensajeError") %>
        </div>
    <% } %>

    <form action="<%=request.getContextPath()%>/CitaServlet" method="post">
        <input type="hidden" name="accion" value="Actualizar">
        <input type="hidden" name="idCita" value="<%= cita.getIdCita() %>">

        <div class="mb-3">
            <label class="form-label"><strong>ID Cita</strong></label>
            <input type="text" class="form-control" value="<%= cita.getIdCita() %>" readonly>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label"><strong>Fecha Registrada</strong></label>
                <input type="date" class="form-control" name="fechaRegistrada" value="<%= cita.getFechaRegistrada() %>" readonly>
            </div>
            <div class="col-md-6">
                <label class="form-label"><strong>Hora Registrada</strong></label>
                <input type="time" class="form-control" name="horaRegistrada" value="<%= cita.getHoraRegistrada() %>" readonly>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label"><strong>Fecha Programada</strong></label>
                <input type="date" class="form-control" name="fechaProgramada" value="<%= cita.getFechaProgramada() %>" required>
            </div>
            <div class="col-md-6">
                <label class="form-label"><strong>Hora Programada</strong></label>
                <input type="time" class="form-control" name="horaProgramada" value="<%= cita.getHoraProgramada() %>" required>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Descripción</strong></label>
            <textarea class="form-control" name="descripcion" rows="3" required><%= cita.getDescripcion() %></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Estado</strong></label>
            <select class="form-select" name="estado" required>
                <option value="Pendiente" <%= "Pendiente".equals(cita.getEstado()) ? "selected" : "" %>>Pendiente</option>
                <option value="Atendida" <%= "Atendida".equals(cita.getEstado()) ? "selected" : "" %>>Atendida</option>
                <option value="Cancelada" <%= "Cancelada".equals(cita.getEstado()) ? "selected" : "" %>>Cancelada</option>
            </select>
        </div>

        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label"><strong>ID Paciente</strong></label>
                <input type="number" class="form-control" name="idPaciente" value="<%= cita.getIdPaciente() %>" required>
            </div>
            <div class="col-md-4">
                <label class="form-label"><strong>ID Doctor</strong></label>
                <input type="number" class="form-control" name="idDoctor" value="<%= cita.getIdDoctor() %>" required>
            </div>
            <div class="col-md-4">
                <label class="form-label"><strong>ID Recepcionista</strong></label>
                <input type="number" class="form-control" name="idRecepcion" value="<%= cita.getIdRecepcion() %>" required>
            </div>
        </div>

        <div class="d-flex justify-content-between mt-4 mb-5">
            <a href="<%=request.getContextPath()%>/CitaServlet?accion=listar" class="btn btn-secondary">
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

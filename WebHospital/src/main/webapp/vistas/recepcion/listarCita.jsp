<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="Util.MySQLConexion" %>
<%
    // Validación de sesión de recepcionista
    HttpSession sesion = request.getSession(false);
    Integer idRecepcion = (Integer) sesion.getAttribute("idRecepcion");

    if (idRecepcion == null) {
        response.sendRedirect(request.getContextPath() + "/vistas/logeo/loginRec.jsp");
        return;
    }

    // Lista de citas
    List<Map<String, String>> listaCitas = new ArrayList<>();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = MySQLConexion.getConexion();
        String sql = "SELECT c.idCita, c.fechaRegistrada, c.horaRegistrada, c.fechaProgramada, c.horaProgramada, " +
                     "c.descripcion, c.estado, p.nombres AS nombrePaciente, d.nombres AS nombreDoctor " +
                     "FROM Cita c " +
                     "JOIN Paciente p ON c.idPaciente = p.idPaciente " +
                     "JOIN Doctor d ON c.idDoctor = d.idDoctor";

        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            Map<String, String> fila = new HashMap<>();
            fila.put("idCita", String.valueOf(rs.getInt("idCita")));
            fila.put("paciente", rs.getString("nombrePaciente"));
            fila.put("doctor", rs.getString("nombreDoctor"));
            fila.put("fechaRegistrada", rs.getString("fechaRegistrada"));
            fila.put("horaRegistrada", rs.getString("horaRegistrada"));
            fila.put("fechaProgramada", rs.getString("fechaProgramada"));
            fila.put("horaProgramada", rs.getString("horaProgramada"));
            fila.put("descripcion", rs.getString("descripcion"));
            fila.put("estado", rs.getString("estado"));
            listaCitas.add(fila);
        }

    } catch (Exception e) {
        request.setAttribute("error", "Error al cargar las citas: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Reporte Citas</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/icono.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">

<style>
body { background: linear-gradient(to right, #e9f1ff, #ffffff); font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
.banner { width: 100%; height: 140px; overflow: hidden; display: flex; align-items: center; background-color: #fff; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); padding: 0.5rem 1rem; }
.banner img { height: 100%; width: 100%; object-fit: contain; }
.welcome-text { text-align: end; margin-top: 10px; font-size: 1.1rem; color: #333; }
.btn-light { transition: all 0.3s ease; background-color: #f8f9fa; border: 1px solid #dee2e6; }
.btn-light:hover { transform: scale(1.05); background-color: #e2e6ea; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15); }
.thead-azul-oscuro { background-color: #254aa5; color: white; }
.section-title { background-color: #254aa5; color: white; padding: 10px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2); text-align: center; margin-bottom: 1rem; }
.table td, .table th { vertical-align: middle; }
</style>
</head>
<body>
<div class="container mt-4">

    <div class="banner mb-3">
        <img src="<%=request.getContextPath()%>/img/cibertec.png" alt="Banner">
    </div>

    <div class="welcome-text mb-2">
        <strong><i class="bi bi-person-badge-fill"></i> Usuario:</strong> 
        <%= sesion.getAttribute("nombres") %> <%= sesion.getAttribute("apellidos") %>
    </div>

    <div class="mb-4 d-flex flex-wrap gap-2">
        <a href="<%=request.getContextPath()%>/CitaServlet?accion=listar" class="btn btn-light">
            <i class="bi bi-calendar-check"></i> Reporte Citas
        </a>
        <a href="<%=request.getContextPath()%>/DoctorServlet?accion=listar" class="btn btn-light">
            <i class="bi bi-person-badge"></i> Reporte Doctores
        </a>
        <a href="<%=request.getContextPath()%>/PacienteServlet?accion=listar" class="btn btn-light">
            <i class="bi bi-people"></i> Reporte Pacientes
        </a>
        <a href="<%=request.getContextPath()%>/CitaServlet?accion=registrar" class="btn btn-light">
            <i class="bi bi-pencil-square"></i> Registrar Citas
        </a>
        <a href="<%=request.getContextPath()%>/vistas/recepcion/loginRec.jsp" class="btn btn-light text-danger">
            <i class="bi bi-box-arrow-right text-danger"></i> Cerrar sesión
        </a>
    </div>

    <div class="section-title">
        <h5><i class="bi bi-list-ul"></i> Listado de Citas</h5>
    </div>

    <div class="table-responsive">
        <% if (!listaCitas.isEmpty()) { %>
        <table class="table table-bordered text-center">
            <thead class="thead-azul-oscuro">
                <tr>
                    <th>ID</th>
                    <th>Paciente</th>
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
                <% for (Map<String, String> c : listaCitas) { %>
                <tr>
                    <td><%= c.get("idCita") %></td>
                    <td><%= c.get("paciente") %></td>
                    <td><%= c.get("doctor") %></td>
                    <td><%= c.get("fechaRegistrada") %></td>
                    <td><%= c.get("horaRegistrada") %></td>
                    <td><%= c.get("fechaProgramada") %></td>
                    <td><%= c.get("horaProgramada") %></td>
                    <td><%= c.get("descripcion") %></td>
                    <td><%= c.get("estado") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <div class="alert alert-info text-center" role="alert">
            <i class="bi bi-info-circle-fill"></i> No se encontraron citas registradas.
        </div>
        <% } %>
    </div>

</div>
</body>
</html>

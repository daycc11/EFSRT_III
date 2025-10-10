<%@ page import="java.sql.*, Util.MySQLConexion" %>
<%
    String dni = request.getParameter("dni");
    String clave = request.getParameter("clave");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = MySQLConexion.getConexion();
        ps = con.prepareStatement("SELECT * FROM Estudiante WHERE dni=? AND contrasenia=?");
        ps.setString(1, dni);
        ps.setString(2, clave);
        rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("dni", dni);
            session.setAttribute("nombres", rs.getString("nombres"));
            session.setAttribute("apellidos", rs.getString("apellidos"));
            session.setAttribute("rol", "estudiante");
            session.setAttribute("idEstudiante", rs.getInt("idEstudiante"));
            response.sendRedirect("vistas/estudiante/estudiante.jsp");
        } else {
            request.setAttribute("errorLogin", "DNI o Contraseña incorrectos.");
            request.getRequestDispatcher("vistas/estudiante/loginEst.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.setAttribute("errorLogin", "Error del sistema: " + e.getMessage());
        request.getRequestDispatcher("vistas/estudiante/loginEst.jsp").forward(request, response);
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

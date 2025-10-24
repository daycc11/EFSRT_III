<%@ page import="java.sql.*, Util.MySQLConexion" %>
<%
    String dni = request.getParameter("dni");
    String clave = request.getParameter("clave");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = MySQLConexion.getConexion();
        ps = con.prepareStatement("SELECT * FROM Doctor WHERE dni=? AND contrasenia=?");
        ps.setString(1, dni);
        ps.setString(2, clave);
        rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("dni", dni);
            session.setAttribute("nombres", rs.getString("nombres"));
            session.setAttribute("apellidos", rs.getString("apellidos"));
            session.setAttribute("especialidad", rs.getString("especialidad"));
            session.setAttribute("rol", "doctor");
            session.setAttribute("idDoctor", rs.getInt("idDoctor"));

            response.sendRedirect(request.getContextPath() + "/vistas/doctor/doctor.jsp");
        } else {
            request.setAttribute("errorLogin", "DNI o Contrase&ntilde;a incorrectos.");
            request.getRequestDispatcher("/vistas/doctor/loginDoc.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.setAttribute("errorLogin", "Error en el sistema: " + e.getMessage());
        request.getRequestDispatcher("/vistas/doctor/loginDoctor.jsp").forward(request, response);
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

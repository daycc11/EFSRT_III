package Controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Modelo.Cita;
import ModeloDAO.CitaDAO;
import Util.MySQLConexion;

@WebServlet("/CitaServlet")
public class CitaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    String listar = "/vistas/recepcion/listarCita.jsp";
    String registrar = "/vistas/recepcion/registrarCita.jsp";
    String editar = "/vistas/recepcion/editarCita.jsp";

    Cita cita = new Cita();
    CitaDAO dao = new CitaDAO();
    int id;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        if (action != null) {
            switch (action) {
                case "listar":
                    int pagina = 1;
                    int registrosPorPagina = 10;
                    if (request.getParameter("pagina") != null) {
                        pagina = Integer.parseInt(request.getParameter("pagina"));
                    }

                    int offset = (pagina - 1) * registrosPorPagina;
                    List<Cita> listaPaginada = dao.listarPorPagina(offset, registrosPorPagina);
                    int totalRegistros = dao.contarCitas();
                    int totalPaginas = (int) Math.ceil((double) totalRegistros / registrosPorPagina);

                    request.setAttribute("citas", listaPaginada);
                    request.setAttribute("paginaActual", pagina);
                    request.setAttribute("totalPaginas", totalPaginas);
                    acceso = listar;
                    break;

                case "buscarPorFecha":
                    String fechaBuscar = request.getParameter("fecha");

                    if (fechaBuscar == null || fechaBuscar.trim().isEmpty()) {
                        request.setAttribute("mensaje", "Debe ingresar una fecha para buscar.");
                        acceso = listar;
                        break;
                    }

                    List<Cita> todas = dao.buscarPorFecha(fechaBuscar);
                    if (todas.isEmpty()) {
                        request.setAttribute("mensaje", "No existen citas para la fecha seleccionada.");
                    }
                    request.setAttribute("citas", todas);
                    request.setAttribute("fechaBuscar", fechaBuscar);
                    acceso = listar;
                    break;

                case "add":
                    acceso = registrar;
                    break;

                case "Guardar":
                    String fechaRegistrada = request.getParameter("fechaRegistrada");
                    String horaRegistrada = request.getParameter("horaRegistrada");
                    String fechaProgramada = request.getParameter("fechaProgramada");
                    String horaProgramada = request.getParameter("horaProgramada");
                    String estado = request.getParameter("estado");
                    String descripcion = request.getParameter("descripcion");
                    int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
                    int idDoctor = Integer.parseInt(request.getParameter("idDoctor"));
                    int idRecepcion = Integer.parseInt(request.getParameter("idRecepcion"));
                    
                    boolean pacienteExiste = false;
                    try (Connection con = MySQLConexion.getConexion();
                         PreparedStatement ps = con.prepareStatement("SELECT idPaciente FROM Paciente WHERE idPaciente = ?")) {
                        ps.setInt(1, idPaciente);
                        ResultSet rs = ps.executeQuery();
                        pacienteExiste = rs.next();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    if (!pacienteExiste) {
                        request.setAttribute("mensajeError", "El ID del Paciente no existe.");
                    } else {
                        cita = new Cita();
                        cita.setFechaRegistrada(fechaRegistrada);
                        cita.setHoraRegistrada(horaRegistrada);
                        cita.setFechaProgramada(fechaProgramada);
                        cita.setHoraProgramada(horaProgramada);
                        cita.setEstado(estado);
                        cita.setDescripcion(descripcion);
                        cita.setIdPaciente(idPaciente);
                        cita.setIdDoctor(idDoctor);
                        cita.setIdRecepcion(idRecepcion);

                        boolean registrado = dao.add(cita);
                        if (registrado) {
                            request.setAttribute("mensajeExito", "Cita registrada correctamente.");
                        } else {
                            request.setAttribute("mensajeError", "Error al registrar la cita.");
                        }
                    }

                    acceso = registrar;
                    break;

                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    Cita citaEditar = dao.list(id);
                    request.setAttribute("cita", citaEditar);
                    acceso = editar;
                    break;

                case "Actualizar":
                    int idCita = Integer.parseInt(request.getParameter("idCita"));
                    Cita citaOriginal = dao.list(idCita);

                    String fechaProgramadaAct = request.getParameter("fechaProgramada");
                    String horaProgramadaAct = request.getParameter("horaProgramada");
                    String estadoAct = request.getParameter("estado");
                    String descripcionAct = request.getParameter("descripcion");
                    int idPacienteAct = Integer.parseInt(request.getParameter("idPaciente"));
                    int idDoctorAct = Integer.parseInt(request.getParameter("idDoctor"));
                    int idRecepcionAct = Integer.parseInt(request.getParameter("idRecepcion"));

                    Cita citaActualizada = new Cita();
                    citaActualizada.setIdCita(idCita);
                    citaActualizada.setFechaRegistrada(citaOriginal.getFechaRegistrada());
                    citaActualizada.setHoraRegistrada(citaOriginal.getHoraRegistrada());
                    citaActualizada.setFechaProgramada(fechaProgramadaAct);
                    citaActualizada.setHoraProgramada(horaProgramadaAct);
                    citaActualizada.setEstado(estadoAct);
                    citaActualizada.setDescripcion(descripcionAct);
                    citaActualizada.setIdPaciente(idPacienteAct);
                    citaActualizada.setIdDoctor(idDoctorAct);
                    citaActualizada.setIdRecepcion(idRecepcionAct);

                    if (dao.edit(citaActualizada)) {
                        request.setAttribute("mensajeExito", "Cita actualizada correctamente.");
                        request.setAttribute("cita", citaActualizada);
                    } else {
                        request.setAttribute("mensajeError", "No se pudo actualizar la cita.");
                        request.setAttribute("cita", citaActualizada);
                    }

                    acceso = editar;
                    break;

                case "eliminar":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    acceso = listar;
                    break;
            }
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

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

import Modelo.Incidencia;
import ModeloDAO.IncidenciaDAO;
import Util.MySQLConexion;

@WebServlet("/IncidenciaServlet")
public class IncidenciaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    String listar = "/vistas/administracion/listarIncidencia.jsp";
    String listarEst = "/vistas/estudiante/listarIncidencia.jsp";
    String registrar = "/vistas/docente/registrarIncidencia.jsp";
    String editar = "/vistas/administracion/editarIncidencia.jsp";

    Incidencia inc = new Incidencia();
    IncidenciaDAO dao = new IncidenciaDAO();
    int id;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	                List<Incidencia> listaPaginada = dao.listarPorPagina(offset, registrosPorPagina);
	                int totalRegistros = dao.contarIncidencias();
	                int totalPaginas = (int) Math.ceil((double) totalRegistros / registrosPorPagina);
	
	                request.setAttribute("incidencias", listaPaginada);
	                request.setAttribute("paginaActual", pagina);
	                request.setAttribute("totalPaginas", totalPaginas);
	
	                acceso = listar;
	                break;

                case "listarEst":
                    Integer idEstudianteSesion = (Integer) request.getSession().getAttribute("idEstudiante");
                    if (idEstudianteSesion == null) {
                        response.sendRedirect(request.getContextPath() + "/vistas/estudiante/loginEst.jsp");
                        return;
                    }
                    List<Incidencia> listaEst = dao.listarPorEstudiante(idEstudianteSesion);
                    request.setAttribute("incidencias", listaEst);
                    if (listaEst.isEmpty()) {
                        request.setAttribute("mensaje", "No existen incidencias registradas para el estudiante.");
                    }
                    acceso = listarEst;
                    break;
                case "buscarPorFecha":
                    String fechaBuscar = request.getParameter("fecha");
                    
                    if (fechaBuscar == null || fechaBuscar.trim().isEmpty()) {
                        request.setAttribute("mensaje", "Debe ingresar una fecha para buscar.");
                        acceso = listar;
                        break;
                    }

                    int registrosPorPaginaB = 10;
                    int paginaB = 1;

                    if (request.getParameter("pagina") != null) {
                        paginaB = Integer.parseInt(request.getParameter("pagina"));
                    }

                    List<Incidencia> todas = dao.buscarPorFecha(fechaBuscar);
                    int totalRegistrosB = todas.size();
                    int totalPaginasB = (int) Math.ceil((double) totalRegistrosB / registrosPorPaginaB);

                    int inicio = (paginaB - 1) * registrosPorPaginaB;
                    int fin = Math.min(inicio + registrosPorPaginaB, totalRegistrosB);
                    List<Incidencia> paginaActual = todas.subList(inicio, fin);

                    request.setAttribute("incidencias", paginaActual);
                    request.setAttribute("paginaActual", paginaB);
                    request.setAttribute("totalPaginas", totalPaginasB);
                    request.setAttribute("fechaBuscar", fechaBuscar);

                    if (paginaActual.isEmpty()) {
                        request.setAttribute("mensaje", "No existen incidencias para la fecha seleccionada.");
                    }

                    acceso = listar;
                    break;
                case "add":
                    acceso = registrar;
                    break;
                case "Guardar":
                    String tipo = request.getParameter("tipo");
                    String descripcion = request.getParameter("descripcion");
                    String estado = "Sin resolver";
                    String codigoAula = request.getParameter("codigoAula");
                    String sede = request.getParameter("sede");
                    int idDocente = Integer.parseInt(request.getParameter("idDocente"));
                    int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));

                    boolean estudianteExiste = false;
                    try (Connection con = MySQLConexion.getConexion();
                         PreparedStatement ps = con.prepareStatement("SELECT idEstudiante FROM Estudiante WHERE idEstudiante = ?")) {
                        ps.setInt(1, idEstudiante);
                        ResultSet rs = ps.executeQuery();
                        estudianteExiste = rs.next();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    if (!estudianteExiste) {
                        request.setAttribute("mensajeError", "ID de Estudiante no encontrado.");
                    } else {
                        inc = new Incidencia();
                        inc.setTipo(tipo);
                        inc.setDescripcion(descripcion);
                        inc.setEstado(estado);
                        inc.setCodigoAula(codigoAula);
                        inc.setSede(sede);
                        inc.setIdDocente(idDocente);
                        inc.setIdEstudiante(idEstudiante);

                        boolean registrado = dao.add(inc);

                        if (registrado) {
                            request.setAttribute("mensajeExito", "Incidencia Registrada Correctamente.");
                        } else {
                            request.setAttribute("mensajeError", "Error al registrar la incidencia.");
                        }
                    }

                    acceso = registrar;
                    break;

                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    Incidencia incidencia = dao.list(id);
                    request.setAttribute("incidencia", incidencia);
                    acceso = editar;
                    break;
                case "Actualizar":
                    int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));
                    Incidencia incidenciaOriginal = dao.list(idIncidencia);
                    String tipoAct = request.getParameter("tipo");
                    String descripcionAct = request.getParameter("descripcion");
                    String estadoAct = request.getParameter("estado");
                    String codigoAulaAct = request.getParameter("codigoAula");
                    String sedeAct = request.getParameter("sede");
                    int idDocenteAct = Integer.parseInt(request.getParameter("idDocente"));
                    int idEstudianteAct = Integer.parseInt(request.getParameter("idEstudiante"));

                    Incidencia incActualizada = new Incidencia();
                    incActualizada.setIdIncidencia(idIncidencia);
                    incActualizada.setFecha(incidenciaOriginal.getFecha());
                    incActualizada.setTipo(tipoAct);
                    incActualizada.setDescripcion(descripcionAct);
                    incActualizada.setEstado(estadoAct);
                    incActualizada.setCodigoAula(codigoAulaAct);
                    incActualizada.setSede(sedeAct);
                    incActualizada.setIdDocente(idDocenteAct);
                    incActualizada.setIdEstudiante(idEstudianteAct);

                    if (dao.edit(incActualizada)) {
                        request.setAttribute("mensajeExito", "Datos actualizados correctamente.");
                        request.setAttribute("incidencia", incActualizada);
                        acceso = editar;
                    } else {
                        request.setAttribute("mensajeError", "No se pudo actualizar los datos.");
                        request.setAttribute("incidencia", incActualizada);
                        acceso = editar;
                    }
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

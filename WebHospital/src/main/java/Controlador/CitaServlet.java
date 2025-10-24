package Controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import Modelo.Cita;
import Modelo.Doctor;
import Modelo.Paciente;
import ModeloDAO.CitaDAO;
import ModeloDAO.DoctorDAO;
import ModeloDAO.PacienteDAO;

@WebServlet("/CitaServlet")
public class CitaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String listar = "/vistas/recepcion/listarCita.jsp";
	String registrar = "/vistas/recepcion/registrarCita.jsp";
	String editar = "/vistas/recepcion/editarCita.jsp";
	String listarPorPac = "/vistas/paciente/listarCita.jsp";
	String listarPorDoc = "/vistas/doctor/listarCita.jsp";

	CitaDAO dao = new CitaDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acceso = "";
		String action = request.getParameter("accion");
		HttpSession session = request.getSession();

		if (action != null) {
			switch (action) {

			case "listar":
				request.setAttribute("citas", dao.listar());
				acceso = listar;
				break;

			case "listarPorPac":
				Integer idPacienteSesion = (Integer) session.getAttribute("idPaciente");
				if (idPacienteSesion == null) {
					response.sendRedirect(request.getContextPath() + "/vistas/paciente/loginPac.jsp");
					return;
				}
				request.setAttribute("citas", dao.listarPorPac(idPacienteSesion));
				acceso = listarPorPac;
				break;

			case "listarPorDoc":
				Integer idDoctorSesion = (Integer) session.getAttribute("idDoctor");
				if (idDoctorSesion == null) {
					response.sendRedirect(request.getContextPath() + "/vistas/doctor/loginDoc.jsp");
					return;
				}
				request.setAttribute("citas", dao.listarPorDoc(idDoctorSesion));
				acceso = listarPorDoc;
				break;

			case "listarPorEstado":
				String estado = request.getParameter("estado");
				request.setAttribute("citas", dao.listarPorEstado(estado));
				acceso = listar;
				break;

			case "buscarPorFecha":
				String fechaBuscar = request.getParameter("fecha");
				request.setAttribute("citas", dao.buscarPorFecha(fechaBuscar));
				request.setAttribute("fechaBuscar", fechaBuscar);
				acceso = listar;
				break;
			case "actualizarEstado":
			    int idCitaE = Integer.parseInt(request.getParameter("idCita"));
			    String nuevoEstado = request.getParameter("estado");

			    CitaDAO citaDAO = new CitaDAO();
			    citaDAO.actualizarEstado(idCitaE, nuevoEstado);

			    response.sendRedirect(request.getContextPath() + "/CitaServlet?accion=listarPorDoc");
			    return;


			case "add":
				request.setAttribute("listaDoctores", new DoctorDAO().listar());
				request.setAttribute("listaPacientes", new PacienteDAO().listar());
				acceso = registrar;
				break;

			case "Guardar":
				Integer idRecepcion = (Integer) session.getAttribute("idRecepcion");
				if (idRecepcion == null) {
					request.setAttribute("mensajeError", "Debe iniciar sesión como recepcionista.");
					request.setAttribute("listaDoctores", new DoctorDAO().listar());
					request.setAttribute("listaPacientes", new PacienteDAO().listar());
					acceso = registrar;
					break;
				}

				String idPacienteStr = request.getParameter("idPaciente");
				String idDoctorStr = request.getParameter("idDoctor");

				if (idPacienteStr == null || idPacienteStr.isEmpty() || idDoctorStr == null || idDoctorStr.isEmpty()) {
					request.setAttribute("mensajeError", "Debe seleccionar paciente y doctor.");
					request.setAttribute("listaDoctores", new DoctorDAO().listar());
					request.setAttribute("listaPacientes", new PacienteDAO().listar());
					acceso = registrar;
					break;
				}

				try {
					Cita citaNueva = new Cita();
					citaNueva.setFechaProgramada(request.getParameter("fechaProgramada"));
					citaNueva.setHoraProgramada(request.getParameter("horaProgramada"));
					citaNueva.setDescripcion(request.getParameter("descripcion"));
					citaNueva.setIdPaciente(Integer.parseInt(idPacienteStr));
					citaNueva.setIdDoctor(Integer.parseInt(idDoctorStr));
					citaNueva.setIdRecepcion(idRecepcion);

					if (dao.add(citaNueva)) {
						request.setAttribute("mensajeExito", "Cita registrada correctamente.");
					} else {
						request.setAttribute("mensajeError", "Error al registrar la cita.");
					}

				} catch (NumberFormatException e) {
					request.setAttribute("mensajeError", "ID de paciente o doctor inválido.");
				}

				request.setAttribute("listaDoctores", new DoctorDAO().listar());
				request.setAttribute("listaPacientes", new PacienteDAO().listar());
				acceso = registrar;
				break;

			case "edit":
			    int id = Integer.parseInt(request.getParameter("id"));
			    request.setAttribute("cita", dao.list(id));
			    request.setAttribute("listaDoctores", new DoctorDAO().listar());
			    request.setAttribute("listaPacientes", new PacienteDAO().listar());

			    acceso = editar;
			    break;

		    case "Actualizar":
		        int idCita = Integer.parseInt(request.getParameter("idCita"));

		        Cita citaActualizada = new Cita();
		        citaActualizada.setIdCita(idCita);
		        citaActualizada.setFechaProgramada(request.getParameter("fechaProgramada"));
		        citaActualizada.setHoraProgramada(request.getParameter("horaProgramada"));
		        citaActualizada.setDescripcion(request.getParameter("descripcion"));
		        citaActualizada.setIdPaciente(Integer.parseInt(request.getParameter("idPaciente")));
		        citaActualizada.setIdDoctor(Integer.parseInt(request.getParameter("idDoctor")));
		        
		        
		        HttpSession sesion = request.getSession(false);
		        if (sesion != null && sesion.getAttribute("idRecepcion") != null) {
		            citaActualizada.setIdRecepcion((Integer) sesion.getAttribute("idRecepcion"));
		        }

		        if (dao.edit(citaActualizada)) {
		            request.setAttribute("mensajeExito", "Cita actualizada correctamente.");
		        } else {
		            request.setAttribute("mensajeError", "No se pudo actualizar la cita.");
		        }

		        request.setAttribute("cita", citaActualizada);
		        request.setAttribute("listaDoctores", new DoctorDAO().listar());
		        request.setAttribute("listaPacientes", new PacienteDAO().listar());
		        acceso = editar;
		        break;

			case "eliminar":
				int idEliminar = Integer.parseInt(request.getParameter("id"));
				dao.delete(idEliminar);
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

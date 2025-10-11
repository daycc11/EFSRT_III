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
import ModeloDAO.CitaDAO;

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
				List<Cita> lista = dao.listar();
				request.setAttribute("citas", lista);
				acceso = listar;
				break;

			case "listarPorPac":
				Integer idPacienteSesion = (Integer) session.getAttribute("idPaciente");
				if (idPacienteSesion == null) {
					response.sendRedirect(request.getContextPath() + "/vistas/paciente/loginPac.jsp");
					return;
				}
				List<Cita> listaPaciente = dao.listarPorPac(idPacienteSesion);
				System.out.println("ID paciente sesión: " + idPacienteSesion);
				System.out.println("Citas encontradas: " + listaPaciente.size());

				request.setAttribute("citas", listaPaciente);
				if (listaPaciente.isEmpty()) {
					request.setAttribute("mensaje", "No tienes citas registradas.");
				}
				acceso = listarPorPac;
				break;

			case "listarPorDoc":
				Integer idDoctorSesion = (Integer) session.getAttribute("idDoctor");
				if (idDoctorSesion == null) {
					response.sendRedirect(request.getContextPath() + "/vistas/doctor/loginDoc.jsp");
					return;
				}
				List<Cita> listaDoctor = dao.listarPorDoc(idDoctorSesion);
				System.out.println("ID doctor sesión: " + idDoctorSesion);
				System.out.println("Citas encontradas: " + listaDoctor.size());

				request.setAttribute("citas", listaDoctor);
				if (listaDoctor.isEmpty()) {
					request.setAttribute("mensaje", "No tienes citas registradas.");
				}
				acceso = listarPorDoc;
				break;

			case "listarPorEstado":
				String estado = request.getParameter("estado");
				List<Cita> listaEstado = dao.listarPorEstado(estado);
				request.setAttribute("citas", listaEstado);
				acceso = listar;
				break;

			case "buscarPorFecha":
				String fechaBuscar = request.getParameter("fecha");
				List<Cita> citasFecha = dao.buscarPorFecha(fechaBuscar);
				request.setAttribute("citas", citasFecha);
				request.setAttribute("fechaBuscar", fechaBuscar);
				acceso = listar;
				break;

			case "add":
				acceso = registrar;
				break;

			case "Guardar":
				Cita citaNueva = new Cita();
				citaNueva.setFechaRegistrada(request.getParameter("fechaRegistrada"));
				citaNueva.setHoraRegistrada(request.getParameter("horaRegistrada"));
				citaNueva.setFechaProgramada(request.getParameter("fechaProgramada"));
				citaNueva.setHoraProgramada(request.getParameter("horaProgramada"));
				citaNueva.setEstado(request.getParameter("estado"));
				citaNueva.setDescripcion(request.getParameter("descripcion"));
				citaNueva.setIdPaciente(Integer.parseInt(request.getParameter("idPaciente")));
				citaNueva.setIdDoctor(Integer.parseInt(request.getParameter("idDoctor")));
				citaNueva.setIdRecepcion(Integer.parseInt(request.getParameter("idRecepcion")));

				if (dao.add(citaNueva)) {
					request.setAttribute("mensajeExito", "Cita registrada correctamente.");
				} else {
					request.setAttribute("mensajeError", "Error al registrar la cita.");
				}
				acceso = registrar;
				break;

			case "edit":
				int id = Integer.parseInt(request.getParameter("id"));
				Cita citaEditar = dao.list(id);
				request.setAttribute("cita", citaEditar);
				acceso = editar;
				break;

			case "Actualizar":
				int idCita = Integer.parseInt(request.getParameter("idCita"));
				Cita citaActualizada = new Cita();
				citaActualizada.setIdCita(idCita);
				citaActualizada.setFechaRegistrada(request.getParameter("fechaRegistrada"));
				citaActualizada.setHoraRegistrada(request.getParameter("horaRegistrada"));
				citaActualizada.setFechaProgramada(request.getParameter("fechaProgramada"));
				citaActualizada.setHoraProgramada(request.getParameter("horaProgramada"));
				citaActualizada.setEstado(request.getParameter("estado"));
				citaActualizada.setDescripcion(request.getParameter("descripcion"));
				citaActualizada.setIdPaciente(Integer.parseInt(request.getParameter("idPaciente")));
				citaActualizada.setIdDoctor(Integer.parseInt(request.getParameter("idDoctor")));
				citaActualizada.setIdRecepcion(Integer.parseInt(request.getParameter("idRecepcion")));

				if (dao.edit(citaActualizada)) {
					request.setAttribute("mensajeExito", "Cita actualizada correctamente.");
				} else {
					request.setAttribute("mensajeError", "No se pudo actualizar la cita.");
				}
				request.setAttribute("cita", citaActualizada);
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

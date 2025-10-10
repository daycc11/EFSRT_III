package Controlador;

import Modelo.Paciente;
import ModeloDAO.PacienteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.io.IOException;
import java.util.List;

@WebServlet("/PacienteServlet")
public class PacienteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    String listarRecepcion = "/vistas/recepcion/listarPaciente.jsp";
    String listarDoctor = "/vistas/doctor/listarPaciente.jsp";

    PacienteDAO dao = new PacienteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String accion = request.getParameter("accion");
        String origen = request.getParameter("origen");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    List<Paciente> lista = dao.listar();
                    request.setAttribute("pacientes", lista);
                    acceso = (origen != null && origen.equals("doctor")) ? listarDoctor : listarRecepcion;
                    break;

                case "buscar":
                    String filtro = request.getParameter("filtro");

                    if (filtro == null || filtro.trim().length() != 8) {
                        request.setAttribute("mensajeError", "DNI incorrecto. Debe tener 8 dígitos.");
                        request.setAttribute("pacientes", new ArrayList<>());
                    } else {
                        List<Paciente> listaFiltrada = dao.buscarPorDNI(filtro);
                        request.setAttribute("pacientes", listaFiltrada);
                        if (listaFiltrada.isEmpty()) {
                            request.setAttribute("mensajeError", "DNI no encontrado.");
                        }
                    }

                    request.setAttribute("filtro", filtro);
                    acceso = (origen != null && origen.equals("doctor")) ? listarDoctor : listarRecepcion;
                    break;
            }
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

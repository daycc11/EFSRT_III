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
    String agregar = "/vistas/paciente/crearCuentaPac.jsp";

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
                    
                case "add":
                	acceso = agregar;
                	break;

                case "buscar":
                    String filtro = request.getParameter("filtro");

                    if (filtro == null || filtro.trim().length() != 8) {
                        request.setAttribute("mensajeError", "DNI incorrecto. Debe tener 8 dígitos.");
                        request.setAttribute("pacientes", new ArrayList<>());
                    } else {
                        Paciente pacienteEncontrado = dao.buscarPorDNI(filtro);
                        List<Paciente> listaFiltrada = new ArrayList<>();
                        if (pacienteEncontrado != null) {
                            listaFiltrada.add(pacienteEncontrado);
                        } else {
                            request.setAttribute("mensajeError", "DNI no encontrado.");
                        }
                        request.setAttribute("pacientes", listaFiltrada);
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

        String accion = request.getParameter("accion");

        if ("registrar".equalsIgnoreCase(accion)) {

            Paciente p = new Paciente();
            p.setDni(request.getParameter("dni"));
            p.setNombres(request.getParameter("nombres"));
            p.setApellidos(request.getParameter("apellidos"));
            p.setCorreo(request.getParameter("correo"));
            p.setTelefono(request.getParameter("telefono"));
            p.setDireccion(request.getParameter("direccion"));
            p.setFechaNacimiento(request.getParameter("fechaNacimiento"));
            p.setContrasenia(request.getParameter("password"));

            PacienteDAO dao = new PacienteDAO();

            Paciente existente = dao.buscarPorDNI(p.getDni());
            if (existente != null) {
                request.setAttribute("error", "Ya se encuentra registrado. Intenta iniciar sesión.");
                request.getRequestDispatcher("/vistas/paciente/crearCuentaPac.jsp").forward(request, response);
                return;
            }

            boolean registrado = dao.add(p);

            if (registrado) {
                request.setAttribute("mensaje", "Cuenta registrada exitosamente!");
            } else {
                request.setAttribute("error", "Hubo un error al registrar la cuenta.");
            }

            request.getRequestDispatcher("/vistas/paciente/crearCuentaPac.jsp").forward(request, response);
        } else {
            doGet(request, response);
        }
    }

}

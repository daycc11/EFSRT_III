package Controlador;

import Modelo.Estudiante;
import ModeloDAO.EstudianteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import java.io.IOException;
import java.util.List;

@WebServlet("/EstudianteServlet")
public class EstudianteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    String listarAdmin = "/vistas/administracion/listarEstudiante.jsp";
    String listarDocente = "/vistas/docente/listarEstudiante.jsp";

    EstudianteDAO dao = new EstudianteDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso = "";
        String accion = request.getParameter("accion");
        String origen = request.getParameter("origen");
        
        if (accion != null) {
            switch (accion) {
                case "listar":
                    List<Estudiante> lista = dao.listar();
                    request.setAttribute("estudiantes", lista);
                    acceso = origen != null && origen.equals("docente") ? listarDocente : listarAdmin;
                    break;

                case "buscar":
                    String filtro = request.getParameter("filtro");

                    if (filtro == null || filtro.trim().length() != 8) {
                        request.setAttribute("mensajeError", "DNI incorrecto. Debe tener 8 dígitos.");
                        request.setAttribute("estudiantes", new ArrayList<>());
                    } else {
                        List<Estudiante> listaFiltrada = dao.buscarPorDNI(filtro);
                        request.setAttribute("estudiantes", listaFiltrada);
                        if (listaFiltrada.isEmpty()) {
                            request.setAttribute("mensajeError", "DNI no encontrado.");
                        }
                    }

                    request.setAttribute("filtro", filtro);
                    acceso = origen != null && origen.equals("docente") ? listarDocente : listarAdmin;
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

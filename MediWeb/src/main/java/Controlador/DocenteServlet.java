package Controlador;

import Modelo.Docente;
import ModeloDAO.DocenteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DocenteServlet")
public class DocenteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    String listar = "/vistas/administracion/listarDocente.jsp";

    DocenteDAO dao = new DocenteDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    List<Docente> lista = dao.listar();
                    request.setAttribute("docentes", lista);
                    acceso = listar;
                    break;

                case "buscar":
                    String filtro = request.getParameter("filtro");

                    if (filtro == null || filtro.trim().length() != 8) {
                        request.setAttribute("mensajeError", "DNI incorrecto. Debe tener 8 dígitos.");
                        request.setAttribute("docentes", new ArrayList<>());
                    } else {
                        List<Docente> listaFiltrada = dao.buscarPorDNI(filtro);
                        request.setAttribute("docentes", listaFiltrada);
                        if (listaFiltrada.isEmpty()) {
                            request.setAttribute("mensajeError", "DNI no encontrado.");
                        }
                    }

                    request.setAttribute("filtro", filtro);
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

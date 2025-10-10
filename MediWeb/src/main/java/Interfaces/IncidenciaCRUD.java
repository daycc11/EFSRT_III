package Interfaces;

import Modelo.Incidencia;
import java.util.List;

public interface IncidenciaCRUD {
    List<Incidencia> listar();
    List<Incidencia> listarPorEstudiante(int idEstudiante);
    List<Incidencia> buscarPorFecha(String fecha);
    Incidencia list(int id);
    boolean add(Incidencia i);
    boolean edit(Incidencia i);
    boolean delete(int id);
    List<Incidencia> listarPorPagina(int offset, int limite);
    int contarIncidencias();
}


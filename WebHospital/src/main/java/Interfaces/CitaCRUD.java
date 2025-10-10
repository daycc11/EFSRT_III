package Interfaces;

import Modelo.Cita;
import java.util.List;

public interface CitaCRUD {
    List<Cita> listar();
    List<Cita> listarPorPaciente(int idPaciente);
    List<Cita> buscarPorFecha(String fecha);
    Cita list(int id);
    boolean add(Cita c);
    boolean edit(Cita c);
    boolean delete(int id);
    List<Cita> listarPorPagina(int offset, int limite);
    int contarCitas();
}

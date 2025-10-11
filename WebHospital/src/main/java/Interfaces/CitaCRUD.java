package Interfaces;

import Modelo.Cita;
import java.util.List;

public interface CitaCRUD {
    List<Cita> listar();
    List<Cita> listarPorPac(int idPaciente);
    List<Cita> listarPorDoc(int idDoctor);
    List<Cita> listarPorEstado(String estado);
    List<Cita> buscarPorFecha(String fecha);
    Cita list(int id);
    boolean add(Cita c);
    boolean edit(Cita c);
    boolean delete(int id);
    List<Cita> listarPorPagina(int offset, int limite);
    int contarCitas();
}

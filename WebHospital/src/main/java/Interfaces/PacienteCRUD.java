package Interfaces;

import Modelo.Paciente;
import java.util.List;

public interface PacienteCRUD {
    List<Paciente> listar();
    Paciente list(int id);
    boolean add(Paciente pac);
    boolean edit(Paciente pac);
    boolean delete(int id);
    Paciente buscarPorDNI(String dni);
}

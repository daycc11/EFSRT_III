package Interfaces;

import Modelo.Paciente;
import java.util.List;

public interface PacienteCRUD {
    public List<Paciente> listar();
    public Paciente list(int id);
    public boolean add(Paciente pac);
    public boolean edit(Paciente pac);
    public boolean delete(int id);
    public List<Paciente> buscarPorDNI(String dni);
}

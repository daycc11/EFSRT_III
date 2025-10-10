package Interfaces;

import Modelo.Estudiante;
import java.util.List;

public interface EstudianteCRUD {
    public List<Estudiante> listar();
    public Estudiante list(int id);
    public boolean add(Estudiante est);
    public boolean edit(Estudiante est);
    public boolean delete(int id);
    public List<Estudiante> buscarPorDNI(String dni);
}

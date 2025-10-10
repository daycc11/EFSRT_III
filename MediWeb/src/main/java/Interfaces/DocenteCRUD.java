package Interfaces;

import Modelo.Docente;
import java.util.List;

public interface DocenteCRUD {
    public List<Docente> listar();
    public Docente list(int id);
    public boolean add(Docente doc);
    public boolean edit(Docente doc);
    public boolean delete(int id);
    public List<Docente> buscarPorDNI(String dni);
}
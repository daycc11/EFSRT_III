package Interfaces;

import Modelo.Administracion;
import java.util.List;

public interface AdministracionCRUD {
    public List<Administracion> listar();
    public Administracion list(int id);
    public boolean add(Administracion adm);
    public boolean edit(Administracion adm);
    public boolean delete(int id);
}

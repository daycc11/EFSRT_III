package Interfaces;

import Modelo.Recepcion;
import java.util.List;

public interface RecepcionCRUD {
    public List<Recepcion> listar();
    public Recepcion list(int id);
    public boolean add(Recepcion recepcion);
    public boolean edit(Recepcion recepcion);
    public boolean delete(int id);
}

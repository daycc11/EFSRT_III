package Interfaces;

import Modelo.Recepcion;
import java.util.List;

public interface RecepcionCRUD {
    List<Recepcion> listar();
    Recepcion list(int id);
    boolean add(Recepcion recepcion);
    boolean edit(Recepcion recepcion);
    boolean delete(int id);
}

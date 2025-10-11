package Interfaces;

import Modelo.Doctor;
import java.util.List;

public interface DoctorCRUD {
    List<Doctor> listar();
    Doctor list(int id);
    boolean add(Doctor doc);
    boolean edit(Doctor doc);
    boolean delete(int id);
    List<Doctor> buscarPorDNI(String dni);
}

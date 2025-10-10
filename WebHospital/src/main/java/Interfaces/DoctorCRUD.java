package Interfaces;

import Modelo.Doctor;
import java.util.List;

public interface DoctorCRUD {
    public List<Doctor> listar();
    public Doctor list(int id);
    public boolean add(Doctor doc);
    public boolean edit(Doctor doc);
    public boolean delete(int id);
    public List<Doctor> buscarPorDNI(String dni);
}

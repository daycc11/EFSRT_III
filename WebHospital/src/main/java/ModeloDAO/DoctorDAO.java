package ModeloDAO;

import java.sql.*;
import java.util.*;
import Interfaces.DoctorCRUD;
import Modelo.Doctor;
import Util.MySQLConexion;

public class DoctorDAO implements DoctorCRUD {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Doctor> listar() {
        List<Doctor> lista = new ArrayList<>();
        String sql = "SELECT * FROM Doctor";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setIdDoctor(rs.getInt("idDoctor"));
                d.setDni(rs.getString("dni"));
                d.setNombres(rs.getString("nombres"));
                d.setApellidos(rs.getString("apellidos"));
                d.setCorreo(rs.getString("correo"));
                d.setEspecialidad(rs.getString("especialidad"));
                d.setTelefono(rs.getString("telefono"));
                d.setNroColegiatura(rs.getString("nroColegiatura"));
                d.setContrasenia(rs.getString("contrasenia"));
                lista.add(d);
            }
        } catch (Exception e) {
            System.out.println("Error en listar Doctor: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public List<Doctor> buscarPorDNI(String dni) {
        List<Doctor> lista = new ArrayList<>();
        String sql = "SELECT * FROM Doctor WHERE dni LIKE ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + dni + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setIdDoctor(rs.getInt("idDoctor"));
                d.setDni(rs.getString("dni"));
                d.setNombres(rs.getString("nombres"));
                d.setApellidos(rs.getString("apellidos"));
                d.setCorreo(rs.getString("correo"));
                d.setEspecialidad(rs.getString("especialidad"));
                d.setTelefono(rs.getString("telefono"));
                d.setNroColegiatura(rs.getString("nroColegiatura"));
                lista.add(d);
            }
        } catch (Exception e) {
            System.out.println("Error al buscar Doctor por DNI: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public Doctor list(int id) {
        Doctor d = new Doctor();
        String sql = "SELECT * FROM Doctor WHERE idDoctor = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                d.setIdDoctor(rs.getInt("idDoctor"));
                d.setDni(rs.getString("dni"));
                d.setNombres(rs.getString("nombres"));
                d.setApellidos(rs.getString("apellidos"));
                d.setCorreo(rs.getString("correo"));
                d.setEspecialidad(rs.getString("especialidad"));
                d.setTelefono(rs.getString("telefono"));
                d.setNroColegiatura(rs.getString("nroColegiatura"));
                d.setContrasenia(rs.getString("contrasenia"));
            }
        } catch (Exception e) {
            System.out.println("Error en list Doctor: " + e.getMessage());
        }
        return d;
    }

    @Override
    public boolean add(Doctor d) {
        String sql = "INSERT INTO Doctor (dni, nombres, apellidos, correo, especialidad, contrasenia) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, d.getDni());
            ps.setString(2, d.getNombres());
            ps.setString(3, d.getApellidos());
            ps.setString(4, d.getCorreo());
            ps.setString(5, d.getEspecialidad());
            ps.setString(6, d.getContrasenia());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al agregar Doctor: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(Doctor d) {
        String sql = "UPDATE Doctor SET dni=?, nombres=?, apellidos=?, correo=?, especialidad=?, contrasenia=? WHERE idDoctor=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, d.getDni());
            ps.setString(2, d.getNombres());
            ps.setString(3, d.getApellidos());
            ps.setString(4, d.getCorreo());
            ps.setString(5, d.getEspecialidad());
            ps.setString(6, d.getContrasenia());
            ps.setInt(7, d.getIdDoctor());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al editar Doctor: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Doctor WHERE idDoctor=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar Doctor: " + e.getMessage());
        }
        return false;
    }
}

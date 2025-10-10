package ModeloDAO;

import Interfaces.PacienteCRUD;
import Modelo.Paciente;
import Util.MySQLConexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PacienteDAO implements PacienteCRUD {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Paciente> listar() {
        List<Paciente> lista = new ArrayList<>();
        String sql = "SELECT * FROM Paciente";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Paciente pac = new Paciente();
                pac.setIdPaciente(rs.getInt("idPaciente"));
                pac.setDni(rs.getString("dni"));
                pac.setNombres(rs.getString("nombres"));
                pac.setApellidos(rs.getString("apellidos"));
                pac.setCorreo(rs.getString("correo"));
                pac.setTelefono(rs.getString("telefono"));
                pac.setDireccion(rs.getString("direccion"));
                pac.setFechaNacimiento(rs.getString("fechaNacimiento"));
                pac.setContrasenia(rs.getString("contrasenia"));
                lista.add(pac);
            }
        } catch (Exception e) {
            System.out.println("❌ Error al listar pacientes: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public List<Paciente> buscarPorDNI(String dni) {
        List<Paciente> lista = new ArrayList<>();
        String sql = "SELECT * FROM Paciente WHERE dni LIKE ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + dni + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Paciente pac = new Paciente();
                pac.setIdPaciente(rs.getInt("idPaciente"));
                pac.setDni(rs.getString("dni"));
                pac.setNombres(rs.getString("nombres"));
                pac.setApellidos(rs.getString("apellidos"));
                pac.setCorreo(rs.getString("correo"));
                pac.setTelefono(rs.getString("telefono"));
                pac.setDireccion(rs.getString("direccion"));
                pac.setFechaNacimiento(rs.getString("fechaNacimiento"));
                lista.add(pac);
            }
        } catch (Exception e) {
            System.out.println("❌ Error al buscar paciente por DNI: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public Paciente list(int id) {
        Paciente pac = new Paciente();
        String sql = "SELECT * FROM Paciente WHERE idPaciente = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                pac.setIdPaciente(rs.getInt("idPaciente"));
                pac.setDni(rs.getString("dni"));
                pac.setNombres(rs.getString("nombres"));
                pac.setApellidos(rs.getString("apellidos"));
                pac.setCorreo(rs.getString("correo"));
                pac.setTelefono(rs.getString("telefono"));
                pac.setDireccion(rs.getString("direccion"));
                pac.setFechaNacimiento(rs.getString("fechaNacimiento"));
                pac.setContrasenia(rs.getString("contrasenia"));
            }
        } catch (Exception e) {
            System.out.println("❌ Error al obtener paciente: " + e.getMessage());
        }
        return pac;
    }

    @Override
    public boolean add(Paciente pac) {
        String sql = "INSERT INTO Paciente (dni, nombres, apellidos, correo, telefono, direccion, fechaNacimiento, contrasenia) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pac.getDni());
            ps.setString(2, pac.getNombres());
            ps.setString(3, pac.getApellidos());
            ps.setString(4, pac.getCorreo());
            ps.setString(5, pac.getTelefono());
            ps.setString(6, pac.getDireccion());
            ps.setString(7, pac.getFechaNacimiento());
            ps.setString(8, pac.getContrasenia());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("❌ Error al agregar paciente: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(Paciente pac) {
        String sql = "UPDATE Paciente SET dni=?, nombres=?, apellidos=?, correo=?, telefono=?, direccion=?, fechaNacimiento=?, contrasenia=? WHERE idPaciente=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pac.getDni());
            ps.setString(2, pac.getNombres());
            ps.setString(3, pac.getApellidos());
            ps.setString(4, pac.getCorreo());
            ps.setString(5, pac.getTelefono());
            ps.setString(6, pac.getDireccion());
            ps.setString(7, pac.getFechaNacimiento());
            ps.setString(8, pac.getContrasenia());
            ps.setInt(9, pac.getIdPaciente());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("❌ Error al editar paciente: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Paciente WHERE idPaciente = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("❌ Error al eliminar paciente: " + e.getMessage());
        }
        return false;
    }
}

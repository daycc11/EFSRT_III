package ModeloDAO;

import Interfaces.EstudianteCRUD;
import Modelo.Estudiante;
import Modelo.Incidencia;
import Util.MySQLConexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EstudianteDAO implements EstudianteCRUD {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Estudiante> listar() {
        List<Estudiante> lista = new ArrayList<>();
        String sql = "SELECT * FROM Estudiante";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Estudiante est = new Estudiante();
                est.setIdEstudiante(rs.getInt("idEstudiante"));
                est.setDni(rs.getString("dni"));
                est.setNombres(rs.getString("nombres"));
                est.setApellidos(rs.getString("apellidos"));
                est.setCorreo(rs.getString("correo"));
                est.setTelefono(rs.getString("telefono"));
                est.setCarrera(rs.getString("carrera"));
                est.setCiclo(rs.getString("ciclo"));
                est.setContrasenia(rs.getString("contrasenia"));
                lista.add(est);
            }
        } catch (Exception e) {
            System.out.println("Error al listar estudiantes: " + e.getMessage());
        }
        return lista;
    }
    
    public List<Estudiante> buscarPorDNI(String dni) {
        List<Estudiante> lista = new ArrayList<>();
        String sql = "SELECT * FROM Estudiante WHERE dni LIKE ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + dni + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Estudiante est = new Estudiante();
                est.setIdEstudiante(rs.getInt("idEstudiante"));
                est.setDni(rs.getString("dni"));
                est.setNombres(rs.getString("nombres"));
                est.setApellidos(rs.getString("apellidos"));
                est.setCorreo(rs.getString("correo"));
                est.setTelefono(rs.getString("telefono"));
                est.setCarrera(rs.getString("carrera"));
                est.setCiclo(rs.getString("ciclo"));
                lista.add(est);
            }
        } catch (Exception e) {
            System.out.println("Error al buscar estudiante por DNI: " + e.getMessage());
        }
        return lista;
    }
    
    @Override
    public Estudiante list(int id) {
        Estudiante est = new Estudiante();
        String sql = "SELECT * FROM Estudiante WHERE idEstudiante = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
	                est.setIdEstudiante(rs.getInt("idEstudiante"));
	                est.setDni(rs.getString("dni"));
	                est.setNombres(rs.getString("nombres"));
	                est.setApellidos(rs.getString("apellidos"));
	                est.setCorreo(rs.getString("correo"));
	                est.setTelefono(rs.getString("telefono"));
	                est.setCarrera(rs.getString("carrera"));
	                est.setCiclo(rs.getString("ciclo"));
            }
        } catch (Exception e) {
            System.out.println("Error al obtener estudiante: " + e.getMessage());
        }
        return est;
    }

    @Override
    public boolean add(Estudiante est) {
        String sql = "INSERT INTO Estudiante (dni, nombres, apellidos, correo, telefono, carrera, ciclo, contrasenia) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, est.getDni());
            ps.setString(2, est.getNombres());
            ps.setString(3, est.getApellidos());
            ps.setString(4, est.getCorreo());
            ps.setString(5, est.getTelefono());
            ps.setString(6, est.getCarrera());
            ps.setString(7, est.getCiclo());
            ps.setString(8, est.getContrasenia());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al agregar estudiante: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(Estudiante est) {
        String sql = "UPDATE Estudiante SET dni=?, nombres=?, apellidos=?, correo=?, telefono=?, carrera=?, ciclo=?, contrasenia=? WHERE idEstudiante=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, est.getDni());
            ps.setString(2, est.getNombres());
            ps.setString(3, est.getApellidos());
            ps.setString(4, est.getCorreo());
            ps.setString(5, est.getTelefono());
            ps.setString(6, est.getCarrera());
            ps.setString(7, est.getCiclo());
            ps.setString(8, est.getContrasenia());
            ps.setInt(9, est.getIdEstudiante());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al editar estudiante: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Estudiante WHERE idEstudiante = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al eliminar estudiante: " + e.getMessage());
        }
        return false;
    }
}

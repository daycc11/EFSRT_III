package ModeloDAO;

import java.sql.*;
import java.util.*;
import Interfaces.DocenteCRUD;
import Modelo.Docente;
import Util.MySQLConexion;

public class DocenteDAO implements DocenteCRUD {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Docente> listar() {
        List<Docente> lista = new ArrayList<>();
        String sql = "SELECT * FROM Docente";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Docente d = new Docente();
                d.setIdDocente(rs.getInt("idDocente"));
                d.setDni(rs.getString("dni"));
                d.setNombres(rs.getString("nombres"));
                d.setApellidos(rs.getString("apellidos"));
                d.setCorreo(rs.getString("correo"));
                d.setEspecialidad(rs.getString("especialidad"));
                d.setContrasenia(rs.getString("contrasenia"));
                lista.add(d);
            }
        } catch (Exception e) {
            System.out.println("Error en listar Docente: " + e.getMessage());
        }
        return lista;
    }
    
	public List<Docente> buscarPorDNI(String dni) {
		List<Docente> lista = new ArrayList<>();
        String sql = "SELECT * FROM Docente WHERE dni LIKE ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + dni + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Docente est = new Docente();
                est.setIdDocente(rs.getInt("idDocente"));
                est.setDni(rs.getString("dni"));
                est.setNombres(rs.getString("nombres"));
                est.setApellidos(rs.getString("apellidos"));
                est.setCorreo(rs.getString("correo"));
                est.setEspecialidad(rs.getString("especialidad"));
                lista.add(est);
            }
        } catch (Exception e) {
            System.out.println("Error al buscar docente por DNI: " + e.getMessage());
        }
        return lista;
	}

    @Override
    public Docente list(int id) {
        Docente d = new Docente();
        String sql = "SELECT * FROM Docente WHERE idDocente = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                d.setIdDocente(rs.getInt("idDocente"));
                d.setDni(rs.getString("dni"));
                d.setNombres(rs.getString("nombres"));
                d.setApellidos(rs.getString("apellidos"));
                d.setCorreo(rs.getString("correo"));
                d.setEspecialidad(rs.getString("especialidad"));
                d.setContrasenia(rs.getString("contrasenia"));
            }
        } catch (Exception e) {
            System.out.println("Error en list Docente: " + e.getMessage());
        }
        return d;
    }

    @Override
    public boolean add(Docente d) {
        String sql = "INSERT INTO Docente (dni, nombres, apellidos, correo, especialidad, contrasenia) VALUES (?, ?, ?, ?, ?, ?)";
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
            System.out.println("Error al agregar Docente: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(Docente d) {
        String sql = "UPDATE Docente SET dni=?, nombres=?, apellidos=?, correo=?, especialidad=?, contrasenia=? WHERE idDocente=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, d.getDni());
            ps.setString(2, d.getNombres());
            ps.setString(3, d.getApellidos());
            ps.setString(4, d.getCorreo());
            ps.setString(5, d.getEspecialidad());
            ps.setString(6, d.getContrasenia());
            ps.setInt(7, d.getIdDocente());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al editar Docente: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Docente WHERE idDocente=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar Docente: " + e.getMessage());
        }
        return false;
    }
}
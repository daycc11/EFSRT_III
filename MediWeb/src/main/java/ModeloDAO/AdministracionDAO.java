package ModeloDAO;

import java.sql.*;
import java.util.*;
import Interfaces.AdministracionCRUD;
import Modelo.Administracion;
import Util.MySQLConexion;

public class AdministracionDAO implements AdministracionCRUD {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Administracion> listar() {
        List<Administracion> lista = new ArrayList<>();
        String sql = "SELECT * FROM Administracion";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
            	Administracion a = new Administracion();
                a.setIdAdmin(rs.getInt("idAdmin"));
                a.setDni(rs.getString("dni"));
                a.setContrasenia(rs.getString("contrasenia"));
                a.setNombres(rs.getString("nombres"));
                a.setApellidos(rs.getString("apellidos"));
                a.setCorreo(rs.getString("correo"));
                a.setCelular(rs.getString("celular"));
                lista.add(a);
            }
        } catch (Exception e) {
            System.out.println("Error en listar Administrador: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public Administracion list(int id) {
    	Administracion a = new Administracion();
        String sql = "SELECT * FROM Administracion WHERE idAdmin = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                a.setIdAdmin(rs.getInt("idAdmin"));
                a.setDni(rs.getString("dni"));
                a.setContrasenia(rs.getString("contrasenia"));
                a.setNombres(rs.getString("nombres"));
                a.setApellidos(rs.getString("apellidos"));
                a.setCorreo(rs.getString("correo"));
                a.setCelular(rs.getString("celular"));
            }
        } catch (Exception e) {
            System.out.println("Error en list Administrador: " + e.getMessage());
        }
        return a;
    }

    @Override
    public boolean add(Administracion a) {
        String sql = "INSERT INTO Administracion (dni, contrasenia, nombres, apellidos, correo, celular) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, a.getDni());
            ps.setString(2, a.getContrasenia());
            ps.setString(3, a.getNombres());
            ps.setString(4, a.getApellidos());
            ps.setString(5, a.getCorreo());
            ps.setString(6, a.getCelular());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al agregar Administrador: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(Administracion a) {
        String sql = "UPDATE Administracion SET dni=?, contrasenia=?, nombres=?, apellidos=?, correo=?, celular=? WHERE idAdmin=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, a.getDni());
            ps.setString(2, a.getContrasenia());
            ps.setString(3, a.getNombres());
            ps.setString(4, a.getApellidos());
            ps.setString(5, a.getCorreo());
            ps.setString(6, a.getCelular());
            ps.setInt(7, a.getIdAdmin());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al editar Administrador: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Administracion WHERE idAdmin=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar Administrador: " + e.getMessage());
        }
        return false;
    }
}
package ModeloDAO;

import java.sql.*;
import java.util.*;
import Interfaces.RecepcionCRUD;
import Modelo.Recepcion;
import Util.MySQLConexion;

public class RecepcionDAO implements RecepcionCRUD {

    @Override
    public List<Recepcion> listar() {
        List<Recepcion> lista = new ArrayList<>();
        String sql = "SELECT * FROM Recepcion";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Recepcion r = new Recepcion();
                r.setIdRecepcion(rs.getInt("idRecepcion"));
                r.setDni(rs.getString("dni"));
                r.setContrasenia(rs.getString("contrasenia"));
                r.setNombres(rs.getString("nombres"));
                r.setApellidos(rs.getString("apellidos"));
                r.setCorreo(rs.getString("correo"));
                r.setCelular(rs.getString("celular"));
                lista.add(r);
            }

        } catch (SQLException e) {
            System.out.println("❌ Error al listar Recepcionistas: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public Recepcion list(int id) {
        Recepcion r = null;
        String sql = "SELECT * FROM Recepcion WHERE idRecepcion = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    r = new Recepcion();
                    r.setIdRecepcion(rs.getInt("idRecepcion"));
                    r.setDni(rs.getString("dni"));
                    r.setContrasenia(rs.getString("contrasenia"));
                    r.setNombres(rs.getString("nombres"));
                    r.setApellidos(rs.getString("apellidos"));
                    r.setCorreo(rs.getString("correo"));
                    r.setCelular(rs.getString("celular"));
                }
            }

        } catch (SQLException e) {
            System.out.println("❌ Error al obtener Recepcionista: " + e.getMessage());
        }
        return r;
    }

    @Override
    public boolean add(Recepcion r) {
        String sql = "INSERT INTO Recepcion (dni, contrasenia, nombres, apellidos, correo, celular) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getDni());
            ps.setString(2, r.getContrasenia());
            ps.setString(3, r.getNombres());
            ps.setString(4, r.getApellidos());
            ps.setString(5, r.getCorreo());
            ps.setString(6, r.getCelular());
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error al agregar Recepcionista: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(Recepcion r) {
        String sql = "UPDATE Recepcion SET dni=?, contrasenia=?, nombres=?, apellidos=?, correo=?, celular=? WHERE idRecepcion=?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getDni());
            ps.setString(2, r.getContrasenia());
            ps.setString(3, r.getNombres());
            ps.setString(4, r.getApellidos());
            ps.setString(5, r.getCorreo());
            ps.setString(6, r.getCelular());
            ps.setInt(7, r.getIdRecepcion());
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error al editar Recepcionista: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Recepcion WHERE idRecepcion=?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error al eliminar Recepcionista: " + e.getMessage());
        }
        return false;
    }
}

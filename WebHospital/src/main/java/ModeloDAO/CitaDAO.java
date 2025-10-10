package ModeloDAO;

import java.sql.*;
import java.util.*;
import Interfaces.CitaCRUD;
import Modelo.Cita;
import Util.MySQLConexion;

public class CitaDAO implements CitaCRUD {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Cita> listar() {
        List<Cita> lista = new ArrayList<>();
        String sql = "SELECT * FROM Cita ORDER BY fechaProgramada DESC, horaProgramada DESC";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cita c = new Cita();
                c.setIdCita(rs.getInt("idCita"));
                c.setFechaRegistrada(rs.getString("fechaRegistrada"));
                c.setHoraRegistrada(rs.getString("horaRegistrada"));
                c.setFechaProgramada(rs.getString("fechaProgramada"));
                c.setHoraProgramada(rs.getString("horaProgramada"));
                c.setEstado(rs.getString("estado"));
                c.setDescripcion(rs.getString("descripcion"));
                c.setIdPaciente(rs.getInt("idPaciente"));
                c.setIdDoctor(rs.getInt("idDoctor"));
                c.setIdRecepcion(rs.getInt("idRecepcion"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error en listar Cita: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public List<Cita> listarPorPagina(int offset, int limite) {
        List<Cita> lista = new ArrayList<>();
        String sql = "SELECT * FROM Cita ORDER BY fechaProgramada DESC LIMIT ? OFFSET ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, limite);
            ps.setInt(2, offset);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cita c = new Cita();
                c.setIdCita(rs.getInt("idCita"));
                c.setFechaRegistrada(rs.getString("fechaRegistrada"));
                c.setHoraRegistrada(rs.getString("horaRegistrada"));
                c.setFechaProgramada(rs.getString("fechaProgramada"));
                c.setHoraProgramada(rs.getString("horaProgramada"));
                c.setEstado(rs.getString("estado"));
                c.setDescripcion(rs.getString("descripcion"));
                c.setIdPaciente(rs.getInt("idPaciente"));
                c.setIdDoctor(rs.getInt("idDoctor"));
                c.setIdRecepcion(rs.getInt("idRecepcion"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error en paginar Citas: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public int contarCitas() {
        String sql = "SELECT COUNT(*) FROM Cita";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            System.out.println("Error al contar Citas: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public List<Cita> listarPorPaciente(int idPaciente) {
        List<Cita> lista = new ArrayList<>();
        String sql = "SELECT * FROM Cita WHERE idPaciente = ? ORDER BY fechaProgramada DESC";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPaciente);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cita c = new Cita();
                c.setIdCita(rs.getInt("idCita"));
                c.setFechaRegistrada(rs.getString("fechaRegistrada"));
                c.setHoraRegistrada(rs.getString("horaRegistrada"));
                c.setFechaProgramada(rs.getString("fechaProgramada"));
                c.setHoraProgramada(rs.getString("horaProgramada"));
                c.setEstado(rs.getString("estado"));
                c.setDescripcion(rs.getString("descripcion"));
                c.setIdPaciente(rs.getInt("idPaciente"));
                c.setIdDoctor(rs.getInt("idDoctor"));
                c.setIdRecepcion(rs.getInt("idRecepcion"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error en listarPorPaciente: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public List<Cita> buscarPorFecha(String fecha) {
        List<Cita> lista = new ArrayList<>();
        String sql = "SELECT * FROM Cita WHERE fechaProgramada = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, fecha);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cita c = new Cita();
                c.setIdCita(rs.getInt("idCita"));
                c.setFechaRegistrada(rs.getString("fechaRegistrada"));
                c.setHoraRegistrada(rs.getString("horaRegistrada"));
                c.setFechaProgramada(rs.getString("fechaProgramada"));
                c.setHoraProgramada(rs.getString("horaProgramada"));
                c.setEstado(rs.getString("estado"));
                c.setDescripcion(rs.getString("descripcion"));
                c.setIdPaciente(rs.getInt("idPaciente"));
                c.setIdDoctor(rs.getInt("idDoctor"));
                c.setIdRecepcion(rs.getInt("idRecepcion"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error en buscarPorFecha: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public Cita list(int id) {
        Cita c = new Cita();
        String sql = "SELECT * FROM Cita WHERE idCita = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                c.setIdCita(rs.getInt("idCita"));
                c.setFechaRegistrada(rs.getString("fechaRegistrada"));
                c.setHoraRegistrada(rs.getString("horaRegistrada"));
                c.setFechaProgramada(rs.getString("fechaProgramada"));
                c.setHoraProgramada(rs.getString("horaProgramada"));
                c.setEstado(rs.getString("estado"));
                c.setDescripcion(rs.getString("descripcion"));
                c.setIdPaciente(rs.getInt("idPaciente"));
                c.setIdDoctor(rs.getInt("idDoctor"));
                c.setIdRecepcion(rs.getInt("idRecepcion"));
            }
        } catch (Exception e) {
            System.out.println("Error en list Cita: " + e.getMessage());
        }
        return c;
    }

    @Override
    public boolean add(Cita c) {
        String sql = "INSERT INTO Cita (fechaRegistrada, horaRegistrada, fechaProgramada, horaProgramada, estado, descripcion, idPaciente, idDoctor, idRecepcion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getFechaRegistrada());
            ps.setString(2, c.getHoraRegistrada());
            ps.setString(3, c.getFechaProgramada());
            ps.setString(4, c.getHoraProgramada());
            ps.setString(5, c.getEstado());
            ps.setString(6, c.getDescripcion());
            ps.setInt(7, c.getIdPaciente());
            ps.setInt(8, c.getIdDoctor());
            ps.setInt(9, c.getIdRecepcion());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al agregar Cita: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(Cita c) {
        String sql = "UPDATE Cita SET fechaRegistrada=?, horaRegistrada=?, fechaProgramada=?, horaProgramada=?, estado=?, descripcion=?, idPaciente=?, idDoctor=?, idRecepcion=? WHERE idCita=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getFechaRegistrada());
            ps.setString(2, c.getHoraRegistrada());
            ps.setString(3, c.getFechaProgramada());
            ps.setString(4, c.getHoraProgramada());
            ps.setString(5, c.getEstado());
            ps.setString(6, c.getDescripcion());
            ps.setInt(7, c.getIdPaciente());
            ps.setInt(8, c.getIdDoctor());
            ps.setInt(9, c.getIdRecepcion());
            ps.setInt(10, c.getIdCita());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al editar Cita: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Cita WHERE idCita=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar Cita: " + e.getMessage());
        }
        return false;
    }
}

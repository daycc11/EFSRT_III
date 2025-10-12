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
        String sql = "SELECT c.*, " +
                "d.nombres AS nombreDoctor, d.apellidos AS apellidoDoctor, " +
                "p.nombres AS nombrePaciente, p.apellidos AS apellidoPaciente " +
                "FROM Cita c " +
                "INNER JOIN Doctor d ON c.idDoctor = d.idDoctor " +
                "INNER JOIN Paciente p ON c.idPaciente = p.idPaciente " +
                "ORDER BY c.fechaRegistrada DESC, c.horaRegistrada DESC";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(extraerCita(rs));
            }
        } catch (Exception e) {
            System.out.println("Error en listar Cita: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public List<Cita> listarPorPagina(int offset, int limite) {
        List<Cita> lista = new ArrayList<>();
        String sql = "SELECT c.*, " +
                     "d.nombres AS nombreDoctor, d.apellidos AS apellidoDoctor, " +
                     "p.nombres AS nombrePaciente, p.apellidos AS apellidoPaciente " +
                     "FROM Cita c " +
                     "INNER JOIN Doctor d ON c.idDoctor = d.idDoctor " +
                     "INNER JOIN Paciente p ON c.idPaciente = p.idPaciente " +
                     "ORDER BY c.fechaRegistrada DESC, c.horaRegistrada DESC " +
                     "LIMIT ? OFFSET ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, limite);
            ps.setInt(2, offset);
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(extraerCita(rs));
            }
        } catch (Exception e) {
            System.out.println("Error en listarPorPagina Citas: " + e.getMessage());
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
    public List<Cita> listarPorPac(int idPaciente) {
        return listarPorCampo("c.idPaciente", idPaciente);
    }

    @Override
    public List<Cita> listarPorDoc(int idDoctor) {
        return listarPorCampo("c.idDoctor", idDoctor);
    }

    @Override
    public List<Cita> listarPorEstado(String estado) {
        List<Cita> lista = new ArrayList<>();
        String sql = "SELECT c.*, " +
                     "d.nombres AS nombreDoctor, d.apellidos AS apellidoDoctor, " +
                     "p.nombres AS nombrePaciente, p.apellidos AS apellidoPaciente " +
                     "FROM Cita c " +
                     "INNER JOIN Doctor d ON c.idDoctor = d.idDoctor " +
                     "INNER JOIN Paciente p ON c.idPaciente = p.idPaciente " +
                     "WHERE c.estado = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, estado);
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(extraerCita(rs));
            }
        } catch (Exception e) {
            System.out.println("Error en listarPorEstado: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public List<Cita> buscarPorFecha(String fecha) {
        List<Cita> lista = new ArrayList<>();
        String sql = "SELECT c.*, " +
                     "d.nombres AS nombreDoctor, d.apellidos AS apellidoDoctor, " +
                     "p.nombres AS nombrePaciente, p.apellidos AS apellidoPaciente " +
                     "FROM Cita c " +
                     "INNER JOIN Doctor d ON c.idDoctor = d.idDoctor " +
                     "INNER JOIN Paciente p ON c.idPaciente = p.idPaciente " +
                     "WHERE c.fechaProgramada = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, fecha);
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(extraerCita(rs));
            }
        } catch (Exception e) {
            System.out.println("Error en buscarPorFecha: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public Cita list(int id) {
        Cita c = new Cita();
        String sql = "SELECT c.*, " +
                     "d.nombres AS nombreDoctor, d.apellidos AS apellidoDoctor, " +
                     "p.nombres AS nombrePaciente, p.apellidos AS apellidoPaciente " +
                     "FROM Cita c " +
                     "INNER JOIN Doctor d ON c.idDoctor = d.idDoctor " +
                     "INNER JOIN Paciente p ON c.idPaciente = p.idPaciente " +
                     "WHERE c.idCita = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                c = extraerCita(rs);
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

    private Cita extraerCita(ResultSet rs) throws SQLException {
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
        c.setNombreDoctor(rs.getString("nombreDoctor") + " " + rs.getString("apellidoDoctor"));
        c.setNombrePaciente(rs.getString("nombrePaciente") + " " + rs.getString("apellidoPaciente"));
        return c;
    }

    private List<Cita> listarPorCampo(String campo, int valor) {
        List<Cita> lista = new ArrayList<>();
        String sql = "SELECT c.*, " +
                "d.nombres AS nombreDoctor, d.apellidos AS apellidoDoctor, " +
                "p.nombres AS nombrePaciente, p.apellidos AS apellidoPaciente " +
                "FROM Cita c " +
                "INNER JOIN Doctor d ON c.idDoctor = d.idDoctor " +
                "INNER JOIN Paciente p ON c.idPaciente = p.idPaciente " +
                "WHERE " + campo + " = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, valor);
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(extraerCita(rs));
            }
        } catch (Exception e) {
            System.out.println("Error en listarPorCampo (" + campo + "): " + e.getMessage());
        }
        return lista;
    }
}

package ModeloDAO;

import java.sql.*;
import java.util.*;
import Interfaces.IncidenciaCRUD;
import Modelo.Incidencia;
import Util.MySQLConexion;

public class IncidenciaDAO implements IncidenciaCRUD {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Incidencia> listar() {
        List<Incidencia> lista = new ArrayList<>();
        String sql = "SELECT * FROM Incidencia ORDER BY fecha DESC";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Incidencia i = new Incidencia();
                Timestamp timestamp = rs.getTimestamp("fecha");
                String fechaFormateada = new java.text.SimpleDateFormat("dd/MM/yyyy").format(timestamp);
                
                i.setIdIncidencia(rs.getInt("idIncidencia"));
                i.setFecha(fechaFormateada);
                i.setTipo(rs.getString("tipo"));
                i.setDescripcion(rs.getString("descripcion"));
                i.setCodigoAula(rs.getString("codigoAula"));
                i.setSede(rs.getString("sede"));
                i.setIdDocente(rs.getInt("idDocente"));
                i.setIdEstudiante(rs.getInt("idEstudiante"));
                i.setEstado(rs.getString("estado"));
                lista.add(i);
            }
        } catch (Exception e) {
            System.out.println("Error en listar Incidencia: " + e.getMessage());
        }
        return lista;
    }
    
    public List<Incidencia> listarPorPagina(int offset, int limite) {
        List<Incidencia> lista = new ArrayList<>();
        String sql = "SELECT * FROM Incidencia ORDER BY fecha DESC LIMIT ? OFFSET ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, limite);
            ps.setInt(2, offset);
            rs = ps.executeQuery();
            while (rs.next()) {
                Incidencia i = new Incidencia();
                Timestamp timestamp = rs.getTimestamp("fecha");
                String fechaFormateada = new java.text.SimpleDateFormat("dd/MM/yyyy").format(timestamp);

                i.setIdIncidencia(rs.getInt("idIncidencia"));
                i.setFecha(fechaFormateada);
                i.setTipo(rs.getString("tipo"));
                i.setDescripcion(rs.getString("descripcion"));
                i.setCodigoAula(rs.getString("codigoAula"));
                i.setSede(rs.getString("sede"));
                i.setIdDocente(rs.getInt("idDocente"));
                i.setIdEstudiante(rs.getInt("idEstudiante"));
                i.setEstado(rs.getString("estado"));
                lista.add(i);
            }
        } catch (Exception e) {
            System.out.println("Error en paginar incidencias: " + e.getMessage());
        }
        return lista;
    }
    
    public int contarIncidencias() {
        String sql = "SELECT COUNT(*) FROM Incidencia";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error al contar incidencias: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public List<Incidencia> listarPorEstudiante(int idEstudiante) {
        List<Incidencia> lista = new ArrayList<>();
        String sql = "SELECT * FROM Incidencia WHERE idEstudiante = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idEstudiante);
            rs = ps.executeQuery();
            while (rs.next()) {
                Incidencia i = new Incidencia();
                Timestamp timestamp = rs.getTimestamp("fecha");
                String fechaFormateada = new java.text.SimpleDateFormat("dd/MM/yyyy").format(timestamp);
                
                i.setIdIncidencia(rs.getInt("idIncidencia"));
                i.setFecha(fechaFormateada);
                i.setTipo(rs.getString("tipo"));
                i.setDescripcion(rs.getString("descripcion"));
                i.setCodigoAula(rs.getString("codigoAula"));
                i.setSede(rs.getString("sede"));
                i.setIdEstudiante(rs.getInt("idEstudiante"));
                i.setEstado(rs.getString("estado"));
                lista.add(i);
            }
        } catch (Exception e) {
            System.out.println("Error en listarPorEstudiante: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public List<Incidencia> buscarPorFecha(String fecha) {
        List<Incidencia> lista = new ArrayList<>();
        String sql = "SELECT * FROM Incidencia WHERE DATE(fecha) = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, fecha);
            rs = ps.executeQuery();
            while (rs.next()) {
                Incidencia i = new Incidencia();
                Timestamp timestamp = rs.getTimestamp("fecha");
                String fechaFormateada = new java.text.SimpleDateFormat("dd/MM/yyyy").format(timestamp);

                i.setIdIncidencia(rs.getInt("idIncidencia"));
                i.setFecha(fechaFormateada);
                i.setTipo(rs.getString("tipo"));
                i.setDescripcion(rs.getString("descripcion"));
                i.setCodigoAula(rs.getString("codigoAula"));
                i.setSede(rs.getString("sede"));
                i.setIdDocente(rs.getInt("idDocente"));
                i.setIdEstudiante(rs.getInt("idEstudiante"));
                i.setEstado(rs.getString("estado"));
                lista.add(i);
            }
        } catch (Exception e) {
            System.out.println("Error en buscarPorFecha: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public Incidencia list(int id) {
        Incidencia i = new Incidencia();
        String sql = "SELECT * FROM Incidencia WHERE idIncidencia = ?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
            	Timestamp timestamp = rs.getTimestamp("fecha");
                String fechaFormateada = new java.text.SimpleDateFormat("dd/MM/yyyy").format(timestamp);
                
                i.setIdIncidencia(rs.getInt("idIncidencia"));
                i.setFecha(fechaFormateada);
                i.setTipo(rs.getString("tipo"));
                i.setDescripcion(rs.getString("descripcion"));
                i.setCodigoAula(rs.getString("codigoAula"));
                i.setSede(rs.getString("sede"));
                i.setIdDocente(rs.getInt("idDocente"));
                i.setIdEstudiante(rs.getInt("idEstudiante"));
                i.setEstado(rs.getString("estado"));
            }
        } catch (Exception e) {
            System.out.println("Error en list Incidencia: " + e.getMessage());
        }
        return i;
    }

    @Override
    public boolean add(Incidencia i) {
    	String sql = "INSERT INTO Incidencia (tipo, descripcion, codigoAula, sede, idDocente, idEstudiante, estado) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, i.getTipo());
            ps.setString(2, i.getDescripcion());
            ps.setString(3, i.getCodigoAula());
            ps.setString(4, i.getSede());
            ps.setInt(5, i.getIdDocente());
            ps.setInt(6, i.getIdEstudiante());
            ps.setString(7, i.getEstado());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al agregar Incidencia: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(Incidencia i) {
    	String sql = "UPDATE Incidencia SET tipo=?, descripcion=?, sede=?, codigoAula=?, idDocente=?, idEstudiante=?, estado=? WHERE idIncidencia=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, i.getTipo());
            ps.setString(2, i.getDescripcion());
            ps.setString(3, i.getSede());
            ps.setString(4, i.getCodigoAula());
            ps.setInt(5, i.getIdDocente());
            ps.setInt(6, i.getIdEstudiante());
            ps.setString(7, i.getEstado());
            ps.setInt(8, i.getIdIncidencia());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al editar Incidencia: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Incidencia WHERE idIncidencia=?";
        try {
            con = MySQLConexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar Incidencia: " + e.getMessage());
        }
        return false;
    }
}
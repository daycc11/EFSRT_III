package Util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {

	public static Connection getConexion() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/bd_incidencias?serverTimezone=America/Lima&useUnicode=true&characterEncoding=UTF-8";
			String usr = "root";
			String psw = "60895582";
			con = DriverManager.getConnection(url, usr, psw);
			System.out.println("conexion ok");
		} catch (ClassNotFoundException ex) {
			System.out.println("No hay Driver!!");
		} catch (SQLException ex) {
			System.out.println("Error con esta BD ");
		} return con;
	}

	public static void closeConexion(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("Problemas al cerrar la conexión");
		}
	}
}

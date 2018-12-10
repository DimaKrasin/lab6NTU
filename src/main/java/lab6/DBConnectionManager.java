package lab6;

import java.sql.*;


public class DBConnectionManager {

	public static final String DB_URL = "jdbc:mysql://localhost/dbntu?useSSL=false";
	public static final String DB_USER = "root";
	public static final String DB_PASSWORD = "root";

	private Connection connection;
	
	public DBConnectionManager() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	}
	
	public Connection getConnection(){
		return this.connection;
	}
}
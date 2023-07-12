package db;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBcon {
	
	public Connection getConnection() {
		
		Connection conn = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/board", "root", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}

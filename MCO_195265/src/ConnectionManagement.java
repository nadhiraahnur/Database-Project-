

import java.sql.Connection;
import java.sql.DriverManager;
public class ConnectionManagement {
	
	public static Connection connection;
	
	public Connection getConnection() {
		try {
			if(connection==null) {
				System.out.println("Loading jdbc driver...");
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("Connecting to the database...");
				connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/mco195265?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","22Jun1990");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return connection; 
	} 
}
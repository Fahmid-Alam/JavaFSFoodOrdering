
package com.restaurant.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
	
    public static Connection getConnection() throws SQLException {
              Connection con=null;
		
        try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		  
		String path="jdbc:mysql://localhost:3306/foodDel";
		String userName="root";
		String password="fahmid@1";
		
		con= DriverManager.getConnection(path, userName, password);
		System.out.println("Database Connected "+con);
		
        }
        catch(Exception e) {
        	System.out.println("Database NOT Connected");
        	e.printStackTrace();
        }
		
		return con;
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

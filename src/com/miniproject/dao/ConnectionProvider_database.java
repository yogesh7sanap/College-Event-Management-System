package com.miniproject.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider_database {
	
	public static Connection getCon()
	{
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event_system","root", "1234");
			
			return con;
		}
		catch(Exception e) {
			
			System.out.print(e);
			return null;
			
		}
	}

}

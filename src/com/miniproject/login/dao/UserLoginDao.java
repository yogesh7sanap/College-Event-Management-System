package com.miniproject.login.dao;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;





public class UserLoginDao {
	
	//private String dburl = "jdbc:mysql://localhost:3306/event_system";
	//private String dbuname = "root";
	//private String dbpassword = "1234";
	//private String dbDriver = "com.mysql.jdbc.Driver";
	
	public boolean check(String uname,String pass)
	{
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event_system","root", "1234");
			
			PreparedStatement ps=con.prepareStatement("select * from user_table where username=? and password=?");
			
			ps.setString(1, uname);
			ps.setString(2, pass);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return false;
	}

/*----------------------------------------------------------------------------------------------------------------------------------------*/
	
	public boolean adminlogincheck(String admin_uname,String admin_pass)
	{
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event_system","root", "1234");
			
			PreparedStatement ps=con.prepareStatement("select * from organization_table where o_username=? and o_password=?");
			
			ps.setString(1, admin_uname);
			ps.setString(2, admin_pass);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return false;
	}
	
	
/*------------------------------------------------------------------------------------------------------------------------------*/
	
	public boolean principlelogincheck(String pr_uname,String pr_pass)
	{
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event_system","root", "1234");
			
			PreparedStatement ps=con.prepareStatement("select * from college_principle_table where pr_username=? and pr_password=?");
			
			ps.setString(1, pr_uname);
			ps.setString(2, pr_pass);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return false;
	}


}

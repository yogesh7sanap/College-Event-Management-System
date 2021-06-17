<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<% 

	String oid=request.getParameter("o_id");
	String oname=request.getParameter("o_name");
	String ousername=request.getParameter("o_username");
	String opassword=request.getParameter("o_password");
	
	
	
	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		PreparedStatement ps=con.prepareStatement("update organization_table set organization_name=?,o_username=?,o_password=? where o_id=?");
		
		
		ps.setString(1, oname);
		ps.setString(2, ousername);
		ps.setString(3, opassword);
		ps.setString(4, oid);
		
		
		
		ps.executeUpdate();
		
		response.sendRedirect("college_principle_home_page.jsp?msg=valid");
	}
	catch(Exception e){
		
		response.sendRedirect("college_principle_home_page.jsp?msg=invalid");
	}
	
	%>
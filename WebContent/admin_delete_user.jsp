<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<% 

	String uid=request.getParameter("uid");
	
	
	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		Statement st=con.createStatement();
		
		st.executeUpdate("delete from user_table where u_id='"+uid+"'");
		
		response.sendRedirect("admin_all_user_details.jsp?msg=deleted");
	}
	catch(Exception e){
		
		response.sendRedirect("admin_all_user_details.jsp?msg=invalid");
	}
	
	%>
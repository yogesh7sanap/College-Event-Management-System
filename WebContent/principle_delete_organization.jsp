<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<% 

	String oid=request.getParameter("oid");
	
	
	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		Statement st=con.createStatement();
		
		st.executeUpdate("delete from organization_table where o_id='"+oid+"'");
		
		response.sendRedirect("college_principle_home_page.jsp?msg=deleted");
	}
	catch(Exception e){
		
		response.sendRedirect("college_principle_home_page.jsp?msg=invalid");
	}
	
	%>
<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<% 

	String eid=request.getParameter("eid");
	
	
	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		Statement st=con.createStatement();
		
		st.executeUpdate("delete from event_table where e_id='"+eid+"'");
		
		response.sendRedirect("admin_all_event_details.jsp?msg=deleted");
	}
	catch(Exception e){
		
		response.sendRedirect("admin_all_event_details.jsp?msg=invalid");
	}
	
	%>
<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<% 

	String id=request.getParameter("e_id");
	String eventname=request.getParameter("e_name");
	String eventdescription=request.getParameter("e_desc");
	String eventdate=request.getParameter("e_date");
	String eventtime=request.getParameter("e_time");
	String eventlocation=request.getParameter("e_loc");
	String e_co_name=request.getParameter("e_co_name");
	String e_co_mob=request.getParameter("e_co_mob");
	String organizationid=request.getParameter("o_id");
	
	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		PreparedStatement ps=con.prepareStatement("insert into event_table values(?,?,?,?,?,?,?,?,?)");
		
		ps.setString(1, id);
		ps.setString(2, eventname);
		ps.setString(3, eventdescription);
		ps.setString(4, eventdate);
		ps.setString(5, eventtime);
		ps.setString(6, eventlocation);
		ps.setString(7, e_co_name);
		ps.setString(8, e_co_mob);
		ps.setString(9, organizationid);
		
		
		ps.executeUpdate();
		
		response.sendRedirect("admin_add_event.jsp?msg=valid");
	}
	catch(Exception e){
		
		response.sendRedirect("admin_add_event.jsp?msg=invalid");
	}
	
	%>
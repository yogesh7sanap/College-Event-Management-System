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
	
	
	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		PreparedStatement ps=con.prepareStatement("update event_table set event_name=?,event_desc=?,event_date=?, event_time=?,event_location=?,event_coordinator_name=?,event_coordinator_mob_no=? where e_id=?");
		
		
		ps.setString(1, eventname);
		ps.setString(2, eventdescription);
		ps.setString(3, eventdate);
		ps.setString(4, eventtime);
		ps.setString(5, eventlocation);
		ps.setString(6, e_co_name);
		ps.setString(7, e_co_mob);
		
		ps.setString(8, id);
		
		
		
		ps.executeUpdate();
		
		response.sendRedirect("admin_all_event_details.jsp?msg=valid");
	}
	catch(Exception e){
		
		response.sendRedirect("admin_all_event_details.jsp?msg=invalid");
	}
	
	%>
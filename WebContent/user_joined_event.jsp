<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>



<%

	String eid=request.getParameter("eid");

	out.println(eid);

/*------------------------------------------------------------------------------------------------------*/
	HttpSession sessionlogin=request.getSession();
	
	String u_name=sessionlogin.getAttribute("session_username").toString();
	
	out.println(u_name);
	
/*------------------------------------------------------------------------------------------------------*/

	Connection con=ConnectionProvider_database.getCon();

	Statement st=con.createStatement();

	ResultSet rs=st.executeQuery("select u_id from user_table where username='"+u_name+"'");
	
	int uid;
	rs.next();
	
	uid=rs.getInt(1);
	
	
	out.println(uid);
	
	
	
/*--------------------------------------------------------------------------------------------------------*/


	try{
		Connection con1=ConnectionProvider_database.getCon();
		
		PreparedStatement ps1=con1.prepareStatement("insert into user_event_relationship_table values(?,?)");
		
		
		ps1.setInt(1, uid);
		ps1.setString(2, eid);
		
		
		ps1.executeUpdate();
		
		response.sendRedirect("user_event_registration.jsp?msg=valid");
	}
	catch(Exception e)
	{
		response.sendRedirect("user_event_registration.jsp?msg=invalid");	
	}
		
	
	
	
	%>
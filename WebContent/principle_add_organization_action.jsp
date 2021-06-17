<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>


<%
	String o_id=request.getParameter("o_id");
	String org_name=request.getParameter("org_name");
	String org_username=request.getParameter("org_username");
	String org_pass=request.getParameter("org_pass");
	String p_id=request.getParameter("p_id");
	
	
try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		PreparedStatement ps=con.prepareStatement("insert into organization_table values(?,?,?,?,?)");
		
		ps.setString(1, o_id);
		ps.setString(2, org_name);
		ps.setString(3, org_username);
		ps.setString(4, org_pass);
		ps.setString(5, p_id);
		
		
		ps.executeUpdate();
		
		response.sendRedirect("principle_add_organization.jsp?msg=valid");
	}
	catch(Exception e){
		
		response.sendRedirect("principle_add_organization.jsp?msg=invalid");
	}
	
%>
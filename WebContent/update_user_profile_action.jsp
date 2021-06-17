<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<% 

	String id=request.getParameter("u_id");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String comp_name=request.getParameter("com_name");
	String rollno=request.getParameter("roll_number");
	String email=request.getParameter("u_email");
	String mobile=request.getParameter("u_mobile");
	String dept_name=request.getParameter("dept_name");
	String study_year=request.getParameter("study_year");
	String division=request.getParameter("div");
	
	
	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		PreparedStatement ps=con.prepareStatement("update user_table set username=?,password=?,complete_name=?, roll_no=?,user_email=?,user_mobile_no=?,department_name=?,study_year=?,division=?  where u_id=?");
		
		
		ps.setString(1, username);
		ps.setString(2, password);
		ps.setString(3, comp_name);
		ps.setString(4, rollno);
		ps.setString(5, email);
		ps.setString(6, mobile);
		ps.setString(7, dept_name);
		ps.setString(8, study_year);
		ps.setString(9,division);
		ps.setString(10, id);
		
		ps.executeUpdate();
		
		response.sendRedirect("user_home_page.jsp?msg=valid");
	}
	catch(Exception e){
		
		response.sendRedirect("user_home_page.jsp?msg=invalid");
	}
	
	%>
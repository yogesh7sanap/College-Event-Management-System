<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<% 

	String id=request.getParameter("u_id");
	String username=request.getParameter("u_name");
	
	Connection con2=ConnectionProvider_database.getCon();
	
	Statement st2=con2.createStatement();

	ResultSet rs2=st2.executeQuery("select * from user_table  where username='"+username+"'");
	
	if(rs2.next())
	{
		response.sendRedirect("user_profile_signup.jsp?msg=repeated");
		return;
	}
	else
	{
	
	String password=request.getParameter("u_pass");
	String c_name=request.getParameter("com_name");
	String rollno=request.getParameter("roll_number");
	String email=request.getParameter("u_email");
	String mobileno=request.getParameter("u_mobile_no");
	String dept_name=request.getParameter("u_department_name");
	String study_year=request.getParameter("u_study_year");
	String division=request.getParameter("u_division");
	
	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		PreparedStatement ps=con.prepareStatement("insert into user_table values(?,?,?,?,?,?,?,?,?,?)");
		
		ps.setString(1, id);
		ps.setString(2, username);
		ps.setString(3, password);
		ps.setString(4, c_name);
		ps.setString(5, rollno);
		ps.setString(6, email);
		ps.setString(7, mobileno);
		ps.setString(8, dept_name);
		ps.setString(9, study_year);
		ps.setString(10,division);
		
		ps.executeUpdate();
		
		response.sendRedirect("user_profile_signup.jsp?msg=valid");
	}
	catch(Exception e){
		
		response.sendRedirect("user_profile_signup.jsp?msg=invalid");
	}
	}
	
	%>
<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<%@ page import="com.miniproject.login.dao.UserLoginDao"%>


<%

	UserLoginDao loginDao = new UserLoginDao();

	String a_username = request.getParameter("admin_username");
	String a_password = request.getParameter("admin_password");

	//UserLoginBean loginBean = new UserLoginBean();

	//loginBean.setUsername(username);
	//loginBean.setPassword(password);

	if (loginDao.adminlogincheck(a_username, a_password))
	{
		HttpSession sessionadminlogin=request.getSession();
		
		sessionadminlogin.setAttribute("session_admin_username", a_username);
	
		
		
		response.sendRedirect("admin_home_page.jsp");
	
	}
	else 
	{
	
		response.sendRedirect("admin_login.jsp?msg=invalid");
	
	}
%>
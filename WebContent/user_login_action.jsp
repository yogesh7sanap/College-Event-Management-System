<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<%@ page import="com.miniproject.login.dao.UserLoginDao"%>


<%

	UserLoginDao loginDao = new UserLoginDao();

	String username = request.getParameter("username");
	String password = request.getParameter("password");

	//UserLoginBean loginBean = new UserLoginBean();

	//loginBean.setUsername(username);
	//loginBean.setPassword(password);

	if (loginDao.check(username, password))
	{
		HttpSession sessionlogin=request.getSession();
		
		sessionlogin.setAttribute("session_username", username);
	
		
		
		response.sendRedirect("user_home_page.jsp");
	
	}
	else 
	{
	
		response.sendRedirect("user_login.jsp?msg=invalid");
	
	}
%>
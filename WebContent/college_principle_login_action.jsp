<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

<%@ page import="com.miniproject.login.dao.UserLoginDao"%>


<%

	UserLoginDao loginDao = new UserLoginDao();

	String pr_username = request.getParameter("principle_username");
	String pr_password = request.getParameter("principle_password");

	//UserLoginBean loginBean = new UserLoginBean();

	//loginBean.setUsername(username);
	//loginBean.setPassword(password);

	if (loginDao.principlelogincheck(pr_username, pr_password))
	{
		HttpSession sessionprinciplelogin=request.getSession();
		
		sessionprinciplelogin.setAttribute("session_principle_username", pr_username);
	
		
		
		response.sendRedirect("college_principle_home_page.jsp");
	
	}
	else 
	{
	
		response.sendRedirect("college_principle_login.jsp?msg=invalid");
	
	}
%>
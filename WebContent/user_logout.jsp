<%

	HttpSession sessionlogin=request.getSession();
	
	sessionlogin.removeAttribute("session_username");
	
	sessionlogin.invalidate();
	
	response.sendRedirect("user_login.jsp");
%>
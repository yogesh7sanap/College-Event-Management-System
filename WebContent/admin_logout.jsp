<%

	HttpSession sessionadminlogin=request.getSession();
	
	sessionadminlogin.removeAttribute("session_admin_username");
	
	sessionadminlogin.invalidate();
	
	response.sendRedirect("admin_login.jsp");
%>
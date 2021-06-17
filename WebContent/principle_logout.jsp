<%

	HttpSession sessionprinciplelogin=request.getSession();
	
	sessionprinciplelogin.removeAttribute("session_principle_username");
	
	sessionprinciplelogin.invalidate();
	
	response.sendRedirect("college_principle_login.jsp");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<style>
	
	body{
	
		height : 100vh;
		background-size: cover;
		background-position : center;
	
	}
	
	.back_home{
	
			
		 	background-color: rgb(199, 162, 60);
    		font-size: 25PX;
    		padding: 10px 10px;
    		text-decoration: none;
    		color: rgb(255, 255, 255);
    		font-weight: bolder;
    		margin-left:130px;
    	
   		 	
    
   		 	border-radius: 10px;
    		-webkit-border-radius: 10px;
    		-moz-border-radius: 10px;
    		-ms-border-radius: 10px;
    		-o-border-radius: 10px;	
	}
	
	
	.button{
		 	background-color: rgb(199, 162, 60);
    		font-size: 25PX;
    		padding: 10px 10px;
    		text-decoration: none;
    		color: rgb(255, 255, 255);
    		font-weight: bolder;
    		margin-top:15px;
    		margin-left:1100px;
    		margin-bottom:260px;
    		
    		
    	
   		 	
    
   		 	border-radius: 10px;
    		-webkit-border-radius: 10px;
    		-moz-border-radius: 10px;
    		-ms-border-radius: 10px;
    		-o-border-radius: 10px;	
	}
	
	
	.button:hover{
    		color: rgb(41, 226, 149);
    		text-decoration-line: none;
    		-moz-text-decoration-line: none;

	}
	
	.name{
	
		 font-weight: bolder;
	     color: rgb(66, 65, 66);
		 font-size:30px;
		 
	
	}
	
	h1{
	
		 font-weight: bolder;
		color: rgb(255, 255, 255);
		 font-size:40px;
		 
	}
	
	h2{
		float:left;
	}
	
	.ip{
		
		font-size:33px;
		
	}
	
	
	
</style>

<body background="image_inner_home.jpg">
	
<%
		String msg=request.getParameter("msg");
		
		if("valid".equals(msg))
		{
			%>
			<center><font color="red" size="10">Successfully Inserted </font></center>
			
		<%}%>
		<% 	
		if("invalid".equals(msg))
		{
			%>
				<center><font color="red" size="10">Something Went Wrong Please Try Again!!</font></center>
		<%
		}
%>
	
	
	<%
	HttpSession sessionlogin=request.getSession();
	
	String u_name=sessionlogin.getAttribute("session_username").toString();
	
	
	%>
	<h2 style="color : black ;"> User Name :<% out.println(u_name); %></h2>
	
	<% 
	
	%>
   
   
   <%
 		  if(sessionlogin.getAttribute("session_username")==null)
 		  {
 			  response.sendRedirect("user_login.jsp");
 			  
 		  }
   %>
   
   <form action="user_logout.jsp" method="post">
   	
   	<button class=" button" type="submit"> Logout</button>
   
   </form>
   
    <a class=" back_home" href="update_user_profile.jsp">UPDATE PROFILE</a> 
   
   <a class=" back_home" href="user_event_registration.jsp">REGISTER FOR EVENT</a> 
   
   <a class=" back_home" href="user_registered_event_details.jsp">REGISTERED EVENT DETAILS</a> 
   
   
   
   
</body>
</html>



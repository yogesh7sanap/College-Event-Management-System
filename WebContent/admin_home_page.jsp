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
    		margin-left:170px;
    	
   		 	
    
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
	HttpSession sessionadminlogin=request.getSession();

	String a_u_name=sessionadminlogin.getAttribute("session_admin_username").toString();

	
	
	%>
	<h2 style="color : black ;"> Admin User Name :<% out.println(a_u_name); %></h2>
	
	<% 
%>
<br>

	
   
    <%
 		  if(sessionadminlogin.getAttribute("session_admin_username")==null)
 		  {
 			  response.sendRedirect("admin_login.jsp");
 			  
 		  }
   %>
   
   <form action="admin_logout.jsp" method="post">
   	
   	<button class=" button"  type="submit"> Logout</button>
   
   </form>
   
   
   <a class=" back_home" href = "admin_add_event.jsp" > ADD EVENT </a>
	
	<a class=" back_home" href = "admin_all_event_details.jsp" >SHOW ALL EVENTS </a> 
	
   <a class=" back_home" href="admin_all_user_details.jsp">ALL USER DATA</a> 
   
   
    
</body>
</html>



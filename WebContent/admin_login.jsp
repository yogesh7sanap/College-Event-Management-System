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
    		margin-left:1300px;
   		 	
    
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
		color: rgb(255, 255, 255);
		 font-size:30px;
		 
	
	}
	
	h1{
	
		 font-weight: bolder;
		color: rgb(255, 255, 255);
		 font-size:40px;
		 
	}
	
	.ip{
		
		font-size:33px;
		
	}
	
</style>


<body background="image_user_login.jpg">

<form action="user_login.jsp" method="post">
   	
   	<button class="back_home" type="submit"> HOME PAGE</button>
   
   </form>

<%
	
	String msg=request.getParameter("msg");

	if("invalid".equals(msg))
	{
	%>
		<center><font color="red" size="10">Invalid Login Details </font></center>
	
	<%}%>


	<div align ="center">
	<h1>Admin Login </h1>
	<form action ="admin_login_action.jsp" method="post">

<label class ="name">

		User Name: <input class="ip" type="text" name="admin_username"> <br><br>
		Password: <input class="ip" type="password" name="admin_password">  <br><br>
</label>

	<button class="button" type="submit"> Login </button>



</form>

</div>

</body>
</html>
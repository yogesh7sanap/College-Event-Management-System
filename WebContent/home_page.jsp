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
	
	.button{
		 	background-color: rgb(199, 162, 60);
    		font-size: 25PX;
    		padding: 10px 10px;
    		text-decoration: none;
    		color: rgb(255, 255, 255);
    		font-weight: bolder;
    		margin-top: 500px;
    		margin-bottom:150px
   		 	
    
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
	
	.nav{
		margin-bottom:200px;
	}
	
	.title_home{
	
		
		margin-left:150px;
		font-weight:bolder;
		font-size:70px;
		color:yellow;
	
	}
	
	
</style>


<body background="image_home.jpg">

<br><br>
<div  class="nav" align="center">

	<a  class="button" href="user_login.jsp">LOGIN</a> 
	
	<a  class="button" href="user_profile_signup.jsp">USER SIGNUP</a> 
	

</div>
	<label class="title_home">College Event Management System</label>

</body>
</html>
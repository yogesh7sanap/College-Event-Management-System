<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>


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
	     color: rgb(66, 65, 66);
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



<body background="image_form.jpg">

<form action="user_home_page.jsp" method="post">
   	
   	<button class="back_home" type="submit"> HOME PAGE</button>
   
   </form>

<%

	HttpSession sessionlogin=request.getSession();

	String u_name=sessionlogin.getAttribute("session_username").toString();

	%>
	<h2 style="color : green ;"> User Name : <%out.println(u_name);%> </h2>


	<%
	
/*-------------------------------------------------------------------------------------------------*/	
	Connection con=ConnectionProvider_database.getCon();

	Statement st=con.createStatement();

	ResultSet rs=st.executeQuery("select u_id from user_table where username='"+u_name+"'");
	
	int uid;
	rs.next();
	
	uid=rs.getInt(1);
	
	
	%>
	<h2 style="color : green ;"> User ID :<% out.println(uid);%> </h2>
	



<% 

	try{
		Connection con1=ConnectionProvider_database.getCon();

		Statement st1=con.createStatement();

		ResultSet rs1=st1.executeQuery("select * from user_table where u_id='"+uid+"'");
	
		while(rs1.next())
		{
	
%>

<center>

	<form action="update_user_profile_action.jsp" method="post">
		
		<input type="hidden" name="u_id" value=" <%out.println(uid); %> ">
		
		<label class ="name">
		
		Username :
		<input class="ip" type="text" value="<%=rs1.getString(2) %>" name="username">	<br><br>
		
		Password :
		<input class="ip" type="text" value="<%=rs1.getString(3) %>" name="password"><br><br>
		
		Your Name :
		<input class="ip" type="text" value="<%=rs1.getString(4) %>" name="com_name">	<br><br>
		
		Roll Number :
		<input  class="ip" type="text" value="<%=rs1.getString(5) %>" name="roll_number"><br><br>
		
		Your Name :
		<input  class="ip"type="text" value="<%=rs1.getString(6) %>" name="u_email">	<br><br>
		
		Mobile Number :
		<input class="ip" type="text" value="<%=rs1.getString(7) %>" name="u_mobile">	<br><br>
		
		Department Name :
		<input class="ip" type="text" value="<%=rs1.getString(8) %>" name="dept_name">		<br><br>
		
		Study Year :
		<input  class="ip"type="text" value="<%=rs1.getString(9) %>" name="study_year"><br><br>
		
		Division :
		<input class="ip" type="text" value="<%=rs1.getString(10) %>" name="div">		<br><br>
		
		</label>
		
		<br>
		<button class="button" type="submit"> Save </button>	<br><br><br>
	
	
	</form>
	
	
</center>


<%}}
	catch(Exception e)
	{
		e.printStackTrace();
	}%>

</body>
</html>
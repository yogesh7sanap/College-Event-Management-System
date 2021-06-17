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

<br>
<br>

<form action="college_principle_home_page.jsp" method="post">
   	
   	<button class="back_home"type="submit"> HOME PAGE</button>
   
   </form>

<%

	

	String oid=request.getParameter("oid");

	%>
	<h2 style="color : green ;"> User Name :<%out.println(oid);%> </h2>
	
	<% 

/*-------------------------------------------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------------------------------------------*/

	try
	{
		Connection con=ConnectionProvider_database.getCon();
		
		Statement st=con.createStatement();
		
		ResultSet rs=st.executeQuery("select * from organization_table where o_id='"+oid+"'");
		
		while(rs.next())
		{
			
			%>
		<center>
		
			<form action="principle_edit_organization_action.jsp" method="post">
			
			<label class ="name">
	
			<input type="hidden" name="o_id" value=" <%out.println(oid); %> ">
		
			Organization Name :
			<input class="ip" type="text" value="<%=rs.getString(2) %>" name="o_name">	 <br><br>
		
			Organization Username :
			<input class="ip" type="text" value="<%=rs.getString(3) %>" name="o_username">	<br><br>

			Organization Password :
			<input class="ip" type="text" value="<%=rs.getString(4) %>" name="o_password">	<br><br>
		
			
			</label>
		
			<br>
			<br>
			<br>
			<br>
			<button class="button" type="submit"> Save </button>	
		
	
		
		</form>
	
	</center>
			<% 
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>








</body>
</html>














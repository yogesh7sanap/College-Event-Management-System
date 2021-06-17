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

<form action="home_page.jsp" method="post">
   	
   	<button class="back_home" type="submit"> HOME PAGE</button>
   
   </form>


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
		if("repeated".equals(msg))
		{
			%>
				<center><font color="red" size="10">This Username Is Already Taken Please Enter Your Username Again !!</font></center>
		<%
		}
%>

<%


	int u_id=0;

	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		Statement st=con.createStatement();
		
		ResultSet rs=st.executeQuery("select max(u_id) from user_table");
		
		if(rs.next())
		{
			u_id=rs.getInt(1);
			
			u_id=u_id+1;
		} 
		%>
		
		<center><h1 style="color : red ;"> User ID : <% out.println(u_id); %> </h1></center>
		
<%	
	}
	
	catch(Exception e)
	{		}
%>


<center>

	<form action="user_profile_signup_action.jsp" method="post">
		
		<input type="hidden" name="u_id" value=" <%out.println(u_id); %> ">
		
		<label class ="name">
		
		Username :
		<input  class="ip" type="text" placeholder="Enter Username" name="u_name">	<br><br>
		
		Password :
		<input class="ip" type="password" placeholder="Enter Password" name="u_pass">	<br><br>
		
		Your Name : 
		<input  class="ip" type="text" placeholder="Enter Your Name" name="com_name">	<br><br>
		
		Roll Number :
		<input  class="ip" type="text" placeholder="Enter Roll Number"  name="roll_number">	<br><br>
		
		Email :
		<input  class="ip" type="email"  placeholder="Enter Username" name="u_email">	<br><br>
		
		Mobile Number :
		<input  class="ip" type="text" placeholder="Enter Mobile Number" name="u_mobile_no">	<br><br>
		
		Department Name :
		<input   class="ip" type="text" placeholder="Enter Department Name" name="u_department_name"><br>	<br>
		
		Current Study Year :
		<input   class="ip" type="text" placeholder="Enter Current Study Year" name="u_study_year">	<br><br>
		
		Division :
		<input  class="ip" type="text" placeholder="Enter Your Division" name="u_division"><br><br>
		
		</label>
		
		
		<button class="button" type="submit"> Save </button>	<br><br>
	
	
	</form>
	
	
	
</center>

</body>
</html>






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

	<form action="college_principle_home_page.jsp" method="post">
   	
   	<button  class="back_home" type="submit"> HOME PAGE</button>
   
   </form>

	<%
   		 HttpSession sessionprinciplelogin1=request.getSession();
 
 		  if(sessionprinciplelogin1.getAttribute("session_principle_username")==null)
 		  {
 			  response.sendRedirect("college_principle_login.jsp");
 			  
 		  }
   %>
   
  
  
  
  
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
 		HttpSession sessionprinciplelogin=request.getSession();
	
		String pr_u_name=sessionprinciplelogin.getAttribute("session_principle_username").toString();
		
	%>
	
	
	
	
	
	<h2 style="color : green ;"> Principle User Name : <% out.println(pr_u_name); %></h2>
	
	
	
	
	
	<%
		Connection con1=ConnectionProvider_database.getCon();

		Statement st1=con1.createStatement();

		ResultSet rs1=st1.executeQuery("select pr_id from college_principle_table where pr_username='"+pr_u_name+"'");
	
		int p_id;
		rs1.next();
	
		p_id=rs1.getInt(1);
	%>
	
	
	
	<h2 style="color : green ;">College Principle ID :<%out.println(p_id);  %></h2>
	
	
	
	
	<% 

	int o_id=0;

	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		Statement st=con.createStatement();
		
		ResultSet rs=st.executeQuery("select max(o_id) from organization_table");
		
		if(rs.next())
		{
			o_id=rs.getInt(1);
			
			o_id=o_id+1;
		} 
		%>
		
		
		
		
		
		<center><h1 style="color : red ;"> User ID : <% out.println(o_id); %> </h1></center>
		
		
		
		
	<%	
		}
	
		catch(Exception e)
		{		}
	%>
	
	
	
	
	<center>
	
	<form action="principle_add_organization_action.jsp" method="post">
	
		<label class ="name">
	
		<input type="hidden" name="o_id" value=" <%out.println(o_id); %> ">
		
		Organization Name :
		<input class="ip" type="text" placeholder="Enter Organization Name" name="org_name">	<br><br>
		
		Organization Username :
		<input class="ip" type="text" placeholder="Enter Organization Username" name="org_username">	<br><br>

		Organization Password :
		<input class="ip" type="text" placeholder="Enter Organization Password" name="org_pass">	<br><br>
		
		<input class="ip" type="hidden" name="p_id" value=" <%out.println(p_id); %> ">
		
		
		</label>
		
		
		
		<br>
		<br>
		
		<button  class="button" type="submit"> Save </button>	
		
		<br>
		<br>
		
	</form>

</center>
	
	
</body>
</html>
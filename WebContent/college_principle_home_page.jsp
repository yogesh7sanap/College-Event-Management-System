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
    		margin-left:1000px;
    		
    		
    			
    	
   		 	
    
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
		
	}
	
	.ip{
		
		font-size:33px;
		
	}
	
	.table_header{
		color:orange;
	}
	
	.links{
		
		color:red;
	}
	

</style>


<body background="image_table_data.jpg">


 <%
   		 HttpSession sessionprinciplelogin1=request.getSession();
 
 		  if(sessionprinciplelogin1.getAttribute("session_principle_username")==null)
 		  {
 			  response.sendRedirect("college_principle_login.jsp");
 			  
 		  }
   %>
   


 <form action="principle_logout.jsp" method="post">
   	
   	<button class=" button"  type="submit"> Logout</button>
   
   </form>
<% 

String msg=request.getParameter("msg");
		
		if("valid".equals(msg))
		{
			
		%>
			<center><font color="red" size="10">Successfully Updated </font></center>
			
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
		if("deleted".equals(msg))
		{
			
		%>
		
				<center><font color="red" size="10">Organization Data successfully Deleted !!</font></center>
		
		<%
		}
%>



<table border="1">
	<tr>
		<th class="table_header"> Organization ID </th>
		<th class="table_header"> Organization Name</th>
		<th class="table_header"> Organization UserName </th>
		<th class="table_header"> Organization Password </th>
		<th class="table_header"> Edit </th>
		<th class="table_header"> Delete </th>
	
	</tr>
	
	<tr>
	
		<%

/*---------------------------------------------------------------------------------------------------*/

	 HttpSession sessionprinciplelogin=request.getSession();
	
	String pr_u_name=sessionprinciplelogin.getAttribute("session_principle_username").toString();

	

	%>
	<h2 style="color : green ;"> Principle User Name : <% out.println(pr_u_name); %></h2>
	
	<a class=" back_home" href = "principle_add_organization.jsp" > ADD ORGANIZATION </a>
	<br><br>
	<% 

	
/*---------------------------------------------------------------------------------------------------*/
	
	try{
		Connection con1=ConnectionProvider_database.getCon();

		Statement st1=con1.createStatement();

		ResultSet rs=st1.executeQuery("select o.o_id, o.organization_name,o.o_username,o.o_password from  organization_table  o natural join college_principle_table c where pr_username='"+pr_u_name+"'");

	
		
		while(rs.next())
		{
			
	%>
			<th><%=rs.getInt(1)%></th>
			<th><%=rs.getString(2)%></th>
			
			<th><%=rs.getString(3)%></th>
			<th><%=rs.getString(4)%></th>
			
			
			<th><a class="links" href="principle_edit_organization.jsp?oid=<%=rs.getInt(1)%> " > Edit </a></th>
			<th><a class="links" href="principle_delete_organization.jsp?oid=<%=rs.getInt(1)%> " > Delete </a></th>
			
			</tr>
		<% 	
			
		}
		}
	catch(Exception e)
	{
		e.printStackTrace();
	}
			
	%>
	
	
	
	
</table>












</body>
</html>



















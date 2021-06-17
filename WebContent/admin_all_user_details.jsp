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
    		margin-left:900px;
    		
    		
    		float:right;	
    		
    		
    	
   		 	
    
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


 <form action="admin_home_page.jsp" method="post">
   	
   	<button class=" button" type="submit"> HOME PAGE</button>
   
   </form>

<% 	
		String msg=request.getParameter("msg");
		if("invalid".equals(msg))
		{
			%>
				<center><font color="red" size="10">Something Went Wrong Please Try Again!!</font></center>
		<%
		}
		 	
		if("deleted".equals(msg))
		{
			%>
				<center><font color="red" size="10">User Data Has Been Deleted Successfully!!</font></center>
		<%
		}
%>



	<table border="1">
		<tr>
			<th class="table_header"> User ID </th>
			<th class="table_header"> User Name </th>
			<th class="table_header"> Password </th>
			<th class="table_header"> Your Name </th>
			<th class="table_header"> Roll Number </th>
			<th class="table_header"> Email </th>
			<th class="table_header"> Mobile Number </th>
			<th class="table_header"> Department Name </th>
			<th class="table_header"> Study Year </th>
			<th class="table_header"> Division</th>
			<th class="table_header"> Event ID</th>
			<th class="table_header"> Event Name</th>
			<th class="table_header"> Delete User</th>
	
		</tr>
		
		<tr>
		
		<%

/*---------------------------------------------------------------------------------------------------*/
	HttpSession sessionadminlogin=request.getSession();

	String a_u_name=sessionadminlogin.getAttribute("session_admin_username").toString();

	
	
	%>
	<h2 style="color : green ;"> Admin User Name : <% out.println(a_u_name); %></h2>
	
	<% 

	
/*---------------------------------------------------------------------------------------------------*/
	
	
	Connection con1=ConnectionProvider_database.getCon();

	Statement st1=con1.createStatement();

	ResultSet rs1=st1.executeQuery("select o_id from organization_table where o_username='"+a_u_name+"'");

	int oid;
	
	rs1.next();

	oid=rs1.getInt(1);
	
	
	%>
	<h2 style="color : green ;"> Organization Name : <% out.println(oid); %></h2>
	
	<% 

/*---------------------------------------------------------------------------------------------------*/
	
		try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		Statement st=con.createStatement();
		
		ResultSet rs=st.executeQuery("select u_id,username,password,complete_name,roll_no,user_email,user_mobile_no,department_name,study_year,division,e_id,event_name,o_id from user_table natural join user_event_relationship_table natural join event_table where o_id='"+oid+"'");
		
		while(rs.next())
		{
			
	%>
			<th><%=rs.getInt(1)%></th>
			<th><%=rs.getString(2)%></th>
			
			<th><%=rs.getString(3)%></th>
			<th><%=rs.getString(4)%></th>
			<th><%=rs.getString(5)%></th>
			<th><%=rs.getString(6)%></th>
			<th><%=rs.getString(7)%></th>
			<th><%=rs.getString(8)%></th>
			<th><%=rs.getString(9)%></th>
			<th><%=rs.getString(10)%></th>
			<th><%=rs.getString(11)%></th>
			<th><%=rs.getString(12)%></th>
			
			
			<th> <a class="links" href="admin_delete_user.jsp?uid=<%=rs.getInt(1) %>" >  DELETE USER </a> </th>
		
			
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
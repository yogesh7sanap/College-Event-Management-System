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
	
	h4{
	
		
		text-align:center;
		font-size:20px;
		
	}
	
	.ip{
		
		font-size:33px;
		
	}
	
	.table_h{
		color:orange;
		font:bold;
		left-margin:150;
		text-align:center;
	}
	
	.links{
		
		color:red;
		text-align:center;
	}
	
	

</style>


<body background="image_table_data.jpg">


<form action="admin_home_page.jsp" method="post">
   	
   	<button class=" button" type="submit"> HOME PAGE</button>
   
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
		 	
		if("deleted".equals(msg))
		{
			%>
				<center><font color="red" size="10">Event Has Been Deleted Successfully!!</font></center>
		<%
		}
%>



	
	
	
	
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
	<h2 style="color : green ;"> Organization ID : <% out.println(oid); %></h2>
	
	
	
	
	<form style="text-align: center;"action="event_search_by_date.jsp" method="post">
	
		
		<input class="name" type="text" name="event_yyyy_dd_mm" placeholder="yyyy-dd-mm">
		
		<input class="ip" type="hidden" name="org_id" value=" <%out.println(oid); %> ">
   	
   		<button  class="back_home" type="submit"> Search</button>
   		
   		
   
   </form>
   
   
   
   
   
   <br>
   
   <form style="text-align: center;"action="event_search_by_name.jsp" method="post">
	
		
		<input class="name" type="text" name="event_n" placeholder="Enter the first Character of Event">
		
		<input class="ip" type="hidden" name="org_id" value=" <%out.println(oid); %> ">
   	
   		<button  class="back_home" type="submit"> Search</button>
   		
   		
   
   </form>
   
   
   <br>
   <hr><hr>
   
   
   
	
	<% 

/*---------------------------------------------------------------------------------------------------*/
	
		try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		Statement st=con.createStatement();
		
		ResultSet rs=st.executeQuery("select * from event_table where o_id='"+oid+"'");
		
		while(rs.next())
		{
			
	%>
			<h4><label style="font:bold; color:orange"> Event ID      : </label>  <%=rs.getInt(1)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Name      : </label>  <%=rs.getString(2)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Description      : </label>  <%=rs.getString(3)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Date      : </label>  <%=rs.getString(4)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Time      : </label>  <%=rs.getString(5)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Location      : </label>  <%=rs.getString(6)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Co-ordinator Name      : </label>  <%=rs.getString(7)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Co-ordinator Mobile No.      : </label>  <%=rs.getString(8)%></h4>
			
			<h4><label style="font:bold; color:orange"> Organization ID      : </label>  <%=rs.getInt(9)%></h4>
		
		
	
			
						
			<h4><a class="links" href="admin_edit_event.jsp?eid=<%=rs.getInt(1)%> " > Edit </a> </h4>
			<h4><a class="links" href="admin_delete_event.jsp?eid=<%=rs.getInt(1)%> " > Delete </a></h4><br><br><hr>
		
			
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
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



 <form action="admin_home_page.jsp" method="post">
   	
   	<button  class="back_home" type="submit"> HOME PAGE</button>
   
   </form>

<%
	HttpSession sessionadminlogin=request.getSession();

	String a_u_name=sessionadminlogin.getAttribute("session_admin_username").toString();

	
	
	%>
	<h2 style="color : green ;">Admin User Name :<% out.println(a_u_name); %></h2>
	
	<% 
	
	
/*---------------------------------------------------------------------------------------------------*/

	Connection con1=ConnectionProvider_database.getCon();

	Statement st1=con1.createStatement();

	ResultSet rs1=st1.executeQuery("select o_id from organization_table where o_username='"+a_u_name+"'");
	
	int oid;
	rs1.next();
	
	oid=rs1.getInt(1);
	
	%>
	<h2 style="color : green ;">Organization ID :<%out.println(oid);  %></h2>
	
	<% 


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

int e_id=0;

	try{
		
		Connection con=ConnectionProvider_database.getCon();
		
		Statement st=con.createStatement();
		
		ResultSet rs=st.executeQuery("select max(e_id) from event_table");
		
		if(rs.next())
		{
			e_id=rs.getInt(1);
			
			e_id=e_id+1;
		} 
		%>
		
		<center><h1 style="color : red ;"> User ID : <% out.println(e_id); %> </h1></center>
		
<%	
	}
	
	catch(Exception e)
	{		}
%>

<center>
	
	<form action="admin_add_event_action.jsp" method="post">
	
		<label class ="name">
	
		<input type="hidden" name="e_id" value=" <%out.println(e_id); %> ">
		
		Event Name :
		<input class="ip" type="text" placeholder="Enter Event Name" name="e_name">	<br><br>
		
		Event Description :
		<input class="ip" type="text" placeholder="Enter Event Description" name="e_desc">	<br><br>

		Event Date :
		<input class="ip" type="text" placeholder="Enter Event Date" name="e_date">	<br><br>
		
		Event Time :
		<input class="ip" type="text" placeholder="Enter Event Time" name="e_time">	<br><br>
		
		Event Location :
		<input class="ip" type="text" placeholder="Enter Event Location" name="e_loc">	<br><br>
		
		Event Co-ordinator Name :
		<input class="ip" type="text" placeholder="Enter Name" name="e_co_name">	<br><br>
		
		Event Co-ordinator Mobile No. :
		<input class="ip" type="text" placeholder="Enter Mobile Number" name="e_co_mob">	<br><br>
		
		<input class="ip" type="hidden" name="o_id" value=" <%out.println(oid); %> ">
		
		
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







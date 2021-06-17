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
	
	.table_header{
		color:orange;
	}
	
	.links{
		
		color:red;
	}
	
	

</style>


<body background="image_table_data.jpg">


<form action="user_home_page.jsp" method="post">
   	
   	<button class=" button" type="submit"> HOME PAGE</button>
   
   </form>



<%


	HttpSession sessionlogin=request.getSession();
	
	String u_name=sessionlogin.getAttribute("session_username").toString();
	
	
	
	%>
	<h2 style="color : green ;"> User Name : <% out.println(u_name); %></h2>
	
	<% 
	
/*------------------------------------------------------------------------------------------------------*/

	Connection con=ConnectionProvider_database.getCon();

	Statement st=con.createStatement();

	ResultSet rs=st.executeQuery("select u_id from user_table where username='"+u_name+"'");
	
	int uid;
	rs.next();
	
	uid=rs.getInt(1);
	
	
	%>
	<h2 style="color : green ;"> User ID : <% out.println(uid); %></h2>
	
	<form style="text-align: center;"action="user_regi_event_search_by_date.jsp" method="post">
	
		
		<input class="name" type="text" name="event_yyyy_dd_mm" placeholder="yyyy-dd-mm">
		
   	
   		<button  class="back_home" type="submit"> Search</button>
   		
   		
   
   </form>
   
   
   
   
   
   <br>
   
   <form style="text-align: center;"action="user_regi_event_search_by_name.jsp" method="post">
	
		
		<input class="name" type="text" name="event_n" placeholder="Enter the first Character of Event">
		
   	
   		<button  class="back_home" type="submit"> Search</button>
   		
   		
   
   </form>
   
   
   <br>
   <hr><hr>
<br>
<br>


	<% 
		try{
		
		Connection con1=ConnectionProvider_database.getCon();
		
		Statement st1=con1.createStatement();
		
		ResultSet rs1=st1.executeQuery(" select e_id,event_name,event_desc,event_date,event_time,event_location,event_coordinator_name,event_coordinator_mob_no from event_table e natural join user_event_relationship_table  r where u_id='"+uid+"'");
		
		while(rs1.next())
		{
			
	%>
			<h4><label style="font:bold; color:orange"> Event ID      : </label>  <%=rs1.getInt(1)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Name      : </label>  <%=rs1.getString(2)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Description      : </label>  <%=rs1.getString(3)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Date      : </label>  <%=rs1.getString(4)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Time      : </label>  <%=rs1.getString(5)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Location      : </label>  <%=rs1.getString(6)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Co-ordinator Name      : </label>  <%=rs1.getString(7)%></h4>
			
			<h4><label style="font:bold; color:orange"> Event Co-ordinator Mobile No.      : </label>  <%=rs1.getString(8)%></h4><br><br><hr>
			
		
			
			
			
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
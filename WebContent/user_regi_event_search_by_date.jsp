<%@ page import="com.miniproject.dao.ConnectionProvider_database"%>
<%@ page import="java.sql.*" %>

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
    		margin-left:700px;
    	
   		 	
    
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




	<form action="user_registered_event_details.jsp" method="post">
   	
   		<button  class="back_home" type="submit"> Back</button>
   
  	 </form>
  	 
<%


	HttpSession sessionlogin=request.getSession();
	
	String u_name=sessionlogin.getAttribute("session_username").toString();
	
	
	
	%>
	<h2 style="color : green ;"> User Name : <% out.println(u_name); %></h2>
	
	<% 
	
/*------------------------------------------------------------------------------------------------------*/

	Connection con1=ConnectionProvider_database.getCon();

	Statement st1=con1.createStatement();

	ResultSet rs1=st1.executeQuery("select u_id from user_table where username='"+u_name+"'");
	
	int uid;
	rs1.next();
	
	uid=rs1.getInt(1);
	
	
	%>
	<h2 style="color : green ;"> User ID : <% out.println(uid); %></h2>  	

<% 

	String event_date=request.getParameter("event_yyyy_dd_mm");
	

try{
	
	Connection con=ConnectionProvider_database.getCon();
	
	Statement st=con.createStatement();
	
	ResultSet rs=st.executeQuery("select e_id,event_name,event_desc,event_date,event_time,event_location,event_coordinator_name,event_coordinator_mob_no from event_table e natural join user_event_relationship_table  r where u_id='"+uid+"' and event_date='"+event_date+"'" );
	
	while(rs.next())
	{
		
%>
		<hr><hr>
		<br><br>
		<h4><label style="font:bold; color:orange"> Event ID      : </label>  <%=rs.getInt(1)%></h4>
		
		<h4><label style="font:bold; color:orange"> Event Name      : </label>  <%=rs.getString(2)%></h4>
		
		<h4><label style="font:bold; color:orange"> Event Description      : </label>  <%=rs.getString(3)%></h4>
		
		<h4><label style="font:bold; color:orange"> Event Date      : </label>  <%=rs.getString(4)%></h4>
		
		<h4><label style="font:bold; color:orange"> Event Time      : </label>  <%=rs.getString(5)%></h4>
		
		<h4><label style="font:bold; color:orange"> Event Location      : </label>  <%=rs.getString(6)%></h4>
		
		<h4><label style="font:bold; color:orange"> Event Co-ordinator Name      : </label>  <%=rs.getString(7)%></h4>
		
		<h4><label style="font:bold; color:orange"> Event Co-ordinator Mobile No.      : </label>  <%=rs.getString(8)%></h4>
		
		
		
		<hr><hr>
		<br><br>
	
		
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
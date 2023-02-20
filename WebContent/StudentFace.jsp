<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="jdbc.*" %>
<%@ page session="false"%> 
<%@ page import="java.io.*" import="java.sql.*"	import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>  
<%@ page import="javax.servlet.http.HttpServletResponse"%> 
<%@ page import="javax.servlet.http.HttpServletRequest"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" type="image/jpg" href="tab.png"/>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Student Face</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<style>
	body{
		margin: 0;
		padding:0;
		background-size: cover;
		font-family: sans-serif;
		}
	.corners { 
			    background: #FBFDD1;
			    text-align: center;
			    color: #F95757;
			    height: 410px;
			    margin: 5px auto;
			    max-width: 100%;
			    line-height:15px;
			    position: relative;
			    width: 100%;
			    font-family:arial; font-size:24px; font-weight:bold; padding:30px; padding-top:10px;
			    -webkit-box-shadow: 0 1px 7px hsla(0,0%,0%,5);
			       -moz-box-shadow: 0 1px 7px hsla(0,0%,0%,5);
			            box-shadow: 0 1px 7px hsla(0,0%,0%,5);
			}


			.corners:after,
			.corners:before {
			    background: #e6e6e6;
			    content: '';
			    height: 45px;
			    position: absolute;
			    top: -25px;
			    width: 100px;
			    -webkit-box-shadow: 0 5px 10px -7px hsla(0,0%,0%,.5);
			       -moz-box-shadow: 0 5px 10px -7px hsla(0,0%,0%,.5);
			            box-shadow: 0 5px 10px -7px hsla(0,0%,0%,.5);
			}
			.corners:after {
 		         left: -50px;	
			     -webkit-transform: rotate(-45deg);
   	    		 -moz-transform: rotate(-45deg);
        		 -ms-transform: rotate(-45deg);
			   	 -o-transform: rotate(-45deg);
   		         transform: rotate(-45deg);
				}
			.corners:before {
  			  	right: -50px;
   		 		-webkit-transform: rotate(45deg);
   		 		-moz-transform: rotate(45deg);
   			 	-ms-transform: rotate(45deg);
   		      	-o-transform: rotate(45deg);
    	        transform: rotate(45deg);
				}	
		/* Full-width input fields */
	input[type=text], input[type=password] {
    	width: 100%;
    	padding: 15px 20px;
    	margin: 10px 0;
    	display: inline-block;
	    border: 1px solid #fff;
    	box-sizing: border-box;						
		border: none;
		font-size:20px;
		color:black;
		}
	/* Set a style for all buttons */
	button {
    	background-color: #4CAF50;
		color: white;
    	padding: 14px 20px;
    	margin: 8px 0;
    	border: none;
    	cursor: pointer;
    	width: 100%;
    	border-radius:50px;
		}
	button:hover {
		    opacity: 0.8;
    		background: #efed40;
    		color:#262626
		}
	/* Extra styles for the cancel button */
	.cancelbtn {
		    width: auto;
    		padding: 10px 58px;
    		background-color: #f44336;
		}
	/* Center the image and position the close button */
	.imgcontainer {
		    text-align: center;
    		margin: 4px 0 2px 0;
    		position: relative;
		}
	img.avatar {
		    width: 15%;
    		border-radius: 10%;
		}
	.container1 {
		    padding: 5px;
		}
	span.psw {
		    float: right;
    		padding-top: 16px;
		}
	/* The Modal (background) */
	.modal {
		    display: none; /* Hidden by default */
    		position: fixed; /* Stay in place */
    		z-index: 1; /* Sit on top */
    		left: 0;
    		top: 0;
    		width: 100%; /* Full width */
    		height: 100%; /* Full height */
    		overflow: auto; /* Enable scroll if needed */
    		background-color: rgb(0,0,0); /* Fallback color */
    		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    		padding-top: 1px;
		}
	/* Modal Content/Box */
	.modal-content {
		    background-color: #fefefe;
    		margin: 10% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    		border: 10px solid #888;
    		width: 50%; /* Could be more or less, depending on screen size */
		}
	/* The Close Button (x) */
	.close {
		    position: absolute;
    		right: 25px;
    		top: 0;
    		color: #000;
    		font-size: 90;
    		font-weight: bold;
		}
	.close:hover,
		.close:focus {
    		color: red;
    		cursor: pointer;
		}
	/* Add Zoom Animation */
	.animate {
		    -webkit-animation: animatezoom 0.10s;
    		animation: animatezoom 0.5s
		}
	@-webkit-keyframes animatezoom {
		    from {-webkit-transform: scale(0)} 
    		to {-webkit-transform: scale(1)}
		}
	@keyframes animatezoom {
    		from {transform: scale(0)} 
    		to {transform: scale(1)}
		}
	/* Change styles for span and cancel button on extra small screens */
	@media screen and (max-width: 300px) {
		    span.psw {
       		display: block;
       		float: none;
    	}
    .cancelbtn {
      	 width: 100%;
    	}
    
    .aa{
			width:1140px;		
			height:250;
			background-color: rgba(0,0,0,0.1);
			margin:0 auto;		
			margin-top:-30px;
			padding:10px 40px;
			color:white;
			font-weight:bolder;		
			font-size: 18px;
			box-shadow: insert -4px -4px rgba(5.0,0.5,0.5,0.5);
		}
	
</style>
</head>

<body>
	<script language="javascript">
		function fncSubmit()
		{
			if(document.ChangePasswordForm.OldPassword.value == "")	{
				alert('Please input old password');
				document.ChangePasswordForm.OldPassword.focus();
				return false;	
			} 
		
			if(document.ChangePasswordForm.newpassword.value == "")	{
				alert('Please input Password');
				document.ChangePasswordForm.newpassword.focus(); 
				return false;
			}
			
			if(document.ChangePasswordForm.conpassword.value == "")	{
				alert('Please input Confirm Password');
				document.ChangePasswordForm.conpassword.focus(); 
				return false;
			} 
			
			if(document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value)	{
				alert('Confirm Password Not Match');
				document.ChangePasswordForm.conpassword.focus(); 
				return false;
			} 
			
			document.ChangePasswordForm.submit();
		}
	</script>
		   
	 <%	//Prevant Back Button.
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //For HTTp 1.1
		response.setHeader("Pragma","no-cache");	//For HTTP 1.0.
		response.setHeader("Expires","0");	//For Proxy Server's.
	
		//Make Session Validation.
		HttpSession session=request.getSession();
		if(session.getAttribute("username")==null)
		{
			response.sendRedirect("Login.jsp");
		}
	
		//Java Standard Tag Library 
		Connection con=null;
		ResultSet rst=null;
		String email1=(String)session.getAttribute("username");
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			  
			//step2 create  the connection object  
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system"); 
			
			PreparedStatement s2=con.prepareStatement("select count(*) from student where email=? AND status=?");
			s2.setString(1,email1);
			s2.setInt(2,1);
			   	
			rst=s2.executeQuery();
			rst.next();
			
	if(Integer.parseInt( rst.getString(1))  >0)
	{
			PreparedStatement s=con.prepareStatement("select * from student where email=?");
		    s.setString(1,session.getAttribute("username").toString());
			rst=s.executeQuery();
			rst.next();
		 %>
		   
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">
	<div class="aa">
		
	<div class="row">		
			
		<div class="col-sm-3">	<h4>	Welcome	Mr./Mrs.	<%=rst.getString("name").toUpperCase()%>	</h4>	</div>		
		<div class="col-sm-5">				</div>
			
		<div class="col-sm-2">
				<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Update Password</button>		
				
				<div id="id01" class="modal">
  					<form class="modal-content animate"	 method="post" action="ChangePass.jsp" onsubmit="return fncSubmit();">
		    		
		    		<div class="imgcontainer">	
	      				<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    	  				<img src="user.png" alt="Avatar" class="avatar">
    				</div>
    				
    				<div class="container1">
      					<input type="password" placeholder="Old Password" name="OldPassword"	id="OLDpwd" required>
      					<input type="password" placeholder="New Password" name="newpassword"	id="newpassword" required>
      					<input type="password" placeholder="Confirm Password" name="conpassword"	id="conpassword" required>
      					<div class="row">	<div class="col-sm-12">	<button type="submit">Update Password</button>	</div>	</div>
      				</div>
			    	
			    	</form>
				</div>
		</div>
		
		<div class="col-sm-2">	<jsp:include page="Logout.jsp"/>	</div>
	   
	</div>
	 
	 <% String o=  rst.getString("branch");
	    String sem=rst.getString("branch");
	   
	   %>
	
	<div class="row">
		
		<div class="col-sm-2">	
		<% 
		try
			{
			Connection con101=null;
			Class.forName("oracle.jdbc.driver.OracleDriver");  
				  
			//step2 create  the connection object  
			con101=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system"); 
			PreparedStatement s1=con.prepareStatement("select * from student where email=?");
			
			s1.setString(1,email1);
			ResultSet rstfig=s1.executeQuery();
				
			Boolean status=rstfig.next();				
				
			if((rstfig.getString("path"))!=null)
				{
					String file=" ";
				    File f= new File(rstfig.getString("path"));
				         file=f.getName();
	     
				        if(!file.equals(" "))
				        {
				        out.println("<tr>"); 
				        out.println("<td style='margin-top:5px;width:100%;'>");
				        out.println("<image  src='SImage/"+file+"'  height='100%' width='100%'>");
				        out.println("</td>"); 
				        out.println("</tr>");
				        }
				}
			}
		finally	{
				
			}
		%>
		
			<div class="row">	<br><br>	</div>
			<div class="row">
				<form action="strecord.jsp" method="post" >
				<%	
					String email=rst.getString("email");
					HttpSession session1=request.getSession();
					session1.setAttribute("username1", email);
				%>
				<div class="col-sm-12" >	<button class="btn btn-default dropdown-toggle">Record</button>	</div>
				
				</form>
			</div>
		
		</div>

		
		<br><br><br>
		<div class="col-sm-6" >
			<br><br>
			<div class="table-responsive" style="border-radius:20px;">	
        	<table border="1" cellpadding="5" class="table table-sm auto" style="border-radius:10px;">
            <tr>
                <th style="background-color: yellowgreen">Subject1</th>
                <th style="background-color: yellowgreen">Subject2</th>
                <th style="background-color: yellowgreen">Subject3</th>
                <th style="background-color: yellowgreen">Subject4</th>
                <th style="background-color: yellowgreen">Subject5</th>
                </tr>	
		<%	
			Connection con20=null;
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con20=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
				
			    PreparedStatement s20=con20.prepareStatement("select * from subject where sem=?");
			    s20.setString(1,o);
			    ResultSet rst2=s20.executeQuery();
			   // System.out.println("value or result set="+rst2.next()); 
				while(rst2.next())
				{
					
					
		%>	
				<tr>
				<td><%=rst2.getString("sub1") %></td>
				<td><%=rst2.getString("sub2") %></td>
				<td><%=rst2.getString("sub3") %></td>
				<td><%=rst2.getString("sub4") %></td>
				<td><%=rst2.getString("sub5") %></td>
				</tr>	<tr>
		
		
			<tr>
        		<th style="background-color: yellowgreen">Subject6</th>
        		<th style="background-color: yellowgreen">Subject7</th>
        		<th style="background-color: yellowgreen">Subject8</th>
        		<th style="background-color: yellowgreen">Subject9</th>
        		<th style="background-color: yellowgreen">Subject10</th>
    		</tr>
				
			<tr>
				<td><%=rst2.getString("sub6") %></td>
				<td><%=rst2.getString("sub7") %></td>
				<td><%=rst2.getString("sub8") %></td>
				<td><%=rst2.getString("sub9") %></td>
				<td><%=rst2.getString("sub10") %></td>
				
			</tr>
				
		<%
				}
			} 
			catch(Exception e)
			{
		    	System.out.println("Here Is The Problem	:"+e);
			}
			
		 %>
			</table>	
			</div>
							
	
		</div>
		
	<%
		Connection con2=null;
		PreparedStatement s1=null;
		ResultSet rst1=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");  
		  	
			//step2 create  the connection object  
			con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
	     	s1=con2.prepareStatement("select * from activity where sem=?");
	     	s1.setString(1,sem);
			rst1=s1.executeQuery();
	%>
		
		<div class="col-sm-4">
				<div class="corners">**Recent Activity**<br><br>
		
	
	<% 
			while(rst1.next())
			{
			
	%>
		
			<marquee style="height:350px;"onmouseover="this.stop()" onmouseout="this.start()"
				scrollamount="4"direction = "up"behavior="slide"truespeed="100"alt="Natural"scrollamount="10">
			
			<a href="RecentNotice.jsp?name=<%=rst1.getString("subject") %>">
		
			<font color="red"size="3px;">	<label style="width:100px;" class="blink">	<%=rst1.getString("subject")%>	</label>	</font>	
		
			</a>
		
	<%	}	%>
		
			</marquee>
	<%
		
		}finally
		{
			try
			{
				if(s1!=null)s1.close();
			}catch(Exception e){}
				try
			{
				if(rst1!=null)rst1.close();
			}catch(Exception e){}
		}
	%>
			</div>
		</div>
		
		
	</div>
	
	<div>
	<%	}
	else		
	{		%>
				<script type="text/javascript">
					alert("You are not Verified");
					return true;
					<%	//response.sendRedirect("Login.jsp");	
					getServletContext().getRequestDispatcher("/Login.jsp").include(request, response);
					%>
				</script>
	<%
	}
			
		}
		finally 
		{	
			try {
				
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		}
	%>	
		
		
			 
	</div>	
	<script>
		// Get the modal
		var modal = document.getElementById('id01');
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
    	if (event.target == modal) {
	        modal.style.display = "none";
    		}
		}
	</script>
	</div>
	</div>	<br>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>
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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>FacultyFace</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<style>
		body{
				font-family: Arial, Helvetica, sans-serif;
				margin: 0;
				padding:0;
				background-size: cover;
			}
			.aa{
				height:250;
				background-color: rgba(0,0,0,0.1);
				margin:0 auto;		
				margin-top:-30px;
				padding:50px 90px;
				color:black;
						
				font-size: 18px;
				box-shadow: insert -4px -4px rgba(0.5,0.5,0.5,0.5);
				}
			
			.dropdown-submenu {
 			   position: relative;
			}
			.dropdown-submenu .dropdown-menu {
    			top: 0;
    			left: 100%;
    			margin-top: -1px;
   			}
   			.corners { 
			    background: #FBFDD1;
			    text-align: center;
			    color: #F95757;
			    height: 350px;
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
   			
			
	</style>
	<script type="text/javascript">
		function validLogin(){
				if (document.form.email.value == ""){
				alert ( "Please enter Login Name." );
				document.loginform.userName.focus();
				return false;
			}
			if (document.form.pass.value == ""){
				alert ( "Please enter password." );
				document.userform.password.focus();
				return false;
			}
			alert ( "Login Successfully" );
			return true;
		}
		function imageIn()
		{
			var a=document.getElementById('photo').value;
			document.getElementById('photoname').value=a;
		}
		
		$(document).ready(function(){
  		$('.dropdown-submenu a.test').on("click", function(e){
    		$(this).next('ul').toggle();
    		e.stopPropagation();
    		e.preventDefault();
  			});
		});
	</script>
</head>
<body>
	<%	//Prevant Back Button.
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //For HTTp 1.1
		response.setHeader("Pragma","no-cache");	//For HTTP 1.0.
		
		response.setHeader("Expires","0");	//For Proxy Server's.
	
		//	Make Session Validation.
		HttpSession session=request.getSession();
		if(session.getAttribute("username")==null)
		{	
			response.sendRedirect("Home.jsp");
		}	
	//Java Standard Tag Library 
		
		try
		{
			Connection con= GetCon.getCon();
		    PreparedStatement s=con.prepareStatement("select * from faculty11 where email=?");
		   	s.setString(1,session.getAttribute("username").toString());
			ResultSet rst=s.executeQuery();
			
			rst.next();	
		
	%>
	
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">	
	<div class="aa">
		Welcome Mr./Mrs. <%=rst.getString("name").toUpperCase() %>
		
	<% String o=  rst.getString("email");
	    System.out.println(o); 
	%>
	<div class="row">					
	<form action="FUpload" method="post" enctype="multipart/form-data">
		
	<div class="col-sm-2">	<br><br>
		<div class="row-sm-12">		
			
				<select name="head" style="background-color:white;" class="btn btn-default dropdown-toggle" >
				
				<option>--Select--</option>		
			 	<option value = "atten">Attendance</option>
	        	<option value = "ct">CT Marks</option>
        		<option value = "assinment">Assignment</option>
        		<option value = "notice">	<a href="GeneralNotice.jsp">	Notice	</a>	</option>
        		
        		</select>							
		</div>	<br>	<br>
		
		<div class="row-sm-12">	
			
			<select name="sem" id = " " style="background-color:white;" class="btn btn-default dropdown-toggle" >
			
			<option>Class</option>
        	<option value = "sem1">MCA 1 SEM</option>
	        <option value = "sem2">MCA 2 SEM</option>
        	<option value = "sem3">MCA 3 SEM</option>
        	<option value = "sem4">MCA 4 SEM</option>
        	<option value = "sem5">MCA 5 SEM</option>
        	<option value = "sem6">MCA 6 SEM</option>
        	
        	</select> 
		</div>
				
		<div class="row-sm-6">
			<br><br>
			<input type="text" name="sub"placeholder="Subject">
		</div>		
		
		<br><br>
			
		<div class="row-sm-12">
				<input type="file" name="photo"  id="photo" onchange="imageIn()"><br/>
				<input  type="hidden" name="photoname"  id="photoname" value="value">
				<input type="submit" value="submit">
		</div> 
			
	</div>
	</form>
	
	<div class="col-sm-6"><br><br>	
		<div class="col-sm-4"></div>
		<div class="col-sm-4"><a href="AllStudent.jsp">	<button class="btn btn-default dropdown-toggle">Show Student</button>	</a>	</div> 
		
		<br><br>
		<div class="table-responsive" style="border-radius:20px;">	
        	<table border="1" cellpadding="5" class="table table-sm auto" style="border-radius:10px;">
            <tr>
                <th style="background-color: yellowgreen">Subject1</th>
                <th style="background-color: yellowgreen">Time</th>
                <th style="background-color: yellowgreen">Subject2</th>
                <th style="background-color: yellowgreen">Time</th>
            </tr>
		<%	
			Connection con20=null;
			try
			{
				System.out.println(o);
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con20=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
				
			    PreparedStatement s20=con20.prepareStatement("select * from faculty11 where email=?");
			    s20.setString(1,o);
			    ResultSet rst2=s20.executeQuery();
			   // System.out.println("value or result set="+rst2.next()); 
				while(rst2.next())
				{
					
					
		%>	
				<tr>
				<td><%=rst2.getString("sub1") %></td>
				<td><%=rst2.getString("time1") %></td>
				<td><%=rst2.getString("sub2") %></td>
				<td><%=rst2.getString("time2") %></td>
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
	
		
	<div class="col-sm-4"> 
		<div class="row">	
			<div class="col-sm-3">	</div>	
			<div class="col-sm-7">	<jsp:include page="Logout.jsp"/>	</div>
			<div class="col-sm-1">	</div>
		</div>		
	<%	
		Connection con2=null;
		
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		  
		//step2 create  the connection object  
		con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
	    s=con2.prepareStatement("select * from notice where status='1'");
		rst=s.executeQuery();		
	%>	
			<div class="corners">From HOD Desk
				
	<% 
		while(rst.next())
		{
			
	%>
		<br><br>
		<marquee style="height:310px;"onmouseover="this.stop()" onmouseout="this.start()"scrollamount="4"direction = "up"behavior="slide"scrollamount="10">
		<a href="downlod11.jsp?name=<%=rst.getString("subject") %>">
		
		<font color="red"size="3px;">	<label style="width:100px;" class="blink">	<%=rst.getString("subject")%>	</label>	</font>	
		
		</a>
		
		<%	}	%>
		
		</marquee>
		
		<%System.out.println("hey"); %>
		
		<%
		
	}finally
	{
		try
		{
			if(s!=null)s.close();
		}catch(Exception e){}
		try
		{
			if(rst!=null)rst.close();
		}catch(Exception e){}
	}
		%>
	
				
			</div>
	</div>
		
	</div>	<br>				
				
	<%	
			} 
		catch(Exception e){
		    	System.out.println("Here Is The Problem	:"+e);
			}	
	%>
	</div>			
	</div>	<br>
	</div>	
	<jsp:include page="footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" type="image/jpg" href="tab.png"/>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>..Home Page</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<script  type="text/js" src="bootstrap-3.3.7-dist/js/bootstrap.min.js">	</script>
	<script  type="text/js" src="bootstrap-3.3.7-dist/js/jquery.min.js">	</script>
	
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
					
			.aa{
				width:1130px;		
				height:250;
				background-color: rgba(0,0,0,0.1);
				margin:0 auto;		
				margin-top:-30px;
				margin-bottom:10px;
				padding:50px 90px;
				color:white;
				font-weight:bolder;		
				font-size: 18px;
				box-shadow: insert -4px -4px rgba(0.5,0.5,0.5,0.5);
				}
			
			.button {
			    background-color: #1f618d; 
			    border-radius: 50%;
			    color: white;
			    text-align: center;
			    text-decoration: none;
			    display: inline-block;
			    font-size: 26px;
			    margin: 4px 8px;
			    cursor: pointer;
			    padding: 32px 16px;
				}
			.aa button:hover{
				background: #efed40;
				color:#262626;
				}
	</style>
	
</head>
<body>

<%@ page import="java.io.*" import="java.sql.*"	import="javax.servlet.http.HttpServlet"%>
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">	
	<div class="aa">
	
	<div class="row">	
	<div class="col-md-8"><br><br><br>
		<div class="row">
			<div class="col-md-6">
				<a href="StudentForm.jsp">	<button class="button button">Student Login</button></a> </div>
			<div class="col-md-6">
				<a href="FacultyLogin.jsp"><button class="button button">Faculty Login</button></a></div>
		</div>
		
		<div class="row">
			<div class="col-md-3">		</div>
			<div class="col-md-4">
				<a href="HodLogin.jsp">	<button class="button button">HOD Login</button></a></div></div>
			<div class="col-md-4">		</div>		
		</div>
	<%
	Connection con2=null;
	PreparedStatement s=null;
	ResultSet rst=null;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		  
		//step2 create  the connection object  
		con2=DriverManager.getConnection(  
		"jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
	     s=con2.prepareStatement("select * from notice where status='0'");
		rst=s.executeQuery();
		
		
	%>
	<div class="col-md-4">		
		<div class="corners">From HOD Desk<br><br>
		
		<% 
		while(rst.next())
		{
			
		%>
		
		<marquee style="height:350px;"onmouseover="this.stop()" onmouseout="this.start()"
			scrollamount="4"direction = "up"behavior="slide"truespeed="100"alt="Natural"scrollamount="10">
		
		<a href="download.jsp?name=<%=rst.getString("subject") %>">
		
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
	
	</div>
	
			
			
	
	
	</div>
	
	</div>
	
		
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
      					<li data-target="#myCarousel" data-slide-to="0" ></li>
      					<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
      					<li data-target="#myCarousel" data-slide-to="2"></li>
      					<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
			<div class="carousel-inner" role="listbox">
      			<div class="item ">
	        			<img src="resources/1.jpg" style="width:1150px;height:500px" alt="img 1" >
		      		</div>

	      			<div class="item active">
        				<img src="resources/2.jpg" style="width:1150px;height:500px" alt="img 2" >
	   				</div>
	    
    		  		<div class="item">
        				<img src="resources/3.jpg" style="width:1150px;height:500px" alt="img 3" >
      				</div>
      		
      				<div class="item">
        				<img src="resources/4.jpg" style="width:1150px;height:500px" alt="img 4" >
      			    </div>

			</div>
		</div>
	</div><br>
		</div>	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>
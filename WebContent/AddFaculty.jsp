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
	<title>Add Faculty</title>
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
			    height: 350px;
			    margin: 5px auto;
			    max-width: 400px;
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
				padding:50px 90px;
				color:white;
				font-weight:bolder;		
				font-size: 18px;
				box-shadow: insert -4px -4px rgba(0.5,0.5,0.5,0.5);
				}
			
			.button {
			    width:75%;
			height:35px;
			border:none;
			color:black;
			border-radius:40%;
			-webkit-border-radious:50px;
			-o-border-radious:60px;
			-moz-border-radious:90px;
			background-color: #DBF966;
			font-size: 20px;
			cursor: pointer;
				}
			.aa button:hover{
				background: #F7DC6C;
				color:#262626;
				}
			.aa input[type="text"]{
			width:100%;
			height:50px;
			border:0;
			color: #fff;	
			font-size:16px;
			border-bottom:1px solid #fff;
			background: transparent;
			outline:0;
			-webkit-border-radious:5px;
			-o-border-radious:5px;
			-moz-border-radious:5px;	
			padding-left:5px;	
			}
			.aa input[type="password"]{
			width:100%;
			height:50px;
			border:none;
			border-bottom:1px solid #fff;
			color: #fff;
			font-size:16px;
			background: transparent;
			outline:none;
			-webkit-border-radious:5px;
			-o-border-radious:5px;
			-moz-border-radious:5px;	
			padding-left:5px;	
			}
		.aa input[type="varchar"]{
			width:100%;
			height:50px;
			border:none;
			border-bottom:1px solid #fff;
			color: #fff;
			font-size:16px;
			background: transparent;
			outline:none;
			-webkit-border-radious:5px;
			-o-border-radious:5px;
			-moz-border-radious:5px;	
			padding-left:5px;	
			}
			.aa button:hover{
				background: #F7DC6C;
				color:#262626;
			}
			.aa input[type="submit"]{
			width:100%;
			height:40px;
			border:none;
			color:#fff;
			border-radius:40px;
			-webkit-border-radious:50px;
			-o-border-radious:60px;
			--moz-border-radious:90px;
			background-color: #F9BA5F;
			font-size: 25px;
			cursor: pointer;
			}
		.aa input[type="tel"]{
			width:100%;
			height:50px;
			border:none;
			border-bottom:1px solid #fff;
			color: #fff;
			font-size:16px;
			background: transparent;
			outline:none;
			-webkit-border-radious:5px;
			-o-border-radious:5px;
			-moz-border-radious:5px;	
			padding-left:5px;
			}
		.aa input[type="submit"]:hover{
			background: #efed40;
			
			}
		h1{
			color:#efed40;
			text-align: center;	
			}
	</style>
</head>
<body>
	<%	//Prevant Back Button.
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //For HTTp 1.1
		response.setHeader("Pragma","no-cache");	//For HTTP 1.0.
		response.setHeader("Expires","0");	//For Proxy Server's.
	
		String happen=request.getParameter("id");
		System.out.println(happen);
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
		    PreparedStatement s=con.prepareStatement("select * from faculty where email=?");
		   	s.setString(1,session.getAttribute("username").toString());
			ResultSet rst=s.executeQuery();
			rst.next();	
	%>
	
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">	
	<div class="aa">
	
		<div class="row">		
				<div class="col-sm-3">	Welcome Mr. <%=rst.getString("name").toUpperCase() %>	</div>
				<div class="col-sm-1">	</div>
				<div class="col-sm-5"><center><h2>Add Faculty Detail's</h2></center>	</div>
				<div class="col-sm-1">	</div>
				<div class="col-sm-2">	<jsp:include page="Logout.jsp"/>	</div>
			</div>			<br><br>
		
		<form action="FRegistration" method="post" class="form-horizontal">
		<h4>
			
			<div class="row">	
				<div class="col-sm-5">	Name<input type="text" name="name"	required="required"	>	</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-5">	Id<input type="text" name="id"	required="required">	</div>	
			</div>		<br><br>
			
			<div class="row">	
				<div class="col-sm-5">	password<input type="text" name="password"	required="required"	>	</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-5">	mobile no<input type="text" name="mob"	required="required">	</div>	
			</div>		<br><br>
			
			<input type="submit" value="Submit">
		</h4>
		</form>
		
		
	
	<%	
	
		}
		
		catch(Exception e){
	    	System.out.println("Here Is The Problem	:"+e);
		}
	if(!(happen.equals("1")))
	{
	String s=request.getAttribute("print").toString();
	out.print("<h3 style='color:green;text-align:center'>"+s+"</h3>");
	}
			
		
	%>
	</div>
	</div><br>
	</div>
		<jsp:include page="footer.jsp"/>
</body>
</html>
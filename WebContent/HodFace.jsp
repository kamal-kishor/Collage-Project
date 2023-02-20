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
	<title>HodFace</title>
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
			curser: pointer;
				}
			.aa button:hover{
				background: #F7DC6C;
				color:#262626;
				}
			
		
	</style>
	
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
		Connection con2=null;
		try
		{
					
			
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			  
			//step2 create  the connection object  
			con2=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
		    PreparedStatement s=con2.prepareStatement("select * from faculty where email=?");
		   	s.setString(1,session.getAttribute("username").toString());
			ResultSet rst=s.executeQuery();
			
			rst.next();		
	%>
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">
		<div class="aa">
			<div class="row">		
				<div class="col-sm-3">Welcome Mr./Mrs. <%=rst.getString("name").toUpperCase() %></div>
				<div class="col-sm-5"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2">	<jsp:include page="Logout.jsp"/>	</div>
			</div>			
		
		<div class="jumbotron" style="background-color:#641E16;">
			<h3 align="center"> Faculty</h3>
			<div class="row"><br>
				<div class="col-sm-4">	<a href="AddFaculty.jsp?id=1">	<button class="button button">Add Faculty</button>	</a>	</div>
				
				<div class="col-sm-6"><a href="AllFaculty.jsp">	<button class="button button">Show Faculty Members</button>	</a></div>
				
				<div class="col-sm-2"></div>
			</div>			<br><br>
		</div>
		
		<div class="jumbotron" style="background-color:#641E16;">
			<h3 align="center"> Notice</h3>
			<div class="row"><br>
			
				<div class="col-sm-4">	<a href="GeneralNotice.jsp">	<button class="button button">General Notice</button>	</a>	</div>
				
				<div class="col-sm-6"><a href="FacultyNotice.jsp">	<button class="button button">Faculty Notice	</button>	</a></div>
				
				<div class="col-sm-2"></div>
			</div>	<br><br>	
		</div>
		
		<div class="jumbotron" style="background-color:#641E16;">
			<h3 align="center">Student</h3>
			<div class="row"><br>
			
				<div class="col-sm-4">		</div>
				
				<div class="col-sm-6"><a href="AllStudent.jsp">	<button class="button button">Show Student</button>	</a>	</div>
				
				<div class="col-sm-2"></div>
			</div>	<br><br>	
		</div>	
			
	<%	
			} 
		catch(Exception e){
		    	System.out.println("Here Is The Problem	:"+e);
			}
		finally 
		{	
			try {
				con2.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		}
	%>
		
		
		</div>
	</div><br>
	</div>
	<jsp:include page="footer.jsp"/>
		   
</body>
</html>
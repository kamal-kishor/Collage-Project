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
	<title>All Faculty</title>
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
			a2{
			position: relative;
			font-size:35px; 
			color:#F56959;
			text-align: center;	
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
				color:black;
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
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">
	<div class="aa">
	
	<center><a2>Faculty's</a2></center><br> 
	
	<form name="myform"action="SubAllocate.jsp">
	
	
	
	<div class="table-responsive" style="border-radius:15px;">
	<table border="1" cellpadding="1"	class="table table-sm auto" style="border-radius:0px;">
            <tr>
                <th style="background-color: yellowgreen">Name</th>
                <th style="background-color: yellowgreen">Subject1</th>
                <th style="background-color: yellowgreen">Time1</th>
                <th style="background-color: yellowgreen">Subject2</th>
                <th style="background-color: yellowgreen">Time2</th>
                <th style="background-color: yellowgreen">Allocate</th>
            </tr>
	<%
	Connection con=null;
	ResultSet rst1=null;
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");
	try{
		PreparedStatement s2=con.prepareStatement("select * from faculty11");
		rst1=s2.executeQuery();
		
		while (rst1.next()) 
		 {	 
	 %>	
	
	 		<tr>
				<td><%=rst1.getString("name") %></td>			
				<td><input type="text"	name="sub1"	 placeholder="TCA511" maxlength="7"></td>
				<td><input type="text"	name="time1" placeholder="9AM" maxlength="8"></td>
				<td><input type="text"	name="sub2"	 placeholder="TCA511" maxlength="7"></td>
				<td><input type="text"	name="time2" placeholder="9AM" maxlength="8"></td>
				<td><button  type="submit" class="button-success">Allocate</button></td>
				<td><input  type="hidden" name="email" value=<%=rst1.getString("email")%>></td>
				
				
			</tr>
			<%
				}
			%>	
	 </table>
	 </div>
	 </form>
	 <% 
	 }
	
	finally	{
		try{
			if(rst1!=null)rst1.close();
		}
		finally{}
	}	  	
	
	
	%>
	</div>
	</div><br>
	</div>
	<jsp:include page="footer.jsp"/>
	 
	 
</body>
</html>
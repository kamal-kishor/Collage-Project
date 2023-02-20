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
	<title>Academic Record</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<style>
		body{
			margin: 0;
			padding:0;
			background-size: cover;
			font-family: sans-serif;
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
			font-size: 20px;
			box-shadow: insert -4px -4px rgba(5.0,0.5,0.5,0.5);
			
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
		.aa input[type="submit"]{
			width:100%;
			height:70px;
			border:none;
			color:#fff;
			border-radius:40px;
			-webkit-border-radious:50px;
			-o-border-radious:5px;
			-moz-border-radious:5px;
			background-color: #F9BA5F;
			font-size: 46px;
			curser: pointer;
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
	
	<script type="text/javascript">
	function validLogin(){
			alert ( "Data Save Successfully" );
			return true;
		}
	</script>
</head>
<body>
	<%	
		Connection con=null;
		ResultSet rst=null;
		HttpSession session1=request.getSession();
		String email1=(String)session1.getAttribute("username1");
		try 
        {
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			  
			//step2 create  the connection object  
			con=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","system1","system"); 
			// constructs SQL statement
			PreparedStatement statement = con.prepareStatement("insert into record where email=?");
			statement.setString(1,email1);  
			    
		%>
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">
	<div class="aa">
	
		<form  action="recordprocess.jsp" method="post" class="form-horizontal"	onsubmit="return validLogin();">
		
		<div class="jumbotron" style="background-color:#641E16;">	
			<h3 align="center"> 10th Detail's</h3>
			<div class="row">
			<div class="col-sm-6">Board<input type="text"	name="tenboard"	required="required" maxlength="50">	</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">	Percentage<input type="text"	name="tenper"	required="required" maxlength="10">	</div>			
			</div>	<br>
		</div>
		
		<div class="jumbotron" style="background-color:#641E16;">
			<h3 align="center"> 12th Detail's</h3>
			<div class="row">
			<div class="col-sm-6">Board<input type="text"	name="twboard"	required="required" maxlength="50">	</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">	Percentage<input type="text"	name="twper"	required="required" maxlength="10">	</div>			
			</div>	<br>
		</div>
		
		<div class="jumbotron" style="background-color:#641E16;">
			<h3 align="center">Graduation Detail's</h3>
			<div class="row">
			<div class="col-sm-6">UG Course<input type="text"	name="grad"	required="required"	maxlength="50">	</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">Percentage<input type="text"	name="uniper"	required="required"	maxlength="10">	</div>
			</div>	<br>
			<div class="row">
			<div class="col-sm-3">	</div>
			<div class="col-sm-6">University / Institute<input type="text"	name="uni"	required="required" maxlength="50">	</div>
			<div class="col-sm-3">	</div>
			</div>	<br>
		</div>
		<input type="submit" value="Submit">
		</form>
	</div><br>
	
	
	</div>
	</div>
	<jsp:include page="footer.jsp"/>
		
	<%	}
		finally{
			try {
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
		<style type="text/css">
			input[type="submit"]{
			width:75%;
			height:35px;
			border:none;
			color:#fff;
			border-radius:50px;
			-webkit-border-radious:50px;
			-o-border-radious:60px;
			-moz-border-radious:90px;
			background-color: #F9BA5F;
			font-size: 20px;
			curser: pointer;
			}
			
			input[type="submit"]:hover{
			background: #efed40;	
			color:#262626;
			}
		</style>
</head>
<body>
	<%
		if(session.getAttribute("username")==null)
		{
			response.sendRedirect("Login.jsp");
		}
	//Java Standard Tag Library 
	%>
	
	<script type="text/javascript">
		
		function validLogin(){
			alert ( "Logout Successfully" );
			return true;
		}
	</script>
		
	<form action="Logout"	onsubmit="return validLogin();">
		<input type="submit" value="logout">
		
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Faculty Login</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<style >
	body{
		margin: 0;
		padding:0;
		background-size: cover;
		font-family: sans-serif;
	}
	.aa{
		width:550px;		
		height:100;
		background-color: rgba(0,0,0,0.1);
		margin:0 auto;		
		margin-top:-26px;
		padding-top:2px;		
		padding-left:10px;
		padding:10px 40px;
		-webkit-border-radious:55px;		
		-o-border-radious:15px;		
		-moz-border-radious:15px;
		color:white;
		font-weight:bolder;		
		font-size: 25px;
		box-shadow: insert -4px -4px rgba(0,0,0,5);
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
	.aa input[type="submit"]{
		width:100%;
		height:40px;
		border:none;
		color:#fff;
		border-radius:20px;
		-webkit-border-radious:10px;
		-o-border-radious:10px;
		-moz-border-radious:10px;
		background-color: #F9BA5F;
		font-size: 25px;
		curser: pointer;
		}
	.aa input[type="submit"]:hover{
		background: #efed40;
		color:#262626;
	}
	.user{
		width:100px;
		height:100px;
		border-radius:50%;
		overflow:hidden;
		top: calc(75px/2);
		position: relative;
		margin: 24px 0 12px 0
		left: calc(50% - 50px);
		}
	h2{
		margin:0;
		padding:10 10 20px;
		color:#efed40;
		text-align: center;
	}
	::placeholder{
		color: rgba(255,255,255,50);
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
		
	</script>
	
</head>
<body>
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<center>
	<img src="user.png" class="user">
			
	<div class="aa">	
	<br><h2>Login Here</h2>
	
		<form action="FacultyLoginCheck1" class="form-horizontal"	onsubmit="return validLogin();">
			<input type="text" name="email" REQUIRED><br><br>
			<input type="password" name="pass" REQUIRED ><br><br/>
			<input type="submit" value="Login"name="Login"/><br><br>
			<h4><a href="#">Forget Password</a>&nbsp;&nbsp;&emsp;&emsp;&emsp;
			<a href="#">Change Password</a></h4>
		</form>
	
	</div></center>	<br>
	</div>
	<jsp:include page="footer.jsp"/>
	
	
</body>
</html>
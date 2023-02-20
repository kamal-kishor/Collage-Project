<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" type="image/jpg" href="tab.png"/>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Student Form</title>
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
			    font-size: 24px;
			   padding: 22px 56px;
			    cursor: pointer;
			    
				}	
			.aa button:hover{
				background: #efed40;
				color:#262626;	opacity: 0.8;
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
		}</script>
</head>
<body>

	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	
	<div class="container">	
	<div class="aa">
	<br>
	<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-4">	<a href="Login.jsp">		<button class="button">	Sign in</button>	</a>	</div>
	<div class="col-sm-1">	</div>
	<div class="col-sm-4">	<a href="Registration.jsp">	<button class="button">Sign Up	</button>	</a>	</div>
	<div class="col-sm-1">	</div>
	</div><br><br>	
	
	</div></div></div>
	
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
	<jsp:include page="footer.jsp"/>
</body>
</html>
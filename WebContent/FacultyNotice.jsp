<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" type="image/jpg" href="tab.png"/>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Faculty Notice</title>
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
			.aa input[type="text"]{
			width:100%;
			height:50px;
			border:5;
			color: #fff;	
			font-size:16px;
			border-bottom:1px solid #fff;
			background: transparent;
			outline:10;
			-webkit-border-radious:5px;
			-o-border-radious:5px;
			-moz-border-radious:5px;	
			padding-left:5px;	
			}
			.aa input[type="submit"]{
			width:85%;
			height:40px;
			border:none;
			color:#fff;
			border-radius:40px;
			-webkit-border-radious:50px;
			-o-border-radious:5px;
			-moz-border-radious:5px;
			background-color: #F9BA5F;
			font-size: 26px;
			curser: pointer;
			}
			.aa input[type="submit"]:hover{
			background: #efed40;
			
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
	</script>	
</head>
<body>
	<%	//Prevant Back Button.
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //For HTTp 1.1
		response.setHeader("Pragma","no-cache");	//For HTTP 1.0.
		response.setHeader("Expires","0");	//For Proxy Server's.
	%>
	
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">
		<div class="aa">
		
		<div class="table-responsive" style="border-radius:20px;">
        <form action="Fnotice" method="post" enctype="multipart/form-data">
        <table border="1" cellpadding="5" 
        class="table table-sm auto" style="border-radius:10px;">
            
            <tr>
                <th style="background-color: orange"></th>
                <th style="background-color: orange">Subject</th>
                <th style="background-color: orange">File</th>
                <th style="background-color: orange">Submit</th>
                <th style="background-color: orange"></th>
            </tr>
            
            <tr>
            	<th>	</th>
            	
				<th><input  type="text" name="subject"></th>
					
				<th>	<input type="file" name="photo"  id="photo" onchange="imageIn()"><br>
						<input  type="hidden" name="photoname"  id="photoname" value="value">
				</th>		
					
				<th>	<input type="submit" value="submit">	</th>	
					
				<th>	</th>
            </tr>
		</table>
		</form>
		</div>
		
		</div>
		
	</div><br>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
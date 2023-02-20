<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration</title>
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
			/*	if (document.form.userName.value == ""){
				alert ( "Please enter Login Name." );
				document.loginform.userName.focus();
				return false;
			}
			if (document.form.password.value == ""){
				alert ( "Please enter password." );
				document.userform.password.focus();
				return false;
			}*/
			alert ( "Successfully Registered" );
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
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">	
	<div class="aa">
	
		<h1>Registration Form</h1><br>
		<form action="Registration" method="post" class="form-horizontal"	enctype="multipart/form-data" onsubmit="return validLogin();">
	
		<h4>
	
		<div class="row">	
			<div class="col-sm-5">	Name<input type="text" name="name"	required="required" maxlength="20">	</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">	Father Name<input type="text" name="fname"	required="required" maxlength="20">	</div>	
		</div><br><br>
	
		<div class="row">
			<div class="col-sm-5">	Mother Name<input type="text" name="mname"	required="required" maxlength="20">	</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">	Batch Year<input type="tel"	name="byear" required="required"	maxlength="9">	</div>
		</div>	<br><br>
		
		<div class="row">
			<div class="col-sm-5">	Parent AAdhar No.<input type="text" name="paadhar"	required="required" maxlength="12">	</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">	Student AAdhar No.<input type="tel"	name="saadhar" required="required"	maxlength="12">	</div>
		</div>	<br><br>
		
		<div class="row">
			<div class="col-sm-5">	Blood Group<input type="text" placeholder="B+" name="bgroup"	required="required" maxlength="10">	</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">	Emergency Mob. No.<input type="tel"	name="emob" required="required"	maxlength="11" value="+91">	</div>
		</div>	<br><br>
	
	
		<div class="row">
			<div class="col-sm-5">
		
		Branch &nbsp;&emsp;&nbsp;&emsp;&nbsp;&emsp;&emsp;&nbsp;&emsp;&nbsp;&emsp;&nbsp;&emsp;&nbsp;&emsp;&nbsp;&emsp;&nbsp;&emsp;
		<select name="sem" id = " " style="background-color:white;" class="btn btn-default dropdown-toggle">
       
        <option>--SELECT--</option>
        <option value = "sem1">MCA 1 SEM</option>
        <option value = "sem2">MCA 2 SEM</option>
        <option value = "sem3">MCA 3 SEM</option>
        <option value = "sem4">MCA 4 SEM</option>
        <option value = "sem5">MCA 5 SEM</option>
        <option value = "sem6">MCA 6 SEM</option>
        </select>     </div>
     		
     		<div class="col-sm-1"></div>
     		
     		<div class="col-sm-5">	
     			<!--  <form action="SUpload" method="post" enctype="multipart/form-data">-->
					<input type="file" name="photo"  id="photo" onchange="imageIn()"><br/>
					<input  type="hidden" name="photoname"  id="photoname" value="">
					<!--<input type="submit" value="submit">
		
				</form>-->
			</div>
     	</div><br><br>
	
		<div class="row">
			<div class="col-sm-5">Collage ID<input type="varchar"	 name="email"	required="required">	</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">	Address<input type="text"	name="address"	required="required"></div>
		</div><br><br>
	
		<div class="row">
			<div class="col-sm-5">	PIN<input type="tel"	name="pin"	required="required"	maxlength="6">	</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-5">	Student Mob.No.<input type="tel"	name="smob"	required="required"	maxlength="11"	value="+91"></div>
		</div><br><br>
	
		<div class="row">
			<div class="col-sm-5">	Parent Mob.No.<input type="tel"	name="pmob" required="required"	maxlength="11"	value="+91">	</div>
			<div class="col-sm-1"></div>	
			<div class="col-sm-5">	Gender  &nbsp;&emsp; &nbsp;&emsp; &nbsp;&emsp; &nbsp;&emsp; &nbsp;&emsp;	
			<label for="male">Male</label>	
			<input type="radio"	name="gender" id="GENDER" VALUE="male"> &nbsp;&emsp;
			<label for="female">Female</label>
    		<input type="radio" name="gender" id="GENDER" value="female"></div>
    	</div><br><br>
			
		<input type="submit" value="Submit">
		
		</h4>
		</form>
		
		</div>
	</div><br>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>	
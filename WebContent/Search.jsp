<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Search</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
* {box-sizing: border-box;}
	body {
  		margin: 0;
  		font-family: Arial, Helvetica, sans-serif;
	}
	.topnav {
  		overflow: hidden;
	}
	.topnav a {
  		float: left;
  		display: block;
  		color: black;
  		text-align: center;
  		padding: 14px 16px;
  		text-decoration: none;
		font-size: 17px;
	}
		.topnav a:hover {
  		background-color: #ddd;
  		color: black;
	}
	.topnav a.active {
  		background-color: #2196F3;
  		color: green;
	}
		.topnav .search-container {
  		float: right;
	}
	.topnav input[type=text] {
  		padding: 6px;
  		margin-top: 8px;
  		font-size: 17px;
  		border: none;
  		
  		color:black;
	}
		.topnav .search-container button {
  		float: right;
  		padding: 10px 10px;
  		margin-top: 8px;
  		margin-right: 16px;
  		background: #ddd;
  		font-size: 17px;
 		border: none;
  		cursor: pointer;
	}
	.topnav .search-container button:hover {
	  	background: #ccc;
	}
	@media screen and (max-width: 600px) {
  		.topnav .search-container {
   		float: none;
  	}
  	.topnav a, .topnav input[type=text], .topnav .search-container button {
    	float: none;
    	display: block;
   		text-align: left;
    	width: 100%;
    	margin: 0;
	    padding: 14px;
	  }
  		.topnav input[type=text] {
	    border: 1px solid #ccc;  
  	}
	}
	</style>
	
</head>
<body>
	<div class="topnav">
  		<div class="search-container">
    	<form action="Search">
      		<input type="text" placeholder="Search.." name="search">
      		<button type="submit"><i class="fa fa-search"></i></button>
  		  </form>
  		</div>
	</div>
</body>
</html>
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
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Process</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<style>
		body{
			margin: 0;
			padding:0;
			background-size: cover;
			font-family: sans-serif;
			}
		a2{
			position: relative;
			font-size:35px; 
			color:#F56959;
			text-align: center;	
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
			
		
			
		
	</style>

</head>
<body>
	<%
	System.out.println(request.getParameter("check")+" real");
	System.out.println(request.getParameter("check1")+" real");
	Connection con=null;
	ResultSet rst1=null;
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");  

	if(request.getParameter("check1").equals("NA"))
	{
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			  
			//step2 create  the connection object  
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
		    
			PreparedStatement s=con.prepareStatement("update student set status='1' where email=?");
		   	s.setString(1,request.getParameter("check"));
		   	int status=s.executeUpdate();
		   	
			if(status>0)
			{
	%>
	<%=	"successfully updated for "+request.getParameter("check") %>
			
			<script type="text/javascript">
				alert("Verified");
				<%response.sendRedirect("AllStudent.jsp");%>
			</script>
		<%
			}	
		}
		catch(Exception e)
		{	}
			
	}
	
	else
	{
	
	try{
	PreparedStatement s2=con.prepareStatement("select * from student where email=?");
					
	s2.setString(1,request.getParameter("check1"));
	
	rst1=s2.executeQuery();
	String email1=request.getParameter("check1");
	System.out.println(email1);	
	 while (rst1.next()) 
	 {
					
	%>
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">
		
		<div class="aa">
		<center><a2>Student Detail's</a2></center> <br>
			<div class="row">	
			<div class="col-sm-5">	
				
				<div class=:row-sm-2">	Name	:	<%=rst1.getString("name")%>	</div>
				<br>
				<div class=:row-sm-2">	<td>Father Name	:	<%=rst1.getString("fname")%></td>	</div>
				<br>	
				<div class=:row-sm-2">	<td>Mother Name	:	<%=rst1.getString("mname")%></td>	</div>
				<br>
				
			</div>
			
			<div class="col-sm-2">	</div>
			
			<div class="col-sm-3">	
				
					
			<%	
			System.out.println(email1);
				Class.forName("oracle.jdbc.driver.OracleDriver");  
				  
				//step2 create  the connection object  
				con=DriverManager.getConnection(  
				"jdbc:oracle:thin:@localhost:1521:xe","system1","system"); 
				
				PreparedStatement s1=con.prepareStatement("select * from student where email=?");
			   	s1.setString(1,email1);
				ResultSet rstfig=s1.executeQuery();
				
				Boolean status=rstfig.next();
				System.out.println(rstfig.getString("email"));
				System.out.println(status);	
				
				
				if((rstfig.getString("path"))!=null)
				{
					String file=" ";
				    File f= new File(rstfig.getString("path"));
				         file=f.getName();
	     
				        if(!file.equals(" "))
				        {
				        out.println("<tr>"); 
				        out.println("<td style='margin-top:5px;width:100%;'>");
				        out.println("<image  src='SImage/"+file+"'  height='100%' width='100%'>");
				        out.println("</td>"); 
				        out.println("</tr>");
				        }
				}
				 %>
				
				<div class="col-sm-2">	</div>	
			</div>	
		</div>
		<div class="row">
		<div class="col-sm-5">	
		<div class=:row-sm-2">	<td>Batch	:	<%=rst1.getString("byear")%></td>	</div>
				<br>
				<div class=:row-sm-2">	<td>Branch	:	<%=rst1.getString("branch")%></td>	</div>
				<br>
				<div class=:row-sm-2">	<td>Email	:	<%=rst1.getString("email")%></td>	</div>
				<br>		
				<div class=:row-sm-2">	<td>Gender	:	<%=rst1.getString("gender")%></td>	</div>
				<br>
		
		</div>
		<div class="col-sm-2">	</div>
			
			<div class="col-sm-5">
				<div class=:row-sm-2">	<td>Address	:	</td><td><%=rst1.getString("address")%></td>	</div>
				<br>
				<div class=:row-sm-2">	<td>PIN	:	<%=rst1.getString("pin")%></td>	</div>
				<br>	
				<div class=:row-sm-2">	<td>Student No.	:	<%=rst1.getString("smob")%></td>	</div>
				<br>
				<div class=:row-sm-2">	<td>Parent No.	:	<%=rst1.getString("pmob")%></td>	</div>
				<br>
			</div>
	
	
	<%
	 }	 
	 }
	
	finally	{
		try{
			if(rst1!=null)rst1.close();
		}
		finally{}
	}	  	
	}
	
	%>
	 </div>
	</div><br>
	</div>
	<jsp:include page="footer.jsp"/>  	
	   
</body>
</html>
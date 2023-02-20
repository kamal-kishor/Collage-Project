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
	<title>Subject Allocate</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
	<div style="background-color:#7fb3d5;">
	<jsp:include page="header.jsp"/>
	<div class="container">
	<div class="aa">
		
	<%	
		System.out.println(request.getParameter("sub1")+" sub1");		System.out.println(request.getParameter("sub2")+" sub2");
		System.out.println(request.getParameter("time1")+" time1");	System.out.println(request.getParameter("time2")+" time2");
		System.out.println(request.getParameter("check")+" CheckButton");
		
		Connection con=null;
		ResultSet rst1=null;
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			  
			//step2 create  the connectio	n object  
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
			
			PreparedStatement s=con.prepareStatement("update faculty11 set sub1=?,time1=?,sub2=?,time2=? where email=?");
		   	s.setString(1,request.getParameter("sub1"));
		   	s.setString(2,request.getParameter("time1"));
		   	s.setString(3,request.getParameter("sub2"));
		   	s.setString(4,request.getParameter("time2"));
		   	s.setString(5,request.getParameter("email"));
		   	int status=s.executeUpdate();
		   	if(status>0)
			{
	%>
			<script type="text/javascript">
			function alertName(){
				alert("TIME ALLOCATED");	}
				<%response.sendRedirect("AllFaculty.jsp");%>
			</script>
	<%
			}
		   	con.close();
		}
		finally{
			
		}
	%>
		
		
		
		
	</div>
	</div><br>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
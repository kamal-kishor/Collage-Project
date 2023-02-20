<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="jdbc.*" %>
<%@ page session="false"%>
<%@ page import="java.sql.PreparedStatement"%> 
<%@ page import="java.io.*" import="java.sql.*"	import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>  
<%@ page import="javax.servlet.http.HttpServletResponse"%> 
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>...Processing</title>
</head>
<body>
<%		
		String tenboard = request.getParameter("tenboard");		
		String tenper = request.getParameter("tenper");
		String twboard = request.getParameter("twboard");
		String twper = request.getParameter("twper");
		String grad = request.getParameter("grad");
		String uni = request.getParameter("uni");
		String uniper = request.getParameter("uniper");
		String tenth = "High School";
		String twelve = "Intermediate";
		
		Connection con=null;
		ResultSet rst=null;
		
		HttpSession session1=request.getSession();
		String email1=(String)session1.getAttribute("username");

		System.out.println(email1);
		try 
        {
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			  
			//step2 create  the connection object  
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system"); 
			
			// constructs SQL statement
			String sql = "insert into record values (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = con.prepareStatement(sql);
			
			statement.setString(1,tenth);
			statement.setString(2,tenboard);
			statement.setString(3,tenper);
			statement.setString(4,twelve);
			statement.setString(5,twboard);
			statement.setString(6,twper);
			statement.setString(7,grad);
			statement.setString(8,uni);
			statement.setString(9,uniper);
			statement.setString(10,email1); 
			
			statement.executeUpdate();
			getServletContext().getRequestDispatcher("/StudentFace.jsp").forward(request, response);
		%>
		
<%}
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
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
	
<%
	String OldPassword = request.getParameter("OldPassword");
	String Newpass = request.getParameter("newpassword");
	String conpass = request.getParameter("conpassword");
	
	HttpSession session=request.getSession();
	String email1=(String)session.getAttribute("username");
	
	try {
		Connection con=null;
		ResultSet rst=null;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		//step2 create  the connection object  
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");
		// constructs SQL statement
		
		PreparedStatement statement = con.prepareStatement("select * from student where email=?");
		statement.setString(1,email1);
		
		rst=statement.executeQuery();
		rst.next();
		
		String pass1 = rst.getString("pass");
		
		if(pass1==OldPassword){
			PreparedStatement ps=con.prepareStatement("update student set pass="+Newpass+" where email=? ");
			ps.setString(1,email1);
 			ps.executeUpdate();
 			con.close();
 			
 			System.out.println("Password Updated ");
		%>			
			<script type="text/javascript">
			alert("Password Update Successfully");
			return true;
		<%
			getServletContext().getRequestDispatcher("/StudentFace.jsp").forward(request, response);
		%>
			</script>
<%
		}
		else{
%>			out.println("Password  not Updated ");

			<script type="text/javascript">
			alert("Old Password doesn't match");
			return true;
			<%
			getServletContext().getRequestDispatcher("/StudentFace.jsp").forward(request, response);
			%>
			</script>
<%
		}
	}
	finally{
		
	}
		
%>
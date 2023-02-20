package jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/LoginCheck")

public class LoginCheck extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					    	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();
		int status=0;
		// 	gets values of text fields
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		//String userType = request.getParameter("usertype");
		Connection con = null; // connection to the database
		String message = null;  // message will be sent back to client
			// connects to the database
		try 
        {
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			  
			//step2 create  the connection object  
			con=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","system1","system"); 
			// constructs SQL statement
			PreparedStatement statement = con.prepareStatement("select count(*) from student where email=? and pass=?");
			statement.setString(1,email);  
			statement.setString(2,pass);				           	
			ResultSet rs = statement.executeQuery();
			   
			while(rs.next())
			{
				status=Integer.parseInt(rs.getString(1)); 
			}
			if(status>0) {
			   	out.println("location='StudentFace.jsp';");
			   	
			   	HttpSession session=request.getSession();
				session.setAttribute("username", email);
				response.sendRedirect("StudentFace.jsp");
				//getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User or password incorrect');");
				out.println("location='Login.jsp';");
				out.println("</script>");
				
				getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
			}	 
		}
		catch (SQLException ex) 
		{
		     message = "ERROR: " + ex.getMessage();
		     ex.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally 
		{
		     if (con!= null) {
		     // closes the database connection
		     }
		     // sets the message in request scope
		     request.setAttribute("Message", message);
			 }
	}
}
			



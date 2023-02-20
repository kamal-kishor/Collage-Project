package jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/HodLogin")
public class HodLoginCheck extends HttpServlet {    	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			response.setContentType("text/html");	
			PrintWriter out = response.getWriter();
			int status=0;
			// 	gets values of text fields
			
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			//String userType = request.getParameter("usertype");
			 // connection to the database
			String message = null;  // message will be sent back to client
			// connects to the database
			
			Connection con7=null;
			try
			{
				
			
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			  
			//step2 create  the connection object  
			con7=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
			  
			//step3 create the statement object  
			Statement stmt=con7.createStatement();  
			
			PreparedStatement statement = con7.prepareStatement("select count(*) from faculty where email=? and pass=?");
			statement.setString(1,email);  
			statement.setString(2,pass);				           	
			ResultSet rs = statement.executeQuery();
			   
			while(rs.next())
			{
				status=Integer.parseInt(rs.getString(1)); 
			}
			
			
			
		}catch(Exception e){ System.out.println(e);}  
			finally 
			{	
				try {
					con7.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    
			}
		  
			
	/*		try 
	        {
				// constructs SQL statement
				PreparedStatement statement = con.prepareStatement("select count(*) from faculty where email=? and pass=?");
				statement.setString(1,email);  
				statement.setString(2,pass);				           	
				ResultSet rs = statement.executeQuery();
				   
				while(rs.next())
				{
					status=Integer.parseInt(rs.getString(1)); 
				}
				
			}
			catch (SQLException ex) 
			{
				
			     message = "ERROR: " + ex.getMessage();
			     ex.printStackTrace();
			}
			finally 
			{	
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    // if (con!= null) {
			     // closes the database connection
			    // }
			     // sets the message in request scope
			    // request.setAttribute("Message 101", message);
			}*/
			
			if(status>0) {
				
			   	out.println("location='HodFace.jsp';");
			   	HttpSession session=request.getSession();
				session.setAttribute("username", email);
				response.sendRedirect("HodFace.jsp");
				//getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
				
			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User or password incorrect');");
				out.println("location='HodLogin.jsp';");
				out.println("</script>");
				getServletContext().getRequestDispatcher("/HodLogin.jsp").forward(request, response);
			}	 

	}
}

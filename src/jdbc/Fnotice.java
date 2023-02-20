package jdbc;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;


@WebServlet("/Fnotice")
public class Fnotice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
MultipartRequest m = new MultipartRequest(request, "G:"+File.separator+"ProgramFiles"+File.separator+"sfms"+File.separator+"WebContent"+File.separator+"Notice");  
		
		PrintWriter pw= response.getWriter();
		String imagepath=m.getParameter("photoname");
		File filename=new File(imagepath);
		String imagename=filename.getName();

		System.out.print("successfully uploaded");  
		String path= "G:"+File.separator+"ProgramFiles"+File.separator+"sfms"+File.separator+"WebContent"+File.separator+"Notice"+File.separator+imagename;

		System.out.println("photo  name using js="+imagepath);

		System.out.println("photo  name using js="+imagename);
 
		String subject = m.getParameter("subject");
		System.out.print("subject from previous page"+subject);
	    //String status = request.getParameter("status");
	        
	    //String path = request.getParameter("path");
	        
	    @SuppressWarnings("unused")
	
	         
	    Connection con = null; // connection to the database
	    String message = null;  // message will be sent back to client
	         
	        try 
	        {
	            // connects to the database
	            
	            con = GetCon.getCon();
	            String status="1";
	            // constructs SQL statement
	            String sql = "INSERT INTO notice (subject,status,path) values (?,?,?)";
	            
	            PreparedStatement statement = con.prepareStatement(sql);
	           	statement.setString(1,subject);
	           	statement.setString(2,status);
	           	statement.setString(3,path);
	           	
	            
	            getServletContext().getRequestDispatcher("/FacultyNotice.jsp").forward(request, response);
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) { 		
	            	pw.print("<html>");
	                pw.print("<script language='JavaScript'>	alert('Notice have Updaed');	</script>");
	                pw.print("</html>");
		            
	            }
	        } 
	        
	        catch (SQLException ex) 
	        {
	            message = "ERROR: " + ex.getMessage();
	            ex.printStackTrace();
	        } 
	        finally 
	        {
	            
	            request.setAttribute("Message", message);
	       
	        }

	
	}

	}



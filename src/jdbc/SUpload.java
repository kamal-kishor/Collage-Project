package jdbc;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
@MultipartConfig(maxFileSize=1999999999)
@SuppressWarnings("unused")
@WebServlet("/SUpload")
public class SUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MultipartRequest m = new MultipartRequest(request, "G:"+File.separator+"ProgramFiles"+File.separator+"sfms"+File.separator+"WebContent"+File.separator+"Image");  
		String imagepath=m.getParameter("photoname");
		File filename=new File(imagepath);
		String imagename=filename.getName();

		System.out.print("successfully uploaded");  
 String path= "G:"+File.separator+"ProgramFiles"+File.separator+"sfms"+File.separator+"WebContent"+File.separator+"Image"+File.separator+imagename;

 System.out.println("photo  name using js="+imagepath);

 System.out.println("photo  name using js="+imagename);
 

    
 			String email = request.getParameter("email");
	        String name = request.getParameter("name");
	        String pass = request.getParameter("pass");
	        String mob = request.getParameter("mob");
	        
	        //String path = request.getParameter("path");
	        
	        String id = request.getParameter("id");
	          
	        Connection con = null; // connection to the database
	        String message = null;  // message will be sent back to client
	         
	        try 
	        {
	            // connects to the database
	            
	            con = GetCon.getCon();
	            // constructs SQL statement
	            String sql = "INSERT INTO faculty11 (email,pass,name,mob,path,id) values (?,?,?,?,?,?)";
	            
	            PreparedStatement statement = con.prepareStatement(sql);
	           	statement.setString(1, email);
	           	statement.setString(2,pass);
	           	statement.setString(3,name);
	           	statement.setString(4,mob);
	           	statement.setString(5,path);
	            statement.setString(6,id);
	            
	            getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) { 		
	                message = "Record uploaded and saved into database";
	                // forwards to the message page
		            
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

package jdbc;

import java.io.File;
import java.io.IOException;
import jdbc.GetCon;
import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;

@SuppressWarnings("serial")
@WebServlet("/Registration")

@MultipartConfig(maxFileSize = 19999999)    // upload file's size up to 19MB
 
public class Registration extends HttpServlet {
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
			MultipartRequest m = new MultipartRequest(request, "G:"+File.separator+"ProgramFiles"+File.separator+"sfms"+File.separator+"WebContent"+File.separator+"SImage");  
			String imagepath=m.getParameter("photoname");
			File filename=new File(imagepath);
			String imagename=filename.getName();

			System.out.print("successfully uploaded");  
	 String path= "G:"+File.separator+"ProgramFiles"+File.separator+"sfms"+File.separator+"WebContent"+File.separator+"SImage"+File.separator+imagename;

	 System.out.println("photo  name using js="+imagepath);

	 System.out.println("photo  name using js="+imagename);
			
			// TODO Auto-generated method stub	
			// gets values of text fields
	 String email=m.getParameter("email");
	 String name=m.getParameter("name");
	 String fname=m.getParameter("fname");
	 String mname=m.getParameter("mname");
	 String byear=m.getParameter("byear");
	 String address=m.getParameter("address");
	 String pin=m.getParameter("pin");
	 String smob=m.getParameter("smob");
	 String pmob=m.getParameter("pmob");
	 String gender=m.getParameter("gender");
	 String sem=m.getParameter("sem");
		 
	        Connection con = null; // connection to the database
	        String message = null;  // message will be sent back to client
	         
	        try 
	        {
	            // connects to the database
	            
	            con = GetCon.getCon();
	            // constructs SQL statement
	            String sql = "INSERT INTO student(email,name,fname,mname,byear,address,pin,smob,pmob,gender,branch,path) values (?,?,?,?,?,?,?,?,?,?,?,?)";
	            
	            PreparedStatement statement = con.prepareStatement(sql);
	            statement.setString(1,email);
	           	statement.setString(2, name);
	           	statement.setString(3,fname);
	           	statement.setString(4,mname);
	           	statement.setString(5,byear);
	           	statement.setString(6,address);
	           	statement.setString(7,pin);
	           	statement.setString(8,smob);
	           	statement.setString(9,pmob);
	           	statement.setString(10,gender);
	           	statement.setString(11,sem);
	           	statement.setString(12,path);
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) { 		
	            	getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
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
package jdbc;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
@WebServlet("/FUpload")
public class FUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MultipartRequest m = new MultipartRequest
				(request, "G:"+File.separator+"ProgramFiles"+File.separator+"sfms"+File.separator+"WebContent"+File.separator+"activity");  
		
		String imagepath=m.getParameter("photoname");
		File filename=new File(imagepath);
		String imagename=filename.getName();
		
		String path= "G:"+File.separator+"ProgramFiles"+File.separator+"sfms"+File.separator+"WebContent"+File.separator+"activity"+File.separator+imagename;
		String head = m.getParameter("head");
		String sem = m.getParameter("sem");
		String sub = m.getParameter("sub");
        
		System.out.println(head);
		System.out.println("kamlesh420");
		System.out.println(sem);
		System.out.println(sub);
		System.out.println(path);
		
        Connection con = null; // connection to the database
        String message = null;  // message will be sent back to client
        
        try 
        {
            // connects to the database
            con = GetCon.getCon();
            // constructs SQL statement
            String sql = "INSERT INTO activity (sem,path,heading,subject) values (?,?,?,?)";
            
            PreparedStatement statement = con.prepareStatement(sql);
           	statement.setString(1,sem);
           	statement.setString(2,path);
           	statement.setString(3,head);
           	statement.setString(4,sub);
            
            getServletContext().getRequestDispatcher("/FacultyFace.jsp").forward(request, response);
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

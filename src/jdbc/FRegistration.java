package jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FRegistration")
public class FRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Connection con = null; // connection to the database
        String message = null;  // message will be sent back to client
        
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String mob = request.getParameter("mob");
         
        try 
        {
            // connects to the database
            
            con = GetCon.getCon();
            // constructs SQL statement
            String sql = "INSERT INTO faculty11 (email,pass,name,mob) values (?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(sql);
            
           	statement.setString(1,id);
           	statement.setString(2,password);
           	statement.setString(3,name);
           	statement.setString(4,mob);
           
            int row = statement.executeUpdate();
            if (row > 0) { 
            	request.setAttribute("print","Record uploaded and saved into database");
            }
            
            if (row==0) { 
            	request.setAttribute("print","Record not uploaded and saved");
            }
            
            getServletContext().getRequestDispatcher("/AddFaculty.jsp").forward(request, response);
            // sends the statement to the database server
            
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



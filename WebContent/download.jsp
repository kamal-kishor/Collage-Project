<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" import="java.sql.*"	import="javax.servlet.http.HttpServlet"%>
<%@ page import="java.sql.*" %>
<%@ page import="jdbc.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" type="image/jpg" href="tab.png"/>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Notice</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
	<%
	String name=request.getParameter("name");
	System.out.println("name from previous page="+name);
	Connection con2=null;
	PreparedStatement s=null;
	ResultSet rst=null;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		  
		//step2 create  the connection object  
		con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system1","system");  
		  
	     s=con2.prepareStatement("select * from notice where status='0' AND subject=?");
		
	     s.setString(1,name);
	     rst=s.executeQuery();
		rst.next();
	     
	     if((rst.getString(1))!=null)
			{
				String file=" ";
			    File f= new File(rst.getString(3));
			         file=f.getName();
  System.out.println(rst.getString(3));
			        if(!file.equals(" "))
			        {
			        out.println("<tr>"); 
			        out.println("<td style='margin-top:5px;width:100%;'>");
			        out.println("<image  src='Notice/"+file+"'  height='100%' width='100%'>");
			        out.println("</td>"); 
			        out.println("</tr>");
			        }
			}
	     
	     
	     
	     /*String filename = "home.jsp";   
	 	String filepath = "e:\\";   
	   response.setContentType("APPLICATION/OCTET-STREAM");   
	   response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
	   
	   java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
	             
	   int i;   
	   while ((i=fileInputStream.read()) != -1) {  
	     out.write(i);   
	   }   
	   fileInputStream.close();   
	 */
	 
	}
	 catch (SQLException ex) 
     {
         
         ex.printStackTrace();
     } 
	
	finally
	{
		try
		{
			if(s!=null)s.close();
		}catch(Exception e){}
		try
		{
			if(rst!=null)rst.close();
		}catch(Exception e){}
	}
			
	%>	
</body>
</html>
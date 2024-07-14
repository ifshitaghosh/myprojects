<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*, javax.servlet.http.HttpSession.*
 "
%>
<%
	String email=request.getParameter("email"); 
	String password=request.getParameter("password"); 
	
	Connection connection = null;
	Class.forName("oracle.jdbc.OracleDriver");
	connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
   	Statement statement = connection.createStatement();
   
	ResultSet rs=statement.executeQuery("select * from student where email='"+email+"' and password='"+password+"'"); 
	try
		{
			rs.next();
		    if(rs.getString("password").equals(password)&&rs.getString("email").equals(email)) 
		    	{ 
		    	  //HttpSession session = request.getSession();
		    	session.setAttribute("email", email);
		    	
		        	 %>
					 <script>
		           		alert("Login Succesfull");
		           		
		           		window.location.replace('index.html');
		             </script>
		             	 <a href="logout.jsp">Log Out</a><br><br>
					 <%
					 //out.println("welcome	"+email);
				
				} 
			else
				{
					 %>
						 <script>
			           		alert("Login Failed,Invalid password or username");
			           		window.location.replace('Sign-in.jsp');
			             </script>
					 <%
			    }
		}
	catch (Exception e) 
		{
			e.printStackTrace();
		}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
try
	{
		Connection connection = null;
	 	Class.forName("oracle.jdbc.OracleDriver");
	    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
  		Statement statement = connection.createStatement();
		
		String email=request.getParameter("email");
		String newpassword=request.getParameter("newpassword");
		
		String strQuery = "SELECT COUNT(*) FROM student where email='"+email+"'";
		ResultSet rs = statement.executeQuery(strQuery);
		rs.next();
		String Countrow = rs.getString(1);
		
		if(Countrow.equals("0"))
			{
			%>
			<script>
            	window.location.replace("sign-in.jsp");
            	alert("Sorry, no emails exists");
        	</script>
			<%
			}
		else 
			{
			
			int i=statement.executeUpdate("UPDATE student SET password='"+newpassword+"' WHERE email='"+email+"'");	
			%>
			<script>
            	window.location.replace("sign-in.jsp");
            	alert("your password has been succesful reset");
        	</script>
			<%
			}
	}
catch(Exception e)
	{
		out.println(e);
	}
%>
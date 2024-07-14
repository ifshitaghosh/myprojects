<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Count Rows JSP</title>
</head>
<body>
<%
	try
		{
		Connection connection = null;
		 Class.forName("oracle.jdbc.OracleDriver");
		    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
	    Statement statement = connection.createStatement();
			
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String password=request.getParameter("password");
			String strQuery = "SELECT COUNT(*) FROM student where email='"+email+"'";
			ResultSet rs = statement.executeQuery(strQuery);
			rs.next();
			String Countrow = rs.getString(1);
			
			if(Countrow.equals("0"))
				{
					int i=statement.executeUpdate("insert into student(name,email,phno,password)values('"+name+"','"+email+"','"+phno+"','"+password+"')");
					%>
					 <script>
					 alert("Register Succesfull"); 
					 window.location.replace('sign-in.jsp');
				     </script>
				    <%
				}
			else
				{
					%>
					 <script>
					 alert("User name or Email already exists !!!"); 
					 window.location.replace('sign-up.html');
				    </script>
					<%
				}
		}
	catch(Exception e)
		{
			e.printStackTrace();
		}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <%
String email = (String)session.getAttribute("email");
				if (email.equals("pqr"))
				{
					%>
					<!-- NOT A VALID USER, IF THE USER TRIES TO EXECUTE LOGGED IN PAGE DIRECTLY, ACCESS IS RESTRICTED -->
								 <h1 style="font-family: 'Allura', cursive;">Oops!</h1>
								 <h2 style="font-family: 'Allura', cursive;">You are not Loggedin</h2>
								 <button class="btnn"><a href="sign-in.jsp">Login</a></button>
								 <div class="space">
								 </div>
								 <button class="btnn"><a href="sign-up.html">Signup</a></button>		 
					<%	
						
				}
				
				else
				{
					
					response.sendRedirect("dsa-exam.html");
				}
		%>
</body>
</html>
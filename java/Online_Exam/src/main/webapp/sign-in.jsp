
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
<title>SignIn Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="sign-up.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->
</head>
<body>
<%
	String email="pqr";
	session.setAttribute("email",email); 
%>
	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>Sign In Here</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action="sign-in-db.jsp" method="post">
					<input class="text email" type="email" name="email" placeholder="Enter your Email" required="">
					<input class="text" type="password" name="password" placeholder="Enter your Password" required=""><br>
					<p><a href="resetpassword.html"> forget password ?</a></p>
					<input type="submit" value="SIGN IN">
				</form>
				<p>Don't have an Account? <br><a href="sign-up.html"> Sign Up </a>Here</p>
			</div>
		</div>
		<!-- copyright -->
		<div class="colorlibcopy-agile">
			<p>© Copyright 2023  |  All Rights Reserved by Techno India University</a> </p>
		</div>
		<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<!-- //main -->
</body>
</html>
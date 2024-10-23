<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0%;
	padding: 0%;
}
body{
	width: 100%;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.videologo{ 
	width: 70%;
	height: 60vh;
}
a{
width: 80%;
height: 70vh;
text-decoration: none;
display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}
</style>
</head>
<body>
	<a href="Adminlogin.jsp">
	<video src="videoandimg/Blue Professional Hospital Logo.mp4" class="videologo" autoplay muted loop="loop"></video>
	<h6>Click on logo</h6>
	</a>
	
</body>
</html>
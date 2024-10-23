<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="videoandimg/Blue Professional Hospital Logo.png"> 

<style type="text/css">
*{
	margin: 0%;
	padding: 0%;
}
body{
	width: 100%;
	height:auto;
	display: flex;
	flex-direction: column;
}
.header{
width: 100%;
height: 20vh;
background: rgb(130,179,240);
background: linear-gradient(83deg, rgba(130,179,240,1) 0%, rgba(116,218,240,1) 100%);
display: flex;
justify-content:center;
align-items: center;
font-size: x-large;
flex-direction: row;

}
h2{
width: 90%;
    height: 20%;
    text-align: center;
}
h2:after
{
    content: '';
    position:absolute;
    left:0;
    top:0;
    width: 90%;
    height: 20%;
    background: radial-gradient(circle, transparent 70%, transparent 70%),
    radial-gradient(circle, transparent 60%, white 70%) 30px 30px;
    background-size:4px 4px;
    text-align: center;

}
.videologo{
width: 10%;
height: 20vh;
}
.sapnanme{ 
color: red;
}
.menubar{
width: 100%;
height: 7vh;
background-color: #808080;
display: flex;
justify-content:space-around;
align-items: center;
}
a{
text-decoration: none;
color: white;
font-weight: bold;
width:auto;
height:auto;
display: flex;
justify-content: center;
align-items: center;
}
a:hover {
	border-bottom:2px solid orange;
	text-decoration: none;
}
.dash{
color: orange;
background-color: white;
border-radius: 5%;
}
</style>
</head>
<body>
<%String name=request.getParameter("username") ; %>
<div class="header">
<h2><span class="sapnanme">JMMA</span> Group of Hospitails</h2>
<video src="videoandimg/Blue Professional Hospital Logo.mp4" class="videologo" autoplay muted loop="loop"></video>
</div>
<div class="menubar" id="dashdiv">
<a href="Test.jsp?username=<%=name%>">Slot Arrange by a Doctors</a>
<a href="testbyShift.jsp?username=<%=name%>">Avalible Docator on shift</a>
<a href="DashBoard.jsp?username=<%=name%>" class="dash">Dash Board</a>
</div>
</body>
</html>
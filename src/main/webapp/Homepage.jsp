<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
*{
	margin: 0%;
	padding: 0%;
}
body{
	width: 100%;
	height:auto;
	background-image:url("videoandimg/background.png");
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

.navbar {
	width:100%;
	height:9vh;
    background-color: #333;
    display: flex;
}

.nav-menu {
	width:100%;
	height:5vh;
    list-style-type: none;
    margin: 0;
    padding: 0;
    display:flex;
    justify-content:space-between;
    align-items: center; 
}

.nav-item {
    width:25%;
}
#nav-item{
width:auto;color: orange;
text-align: center;
display:flex; 
}
.strong{
background-color: transparent;
border:none;
color: orange;
font-weight: bold;
}
.nav-item a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.nav-item a:hover {
    background-color: #111;
}

.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
	width:auto;
	height:auto;
	display: block;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    text-align: left;
     z-index: 1;
}

.dropdown-content {
  list-style-type: none;
}

.dropdown-content a:hover {
    background-color: #333;
    color:white;
    display: block;
    width: auto;
    height: auto;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #111;
}
.mapping{
width: 100%;
height: 23%;
display: flex;
margin-top: 24%;
}
.mapping1{ 
width:100%;
height:100%;
overflow: hidden;
border-top: 1px solid skyblue;
border-right: 1px solid skyblue;
box-shadow:0px 0px 2px 2px skyblue;
}
.scrooll{ 
width: 100%;
height: auto;
display: flex;
justify-content:space-between;
align-items: center;
}
.scr{
width: 30%;
height:30vh;
background: rgb(246,248,248);
background: linear-gradient(83deg, rgba(246,248,248,0.5580357142857143) 0%, rgba(247,251,251,0.6392682072829132) 100%);
box-shadow: -29px 31px 22px -3px rgba(0,0,0,0.4);
border-radius:10px;
text-align: center;
display: flex;
flex-direction: column;
overflow-x: hidden;
  overflow-y: scroll;
}
.head{
	text-align: center;
	font-family:fantasy;
}

/*logout css things*/

.input{
width:auto;
height:auto;
margin: 0%;
border: 0px;
outline: none;
border-radius: 5px;
font-family: monospace;
text-align: center;
color: white;

}
.sub{
width: auto;
color:orange;
background-color: white;
}
.sub:hover{
color:red;
background-color: white;
}

#user{
width:100%;
height:100px;
}
td{
padding:3px;
text-align: center;
}
</style>
</head>
<body>
<div class="header">
<h2>Wellcome to the <span class="sapnanme">JMMA</span> Group of Hospitails</h2>
<video src="videoandimg/Blue Professional Hospital Logo.mp4" class="videologo" autoplay muted loop="loop"></video>
</div>
<%
            String name = request.getParameter("username");
		  
		
            %>
<nav class="navbar">
        <ul class="nav-menu">
            <li class="nav-item dropdown">
            	<a href="Homepage.jsp" class="dropbtn"><i class="fa-solid fa-house" style="color: #ffffff;"></i>Home</a>
            </li>
            <li class="nav-item dropdown">
            
                <a href="DashBoard.jsp?username=<%=name%>" class="dropbtn"><i class="fa-solid fa-table-columns" style="color: #fcfcfd;"></i>DashBoard</a>
            </li>  
            <li class="nav-item dropdown" id="nav-item">
       			 
			<form action="Homepage.jsp">
      			<%request.setAttribute("username",name);%>
      			
      			
      			<table>
      			<tr>
      			<td><b class="input" ><%out.print(name);%></b></td>
      			<td><input type="checkbox" value="${username}" name="reenteruser" class="input" id="user"  required="required"></td>
      			<td><input type="submit" class="input sub" value="LogOut"></td>
      			</tr>
      			</table>
            </form>
            <c:if test="${param.reenteruser!=null}">
            <jsp:useBean id="adminlogout" class="com.hospitalpro.Imp.AdminImp" />
       			<c:set var="result" value="${adminlogout.adminLogout(param.reenteruser)}"/>
       			<c:if test="${result=='correct'}">
				<jsp:forward page="hospitalEnterpage.jsp" />
				</c:if>
				</c:if>
            </li>
        </ul>
    </nav>
    
<div class="scrooll">
    <div class="scrollingimp scr">
   	<h6 class="head">Important Notes</h6>
  	<jsp:useBean id="getkeypoints" class="com.hospitalpro.Imp.KeyPoint" />
  	<c:set var="details" value="${getkeypoints.showpoints()}" />
  	<c:forEach var="show" items="${details}">
  	<span>
  	<i class="fa-solid fa-star-of-life" style="color: #ff0000;"></i><c:out value="${show.keypoint}" />
  	</span>
  	<br>
  	</c:forEach>
    </div>
    <div class="Notes scr">
    <h6 class="head">Notes board</h6>
    <jsp:useBean id="getnotice" class="com.hospitalpro.Imp.NoticeBoardImp" />
    <c:set var="details" value="${getnotice.showNoticeboard()}" />
  	<c:forEach var="show" items="${details}">
  	<span>
  	<i class="fa-solid fa-star-of-life" style="color: #ff0000;"></i><c:out value="${show.topic}" />
  	</span>
  	<br>
  	</c:forEach>
    </div>
</div>
<div class="mapping">
    <div class="mapping1">
    	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d486415.1779541658!2d82.9329075314286!3d17.739051133413586!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a39431389e6973f%3A0x92d9c20395498468!2sVisakhapatnam%2C%20Andhra%20Pradesh!5e0!3m2!1sen!2sin!4v1721875334184!5m2!1sen!2sin" width="1300" height="200" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
    </div>
</div>

</body>
</html>
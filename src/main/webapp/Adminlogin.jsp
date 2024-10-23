<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">

*{
	padding:0%;
	margin: 0%;
}
body{
width: 100%;
height: 100vh;
background: white;
            background-image: radial-gradient(circle, transparent 20%, rgb(64, 199, 240) 20%, rgb(64, 199, 240) 80%, transparent 20%, transparent), 
                              radial-gradient(circle, transparent 20%, rgb(64, 199, 240) 20%, rgb(64, 199, 240) 80%, transparent 20%, transparent);
            background-size: 10px 10px;display: flex;
justify-content: center;
align-items: center;
flex-direction: column;

}
.div1{
width: 45%;
height: 60vh;
background-color: rgba(255, 255, 255,0.3);
display: flex;
justify-content: center;
align-items: center;
border-radius: 30px;
flex-direction: column;
}
td{
	padding: 3%;
}
label{
font-weight: bold;
font-family: monospace;
}
.input{
width:130%;
height:30px;
margin: 0%;
border: 0px;
outline: none;
border-radius: 10px;
background-color: rgba(255, 255, 255, 0.5);
font-family: monospace;
text-align: center;
}
.sub:hover{
color:orange;
background-color: white;
}
.show{
width: 60%;
height: 11%; 
display: flex;
justify-content: center;

}
h5{
width:100%;
height:5%;
text-align: center;
color: black;
font-family: monospace;
font-weight: bold;
}
</style>
</head>
<body>
<div class="div1">
<form action="Adminlogin.jsp" method="get">
<h5>Admin Login</h5><br>
<table>
	<tr>
		<td>
		<label>UserName:</label>
		</td>
		<td>
		<input type="text" required="required" autofocus="autofocus" name="username" class="input">
		</td>
	</tr>
	<tr>
		<td>
		<label>PassCode:</label>
		</td>
		<td>
		<input type="text" required="required" name="passcode" class="input">
		</td>
	</tr>
	<tr>
		<td>
		</td>
		<td>
		<input type="submit" class="input sub" >
		</td>
	</tr>
</table>
</form>

<c:if test="${param.username!=null}">
<jsp:useBean id="adminlogin" class="com.hospitalpro.Imp.AdminImp" />
<c:set var="result" value="${adminlogin.loginAdmin(param.username,param.passcode)}" />
<c:if test="${result=='correct'}">
<jsp:forward page="Homepage.jsp" />
</c:if>
<c:if test="${result=='incorrect'}">
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><i class="fa-regular fa-thumbs-up fa-flip-vertical" style="color: #f50025;"></i>Invalid Cradentail.....!</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</div>
</c:if>
</c:if>
</body>
</html>
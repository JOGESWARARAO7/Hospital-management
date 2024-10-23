<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="WEB-INF/hostpital.tld" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Admin</title>
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
height:auto;
background-image:url("videoandimg/Blue Professional Hospital Logo.png");
background-repeat:no-repeat;
background-position:center;
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
}

.div1{
margin-top:5%;
width: 45%;
height:60vh;
background: rgb(117,196,213);
background: linear-gradient(83deg, rgba(117,196,213,0.4) 0%, rgba(134,170,225,0.4) 100%);
display: flex;
justify-content: center;
align-items: center;
border-radius: 30px;
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
width: 45%;
height: 7%; 
display: flex;
justify-content: center;

}
h5{
width:100%;
height:5%;
text-align: center;
color: white;
font-family: monospace;
font-weight: bold;
}
a{
text-decoration: none;
}
.headding{
text-align: center;
}
</style>
</head>
<body>
<!--<s:addAdmin>1 cheking 1432 EYE ACTIVE</s:addAdmin>-->
<jsp:include page="AllAdminModules.jsp" />
<div class="div1">
<form action="AddAdmin.jsp" method="post">
	<table>
	<tr>
			<td>
			</td>
			<td>
			<strong>Add Admin</strong>
			</td>
		</tr>
		<tr>
			<td>
				<label for="input-1">HospitalId:</label>
			</td>
			<td>
				<input name="hospitalid" id="input-1" type="text" required="required" autofocus="autofocus" class="input">
			</td>
		</tr>
		<tr>
			<td>
				<label for="input-1">UserName: </label>
			</td>
			<td>
				<input name="username" id="input-1" type="text" required="required" class="input">
			</td>
		</tr>
		<tr>
			<td>
				<label for="input-1">Passcode:</label>
			</td>
			<td>
				<input name="passcode" id="input-1" type="text" required="required" class="input">
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" class="input sub">
			</td>
		</tr>
		
	</table>
</form>
</div>
<c:if test="${param.hospitalid!=null}">
<jsp:useBean id="addadmin" class="com.hospitalpro.Imp.AdminImp" />
<jsp:useBean id="admin" class="com.hospitalpro.Entity.Admin" />
<jsp:setProperty property="*" name="admin"/>
<c:set var="result" value="${addadmin.addAdminData(admin)}" />
<c:if test="${result=='Successfully'}">
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><i class="fa-solid fa-thumbs-up" style="color: #00f576;"></i>Otp sent to the mail and data saved.....</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
<c:if test="${result!='Successfully'}">
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><i class="fa-regular fa-thumbs-up fa-flip-vertical" style="color: #f50025;"></i><c:out value="${addadmin.addAdminData(admin)}" /></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
</c:if>


</body>
</html>

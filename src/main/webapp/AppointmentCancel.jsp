<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
background-image:url("videoandimg/Appointment.png");
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
}
.div1{
width: 45%;
height: auto;
background: rgb(154,158,159);
background: linear-gradient(83deg, rgba(154,158,159,0.6885679271708683) 0%, rgba(121,123,126,0.6081757703081232) 100%);
display: flex;
justify-content: center;
align-items: center;
border-radius: 30px;
margin-top: 2%;
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
height:25px;
margin: 0%;
border: 0px;
outline: none;
border-radius: 10px;
background-color: rgba(255, 255, 255, 0.6);
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
font-size:large;
text-decoration: none;
}
</style>
</head>
<body>
<jsp:include page="AllAppointmentModules.jsp"/>
<div class="div1">
<form action="AppointmentCancel.jsp" method="get" class="heading">
	<h5>Appointment Cancelld<i class="fa-solid fa-calendar-check" style="color: #000000;"></i></h5>
	<table id="table-1" >
		<tr>
		<td><label>Appointment ID</label></td>
		<td><input type="text" name="appointmentid" required="required" class="input" autofocus="autofocus" id="pname" ></td>
		</tr>
		<tr><td></td><td><input type="submit" class="input sub"></td></tr>
	</table>
</form>

</div>
<c:if test="${param.appointmentid!=null }">
<jsp:useBean id="cancellappointmentimp" class="com.hospitalpro.Imp.AppointmentImp" />

<c:if test="${cancellappointmentimp.cancellappointment(param.appointmentid)=='Successfully'}">
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><i class="fa-solid fa-thumbs-up" style="color: #00f576;"></i>Appointment cancell!.....</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>

</c:if>


</body>
</html>
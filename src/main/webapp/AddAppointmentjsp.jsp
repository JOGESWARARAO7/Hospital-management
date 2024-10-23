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
height: 70vh;
background: rgb(154,158,159);
background: linear-gradient(83deg, rgba(154,158,159,0.6885679271708683) 0%, rgba(121,123,126,0.6081757703081232) 100%);
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
<form action="AddAppointmentjsp.jsp" method="get" class="heading">
	<h5>Appointment<i class="fa-solid fa-calendar-check" style="color: #000000;"></i></h5>
	<table id="table-1" >
		<tr>
		<td><label>patientName:</label></td>
		<td><input type="text" name="patientname" required="required" class="input" autofocus="autofocus" id="pname" ></td>
		</tr>
		<tr>
		<td><label>PatientEmail:</label></td>
		<td><input type="text" name="patientemail" required="required" class="input"></td>
		</tr>
		<tr>
		<td><label>PatientMobile:</label></td>
		<td><input type="text" name="patientmobile" required="required" class="input"></td>
		</tr>
		<jsp:useBean id="getdoctor" class="com.hospitalpro.Imp.Doctor_ModifyImp" />
<c:set var="getDoctorlist" value="${getdoctor.getDoctor()}" />
		<tr>
		<td><label>DoctorName:</label></td>
		<td>
		<form method="get" action="AddAppointmentjsp.jsp" onchange="submit()">
		<select name="doctorname" class="input" id="citySelect" required="required">
			<option value="">**Select Doctor**</option>
			<c:forEach var="name" items="${getDoctorlist}">
				<option value="${name}">${name}</option>
			</c:forEach>
		</select>
		</form> 
		</td>
		</tr>
		<tr>
		<td><label>AppointmentDate:</label></td>
		<td><input type="date" name="appointmentdate" required="required" class="input"></td>
		</tr>
		<tr>
		<td><label> AppointTime:</label></td>
		<td><input type="time"    name="appointtime" min="8:00" max="22:00" step="1800" required="required" title="you started 8:00 Am to 22:00 pm only very slot 30min diffrence" class="input">
		</td>
		</tr>
		<tr>
		<td><label>PatientDisease:</label></td>
		<td><input type="text" name="patientdisease" class="input"></td>
		</tr>
		<tr><td></td><td><input type="submit" class="input sub"></td></tr>
	</table>
</form>

</div>
<c:if test="${param.patientname!=null }">
<jsp:useBean id="addappointmentimp" class="com.hospitalpro.Imp.AppointmentImp" />
<jsp:useBean id="appointment" class="com.hospitalpro.Entity.Appointment" />
<%
String patientName = request.getParameter("patientname");
String patientEmail = request.getParameter("patientemail");
String patientMobile = request.getParameter("patientmobile");
String doctorName = request.getParameter("doctorname");
String appointTime = request.getParameter("appointtime");
String patientDisease = request.getParameter("patientdisease");

// Parse and convert the date
String dateString = request.getParameter("appointmentdate");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date date = sdf.parse(dateString);
java.sql.Date appointmentDate = new java.sql.Date(date.getTime());

// Manually set properties
appointment.setPatientname(patientName);
appointment.setPatientemail(patientEmail);
appointment.setPatientmobile(patientMobile);
appointment.setDoctorName(doctorName);
appointment.setAppointmentdate(appointmentDate);
appointment.setAppointtime(appointTime);
appointment.setPatientdisease(patientDisease);
%>
<c:set var="result" value="${addappointmentimp.addappointment(appointment)}" />

<c:if test="${result=='Successfully'}">
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><i class="fa-solid fa-thumbs-up" style="color: #00f576;"></i>Appointment data saved Sucessfully!.....</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
<c:if test="${result!='Successfully'}">
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><i class="fa-regular fa-thumbs-up fa-flip-vertical" style="color: #f50025;"></i>Already alocated</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
</c:if>


</body>
</html>
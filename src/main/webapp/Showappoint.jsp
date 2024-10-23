<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
height: auto;
background-image:url("videoandimg/Appointment.png");
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
}
.div1{
width: 100%;
height: 10vh;
background: rgb(118,170,235);
background: linear-gradient(83deg, rgba(118,170,235,0.8773634453781513) 0%, rgba(93,239,238,1) 100%);
display: flex;
justify-content: center;
align-items: center;
}
.span{
font-weight: bold;
font-family: monospace;
font-size: large;
}
.input{
width:100%;
height:25px;
margin: 0%;
border: 0px;
outline: none;
border-radius: 10px;
background-color: rgba(255, 255, 255, 0.5);
font-family: monospace;
text-align: center;
}
td{
padding: 5px;
}
.sub:hover{
color:orange;
background-color: white;
}
</style>
</head>
<body>
<jsp:include page="AllAppointmentModules.jsp" />
<div class="div1">
<form action="Showappoint.jsp" method="get" class="heading">
	<table id="table-1" >
		<tr>
		<td><label>Appointment Details</label></td>
		<td><select name="status" class="input" id="citySelect">
			<option value="Active">Active</option>
				<option value="Cancel">Cancel</option>
		</select></td>
		<td><input type="submit" class="input sub"></td></tr>
	</table>
</form>

</div>
<c:if test="${param.status!=null }">
<jsp:useBean id="addappointmentimp" class="com.hospitalpro.Imp.AppointmentImp" />
<c:set var="details" value="${addappointmentimp.showappointment(param.status)}" />
<h5>All Appointment Details </h5>
<table  align="center" class="table table-striped">
		<thead class="thead-dark">
    <tr>
    
			<th scope="col"><i class="fa-solid fa-id-badge"></i>appointmentid</th>
			<th scope="col"><i class="fa-solid fa-signature"></i><br>appointment Name</th>
			<th scope="col"><i class="fa-regular fa-envelope"></i><br>patientemail </th>
			<th scope="col"><i class="fa-solid fa-phone" style="color: #ffffff;"></i>patientmobile</th>
			<th scope="col"><i class="fa-solid fa-signature"></i>doctorName</th>
			<th scope="col"><i class="fa-regular fa-calendar-days"></i>appointmentdate</th>
			<th scope="col"><i class="fa-regular fa-clock"></i>appointtime</th>
			<th scope="col">patientdisease</th>
		</tr>
  </thead>
	<c:forEach var="show" items="${details}">
	<tbody>
		<tr class="">
			<th scope="row" class="table-primary"><c:out value="${show.appointmentid}" /></th>
			<td><c:out value="${show.patientname}" /> </td>
			<td><c:out value="${show.patientemail}" /> </td>
			<td><c:out value="${show.patientmobile}" /> </td>
			<td><c:out value="${show.doctorName}" /> </td>
			<td><c:out value="${show.appointmentdate}" /> </td>
			<td><c:out value="${show.appointtime}" /> </td>
			<td><c:out value="${show.patientdisease}" /> </td>
		</tr>
		</tbody>
	</c:forEach>
	</table>
	</c:if>
</body>
</html>
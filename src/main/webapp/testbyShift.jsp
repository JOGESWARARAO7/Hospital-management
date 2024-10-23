<%@page import="com.hospitalpro.Entity.Test"%>
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
	padding:0%;
	margin: 0%;
}
body{
width: 100%;
height: 100vh;
background-repeat:no-repeat;
background-size:cover;
display: flex;
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
width:80%;
height:25px;
margin: 0%;
border: 0px;
outline: none;
border-radius: 10px;
background-color: rgba(255, 255, 255, 0.5);
font-family: monospace;
text-align: center;
}

.id{
font-weight: bold;
}
button{
width:100%;
height: 7vh;
letter-spacing: 3px;
font-weight: bold;
}

</style>
</head>
<body>
<jsp:include page="AllHospitalDoctorsModules.jsp" />
<jsp:useBean id="testimp" class="com.hospitalpro.Imp.TestImp" />
<c:set var="getslot" value="${testimp.avalibleslot()}" />
<div class="div1">
<form method="get" action="testbyShift.jsp" onchange="submit()">
		<span class="span" >Avalible slot Doctors :<i class="fa-solid fa-city" style="color: #003cf0;"></i></span>
		<select name="slot" class="input">
			<option value="Select Gender">Select slot</option>
			<c:forEach var="slot" items="${getslot}">
				<option value="${slot}">${slot}</option>
			</c:forEach>
		</select>
		</form> <br/><br/><hr/>
</div>
<c:if test="${param.slot!=null}">

<%
String availableSlot = request.getParameter("slot");
Test.AvailableSlot slotEnum = null;
if (availableSlot != null) {
    slotEnum = Test.AvailableSlot.valueOf(availableSlot.toUpperCase());
    request.setAttribute("slotEnum", slotEnum);
}
%>
<jsp:useBean id="dto" class="com.hospitalpro.Imp.DoctorDetailsDTO" />
<c:set var="getbyslot" value="${dto.getSlotWithDetails(slotEnum)}" />
<table align="center" class="table table-striped">
		<thead class="thead-dark">
    <tr>
			<th>Doctor ID</th>
			<th>Doctor Name</th>
			<th>Specialization</th>
			<th>Qualification</th>
			<th>hospitalname</th>
		</tr>
		</thead>
		
	<c:forEach var="item" items="${getbyslot}">
		<tbody>
		<tr>
			<td class="id"><c:out value="${item.doctor.doctorid}" /> </td>
			<td><c:out value="${item.doctor.doctorname}" /> </td>
			<td><c:out value="${item.doctor.specialization}" /> </td>
			<td><c:out value="${item.doctor.qualification}" /> </td>
			<th><c:out value="${item.hospital.hospitalname}" /> </th>
		</tr>
		</tbody>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
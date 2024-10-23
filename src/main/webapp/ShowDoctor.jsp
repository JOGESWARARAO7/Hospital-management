<%@ page import="com.hospitalpro.Imp.DactorDaoImp"%>
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
background: rgb(1,128,255);
background: linear-gradient(83deg, rgba(1,128,255,0.8773634453781513) 0%, rgba(82,207,149,1) 100%); 
display: flex;
flex-direction: column;
}
h5{
	width: 100%;
	height: 8vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: rgb(118,170,235);
background: linear-gradient(83deg, rgba(118,170,235,0.8773634453781513) 0%, rgba(93,239,238,1) 100%);
}
</style>
</head>
<body>
	<div>
	<jsp:useBean id="dactorimp" class="com.hospitalpro.Imp.DactorDaoImp" />
	<c:set var="doctorlist" value="${dactorimp.showDoctors()}" />
	<h5>Doctor details<i class="fa-solid fa-user-doctor" style="color: #0b5fef;"></i></h5>
	<table align="center" class="table table-striped">
		<thead class="thead-dark">
    <tr>
			<th>Doctor ID</th>
			<th>Doctor Name</th>
			<th>Specialization</th>
			<th>Qualification</th>
			<th>Availableslot</th>
		</tr>
		</thead>
		
	<c:forEach var="doctor" items="${doctorlist}">
		<tbody>
		<tr>
			<td class="id"><c:out value="${doctor.doctorid}" /> </td>
			<td><c:out value="${doctor.doctorname}" /> </td>
			<td><c:out value="${doctor.specialization}" /> </td>
			<td><c:out value="${doctor.qualification}" /> </td>
			<td><c:out value="${doctor.availableslot}" /> </td>
		</tr>
		</tbody>
	</c:forEach>
	</table>
	</div>
</body>
</html>
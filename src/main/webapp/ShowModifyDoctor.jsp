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
height:auto;
background-position:center;
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
background: linear-gradient(83deg, rgba(118,170,235,0.2) 0%, rgba(93,239,238,0.2) 100%);
}
.button{
height: 30px;
width:60%;
border-radius: 20px;
font-size:medium;
border: none;
margin: 0%;
margin-left: 30%;
}
</style>
</head>
<body>
<jsp:include page="AllDoctorModules.jsp" />
	<div>
	<jsp:useBean id="dactorimp" class="com.hospitalpro.Imp.Doctor_ModifyImp" />
	<c:set var="doctorlist" value="${dactorimp.showModifyDoctors()}" />
	<h5>Doctor details<i class="fa-solid fa-user-doctor" style="color: #0b5fef;"></i></h5>
	<table align="center" class="table table-striped">
		<thead class="thead-dark">
    <tr>
			<th><i class="fa-solid fa-id-card"></i>Doctor ID</th>
			<th><i class="fa-solid fa-signature"></i>Doctor Name</th>
			<th>Specialization</th>
			<th><i class="fa-solid fa-user-graduate"></i>Qualification</th>
		</tr>
		</thead>
		
	<c:forEach var="doctor" items="${doctorlist}">
		<tbody>
		<tr>
			<th class="id"><c:out value="${doctor.doctorid}" /> </th>
			<td><c:out value="${doctor.doctorname}" /> </td>
			<td><c:out value="${doctor.specialization}" /> </td>
			<td><c:out value="${doctor.qualification}" /> </td>
		</tr>
		</tbody>
	</c:forEach>
	</table>
	</div>
</body>
</html>
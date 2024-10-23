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
display: flex;
justify-content: center;
flex-direction: column;
}
table{
background: rgb(154,158,159);
background: linear-gradient(83deg, rgba(154,158,159,0.6885679271708683) 0%, rgba(121,123,126,0.6101365546218487) 100%);
}
td{
padding: 1%;
color:black;
}
th{
text-align: center;
}
.div1{
width: 100%;
height: 100vh;
display: flex;
flex-direction: column;

}
.heading{
width: 100%;
height: 8vh;
text-align: center;
background: rgb(118,176,235);
background: linear-gradient(83deg, rgba(118,176,235,0.5773634453781513) 0%, rgba(141,245,244,0.5) 100%);
display: flex;
justify-content: center;
align-items: center;
}
.id{
font-weight: bold;
}
button{
width: 100%;
height: 7vh;
font-size: large;
font-weight: bold;
}
</style>
</head>
<body>
<jsp:include page="AllHospitalModules.jsp" />
<div class="div1">
	<h5 class="heading">All Hospital details <i class="fa-solid fa-circle-info"></i></h5>
	<jsp:useBean id="appimp" class="com.hospitalpro.Imp.HospitalImp" />
	<c:set var="details" value="${appimp.showhospital()}" />
	<table align="center" class="table table-striped table-hover">
		<thead class="thead-dark">
    <tr>
			<th scope="col" >Hospital Id</th>
			<th scope="col">HospitalName</th>
			<th scope="col">City</th>
			<th scope="col">Street Name</th>
			<th scope="col">ZipCode</th>
			<th scope="col">Email</th>
			<th scope="col">PhoneNo</th>
		</tr>
		</thead>
	<c:forEach var="hospital" items="${details}">
		<tbody>
		<tr>
			<td scope="row" class="id"><c:out value="${hospital.hospitalid}" /> </td>
			<td><c:out value="${hospital.hospitalname}" /> </td>
			<td><c:out value="${hospital.city}" /> </td>
			<td><c:out value="${hospital.streetname}" /> </td>
			<td><c:out value="${hospital.zipcode}" /> </td>
			<td><c:out value="${hospital.email}" /> </td>
			<td><c:out value="${hospital.phoneno}" /> </td>
		</tr>
		</tbody>
	</c:forEach>
	</table>
	</div>
</body>
</html>
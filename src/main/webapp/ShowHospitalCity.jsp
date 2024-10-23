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
th{
text-align: center;
}
.id{
font-weight: bold;
}

</style>

</head>
<body>
<%String name=request.getParameter("username"); %>
<jsp:include page="AllHospitalModules.jsp?username=<%=name%>" />
<div class="div1">
<jsp:useBean id="hospitalimp" class="com.hospitalpro.Imp.HospitalImp" />
<c:set var="getHospitallist" value="${hospitalimp.HospitalCity()}" />
<form method="get" action="ShowHospitalCity.jsp" onchange="submit()">
<span class="span">City is :<i class="fa-solid fa-city" style="color: #003cf0;" ></i></span>
<select name="city" class="input" id="citySelect">
			<option value="">Select Gender</option>
			<c:forEach var="city" items="${getHospitallist}">
				<option value="${city}">${city}</option>
			</c:forEach>
		</select>
		</form> <br/><br/><hr/>
</div>
<c:if test="${param.city!=null}">
<c:set var="getbyid" value="${hospitalimp.getHospitalCity(param.city)}" />

<table align="center" class="table table-striped">
		<thead class="thead-dark">
    <tr>
			<th>Hospital ID</th>
			<th>Hospital Name</th>
			<th>City</th>
			<th>Street Name</th>
			<th>ZipCode</th>
			<th>Email </th>
			<th>Phone Number</th>
		</tr>
		</thead>
	<c:forEach var="hospital" items="${getbyid}">
		<tbody>
		<tr>
			<td class="id"><c:out value="${hospital.hospitalid}" /> </td>
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
</c:if>
</body>
</html>
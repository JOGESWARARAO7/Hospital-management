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
<style type="text/css">
*{
	padding:0%;
	margin: 0%;
}
body{
width: 100%;
height: 100vh;
background-image:url("videoandimg/Blue Professional Hospital Logo.png");
background-repeat:no-repeat;
background-size:contain;
background-position:center;
display: flex;
flex-direction: column;
}
td{
padding: 5%;
}
tr{
text-align: center;
}
.div1{
width: 100%;
height: 15vh;
background: rgb(118,170,235);
background: linear-gradient(83deg, rgba(118,170,235,0.8773634453781513) 0%, rgba(93,239,238,1) 100%);
display:flex;
justify-content: center;
align-items: center;
}
.inputcheck{
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
.submit{
width:100%;
height:30px;
margin: 0%;
border: 0px;
outline: none;
border-radius: 10px;
font-size:small;
}
label{
font-weight: bold;
}

</style>
</head>
<body>
<%

String name=request.getParameter("username") ;
  
%>
<jsp:include page="AllHospitalModules.jsp?username=<%=name%>" />
<div class="div1">
<form action="ShowHospitalByID.jsp" method="get">
	<table align="center" class="table table-striped">
		<tr>
			<td>
				<label for="input-1">Hospitalid:</label>
			</td>
			<td>
				<input id="input-1" placeholder="Hospital ID" type="text" name="hospitalid" class="inputcheck"/>
			</td>
			<td><input type="submit" class="submit"></td>
		</tr>
	</table>
</form>
</div>
<jsp:useBean id="hospitalimp" class="com.hospitalpro.Imp.HospitalImp" />
<c:if test="${param.hospitalid!=null }">
<c:set var="getbyid" value="${hospitalimp.gethospitalbyid(param.hospitalid)}" />

<div>

<table align="center" class="table table-striped table-hover ">
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
			<th class="id"><c:out value="${hospital.hospitalid}" /> </th>
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
</c:if>

</body>
</html>
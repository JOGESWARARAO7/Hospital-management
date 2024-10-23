<%@page import="com.hospitalpro.Imp.DactorDaoImp"%>
<%@page import="com.hospitalpro.Entity.EntityDoctor"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>

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
.select{
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

.id{
font-weight: bold;
}
.submit{
font-weight: bold;
font-size: small;
width: 140%;
height:30px;
}
.submit:hover {
	color: orange;
	font-size: medium;
	background: white;
}
</style>
</head>
<body>
<div class="div1">
<form action="SearchbyAvailableSlot.jsp" method="get" align="center" >
<table align="center" class="table table-striped">
<tr>
<td><span>AvailableSlot :</span></td>
<td>
<select name="availableslot" required="required" class="select">
            <option value="GENERAL">General</option>
            <option value="MORNING">Morning</option>
            <option value="EVENING">Evening</option>
            <option value="WEEKENDS">Weekends</option>
            <option value="CALLON">Call On</option>
        </select>
</td>
<td><input type="submit" class="select submit"></td>
</tr>
</table>
</form>
</div>
<c:if test="${param.availableslot!=null}">
<jsp:useBean id="doctorimp" class="com.hospitalpro.Imp.DactorDaoImp" />
<jsp:useBean id="entitydoctor" class="com.hospitalpro.Entity.EntityDoctor" />

<%
String availableSlot = request.getParameter("availableslot");
if (availableSlot != null) {
	entitydoctor.setAvailableslot(EntityDoctor.AvailableSlot.valueOf(availableSlot.toUpperCase()));
    List<EntityDoctor> ed=doctorimp.searchAvailableSlot(entitydoctor);
%>
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
	<%
		for(EntityDoctor entityDoctor:ed){
	%>
		<tbody>
		<tr>
			<td class="id"><%=entityDoctor.getDoctorid() %></td>
			<td><%=entityDoctor.getDoctorname()%></td>
			<td><%=entityDoctor.getSpecialization()%></td>
			<td><%=entityDoctor.getQualification()%></td>
			<td><%=entityDoctor.getAvailableslot()%></td>
		</tr>
		</tbody>
		<%
		}
	}
		%>
	</table>
</c:if>
</body>
</html>
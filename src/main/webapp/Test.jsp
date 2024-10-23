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
background-image:url("videoandimg/background.png");
background-position:center;
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
}
.div1{
width: 40%;
height: 60vh;
background-color: rgba(255, 255, 255, 0.4);
display: flex;
justify-content: center;
align-items: center;
border-radius: 30px;
font-size: large;
margin-top: 1%;
}
td{
	padding: 3%;
}
label{
font-weight: bold;
font-family: monospace;
}
.input{
width:90%;
height:30px;
margin: 0%;
border: 0px;
outline: none;
border-radius: 10px;
background-color: rgba(255, 255, 255, 0.5);
font-family: monospace;
text-align: center;
}
h5{
width:100%;
height:5%;
text-align: center;
color: white;
font-family: monospace;
font-weight: bold;
font-size:large;
}
.sub:hover{
color:orange;
background-color: white;
}
.sub{
margin-top: 10%;
}
.show{
width: 45%;
height: 7%; 
display: flex;
justify-content: center;

}
a{
text-decoration: none;
letter-spacing: 4px;
font-weight: bold;
font-size: large;
}
</style>
</head>
<body>
<jsp:include page="AllHospitalDoctorsModules.jsp"/>
<div class="div1">
<form action="Test.jsp" method="get">
<label>Doctorid</label>
<input type="text" name="dided" required="required" class="input" placeholder="Doctorid"><br>
<label>Hospitalid</label>
<input type="text" name="hid" required="required" class="input" placeholder="Hospitalid"><br>
<label>Avalible Slot</label>
<select name="availableslot" class="input" required="required" class="input">
			<option value="">*select slot*</option>
            <option value="GENERAL">General</option>
            <option value="MORNING">Morning</option>
            <option value="EVENING">Evening</option>
            <option value="WEEKENDS">Weekends</option>
            <option value="CALLON">Call On</option>
        </select><br>
        <input type="submit" class="input sub">
</form>

</div>
<c:if test="${param.dided!=null&&param.availableslot!=null}">
<jsp:useBean id="add" class="com.hospitalpro.Imp.TestImp" />
<jsp:useBean id="addtest" class="com.hospitalpro.Entity.Test" />
<%
addtest.setDoctorid(request.getParameter("dided"));
addtest.setHospitalid(request.getParameter("hid"));
String availableSlot = request.getParameter("availableslot");
if (availableSlot != null) {
	addtest.setAvailableslot(Test.AvailableSlot.valueOf(availableSlot.toUpperCase()));
}
	%>
<c:set var="result" value="${add.addTest(addtest)}" />
<c:if test="${result=='Shift Add Sucessfually'}">
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><i class="fa-solid fa-thumbs-up" style="color: #00f576;"></i>Slot is allocated sucessfully</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
<c:if test="${result!='Shift Add Sucessfually'}">
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><i class="fa-regular fa-thumbs-up fa-flip-vertical" style="color: #f50025;"></i>Slot is not a assign allready ocupied</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
	</c:if>
</body>
</html>
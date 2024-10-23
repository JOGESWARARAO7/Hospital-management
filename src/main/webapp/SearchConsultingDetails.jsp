<%@page import="java.util.Date"%>
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
input::-webkit-outer-spin-button,
      input::-webkit-inner-spin-button {
         -webkit-appearance: none;
      }
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
td{
padding: 3px;
}
</style>
</head>
<body>
<jsp:include page="AllConsultingModules.jsp" />
<div class="div1">
<form action="SearchConsultingDetails.jsp" method="get">
	<table id="table-1">
		<tr>
		<td><label for="input-1">Consulting Id :</label>
		<td><input type="number" name="consultingid" class="inputcheck"></td>
		<td><input type="submit" class="submit"></td>
		</tr>
	</table>
</form>
</div>
<c:if test="${param.consultingid!=null}">
<jsp:useBean id="consultaion" class="com.hospitalpro.Imp.ConsultionBillingImp" />

<c:set var="consultaionList" value="${consultaion.searchConsultingDetails(param.consultingid)}" />
<table class="table table-bordered">
<thead class="thead-dark">
        <tr>
            <th>ConsultionID</th>
            <th>AppointmentID</th>
            <th>PatientID</th>
            <th>STATUS</th>
            <th>FeeAmount</th>
            <th>BillingDate</th>
            <th>PaymentStatus</th>
            <th>Comments</th>
        </tr>
        </thead>
        <c:forEach var="consultaion" items="${consultaionList}">
           <tbody> <tr>
                <td>${consultaion.consultionID}</td>
                <td>${consultaion.appointmentID}</td>
                <td>${consultaion.patientID}</td>
                <td>${consultaion.status}</td>
                <td>${consultaion.feeAmount}</td>
                <td>${consultaion.billingDate}</td>
                <td>${consultaion.paymentStatus}</td>
                <td>${consultaion.comments}</td>
            </tr></tbody>
        </c:forEach>
</table>
</c:if>
</body>
</html>
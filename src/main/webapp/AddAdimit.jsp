<%@page import="com.hospitalpro.Entity.AdmitDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="videoandimg/Blue Professional Hospital Logo.png"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

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
height:auto;
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
}

.div1{
width: 45%;
height: auto;
background: rgb(154,158,159);
background: linear-gradient(83deg, rgba(154,158,159,0.6885679271708683) 0%, rgba(121,123,126,0.6081757703081232) 100%);
display: flex;
justify-content: center;
align-items: center;
border-radius: 30px;
}
td{
	padding: 3%;
}
label{
font-weight: bold;
font-family: monospace;
}
.input{
width:130%;
height:25px;
margin: 0%;
border: 0px;
outline: none;
border-radius: 10px;
background-color: rgba(255, 255, 255, 0.6);
font-family: monospace;
text-align: center;
}
.sub:hover{
color:orange;
background-color: white;
}
.show{
width: 45%;
height: 7%; 
display: flex;
justify-content: center;

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
</style>
</head>
<body>

<jsp:include page="AllAdmitModules.jsp" />
<div class="div1">
<form action="AddAdimit.jsp" method="post">
	<h5>Admit Details<i class="fa-solid fa-calendar-check" style="color: #000000;"></i></h5>

<table>
<tr>
<td>
    <label for="input-1">RoomID</label>
</td>
<td>
      <input type="number"  name="roomID" required="required" class="input" placeholder="RoomID">
    </td>
</tr>
    <tr>
<td>
    <label for="input-1">PatientID</label>
    </td>
<td>
    <input type="number"  name="patientID" required="required" class="input" placeholder="PatientID">
    </td>
    </tr>
    
    <tr>
<td>
    <label for="input-1">AppointmentId</label>
    </td>
<td>
    <input type="number"  name="appointmentId" required="required" class="input" placeholder="AppointmentId">
    </td>
    </tr>
     <tr>
<td>
    <label for="input-1">StartDate</label>
    </td>
<td>
    <input type="date"  name="startDate" required="required" class="input" placeholder="StartDate">
    </td>
    </tr>
    
    <tr>
<td>
    <label for="input-1">EndDate</label>
    </td>
<td>
    <input type="date"  name="endDate" required="required" class="input" placeholder="EndDate">
    </td>
    </tr>
    
     <tr>
<td>
    <label for="input-1">BillingAmount</label>
    </td>
<td>
    <input type="number"  name="billingAmount" required="required" class="input" placeholder="BillingAmount">
    </td>
    </tr>
    
    <tr>
<td>
    <label for="input-1">Status</label>
    </td>
<td>
    <select name="status" class="input" required="required" class="input">
        <option value="PAID">PAID</option>
        <option value="PENDING">PENDING</option>
    </select>
    </td>
    </tr>
<tr>
<td>
    <label for="input-1">Comments</label>
    </td>
<td>
    <input type="text"  name="comments" required="required" class="input" placeholder="comments">
    </td>
    </tr>

    <tr>
    <td></td>
    <td>
    <input type="submit" class="input sub" value="Add Admit">
    </td>
    </tr>
    </table>
</form>
</div>
<c:if test="${param.roomID!=null}">
<jsp:useBean id="addAdmit" class="com.hospitalpro.Imp.AdmitImp" />
<jsp:useBean id="entity" class="com.hospitalpro.Entity.AdmitDetails" />
<%
    // Manually set properties
    String roomID = request.getParameter("roomID");
    String patientID = request.getParameter("patientID");
    String appointmentID = request.getParameter("appointmentId");
    String startDateStr = request.getParameter("startDate");
    String endDateStr = request.getParameter("endDate");
    String billingAmount = request.getParameter("billingAmount");
    String status = request.getParameter("status");
    String comments = request.getParameter("comments");

    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
    try {
        entity.setStartDate(sdf.parse(startDateStr));
        entity.setEndDate(sdf.parse(endDateStr));
    } catch (java.text.ParseException e) {
        e.printStackTrace();
    }

    entity.setRoomID(Integer.parseInt(roomID));
    entity.setPatientID(Integer.parseInt(patientID));
    entity.setAppointmentID(Integer.parseInt(appointmentID));
    entity.setBillingAmount(Double.parseDouble(billingAmount));
    if (status != null) {
    	entity.setStatus(AdmitDetails.Status.valueOf(status.toUpperCase()));
    }
    entity.setComments(comments);
%>
<c:set var="result" value="${addAdmit.addAdmit(entity)}" />
<c:if test="${result=='Sucessfully'}">
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><i class="fa-solid fa-thumbs-up" style="color: #00f576;"></i>Slot is allocated sucessfully</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
<c:if test="${result!='Sucessfully'}">
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><i class="fa-regular fa-thumbs-up fa-flip-vertical" style="color: #f50025;"></i>Slot is not a assign allready ocupied</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
</c:if>
</body>
</html>
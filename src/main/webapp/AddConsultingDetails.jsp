<%@page import="com.hospitalpro.Entity.ConsultionBilling"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Consultation Billing</title>
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
height: auto;
background-image:url("videoandimg/Appointment.png");
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
<jsp:include page="AllConsultingModules.jsp" />
<div class="div1">
<form action="AddConsultingDetails.jsp" method="post">
	<h5>Consultation Billing Details<i class="fa-solid fa-calendar-check" style="color: #000000;"></i></h5>
	<table>
		<tr>
			<td><label for="appointmentID">AppointmentID</label></td>
			<td><input type="number" name="appointmentID" required="required" class="input" placeholder="AppointmentID"></td>
		</tr>
		<tr>
			<td><label for="patientID">PatientID</label></td>
			<td><input type="number" name="patientID" required="required" class="input" placeholder="PatientID"></td>
		</tr>
		<tr>
			<td><label for="status">Status</label></td>
			<td>
				<select name="status" class="input" required="required">
				<option value="">*Select Status*</option>
					<option value="VISIT">VISIT</option>
					<option value="ADMIT">ADMIT</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><label for="feeAmount">Fee Amount</label></td>
			<td><input type="number" step="0.01" name="feeAmount" required="required" class="input" placeholder="Fee Amount"></td>
		</tr>
		<tr>
			<td><label for="billingDate">Billing Date</label></td>
			<td><input type="date" name="billingDate" required="required" class="input" placeholder="Billing Date"></td>
		</tr>
		<tr>
			<td><label for="paymentStatus">Payment Status</label></td>
			<td>
				<select name="paymentStatus" class="input" required="required">
				<option value="">*PaymentStatus"</option>
					<option value="PENDING">PENDING</option>
					<option value="PAID">PAID</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><label for="comments">Comments</label></td>
			<td><input type="text" name="comments" class="input" placeholder="Comments"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" class="input sub" value="Add Billing"></td>
		</tr>
	</table>
</form>
</div>

<c:if test="${param.appointmentID != null}">
<jsp:useBean id="consultionBilling" class="com.hospitalpro.Imp.ConsultionBillingImp" />
<jsp:useBean id="consultionBillingService" class="com.hospitalpro.Entity.ConsultionBilling" />
<%
	// Manually set properties
	String appointmentID = request.getParameter("appointmentID");
	String patientID = request.getParameter("patientID");
	String status = request.getParameter("status");
	String feeAmount = request.getParameter("feeAmount");
	String billingDateStr = request.getParameter("billingDate");
	String paymentStatus = request.getParameter("paymentStatus");
	String comments = request.getParameter("comments");

	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	try {
		consultionBillingService.setBillingDate(sdf.parse(billingDateStr));
	} catch (java.text.ParseException e) {
		e.printStackTrace();
	}

	consultionBillingService.setAppointmentID(Integer.parseInt(appointmentID));
	consultionBillingService.setPatientID(Integer.parseInt(patientID));
	consultionBillingService.setStatus(ConsultionBilling.Status.valueOf(status.toUpperCase()));
	consultionBillingService.setFeeAmount(Double.parseDouble(feeAmount));
	consultionBillingService.setPaymentStatus(ConsultionBilling.PaymentStatus.valueOf(paymentStatus.toUpperCase()));
	consultionBillingService.setComments(comments);

%>
<c:set var="result" value="${consultionBilling.addConsultingDetails(consultionBillingService)}" />
<c:if test="${result=='Sucessfully'}">
	<div class="alert alert-success" role="alert">
		<strong>Billing added successfully!</strong>
	</div>
</c:if>
<c:if test="${result!='Sucessfully'}">
	<div class="alert alert-danger" role="alert">
		<strong>Failed to add billing!</strong>
	</div>
</c:if>
</c:if>

</body>
</html>

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
height: auto;
display: flex;
flex-direction: column;
}
td{
padding: 5%;
}
tr{
text-align: center;
}
td{
padding: 3px;
}
</style>
</head>
<body>
<jsp:include page="AllAdminModules.jsp" />
<jsp:useBean id="adminDetails" class="com.hospitalpro.Imp.AdminImp" />

<c:set var="AdminList" value="${adminDetails.showAdmin()}" />
<table class="table table-bordered">
<thead class="thead-dark">
        <tr>
            <th>AdminId</th>
            <th>HospitalId</th>
            <th>UserName</th>
            <th>Passcode</th>
            <th>Otp</th>
            <th>OtpPurpose</th>
            <th>Status</th>
        </tr>
        </thead>
        <c:forEach var="admin" items="${AdminList}">
           <tbody> <tr>
                <td>${admin.adminid}</td>
                <td>${admin.hospitalid}</td>
                <td>${admin.username}</td>
                <td>${admin.passcode}</td>
                <td>${admin.otp}</td>
                <td>${admin.otppurpose}</td>
                <td>${admin.status}</td>
            </tr></tbody>
        </c:forEach>
</table>
</body>
</html>
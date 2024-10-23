<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="AsignHospitalDoctors.jsp" method="get">
<table border="2">
	<tr>
	<td>
	<label>Doctor ID:</label>
	</td>
	<td>
	<input type="text" name="doctorid">
	</td>
	</tr>
	<tr>
	<td>
	<label>Hospital ID:</label>
	</td>
	<td>
	<input type="text" name="hospitalid">
	</td>
	</tr>
	<tr>
	<td>
	<input type="submit" >
	</td>
	</tr>
	</table>
</form>
<jsp:useBean id="hospitaldoctors" class="com.hospitalpro.Imp.HospitalDoctorsImp" />
<jsp:useBean id="hdentity" class="com.hospitalpro.Entity.HospitalDoctor" />
<jsp:setProperty property="*" name="hdentity"/>
<c:if test="${param.doctorid!=null && param.hospitalid!=null }">
<c:out value="${hospitaldoctors.assignHD(hdentity)}"></c:out>
</c:if>
</body>
</html>
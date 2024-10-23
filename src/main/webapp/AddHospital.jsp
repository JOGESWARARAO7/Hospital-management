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
height: auto;
background-image:url("videoandimg/Hospitals.png");
background-size:cover;
background-repeat:no-repeat;
background-position:center;
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
}
.div1{
width: 45%;
height: auto;
background: rgb(154,158,159);
background: linear-gradient(83deg, rgba(154,158,159,0.6885679271708683) 0%, rgba(121,123,126,0.6101365546218487) 100%);
display: flex;
justify-content: center;
align-items: center;
border-radius: 30px;
font-size: large;
margin-top: 2%;
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
.show{
width: 45%;
height: 7%; 
display: flex;
justify-content: center;

}
.check{
width:110%;
height:25px;
margin-left: 7%;
}
a{
text-decoration: none;
letter-spacing: 3px;
}
</style>
</head>
<body>
<jsp:include page="AllHospitalModules.jsp" />
<div class="div1">
	<form id="form-1" action="AddHospital.jsp" method="post">
		<h5>Add Hospital<i class="fa-regular fa-hospital" style="color: #000000;"></i></h5>
	
		<table id="table-1">
			<tr>
			<td>
				<label for="input-1">hospitalid:</label>
			</td>
			<td>
				<input id="input-1" placeholder="hospitalid" type="text" name="hospitalid" class="input" required="required" autofocus="autofocus"/>
			</td>
			</tr>
			<tr>
			<td>
				<label for="input-1">hospitalName:</label>
			</td>
			<td>
				<input id="input-1" placeholder="hospitalName" type="text" name="hospitalname" class="input" required="required"/>
			</td>
			</tr>
			<tr>
			<td>
				<label for="input-1">City:</label>
				</td>
			<td>
				<input id="input-1" placeholder="City" type="text" name="city" class="input" required="required"/>
			</td>
			</tr>
			<tr>
			<td>
				<label for="input-1">StreetName:</label>
				</td>
			<td>
				<input id="input-1" placeholder="StreetName" type="text" name="streetname" class="input" required="required"/>
			</td>
			</tr>
			<tr>
			<td>
				<label for="input-1">ZipCode:</label>
				</td>
			<td>
				<input id="input-1" placeholder="ZipCode" type="text" name="zipcode" class="input" required="required"/>
			</td>
			</tr>
			<tr>
			<td>
				<label for="input-1">Email:</label>
				</td>
			<td>
				<input id="input-1" placeholder="Email" type="text" name="email" class="input" required="required"/>
			</td>
			</tr>
			<tr>
			<td>
				<label for="input-1">PhoneNo:</label>
				</td>
			<td>
				<input id="input-1" placeholder="PhoneNo" type="text" name="phoneno" class="input" required="required"/>
			</td>
			</tr>
			<tr>
			<td></td>
			<td><input type="submit" class="input sub"></td>
			</tr>
		</table>
	</form>
	<c:if test="${param.hospitalid!=null}">
	<jsp:useBean id="hospitalimp" class="com.hospitalpro.Imp.HospitalImp" />
	<jsp:useBean id="hospitalentity" class="com.hospitalpro.Entity.Hospital" />
	<jsp:setProperty property="*" name="hospitalentity"/>
	</div>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><i class="fa-solid fa-thumbs-up" style="color: #00f576;"></i><c:out value="${hospitalimp.addHospital(hospitalentity)}" /></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
</body>
</html>
<%@page import="com.hospitalpro.Entity.EntityDoctor"%>
<%@page import="com.hospitalpro.Imp.DactorDaoImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	margin: 0%;
	padding: 0%;
}
body {
	width:100%;
	height:100vh;
	display: flex;
	justify-content: center;
	align-items:center;
	background: rgb(2,0,36);
	background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,121,106,1) 1%, rgba(0,194,255,1) 100%);
	flex-wrap: wrap;
}
.buble{
width: 20%;
height:45vh;
background-color: red;
border-radius: 100%;
position: absolute;

}
.buble{
 animation-name: buble;
 animation-duration: 30s;
 animation-timing-function: linear;
 animation-iteration-count: infinite;
}
 @keyframes buble {
            0%{
           		width: 20%;
                height:40vh;
                left: 0px;
                top: 0px;
background: rgb(2,0,36);
background: linear-gradient(83deg, rgba(2,0,36,1) 0%, rgba(246,246,246,0.2639180672268907) 0%, rgba(203,218,233,0.6112570028011204) 100%);
	box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
            }
            15%{
            	width: 20%;
                height:40vh;
                left: 80%;
                top: 0%;
background: rgb(2,0,36);
background: linear-gradient(83deg, rgba(2,0,36,1) 0%, rgba(246,246,246,0.2639180672268907) 0%, rgba(203,218,233,0.6112570028011204) 100%);
	box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
}
            25%{
            	width: 20%;
                height: 40vh;
                left:0%;
                top: 60%;
               background: rgb(2,0,36);
               box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
background: linear-gradient(83deg, rgba(2,0,36,1) 0%, rgba(246,246,246,0.2639180672268907) 0%, rgba(203,218,233,0.6112570028011204) 100%);
            }
            35%{
            	width: 20%;
                height: 40vh;
                left:80%;
                top:0%;
                box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
background: rgb(2,0,36);
background: linear-gradient(83deg, rgba(2,0,36,1) 0%, rgba(246,246,246,0.2639180672268907) 0%, rgba(203,218,233,0.6112570028011204) 100%);
            }
            50%{
            	width: 20%;
                height: 40vh;
                left:80%;
                top:60% ;
                box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
               background: rgb(2,0,36);
background: linear-gradient(83deg, rgba(2,0,36,1) 0%, rgba(246,246,246,0.2639180672268907) 0%, rgba(203,218,233,0.6112570028011204) 100%);
            }
            65%{
            	width: 20%;
                height: 40vh;
                left:-0%;
                top:60% ;
                box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
               background: rgb(2,0,36);
background: linear-gradient(83deg, rgba(2,0,36,1) 0%, rgba(246,246,246,0.2639180672268907) 0%, rgba(203,218,233,0.6112570028011204) 100%);
            }
            75%{
                left:-0%;
                top:-0%;
                box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
			background: rgb(2,0,36);
background: linear-gradient(83deg, rgba(2,0,36,1) 0%, rgba(246,246,246,0.2639180672268907) 0%, rgba(203,218,233,0.6112570028011204) 100%);
				width: 20%;
                height:40vh;
            }
            85%{
            	width: 20%;
                height:40vh;
                left:38%;
                top:26% ;
                box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
               background: rgb(2,0,36);
background: linear-gradient(83deg, rgba(2,0,36,1) 0%, rgba(246,246,246,0.2639180672268907) 0%, rgba(203,218,233,0.6112570028011204) 100%);
                
            }
            95%{
            	width: 30%;
                height:55vh;
                left:38%;
                top:26%;
                box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
background: rgb(2,0,36);
background: radial-gradient(circle, rgba(2,0,36,1) 0%, rgba(201,30,30,1) 0%, rgba(63,134,132,1) 36%, rgba(154,51,157,1) 52%, rgba(71,177,113,1) 65%, rgba(168,61,81,1) 71%, rgba(128,127,80,1) 80%, rgba(126,119,94,1) 86%, rgba(143,86,141,1) 91%, rgba(86,165,181,1) 95%, rgba(1,128,255,0.6112570028011204) 100%);                
            }
            100%{
            	width: 0%;
                height:0vh;
                left:38%;
                top:26%;
                box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
               background: rgb(2,0,36);
background: radial-gradient(circle, rgba(2,0,36,1) 0%, rgba(201,30,30,1) 0%, rgba(63,134,132,1) 36%, rgba(154,51,157,1) 52%, rgba(71,177,113,1) 65%, rgba(168,61,81,1) 71%, rgba(128,127,80,1) 80%, rgba(126,119,94,1) 86%, rgba(143,86,141,1) 91%, rgba(86,165,181,1) 95%, rgba(1,128,255,0.6112570028011204) 100%);
               }
        }
.formdiv{
width:40%;
height: 60vh;
display: flex;
justify-content: center;
align-items:center;
flex-direction:column;
background: rgb(2,0,36);
background: linear-gradient(83deg, rgba(2,0,36,1) 0%, rgba(176,238,237,1) 0%, rgba(9,207,239,0.7261029411764706) 100%);
border-radius: 20px;
position: static;
z-index: 1;
}
.doctortable{
border: none;
border-collapse: collapse;
width: 100%;

}
tr{
text-align: center;
}
th,td{
padding:10px;
text-align: center;
font-weight: bold;
font-size: medium;
}
.input{
height: 27px;
width: 110%;
background: rgb(2,0,36);
background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(190,194,194,1) 0%, rgba(255,255,255,1) 100%);
border: none;
margin: 0%;
border-radius: 20px;
font-weight: bold;
font-size:medium;
text-align:center; 
}
select{
background: rgba(0, 0, 0, 0.3);
  color:black;
  text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
  }
 select option {
  margin: 40px;
background:rgba(2, 169, 99, 0.27);
  color: black;
  font-weight:bold;
  text-shadow: 4px 7px 7px rgba(0,0,0,0.74);
}
button{
height: 27px;
width: 80%;
border-radius: 20px;
font-size:xx-small;
border: none;
margin: 0%;
filter: blur(1px);
transition: all 1s ease-out;
}
a{

}
.form button:hover{
	filter: blur(0px);
	font-weight:lighter;
	font-size:small;
	transform: scale(1.2,1.2); 
	
}
.home{
color: blue;

}
h3{
width:40%;
height: 5vh;
border-radius:20px;
text-align: center;
}
.resultdiv{
width:100%;
height: 5vh;
display: flex;
justify-content: center;
}

</style>
</head>
<body >
<div class="buble"></div>
<div class="formdiv">
<form action="AddDoctorDetail.jsp" method="get" class="form">
<table class="doctortable">
<h2>Enter the user date</h2>
<tr>
<td>Doctor Name</td><td>:</td><td><input type="text" name="dname" class="input" required="required" autofocus="autofocus"></td>
</tr>
<tr>
<td>Specialization</td><td>:</td><td><input type="text" name="specialization" class="input" required="required"></td>
</tr>
<tr>
<td>Qualification</td><td>:</td><td><input type="text" name="qualification" class="input" required="required"></td>
</tr>
<tr>
<td>Availableslot</td><td>:</td><td>
<select name="availableslot" class="input" required="required">
			<option value="">*select slot*</option>
            <option value="GENERAL">General</option>
            <option value="MORNING">Morning</option>
            <option value="EVENING">Evening</option>
            <option value="WEEKENDS">Weekends</option>
            <option value="CALLON">Call On</option>
        </select>
</td>
</tr>
<tr><td></td><td></td><td><button>Submit</button></td></tr>
</table>
</form>
</div>
<c:if test="${param.dname!=null && param.availableslot!=null}">
<jsp:useBean id="dactorimp" class="com.hospitalpro.Imp.DactorDaoImp" />
<jsp:useBean id="entitydoctor" class="com.hospitalpro.Entity.EntityDoctor" />
	<%
entitydoctor.setDoctorname(request.getParameter("dname"));
entitydoctor.setSpecialization(request.getParameter("specialization"));
entitydoctor.setQualification(request.getParameter("qualification"));
String availableSlot = request.getParameter("availableslot");
if (availableSlot != null) {
    entitydoctor.setAvailableslot(EntityDoctor.AvailableSlot.valueOf(availableSlot.toUpperCase()));
}
	%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><i class="fa-solid fa-thumbs-up" style="color: #00f576;"></i><c:out value="${dactorimp.addDoctor(entitydoctor)}" /></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
</body>
</html>
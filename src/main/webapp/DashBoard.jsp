<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="videoandimg/Blue Professional Hospital Logo.png"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
*{
	margin: 0%;
	padding: 0%;
}
body{
	width: 100%;
	height: auto;
	background-image:url("videoandimg/background.png");
	background-size:cover;
	background-position:center
	display: flex;
	flex-direction: column;
}
.header{
width: 100%;
height: 20vh;
background: rgb(130,179,240);
background: linear-gradient(83deg, rgba(130,179,240,1) 0%, rgba(116,218,240,1) 100%);
display: flex;
justify-content:center;
align-items: center;
font-size: x-large;
flex-direction: row;

}
h2{
width: 90%;
    height: 20%;
    text-align: center;
}
h2:after
{
    content: '';
    position:absolute;
    left:0;
    top:0;
    width: 90%;
    height: 20%;
    background: radial-gradient(circle, transparent 70%, transparent 70%),
    radial-gradient(circle, transparent 60%, white 70%) 30px 30px;
    background-size:4px 4px;
    text-align: center;

}
.videologo{
width: 10%;
height: 20vh;
}
.sapnanme{ 
color: red;
}
.Detiails{
	width:100%;
	height:Auto;
	display: flex;
	justify-content: space-around;
	align-self: center;
	flex-wrap: wrap;
}
.one{
width: 27%;
height:32vh;
background: rgb(246,248,248);
background: linear-gradient(83deg, rgba(246,248,248,0.5580357142857143) 0%, rgba(247,251,251,0.6392682072829132) 100%);
box-shadow: -29px 31px 22px -3px rgba(0,0,0,0.4);
border-radius:10px;
margin-top: 3%;
display: flex;
justify-content:center;
align-items:center;
flex-direction: column;
text-align:right;

}
button{
width: 100%;
height: 7vh;
font-size: large;
font-weight: bold;
border: none;
}
small{
display:none;
}
.one:hover small{
text-align: left;
display:flex;
flex-direction: column;
font-weight: bold;
}
h6{
font-family: monospace;
font-weight: bold;
}
.no{
visibility: hidden;
}
i{
font-size:200%;
}
.span{
font-size: small;
color: #D2691E;
}
</style>
</head>
<body>
<%

String name=request.getParameter("username") ;
  
%>

<div class="header">
<h2>Wellcome to the <span class="sapnanme">JMMA</span> Group of Hospitails</h2>
<video src="videoandimg/Blue Professional Hospital Logo.mp4" class="videologo" autoplay muted loop="loop"></video>
</div>
<a href="Homepage.jsp?username=<%=name%>"><button>Home_Page</button></a>
<div class="Detiails">

<div class="one">
<h6>Admin</h6>
<a href="AllAdminModules.jsp?username=<%=name%>"><i class="fa-solid fa-user-tie"></i></a>
<small>
<span class="span">Add Admin</span>
<span class="span">Show Admin</span>

</small>

</div>
<div class="one">
<h6>Hospitals</h6>
<a href="AllHospitalModules.jsp?username=<%=name%>"><i class="fa-solid fa-hospital"></i></a>
<small><span class="span">Add Hospital</span>
<span class="span">Show Hospital</span>
<span class="span">Show HospitalBy ID</span>
<span class="span">Show HospitalBy City</span></small>
</div>
<div class="one">
<h6>Doctors</h6>
<a href="AllDoctorModules.jsp?username=<%=name%>"><i class="fa-solid fa-user-doctor"></i></a>
<small><span class="span">Add Doctors</span>
<span class="span">Show Doctors</span></small>
</div>
<div class="one">
<h6>Hospital Doctors</h6>
<a href="AllHospitalDoctorsModules.jsp?username=<%=name%>"><i class="fa-solid fa-stethoscope"></i></a>
<small><span class="span">Slot Arrange by a Doctors</span>
<span class="span">Avalible Docator on shift</span></small>
</div>
<div class="one">
<h6>Appointment</h6>
<a href="AllAppointmentModules.jsp?username=<%=name%>"><i class="fa-regular fa-calendar-check"></i></a>
<small><span class="span">Add Appointment</a></span>
<span class="span">Show Appointments</a></span>
<span class="span">Cancel Appointments</a></span></small>
</div>
<div class="one">
<h6>Room Details</h6>
<a href="AllRoomModules.jsp?username=<%=name%>"><i class="fa-solid fa-restroom"></i></a>
<small>
<span class="span">Add Room</a></span>
<span class="span">Show Room</a></span>
<span class="span">SearchRoom(By Id/THREE/TWO/DELUX/SUITE)</a></span>
<span class="span">ShowAvailableRooms</a></span>
</small>
</div>
<div class="one">
<h6>Adimit</h6>
<a href="AllAdmitModules.jsp?username=<%=name%>"><i class="fa-solid fa-bed"></i></a>
<small>
<span class="span">Add Adimit</a></span>
</small>
</div>

<div class="one">
<h6>ConsultionBilling</h6>
<a href="AllConsultingModules.jsp?username=<%=name%>"><i class="fa-solid fa-hand-holding-dollar"></i></a>
<small>
<span class="span">AddConsultingDetails</a></span>
<span class="span">ShowConsultingDetails of Particular Date</a></span>
<span class="span">SearchConsultingDetails</a></span>
<span class="span">ShowConsulting PENDING</a></span>

</small>
</div>

<div class="one no">
</div>
</div>

</body>
</html>
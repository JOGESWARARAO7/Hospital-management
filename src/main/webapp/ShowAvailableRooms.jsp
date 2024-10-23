<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Rooms</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
height:auto;
display: flex;
justify-content: center;
flex-direction: column;
}
table{
background: rgb(154,158,159);
background: linear-gradient(83deg, rgba(154,158,159,0.6885679271708683) 0%, rgba(121,123,126,0.6101365546218487) 100%);
}
td{
padding: 1%;
color:black;
}
th{
text-align: center;
}
.heading{
width: 100%;
height: 8vh;
text-align: center;
background: rgb(118,176,235);
background: linear-gradient(83deg, rgba(118,176,235,0.5773634453781513) 0%, rgba(141,245,244,0.5) 100%);
display: flex;
justify-content: center;
align-items: center;
}
</style>
</head>
<body>
<jsp:include page="AllRoomModules.jsp"/>
<jsp:useBean id="Showroom" class="com.hospitalpro.Imp.RoomDetailsDaoImpl" />
<h5 class="heading">Avaliable Room details <i class="fa-solid fa-circle-info"></i></h5>

<c:set var="roomList" value="${Showroom.showAvailableRooms()}" />
<table class="table table-bordered">
    <thead class="thead-dark">
        <tr>
            <th scope="col"><i class="fa-solid fa-fingerprint" style="color: #f9fafb;"></i>Room ID</th>
            <th scope="col"><i class="fa-solid fa-quote-left" style="color: #f3f4f7;"></i>Room Type</th>
            <th scope="col"><i class="fa-solid fa-hand-holding-dollar" style="color: #f7f7f8;"></i>Room Fare</th>
            <th scope="col"><i class="fa-brands fa-usps" style="color: #f1f2f3;"></i>Room Status</th>
            <th scope="col"><i class="fa-solid fa-user-astronaut" style="color: #f4f5f6;"></i>Room filled</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="room" items="${roomList}">
            <tr>
                <td scope="row" class="table-primary">${room.roomId}</td>
                <td>${room.roomType}</td>
                <td>${room.roomFare}</td>
                <td>${room.roomStatus}</td>
                <td>${room.roomalocate}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>

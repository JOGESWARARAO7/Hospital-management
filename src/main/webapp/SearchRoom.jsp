<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Room</title>
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
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
}
.div1{
width: 100%;
height: 10vh;
background: rgb(118,170,235);
background: linear-gradient(83deg, rgba(118,170,235,0.8773634453781513) 0%, rgba(93,239,238,1) 100%);
display: flex;
justify-content: center;
align-items: center;
}
.input{
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
td{
padding: 5px;
}
.sub:hover{
color:orange;
background-color: white;
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
<h5 class="heading">All Room details <i class="fa-solid fa-circle-info"></i></h5>

<div class="div1">
<jsp:useBean id="Showroom" class="com.hospitalpro.Imp.RoomDetailsDaoImpl" />

<form action="SearchRoom.jsp" method="get">
<table>
<tr>
<td>
    <label>Search By Room ID</label>
</td>
<td>
    <input type="number" name="roomId" class="input" placeholder="Room ID">
</td>
<td>
    <label>Or Search By Room Type</label>
</td>
<td>
    <select name="roomType" class="input">
        <option value="">*Select Room Type*</option>
        <option value="THREE">Three</option>
        <option value="TWO">Two</option>
        <option value="DELUX">Delux</option>
        <option value="SUITE">Suite</option>
    </select>
</td>
<td>
    <input type="submit" class="input sub" value="Search Room">
    </td>
    </tr>
    </table>
</form>
</div>
<c:if test="${param.roomId!=null}">
<c:set var="roomList" value="${Showroom.searchRoomById(param.roomId)}" />
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Room ID</th>
                <th scope="col">Room Type</th>
                <th scope="col">Room Fare</th>
                <th scope="col">Room Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="room" items="${roomList}">
            <tr>
                <td class="table-primary">${room.roomId}</td>
                <td>${room.roomType}</td>
                <td>${room.roomFare}</td>
                <td>${room.roomStatus}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</c:if>
<c:if test="${param.roomType!=null}">
<c:set var="roomList" value="${Showroom.searchRoomByType(param.roomType)}" />
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Room ID</th>
                <th scope="col">Room Type</th>
                <th scope="col">Room Fare</th>
                <th scope="col">Room Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="room" items="${roomList}">
            <tr>
                <td class="table-primary">${room.roomId}</td>
                <td>${room.roomType}</td>
                <td>${room.roomFare}</td>
                <td>${room.roomStatus}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Room</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style type="text/css">
    /* Your CSS styles */
    
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
margin-top:5%;
width: 45%;
height:60vh;
background: rgb(117,196,213);
background: linear-gradient(83deg, rgba(117,196,213,0.4) 0%, rgba(134,170,225,0.4) 100%);
display: flex;
justify-content: center;
align-items: center;
border-radius: 30px;
}
.input{
width:130%;
height:30px;
margin: 0%;
border: 0px;
outline: none;
border-radius: 10px;
background-color: rgba(255, 255, 255, 0.5);
font-family: monospace;
text-align: center;
}
td{
	padding: 3%;
}
.sub:hover{
color:orange;
background-color: white;
}
label{
font-weight: bold;
font-family: monospace;
}
</style>
</head>
<body>
<jsp:include page="AllRoomModules.jsp"/>
<div class="div1">
<form action="AddRoom.jsp" method="post">
<table>
<tr>
<td>
    <label for="input-1">Room_Type</label>
</td>
<td>
    <select name="roomType" class="input" required="required" class="input">
        <option value="">*Select Room Type*</option>
        <option value="THREE">Three</option>
        <option value="TWO">Two</option>
        <option value="DELUX">Delux</option>
        <option value="SUITE">Suite</option>
    </select>
    </td>
</tr>
    <tr>
<td>
    <label for="input-1">Room_Fare</label>
    </td>
<td>
    <input type="number" step="0.01" name="roomFare" required="required" class="input" placeholder="Room Fare"><br>
    </td>
    </tr>
    
    <tr>
<td>
    <label for="input-1">Room_Status</label>
     </td>
<td>
    <select name="roomStatus" class="input" required="required" class="input">
        <option value="VACANT">Vacant</option>
        <option value="OCCUPIED">Occupied</option>
    </select>
    </td>
    </tr>
    <tr>
    <td></td>
    <td>
    <input type="submit" class="input sub" value="Add Room">
    </td>
    </tr>
    </table>
</form>
</div>
<c:if test="${param.roomType!=null}">
<jsp:useBean id="addroom" class="com.hospitalpro.Imp.RoomDetailsDaoImpl" />
<jsp:useBean id="entity" class="com.hospitalpro.Entity.RoomDetails" />
<jsp:setProperty property="*" name="entity"/>
<c:if test="${addroom.addRoom(entity)=='Data Add'}">
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><i class="fa-solid fa-thumbs-up" style="color: #00f576;"></i>Room Add.....</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
</c:if>
</c:if>
</body>
</html>

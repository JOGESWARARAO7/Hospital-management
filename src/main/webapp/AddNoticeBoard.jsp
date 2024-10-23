<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
</head>
<body>
   <form action="AddNoticeBoard.jsp">
   name:
   <input type="text" placeholder="topic" name=topic>
   active:
   <input type="text" placeholder="Active/NotActive" name=status>
   <input type="submit" >
   </form>
   <c:if test="${param.topic!=null&&(param.status=='Active' || param.status=='NotActive')}">
   <jsp:useBean id="points" class="com.hospitalpro.Imp.NoticeBoardImp" />
   <jsp:useBean id="entity" class="com.hospitalpro.Entity.NotiesBoard" />
   <jsp:setProperty property="topic" name="entity" />
       <jsp:setProperty property="status" name="entity" />
   <c:out value="${points.adddata(entity)}" />
   </c:if>
</body>
</html>

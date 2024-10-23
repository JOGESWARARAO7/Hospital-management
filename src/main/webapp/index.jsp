<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
</head>
<body>
   <form action="index.jsp">
   name:
   <input type="text" placeholder="name" name=keypoint>
   active:
   <input type="text" placeholder="Active/NotActive" name=status>
   <input type="submit" >
   </form>
   <c:if test="${param.keypoint!=null&&(param.status=='Active' || param.status=='NotActive')}">
   <jsp:useBean id="points" class="com.hospitalpro.Imp.KeyPoint" />
   <jsp:useBean id="entity" class="com.hospitalpro.Entity.KeyPoints" />
   <jsp:setProperty property="keypoint" name="entity" />
       <jsp:setProperty property="status" name="entity" />
   <c:out value="${points.adding(entity)}" />
   </c:if>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<jsp:include page="include/resource.jsp"/>
</head>
<body>
<jsp:include page="include/navbar-new.jsp"/>

<div class="container">
	<h1>Main Page</h1>
	
	<c:choose>
		<c:when test="${empty sessionScope.isAdmin }">
		</c:when>
		<c:otherwise>
			<a href="emp/insertform.go">사원 추가(임시)</a>
		</c:otherwise>
	</c:choose>
</div>

</body>
</html>
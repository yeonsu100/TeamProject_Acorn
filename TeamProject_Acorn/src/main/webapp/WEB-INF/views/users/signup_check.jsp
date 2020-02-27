<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup_check.jsp</title>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<c:choose>
		<c:when test="${not empty sessionScope.ename }">
			<p>
				<strong>${ename }</strong> 사원님 회원가입을 시작합니다.
				<a href="${url }">확인</a>
			</p>
		</c:when>
		<c:otherwise>
			<p>
				등록되지 않은 사원입니다. 문제 지속시 전산실에 문의하시기 바랍니다.
				<a href="signup_checkform.go?url=${encodedUrl }">돌아가기</a>
			</p>
		</c:otherwise>
	</c:choose>	
</div>
</body>
</html>
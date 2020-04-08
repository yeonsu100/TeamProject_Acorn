<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/favicon.ico">
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${not empty sessionScope.ename && sessionScope.isUserExist==false }">
			<script>
				alert("${ename } 사원님 회원가입을 시작합니다.");
				location.href="${url }";
			</script>
		</c:when>
		<c:when test="${not empty sessionScope.ename && sessionScope.isUserExist==true }">
			<script>
				alert("이미 가입 된 회원입니다. 로그인 화면으로 이동합니다.");
				location.href="${pageContext.request.contextPath }/home.go";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("등록되지 않은 사원입니다. 문제 지속시 전산실에 문의하시기 바랍니다.");
				location.href="signup_checkform.go?url=${encodedUrl }";
			</script>
		</c:otherwise>
	</c:choose>	
</div>
</body>
</html>
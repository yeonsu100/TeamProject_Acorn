<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${not empty sessionScope.id }">
			<script>
				alert("성공적으로 로그인 되었습니다!");
				location.href="${pageContext.request.contextPath }/home.go";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("아이디 혹은 비밀번호가 일치하지 않습니다. 다시 시도해주세요");
				location.href="${pageContext.request.contextPath }/home.go";
			</script>			
		</c:otherwise>
	</c:choose>
	
	
</div>
</body>
</html>
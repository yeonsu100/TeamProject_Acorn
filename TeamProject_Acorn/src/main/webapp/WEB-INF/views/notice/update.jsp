<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>>
<div class="container">
		<script>
			alert("글을 수정했습니다.");
			location.href="${pageContext.request.contextPath }/notice/detail.go?num=${num}";
		</script>
</div>
</body>
</html>
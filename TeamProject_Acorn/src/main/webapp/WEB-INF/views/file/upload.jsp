<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/upload.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>

<div class="container">
	<h1>Alert</h1>
	
	<c:choose>
		<c:when test="${isSuccess }">
			<script>
				alert("게시물이 정상적으로 업로드 되었습니다")
				location.href="list.go";
			</script>
		</c:when>
		<c:otherwise>
			<h1>Alert!</h1>
			<p>업로드 실패
			<a href="upload_form.go">다시 시도해 주세요.</a>
			</p>
		</c:otherwise>
	</c:choose>

</div>

</body>
</html>
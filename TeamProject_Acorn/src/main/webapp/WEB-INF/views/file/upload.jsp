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
				alert("Successfully Updated!")
				location.href="list.go";
			</script>
		</c:when>
		<c:otherwise>
			<h1>Alert</h1>
			<p>Failure to update
			<a href="upload_form.go">Please try it again.</a>
			</p>
		</c:otherwise>
	</c:choose>

</div>

</body>
</html>
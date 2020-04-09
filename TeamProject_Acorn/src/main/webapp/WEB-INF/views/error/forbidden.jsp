<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forbidden Error</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>

<div class="container">
	<h1>Forbidden Request!</h1>
	<p class="alert alert-danger">${msg }
	<a class="alert-link" href="${pageContext.request.contextPath }/home.go">Turn Back</a>
	</p>
</div>

</body>
</html>
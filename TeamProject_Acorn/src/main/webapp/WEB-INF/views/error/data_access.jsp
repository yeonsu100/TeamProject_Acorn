<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data access Error</title>
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/favicon.ico">
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="shop" name="category"/>
</jsp:include>

<div class="container">
	<h1>Erupted an Error about DB!</h1>
	<p class="alert alert-danger">${exception.message }</p>
	<a href="${pageContext.request.contextPath }/home.go">Back to the main page (index page)</a>
</div>

</body>
</html>
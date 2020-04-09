<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data access Error</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="shop" name="category"/>
</jsp:include>

<div class="container">
	<h1>관계자 외 접근 불가능한 데이터베이스입니다!</h1>
		<p class="alert alert-danger">${exception.message }<br/>
		<a href="${pageContext.request.contextPath }/home.go">메인 화면으로 돌아가기</a>
		<img src="${pageContext.request.contextPath }/resources/images/stop.jpg"/>
		</p>
</div>

</body>
</html>
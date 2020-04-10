<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Error</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource.jsp"/>
</head>
<body>

<div class="container">
	<h1>에러발생 - 에러코드 404</h1>
	<p class="alert alert-danger">
		요청하신 페이지는 존재하지 않습니다. <br/>
		<a href="${pageContext.request.contextPath }/home.go">메인 화면으로 돌아가기</a><br/>
		<img src="${pageContext.request.contextPath }/resources/images/not-found.gif"/>
	</p>
</div>

</body>
</html>
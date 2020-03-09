<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/error/404.jsp</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>

<div class="container">
	<h1>404 error!</h1>
	<p class="alert alert-danger">
		요청하신 페이지는 존재하지 않습니다. <br/>
		This page is NOT exist.<br/><br/>
		<a href="${pageContext.request.contextPath }/home.go">메인 페이지로 돌아가기</a>
	</p>
</div>

</body>
</html>
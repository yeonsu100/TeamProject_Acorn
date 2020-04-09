<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 Error</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource.jsp"/>
</head>
<body>

<div class="container">
	<h1>500 error!</h1>
	<p class="alert alert-danger">
		요청 처리 중 오류가 발생했습니다. <br/>
		Error was erupted. <br/>
		We'll fix it soon. Sorry about it! <br/>
		<a href="${pageContext.request.contextPath }/home.go">메인 페이지로 돌아가기</a>
	</p>
</div>

</body>
</html>
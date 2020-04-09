<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 Error</title>
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/favicon.ico">
<jsp:include page="../include/resource.jsp"/>
</head>
<body>

<div class="container">
	<h1>에러발생 - 에러코드 500</h1>
	<p class="alert alert-danger">
		요청 처리 중 오류가 발생했습니다! <br/>
		조속히 복구하겠습니다. 이용에 불편을 드려 죄송합니다. <br/>
		<a href="${pageContext.request.contextPath }/home.go">메인 화면으로 돌아가기</a>
	</p>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource_boot4.jsp" />
<style>
h1{color: #F1648A;}

</style>
</head>
<body>

<div class="container">
	<h1>바나프레소의 대표상품 페이지입니다</h1> <br/>
	<h3>바나프레소에서 제공하는 최상급 품질의 원두를 집에서도 느껴보세요</h3> <br/><br/> 
		<img src="${pageContext.request.contextPath }/resources/images/coffee.jpg"/>
</div>

<jsp:include page="../include/msgbtn.jsp"/>
</body>
<jsp:include page="../include/footer2.jsp"/>
</html>
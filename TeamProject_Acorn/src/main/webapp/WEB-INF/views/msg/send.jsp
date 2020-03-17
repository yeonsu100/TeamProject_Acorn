<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/msg/send.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<script>
		alert("메시지를 보냈습니다");
		location.href="${pageContext.request.contextPath }/msg/list.go";
	</script>
</div>
</body>
</html>
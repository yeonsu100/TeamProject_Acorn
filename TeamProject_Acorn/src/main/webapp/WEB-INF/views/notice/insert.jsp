<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/favicon.ico">
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<script>
		alert("성공적으로 저장하였습니다!");
		location.href="${pageContext.request.contextPath }/notice/list.go";
	</script>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<script>
	alert("${dto.ename } 사원 데이터가 삭제 되었습니다.");
	location.href="${pageContext.request.contextPath }/emp/main.go";
</script>	
</div>
</body>
</html>
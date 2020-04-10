<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
</head>
<body>
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
<div class="container">
	<c:choose>
		<c:when test="${not empty sessionScope.ename && sessionScope.isUserExist==false }">
			<script>
				swal("${ename } 사원님 회원가입을 시작합니다.", "" , "success", {
					  button: "확인",
					})
					.then((isSuccess) =>{
						location.href="${url }";
					})
			</script>
		</c:when>
		<c:when test="${not empty sessionScope.ename && sessionScope.isUserExist==true }">
			<script>
				swal("이미 가입 된 회원입니다. 로그인 화면으로 이동합니다.", "" , "error", {
					  button: "확인",
					})
					.then((isSuccess) =>{
						location.href="${pageContext.request.contextPath }/home.go";
					})
			</script>
		</c:when>
		<c:otherwise>
			<script>
				swal("등록되지 않은 사원입니다. 문제 지속시 전산실에 문의하시기 바랍니다.", "" , "error", {
					  button: "확인",
					})
					.then((isSuccess) =>{
						location.href="signup_checkform.go?url=${encodedUrl }";
					})
			</script>
		</c:otherwise>
	</c:choose>	
</div>
</body>
</html>
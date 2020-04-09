<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
<div class="container">
	<c:choose>
		<c:when test="${not empty sessionScope.id }">
			<script>
				swal("${id}님 환영합니다!", "확인 버튼을 눌러주세요", "success")
				.then((isSuccess) => {
					if(isSuccess){
						location.href="${pageContext.request.contextPath }/home.go";
					}
				});
			</script>
		</c:when>
		<c:otherwise>
			<script>
				swal("로그인에 실패 하였습니다.", "아이디 혹은 비밀번호가 일치하지 않습니다. 다시 시도해주세요", "error")
				.then((isSuccess) => {
					if(isSuccess){
						location.href="${pageContext.request.contextPath }/home.go";
					}
				});
			</script>			
		</c:otherwise>
	</c:choose>
	
</div>
</body>
</html>
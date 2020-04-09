<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/favicon.ico">
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<div class="container">
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
<script>
	swal("${dto.ename } 사원의 데이터가 추가 되었습니다.", "확인 버튼을 눌러주세요", "success")
	.then((isSuccess) => {
		if(isSuccess){
			location.href="${pageContext.request.contextPath }/emp/main.go";
		}
	});
</script>	
</div>
</body>
</html>

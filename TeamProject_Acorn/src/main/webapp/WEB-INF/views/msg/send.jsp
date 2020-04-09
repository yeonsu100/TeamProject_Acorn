<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
	<script>
		swal("메시지를 보냈습니다.", "확인 버튼을 눌러주세요", "success")
		.then((isSuccess) => {
			if(isSuccess){
				location.href="${pageContext.request.contextPath }/msg/list.go";
			}
		});
	</script>
</div>
</body>
</html>
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
<body>>
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
		<script>
			swal("글을 수정하였습니다.", "확인 버튼을 눌러주세요", "success")
			.then((isSuccess) => {
				if(isSuccess){
					location.href="${pageContext.request.contextPath }/notice/detail.go?num=${num}";
				}
			});
		</script>
</body>
</html>
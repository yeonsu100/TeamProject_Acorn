<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<div class="container">
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
	<script>
		swal("메시지를 보관함에 저장했습니다. 보관함으로 이동하시겠습니까?", {
			  buttons: ["X", true],
			})
			.then((result) => {
			  if (result) {
				  location.replace("list.go?pageType=saved");
			  } else {
				  location.replace("detail.go?num=${num}&pageNum=${pageNum}")
			  }
			});
	</script>
</div>
</body>
</html>

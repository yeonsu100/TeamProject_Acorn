<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/upload_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="category" />
</jsp:include>
<div class="container">
	<h1>파일 업로드 폼입니다</h1>
	<h4>업로드 규정에 맞게 올려주시기 바랍니다. 선정적, 폭력적, 비방 또는 허위 사실 등의 운영 목적에 맞지않는 게시물의 경우 사전 예고없이 삭제될 수 있습니다.</h4>
	<form action="upload.go" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="title">파일 제목</label>
			<input class="form-control" type="text" name="title" id="title" />
		</div>
		<div class="form-group">
			<label for="myFile">파일 첨부</label>
			<input class="form-control" type="file" name="myFile" id="myFile" />
		</div>
		<button class="btn btn-primary" type="submit">저장하기</button>
		<button class="btn btn-default" type="reset">초기화하기</button>
	</form>
</div>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
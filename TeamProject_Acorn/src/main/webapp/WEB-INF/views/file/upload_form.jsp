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
	<h1>File upload Form</h1>
	<form action="upload.go" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="title">Title</label>
			<input class="form-control" type="text" name="title" id="title" />
		</div>
		<div class="form-group">
			<label for="myFile">Attachment</label>
			<input class="form-control" type="file" name="myFile" id="myFile" />
		</div>
		<button class="btn btn-primary" type="submit">Save</button>
		<button class="btn btn-default" type="reset">Reset</button>
	</form>
</div>
</body>
</html>
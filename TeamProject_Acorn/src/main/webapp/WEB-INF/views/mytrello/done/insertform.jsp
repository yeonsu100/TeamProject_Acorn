<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/mytrello/done/insertform.jsp</title>
</head>
<body>

<div class="container">
	<form action="insert.go" method="post">
		<div>
			<label for="content">프로젝트명</label>
			<input type="text" name="title" id="title" />
		</div> </br>
		<div>
			<label for="content">세부 업무 사항</label>
			<input type="text" name="content" id="content" />
		</div>
		<button type="submit">저장</button>
	</form>
</div>

</body>
</html>
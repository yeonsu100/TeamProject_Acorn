<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/mytrello/doing/insertform.jsp</title>
</head>
<body>

<div class="container">
	<form action="insert.go" method="post">
		<div>
			<label for="content">Assignment</label>
			<input type="text" name="content" id="content" />
		</div>
		<button type="submit">Save</button>
	</form>
</div>

</body>
</html>
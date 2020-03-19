<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/mytrello/todo/updateform.jsp</title>
</head>
<body>

<div class="container">
	<h1>Page of Update form</h1>
	<form action="update.go" method="post">
	<input type="hidden" name="num" value="${dto.num }" />
		<div>
			<label for="num">No.</label>
			<input type="text" id="num" value="${dto.num }" disabled />
		</div>
		<div>
			<label for="title">Title</label>
			<input type="text" name="title" id="title" value="${dto.title }"/>
		</div>
		<div>
			<label for="content">Content</label>
			<input type="text" name="content" id="content" value="${dto.content }"/>
		</div>
		<input type="hidden" name="regdate" value="${dto.regdate }" />
		<div>
			<label for="addr">Date</label>
			<input type="text" name="regdate" id="regdate" value="${dto.regdate }"/>
		</div>
		<button type="submit">Save</button>
		<button type="reset">Reset All</button>
	</form>
</div>

</body>
</html>
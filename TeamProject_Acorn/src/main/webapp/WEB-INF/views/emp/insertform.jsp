<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/emp/insertform.jsp</title>
</head>
<body>
<div class="container">
<h1>사원 추가 페이지</h1>
	<form action="insert.go" method="post" id="empInsertForm">
		<div class="form-group has-feedback">
			<label class="control-label" for="ename">이름</label>
			<input class="form-control" type="text" id="ename" name="ename"/>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="pnum">전화번호</label>
			<input class="form-control" type="text" id="pnum" name="pnum"/>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="hdate">입사일</label>
			<input class="form-control" type="text" id="hdate" name="hdate"/>
		</div>
		<button class="btn btn-primary" type="submit">추가</button>
		<button class="btn btn-warning" type="reset">취소</button>
	</form>
</div>
</body>
</html>
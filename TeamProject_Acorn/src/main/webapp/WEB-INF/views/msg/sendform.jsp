<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/board/insertform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	#content{
		width: 100%;
		height: 200px;
	}
	
	body{padding-top: 0px;}
</style>
</head>
<body>
<div class="container">
	<form action="send.go" method="post">
		<div class="form-group">
			<label for="idSend">보내는 사람</label>
			<input class="form-control" type="text" value="${id }" disabled/>
		</div>
		<div class="form-group">
			<label for="idRec">받는 사람</label>
			<input class="form-control" type="text" name="idRec" id="idRec"/>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title"/>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
		</div>
		<button class="btn btn-primary" type="submit">보내기</button>
		<button class="btn btn-warning" type="reset">취소</button>
	</form>
</div>
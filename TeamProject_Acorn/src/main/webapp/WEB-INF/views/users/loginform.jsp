<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>

<div class="container">
	<form class="form-signin" action="login.go" method="post">
		<input type="hidden" name="url" value="${url }" />
		<h2 class="form-signin-heading">로그인 정보 입력</h2>
		<label for="userid" class="sr-only">아이디</label>
		<input type="text" id="userid" name="userid" class="form-control" 
			placeholder="아이디" value="${savedId }"/>
		<label for="pwd" class="sr-only">비밀번호</label>
		<input type="password" id="pwd" name="pwd" class="form-control" 
			placeholder="비밀번호" value="${savedPwd }">
		<div class="checkbox">
			<label>
				<input type="checkbox" name="isSave" value="yes"/>아이디, 비밀번호 저장
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
	</form>	
</div>
</body>
</html>
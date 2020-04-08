<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform</title>
<jsp:include page="../include/resource_boot4.jsp"/>
<style>	
	body {
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-image: url('${pageContext.request.contextPath }/resources/images/loginbg.jpg');
	  background-repeat: no-repeat;
	  background-size: cover;
	  
	}
	.container{
		width: 360px;
		height: 600px;
		background-color: #000000;
		position: absolute;
		transform: translate(-50%, -50%);
		top: 50%;
		left: 50%;
		color: white;
		text-align: center;
		opacity: 80%;
	}
	.container h2{
		font-size: 40px;
		margin-top: 125px;
		margin-bottom: 60px;
	}
	.btn{
		display: block;
		cursor: pointer;
		text-align: center;
	}
		
</style>
</head>
<body>

<div class="container">
	<form class="form-signin" action="users/login.go" method="post">
		<input type="hidden" name="url" value="${url }" />
		<h2 class="form-signin-heading">로그인 정보 입력</h2>
		
		<label for="userid" class="sr-only">아이디</label>
		<input type="text" id="userid" name="userid" class="form-control" 
			placeholder="아이디를 입력하세요" value="${savedId }"/> <br/>
			
		<label for="pwd" class="sr-only">비밀번호</label>
		<input type="password" id="pwd" name="pwd" class="form-control" 
			placeholder="비밀번호를 입력하세요" value="${savedPwd }"> <br/>
			
		<div class="checkbox">
			<label>
				<input type="checkbox" name="isSave" value="yes"/>로그인 정보 저장
			</label> <br/>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
	</form>	<br/>
	
	<a href="${pageContext.request.contextPath }/users/signup_checkform.go">계정 생성하기</a>
</div>
</body>
</html>
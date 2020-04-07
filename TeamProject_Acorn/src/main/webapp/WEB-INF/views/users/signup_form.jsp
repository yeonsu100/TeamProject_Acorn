<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"/>
<style>
	/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
	.help-block, .form-control-feedback{
		display: none;
	}
	.form-row{
		margin-top:1rem;
	}
</style>
<jsp:include page="../include/navbar2.jsp"/>
</head>
<body>
<div class="container">
	<h1>회원 가입 페이지</h1>
	<form action="signup.go" method="post" id="signupForm">
		<div class="form-row">
			<label class="control-label" for="userid">아이디</label>
			<input class="form-control" type="text" id="userid" name="userid"/>
			<p class="invalid-feedback" id="id_notusable">사용 불가능한 아이디 입니다.</p>
			<p class="invalid-feedback" id="id_required">반드시 입력 하세요</p>
		</div>
		<div class="form-row">
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
			<p class="invalid-feedback" id="pwd_required">반드시 입력하세요</p>
			<p class="invalid-feedback" id="pwd_tooshort">비밀번호가 너무 짧습니다. 5자 이상 입력해 주세요</p>
		</div>
		<div class="form-row">
			<label class="control-label" for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="pwd2" name="pwd2"/>
			<p class="invalid-feedback" id="pwd2_notequal">입력한 비밀번호와 다릅니다</p>
		</div>
		<div class="form-row">
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="email" id="email" name="email" />
			<p class="invalid-feedback" id="email_notmatch">잘못된 이메일 주소입니다.</p>
		</div>
		<div class="form-row">
			<label class="control-label" for="ename">이름</label>
			<input type="text" class="form-control" id="ename" value="${ename }" disabled/>
		</div>
		<input type="hidden" name="empno" value="${empno}" }/>
		<div class="form-row">
			<label class="control-label" for="empno">사번</label>
			<input type="text" class="form-control" id="empno" value="${empno }" disabled/>
		</div>
		<button disabled="disabled" class="btn btn-primary btn-sm mt-3" type="submit">가입</button>
		<button class="btn btn-secondary btn-sm mt-3" type="reset">취소</button>
		<input type="hidden" name="profile" value="/resources/images/default_user.jpeg" />
	</form>
</div>
<% session.invalidate(); %>
<script>
	//아이디를 사용할수 있는지 여부 
	var isIdUsable=false;
	//아이디를 입력 했는지 여부 
	var isIdInput=false;
	
	//비밀번호를 확인란과 같게 입력 했는지 여부 
	var isPwdEqual=false;
	//비밀번호를 입력했는지 여부 
	var isPwdInput=false;
	//비밀번호가 규정보다 짧은지 여부
	var isPwdShort=false;
	
	//이메일을 형식에 맞게 입력했는지 여부 
	var isEmailMatch=false;
	//이메일을 입력했는지 여부
	var isEmailInput=false;
	
	//아이디 입력란에 한번이라도 입력한 적이 있는지 여부
	var isIdDirty=false;
	//비밀 번호 입력란에 한번이라도 입력한 적이 있는지 여부
	var isPwdDirty=false;
	//비번 확인란 입력한적있나
	var isPwd2Dirty=false;
	
	//이메일을 입력할때 실행할 함수 등록
	$("#email").on("input", function(){
		var email=$("#email").val();
		
		if(email.match("@")){//이메일 형식에 맞게 입력 했다면
			isEmailMatch=true;
		}else{//형식에 맞지 않게 입력했다면 
			isEmailMatch=false;
		}
		
		if(email.length == 0){ //이메일을 입력하지 않았다면
			isEmailInput=false;
		}else{//이메일을 입력 했다면 
			isEmailInput=true;
		}
		//이메일 에러 여부 
		var isError=isEmailInput && !isEmailMatch;
		//이메일 상태 바꾸기 
		setState("#email", isError);
	});
	
	//비밀번호를 입력할때 실행할 함수 등록
	$("#pwd").on("input", function(){
		//상태값을 바꿔준다. 
		isPwdDirty=true;
		
		//입력한 비밀번호를 읽어온다.
		var pwd=$("#pwd").val();
				
		if(pwd.length == 0){
			isPwdInput=false;
		}else{
			isPwdInput=true;
		}
		
		if(pwd.length < 5){
			isPwdShort=true;
		}else{
			isPwdShort=false;
		}
		//비밀번호 에러 여부 
		var isError=!isPwdInput || isPwdShort;
		//비밀번호 상태 바꾸기 
		setState("#pwd", isError);
	});
	
	//비밀번호 확인란 입력할때 실행
	$("#pwd2").on("input", function(){
		//상태바꾸기
		isPwd2Dirty=true;
		
		//비번, 비번확인 둘다 읽어온다
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		
		if(pwd != pwd2){//두 비밀번호를 동일하게 입력하지 않았다면
			isPwdEqual=false;
		}else{
			isPwdEqual=true;
		}
		
		//비번확인란 에러 여부
		var isError=!isPwdEqual;
		//비번확인란 상태바꾸기
		setState("#pwd2", isError);
	});
	//아이디를 입력할때 실행할 함수 등록 
	$("#userid").on("input", function(){
		isIdDirty=true;
		
		//1. 입력한 아이디를 읽어온다.
		var inputId=$("#userid").val();
		//2. 서버에 보내서 사용가능 여부를 응답 받는다.
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkid.go",
			method:"GET",
			data:{inputId:inputId},
			success:function(responseData){
				if(responseData.isExist){//이미 존재하는 아이디라면 
					isIdUsable=false;
				}else{
					isIdUsable=true;
				}
				//아이디 에러 여부 
				var isError= !isIdUsable || !isIdInput ;
				//아이디 상태 바꾸기 
				setState("#userid", isError );
			}
		});
		//아이디를 입력했는지 검증
		if(inputId.length == 0){//만일 입력하지 않았다면 
			isIdInput=false;
		}else{
			isIdInput=true;
		}
		//아이디 에러 여부 
		var isError= !isIdUsable || !isIdInput ;
		//아이디 상태 바꾸기 
		setState("#userid", isError );
	});
	
	//입력란의 상태를 바꾸는 함수 
	function setState(sel, isError){
		//일단 UI 를 초기 상태로 바꿔준다.
		$(sel)
		.removeClass("is-valid is-invalid")
		.parent()
		.find(".invalid-feedback")
		.hide();
		
		//입력란의 색상과 아이콘을 바꿔주는 작업 
		if(isError){
			//입력란이 error 인 상태
			$(sel)
			.addClass("is-invalid")
			.show();
		}else{
			//입력란이 success 인 상태
			$(sel)
			.addClass("is-valid")
			.show();
		}
		//에러가 있다면 에러 메세지 띄우기
		if(isEmailInput && !isEmailMatch){
			$("#email_notmatch").show();
		}
		//에러가 있다면 에러 메세지 띄우기
		if(!isPwdEqual && isPwd2Dirty){
			$("#pwd2_notequal").show();
		}
		if(!isPwdInput && isPwdDirty){
			$("#pwd_required").show();
		}
		if(isPwdInput && isPwdShort){
			$("#pwd_tooshort").show();
		}
		//에러가 있다면 에러 메세지 띄우기
		if(!isIdUsable && isIdDirty){
			$("#id_notusable").show();
		}
		if(!isIdInput && isIdDirty){
			$("#id_required").show();
		}
		
		//버튼의 상태 바꾸기 
		if(isIdUsable && isIdInput && isPwdEqual && !isPwdShort &&
				isPwdInput && (!isEmailInput || isEmailMatch) ){
			$("button[type=submit]").removeAttr("disabled");
		}else{
			$("button[type=submit]").attr("disabled","disabled");
		}
	}
	
</script>
</body>
</html>
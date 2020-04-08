<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_updateform.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"/>
<style>
/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
.help-block, .form-control-feedback{
	display: none;
}
.form-row{
	margin-bottom:1rem;
}
.btn-secondary{
	border:0;
	outline:0;
}
.btn-primary{
	background-color:#F1648A;
	border:0;
	outline:0;
}
.btn-primary:disabled{
	background-color:#F1A4BA;
	border:0;
	outline:0;
}
.btn-primary:hover{
	background-color:#F1A4BA;
	border:0;
	outline:0;
}
.btn-primary:focus, .btn-primary.focus {
	color: #fff;
	background-color: #F1648A;
	border: 0;
	box-shadow: 0 0 0 0.1rem #F1A4BA;
}
.btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active,
.show > .btn-primary.dropdown-toggle {
  color: #fff;
  background-color: #F1648A;
  border-color: #F1A4BA;
}
.btn-primary:not(:disabled):not(.disabled):active:focus, .btn-primary:not(:disabled):not(.disabled).active:focus,
.show > .btn-primary.dropdown-toggle:focus {
  box-shadow: 0 0 0 0.1rem #F1A4BA;
}
</style>
<jsp:include page="../include/navbar2.jsp"/>
</head>
<body>

<div class="container">
	<h1>비밀번호 수정 페이지</h1>
	<form action="pwd_update.go" method="post">
		<div class="form-row">
			<label class="control-label" for="pwd">기존 비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
		</div>
		<div class="form-row">
			<label class="control-label" for="newPwd">비밀번호</label>
			<input class="form-control" type="password" id="newPwd" name="newPwd"/>
			<p class="invalid-feedback" id="pwd_required">반드시 입력하세요</p>
		</div>
		<div class="form-row">
			<label class="control-label" for="newPwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="newPwd2" name="newPwd2"/>
			<p class="invalid-feedback" id="pwd2_notequal">입력한 비밀번호와 다릅니다</p>
		</div>
		<button disabled="disabled" class="btn btn-primary btn-sm" type="submit">수정확인</button>
		<button class="btn btn-secondary btn-sm" type="button" onclick="location.href='info.go'">취소</button>
	</form>
</div>
<script>
	//비밀번호를 확인란과 같게 입력 했는지 여부 
	var isPwdEqual=false;
	//비밀번호를 입력했는지 여부 
	var isPwdInput=false;
	//비밀 번호 입력란에 한번이라도 입력한 적이 있는지 여부
	var isPwdDirty=false;
	//비번 확인란 입력한적있나
	var isPwd2Dirty=false;
	
	//비밀번호를 입력할때 실행할 함수 등록
	$("#newPwd").on("input", function(){
		//상태값을 바꿔준다. 
		isPwdDirty=true;
		
		//입력한 비밀번호를 읽어온다.
		var pwd=$("#newPwd").val();
				
		if(pwd.length == 0){
			isPwdInput=false;
		}else{
			isPwdInput=true;
		}
		//비밀번호 에러 여부 
		var isError=!isPwdInput;
		//비밀번호 상태 바꾸기 
		setState("#newPwd", isError);
	});
	
	//비밀번호 확인란 입력할때 실행
	$("#newPwd2").on("input", function(){
		//상태바꾸기
		isPwd2Dirty=true;
		
		//비번, 비번확인 둘다 읽어온다
		var pwd=$("#newPwd").val();
		var pwd2=$("#newPwd2").val();
		
		if(pwd != pwd2){
			isPwdEqual=false;
		}else{
			isPwdEqual=true;
		}
		
		//비번확인란 에러 여부
		var isError=!isPwdEqual;
		//비번확인란 상태바꾸기
		setState("#newPwd2", isError);
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
		if(!isPwdEqual && isPwd2Dirty){
			$("#pwd2_notequal").show();
		}
		if(!isPwdInput && isPwdDirty){
			$("#pwd_required").show();
		}
		
		//버튼의 상태 바꾸기 
		if(isPwdEqual && isPwdInput){
			$("button[type=submit]").removeAttr("disabled");
		}else{
			$("button[type=submit]").attr("disabled","disabled");
		}
	}
</script>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/favicon.ico">
<jsp:include page="../include/resource_boot4.jsp"/>
<style>
/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
.help-block, .form-control-feedback{
	display: none;
}
.form-row{
	margin-top:1rem;
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
	<h1>사원 확인</h1>
	<form action="signup_check.go" method="post" id="signupCheck">
		<div class="form-row">
			<label class="control-label" for="ename">이름</label>
			<input class="form-control" type="text" id="ename" name="ename"/>
			<p class="invalid-feedback" id="ename_required">반드시 입력 하세요</p>
		</div>
		<div class="form-row">
			<label class="control-label" for="pnum">전화번호</label>
			<input class="form-control" type="text" id="pnum" name="pnum"/>
			<p class="invalid-feedback" id="pnum_error">-를 제외하고 입력하세요</p>
			<p class="invalid-feedback" id="pnum_required">반드시 입력하세요</p>
		</div>
		<button disabled="disabled" class="btn btn-primary btn-sm mt-3" type="submit">본인 확인</button>
		<button class="btn btn-secondary btn-sm mt-3" type="reset">취소</button>
	</form>
</div>
<script>
	//이름을 입력 했는지 여부 
	var isEnameInput=false;
	//전화번호를 입력했는지 여부 
	var isPnumInput=false;
	
	//아이디 입력란에 한번이라도 입력한 적이 있는지 여부
	var isEnameDirty=false;
	//비밀 번호 입력란에 한번이라도 입력한 적이 있는지 여부
	var isPnumDirty=false;
	
	//전화번호를 형식에 맞게 입력했는지 여부 
	var isPnumMatch=false;
	
	//전화번호를 입력할때 실행할 함수 등록
	$("#pnum").on("input", function(){
		isPnumDirty=true;
		
		//입력한 전화번오 받아오기
		var pnum=$("#pnum").val();
		
		if(pnum.match("-")){//전화번호에 -를 넣었다면
			isPnumMatch=false;
		}else{				//- 안넣고 제대로 입력했다면
			isPnumMatch=true;
		}
		
		if(pnum.length == 0){ //전화번호를 입력하지 않았다면
			isPnumInput=false;
		}else{					//입력 했다면 
			isPnumInput=true;
		}
		//전화번호 에러 여부 
		var isError= !isPnumInput || !isPnumMatch;
		//전화번호 상태 바꾸기 
		setState("#pnum", isError);
	});
	
	//이름을 입력할때 실행할 함수 등록 
	$("#ename").on("input", function(){
		isEnameDirty=true;
		
		//입력한 이름 받아오기
		var ename=$("#ename").val();
		
		//이름을 입력했는지 검증
		if(ename.length == 0){//만일 입력하지 않았다면 
			isEnameInput=false;
		}else{
			isEnameInput=true;
		}
		//이름 에러 여부 
		var isError=!isEnameInput;
		//이메일 상태 바꾸기 
		setState("#ename", isError);
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
		
		if(!isPnumInput && isPnumDirty){
			$("#pnum_required").show();
		}
		if(!isEnameInput && isEnameDirty){
			$("#ename_required").show();
		}
		if(isPnumInput && !isPnumMatch){
			$("#pnum_error").show();
		}
		
		//버튼의 상태 바꾸기 
		if(isEnameInput && isPnumInput && isPnumMatch){
			$("button[type=submit]").removeAttr("disabled");
		}else{
			$("button[type=submit]").attr("disabled","disabled");
		}
	}
	
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"></jsp:include>
<style>
#content{
	display:none;
	width:100%;
	height:400px;
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
.btn-primary:hover{
	background-color:#F1A4BA;
	border:0;
	outline:0;
}
.btn-primary:disabled{
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
<jsp:include page="../include/navbar2.jsp">
	<jsp:param value="cafe" name="category"/>
</jsp:include>
</head>
<body>

<div class="container">
	<form action="update.go" method="post">
		<input type="hidden" name="num" value="${dto.num }"/>
		<div class="form-group">
			<label for="num">글 번호</label>
			<input class="form-control" type="text" id="num" value="${dto.num }" disabled/>
		</div>
		<div class="form-group">
			<label for="title">글 제목</label>
			<input class="form-control" type="text" id="title" name="title" value="${dto.title }"/>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content">
				${dto.content }
			</textarea>
		</div>
		<button class="btn btn-primary btn-sm" type="submit" onclick="submitContents(this);">수정확인</button>
		<button class="btn btn-secondary btn-sm" type="button"  onclick="location.href='detail.go?num=${dto.num}' ">취소</button>
	</form>
</div>
<!-- SmartEditor 에서 필요한 javascript 로딩  -->
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				
			bUseVerticalResizer : true,		
			bUseModeChanger : true,			
			fOnBeforeUnload : function(){
			}
		}, 
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
</body>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</html>
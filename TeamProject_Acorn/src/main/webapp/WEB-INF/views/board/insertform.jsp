<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/board/insertform.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"></jsp:include>
<style>
#content{
	display: none;
	width: 100%;
	height: 400px;
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
	<jsp:param value="board" name="category"/>
</jsp:include>
</head>
<body>
<div class="container">
	<form action="insert.go" method="post">
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" type="text" value="${id }" disabled/>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" 
				name="title" id="title"/>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
		</div>
		<button class="btn btn-primary btn-sm" type="button" onclick="submitContents(this);">저장</button>
		<button class="btn btn-secondary btn-sm" type="button" onclick="location.href='list.go'">취소</button>
	</form>
</div>

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
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		var content=document.getElementById("content").value;
		if(content == "" ||content == null|| content == "&nbsp;" || content == "<p>&nbsp;</p>"){
			alert("내용을 입력하세요.");
            oEditors.getById["content"].exec("FOCUS"); //포커싱
            return false;
		}
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
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
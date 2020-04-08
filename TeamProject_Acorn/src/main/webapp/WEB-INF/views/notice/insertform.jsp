<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/insertform.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"></jsp:include>
<style>
	/* textarea의 크기가 SmartEditor의 크기가 된다.*/
	#content{
		display:nome;
		width:100%;
		height:400px;
	}
</style>
<jsp:include page="../include/navbar2.jsp">
	<jsp:param value="notice" name="category"/>
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
			<input class="form-control" type="text" name="title" id="title"/>
		</div>
		<div>
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
		</div>
		<button class="btn btn-primary" type="button" onclick="submitContents(this);">저장</button>
		<button class="btn btn-warning" type="button"  onclick="location.href='list.go' ">취소</button>
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
	// 빈 값 일 경우 제출 막기
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	
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
</body>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</html>
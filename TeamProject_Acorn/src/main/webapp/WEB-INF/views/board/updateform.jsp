<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/board/updateform.jsp</title>
<head>
<meta charset="UTF-8">
<title>/board/updateform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/board/list.go">목록</a></li>
		<li>글 수정 양식</li>
	</ol>	
	<form action="update.go" method="post">
		<input type="hidden" name="num" value="${dto.num }"/>
		<div class="form-group">
			<label for="num">글번호</label>
			<input class="form-control" type="text" id="num" value="${dto.num }" disabled/>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" id="title" name="title" 
				value="${dto.title }"/>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content">
				${dto.content }
			</textarea>
		</div>
		<button class="btn btn-primary" type="submit" onclick="submitContents(this);">수정확인</button>
		<button class="btn btn-warning" type="reset">취소</button>
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
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
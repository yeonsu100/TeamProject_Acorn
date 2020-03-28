<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	.selected{
		background-color:#ccc;
	}
</style>
</head>
<body>
<jsp:include page="msgnav.jsp"/>
<script>


$(document).ready(function(){
    $("#idRec").on("click", function(){
        $("#userlist").modal({backdrop: 'static'});
    });
    
    $("#submitId").on("click", function(){
    	var msg=document.getElementById('idinsert').value;
		ajaxCall(msg);
    })
    
    function ajaxCall(msg){
    	$.ajax({
    		url:"${pageContext.request.contextPath }/msg/idlist.go",
    		data:{idkey:msg},
    		cache:false,
    		success: function(response){
    			console.log(response);
    			console.log(response.length);
    			$("#tbody *").remove();
    			$.each(response, function (index, item) {
    			     var eachrow = "<tr>"
    	                 + "<td>" + response[index].userid + "</td>"
    	                 + "</tr>";
    				$("#tbody").append(eachrow);
    			});
    		}
    	})
    }
});

$(document).on("click", "#idTable tr", function(){
	$(this).addClass("selected").siblings().removeClass("selected");
})

var isIdRecInput;
$(document).on("click", "#idSelect", function(e){
	var value=$("#idTable tr.selected td").html();
	if(value!=null){
		isIdRecInput=true;
		$("#idRec").val(value);
		$("#userlist").modal("hide");
	}else{
		isIdRecInput=false;
		alert("메시지를 보낼 대상을 선택해 주세요")
	}
})	
var isTitleInput;
$(document).on("input","#title", function(){
	var title=$("#title").val();
	if(title.length!=0){
		isTitleInput=true;
	}else{
		isTitleInput=false;
	}
	setBtnState();
})
function setBtnState(){
	//버튼의 상태 바꾸기 
	if(isIdRecInput && isTitleInput){
		$("button[type=submit]").removeAttr("disabled");
	}else{
		$("button[type=submit]").attr("disabled","disabled");
	}
}


</script>
<div class="modal fade" id="userlist">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원 검색</h4>
			</div>
			<div class="modal-body">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="검색어 입력" id="idinsert">
					<span class="input-group-btn">
					  <button class="btn btn-success" type="button" id="submitId">검색</button>
					</span>
				</div>
				<table class="table table-hover table-condensed" id="idTable">
					<tbody id="tbody">
					
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="idSelect">확인</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      	</div>
		</div>
	</div>
</div>
<div class="container">
	<form action="send.go" method="post">
		<div class="form-group">
			<label for="idSend">보내는 사람</label>
			<input class="form-control" type="text" value="${id }" disabled/>
		</div>
		<div class="form-group">
			<label for="idRec">받는 사람</label>
			<input class="form-control" type="text" name="idRec" id="idRec" readonly="readonly"/>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title"/>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
		</div>
		<button class="btn btn-primary" type="submit" disabled="disabled">보내기</button>
		<button class="btn btn-warning" type="button" onclick="location.href='list.go'">취소</button>
	</form>
</div>
<script>
	
</script>
</body>
</html>


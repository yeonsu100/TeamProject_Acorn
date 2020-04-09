<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource_boot4.jsp"></jsp:include>
<style>
#content{
	width: 100%;
	height: 200px;
}

body{margin-top: 0rem;}

.selected{
	background-color:#ccc;
}
#idRec{
	background-color:#fff;
}
#tbody tr:hover{
	background-color:#f5d7e0;
}
#tbody tr.selected{
  color: #fff;
  background-color: #F1A4BA;
}
#tbody tr:not(:disabled):not(.disabled):active, #tbody tr:not(:disabled):not(.disabled).active{
  color: #fff;
  background-color: #F1A4BA;
}
.btn-primary{
	background-color:#F1648A;
	border:0;
	outline:0;
}
.btn-primary:hover,
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
.btn-secondary{
	border:0;
	outline:0;
}
</style>
</head>
<body>
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
				<h5 class="modal-title" style="float:left;">회원 검색</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" placeholder="검색어 입력" id="idinsert">
					<span class="input-group-btn">
					  <button class="btn btn-success btn-sm" type="button" id="submitId">검색</button>
					</span>
				</div>
				<table class="table table-hover table-sm" id="idTable">
					<tbody id="tbody">
					
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-primary btn-sm" id="idSelect">확인</button>
		        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
	      	</div>
		</div>
	</div>
</div>
<div class="container">
	<h3>메시지 작성</h3>
	<form action="send.go" method="post">
		<div class="form-group">
			<label for="idSend">보내는 사람</label>
			<input class="form-control" type="text" value="${id }" disabled/>
		</div>
		<div class="form-group">
			<c:choose>
				<c:when test="${not empty requestScope.idRec}">
					<label for="idRec">받는 사람</label>
					<input class="form-control" type="text" name="idRec" readonly="readonly" value="${idRec }"/>
				</c:when>
				<c:otherwise>
					<label for="idRec">받는 사람</label>
					<input class="form-control" type="text" name="idRec" id="idRec" readonly="readonly"/>
				</c:otherwise>
			</c:choose>
			
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title"/>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
		</div>
		<button class="btn btn-primary btn-sm" type="submit" disabled="disabled">보내기</button>
		<button class="btn btn-secondary btn-sm" type="button" onclick="location.href='list.go'">취소</button>
	</form>
</div>
<script>
	
</script>
</body>
</html>


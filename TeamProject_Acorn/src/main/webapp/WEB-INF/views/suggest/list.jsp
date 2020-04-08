<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/suggest/list.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"/>
<style>
h1{color: #F1648A;}
.comments ul{
	padding: 0;
	margin: 0;
	list-style-type: none;
}
.comments ul li{
	border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
}
.comments dt{
	margin-top: 5px;
}
.comments dd{
	margin-left: 26px;
}
.comments form textarea, .comments form button{
	float: left;
}
.comments li{
	clear: left;
}
.comments form textarea{
	width: 85%;
	height: 100px;
}
.comments form button{
	width: 15%;
	height: 100px;
	color: #B2CCFF;
}
/* 수정폼을 일단 숨긴다.*/
.suggest form{
	display: none;
}
.suggest{
	position: relative;
}
.comments .user-img{
	width: 20px;
	height: 20px;
	border-radius: 50%;
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
.page-link {
	color: #F1648A;
	border: 1px solid #F1A4BA;
}
.page-link:hover {
	color: #F1648A;
	background-color: #F1A4BA;
	border-color: #F1A4BA;
}
.page-item{
	border-top:none !important;
}
.page-item.active .page-link {
	color: #fff;
	background-color: #F1648A;
	border-color: #F1A4BA;
}
.page-item.disabled .page-link {
	border-color: #F1A4BA;
}
</style>
<jsp:include page="../include/navbar2.jsp">
	<jsp:param value="suggest" name="category"/>
</jsp:include>
</head>
<body>
<div class="container">

	<h1>건의사항 게시판</h1>
	<p>게시판 운영 목적과 맞지 않는 게시물은 관리자 권한으로 삭제될 수 있습니다.</p> <br/>
	
	<div class="comments">
		<ul>
		<c:forEach items="${list }" var="tmp">
			<li class="suggest" id="suggest${tmp.num }">
				<dl>
					<dt>
						<c:choose>
							<c:when test="${empty tmp.profile }">
								<img class="user-img" src="${pageContext.request.contextPath}/resources/images/default_user.jpeg"/>
							</c:when>
							<c:otherwise>
								<img class="user-img" src="${pageContext.request.contextPath}${tmp.profile}"/>
							</c:otherwise>
						</c:choose>
						<span>${tmp.sugId }</span>
						<span style="float:right;">
						<c:choose>
							<c:when test="${id eq tmp.sugId}">
								<a href="javascript:" class="suggest-update-link" style="color: #F1648A;">수정</a>&nbsp;|
								<a href="javascript:deleteConfirm(${tmp.num })" style="color: #F1648A;">삭제</a>&nbsp;
							</c:when>
							<c:otherwise>
								<c:if test="${not empty isAdmin }">
									<a href="javascript:deleteConfirm(${tmp.num })" style="color: #F1648A;">삭제</a>&nbsp;
								</c:if>
							</c:otherwise>
						</c:choose>
						${tmp.regdate }
						</span>
					</dt>
					<dd>
						<pre>${tmp.sugContent }</pre>
					</dd>
				</dl>
				<c:if test="${id eq tmp.sugId }">
					<form class="suggest-update-form" action="update.go" method="post">
						<input type="hidden" name="num" value="${tmp.num }" />
						<textarea class="form-control update-sugContent" rows="3" name="sugContent">${tmp.sugContent }</textarea>
						<button type="submit" class="btn btn-primary updateBtn" disabled>수정</button>
					</form>
				</c:if>
			</li>
		</c:forEach>
		</ul>
	
	<nav aria-label="Search pages" class="d-flex" style="margin-top:1rem;margin-bottom:1rem;">
		<ul class="pagination pagination-sm mx-auto">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li class="page-item">
					<a class="page-link" href="list.go?pageNum=${startPageNum-1 }">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="page-item active">
						<a class="page-link" href="list.go?pageNum=${i }">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="list.go?pageNum=${i }">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="list.go?pageNum=${endPageNum+1 }">&raquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="javascript:">&raquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<form action="insert.go" method="post">
		<input type="hidden" name="sugId" value="${id }" />
		<input type="hidden" name="sugProfile" value="${tmp.profile}"/>
		<c:if test="${not empty id}">
			<div class="input-group">
				<textarea class="form-control" id="insert-sugContent" name="sugContent"></textarea>
				<button class="btn btn-primary" type="submit" disabled id="insertBtn">등록</button>
			</div>
		</c:if>
	</form>
	</div>
</div>
<script>
	// 게시글 수정 링크를 눌렀을때 호출되는 함수 등록
	$(".suggest-update-link").click(function(){
		$(this)
		.parent().parent().parent().parent()
		.find(".suggest-update-form")
		.slideToggle(200);
	});
	
	// 게시글 수정 폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
	$(".suggest-update-form").on("submit", function(){
		var url=$(this).attr("action");
		var data=$(this).serialize();
		var $this=$(this);
		$.ajax({
			url:url,
			method:"post",
			data:data,
			success:function(responseData){
				if(responseData.isSuccess){
					$this.slideUp(200);
					var content=$this.find("textarea").val(); 
					$this.parent().find("pre").text(content);
				}
			}
		});
		return false;
	});
	
	// 작성시 빈 값일 경우 버튼 제출 막기
	$("#insert-sugContent").on("input",function(){
		var insertSug=$("#insert-sugContent").val();
		if(insertSug.length!=0){
			$("#insertBtn").removeAttr("disabled");
		}else{
			$("#insertBtn").attr("disabled","disabled");
		}
	});
	// 수정시 빈 값일 경우 버튼 제출 막기
	$(".update-sugContent").on("input",function(){
		var updateSug=$(this).val();
		if(updateSug.length!=0){
			$(this).parent().find(".updateBtn").removeAttr("disabled");
		}else{
			$(this).parent().find(".updateBtn").attr("disabled","disabled");
		}
	});
	
	function deleteConfirm(num){
		var isDelete=confirm("확인 버튼을 누르면 해당 게시물이 삭제됩니다.");
		if(isDelete){
			$.ajax({
				url:"delete.go",
				method:"post",
				data:{"num":num},	
			})
			location.href="${pageContext.request.contextPath}/suggest/list.go";
		}
	}
</script>
<br/><br/><br/>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
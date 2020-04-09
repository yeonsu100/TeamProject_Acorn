<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource_boot4.jsp"/>
<style>
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
.page-link {
  color: #F1648A;
  border: 1px solid #F1A4BA;
}
.page-link:hover {
  color: #F1648A;
  background-color: #F1A4BA;
  border-color: #F1A4BA;
}
.page-item.active .page-link {
  color: #fff;
  background-color: #F1648A;
  border-color: #F1A4BA;
}
.page-item.disabled .page-link {
  border-color: #F1A4BA;
}
.comments ul{
	padding: 0;
	margin: 0;
	margin-top: 55px;
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
}
.comment form{
	display: none;
}
.comment{
	position: relative;
}
.comment .reply_icon{
	width: 15px;
	height: 15px;
	position: absolute;
	top: 10px;
	left: 30px;
}
.comments .user-img{
	width: 25px;
	height: 25px;
	border-radius: 50%;
}
.page-item{
	border-top:none !important;
}
.btn-group .btn-secondary{
	background-color:#F1648A;
	border:0;
	outline:0;
}
.btn-group .btn-secondary:hover{
	background-color:#F1A4BA;
	border:0;
	outline:0;
}
.btn-group .btn-secondary:focus, .btn-group .btn-secondary.focus {
	color: #fff;
	background-color: #F1648A;
	border: 0;
	box-shadow: 0 0 0 0.1rem #F1A4BA;
}
.btn-group .btn-secondary:not(:disabled):not(.disabled):active, .btn-group .btn-secondary:not(:disabled):not(.disabled).active{
  color: #fff;
  background-color: #F1648A;
  border-color: #F1A4BA;
}
.btn-group .btn-secondary:not(:disabled):not(.disabled):active:focus, .btn-group .btn-secondary:not(:disabled):not(.disabled).active:focus{
  box-shadow: 0 0 0 0.1rem #F1A4BA;
}
.table-bordered th,
.table-bordered td {
  	border: 2px solid #F1A4BA !important;
}

</style>
<jsp:include page="../include/navbar2.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
</head>
<body>
<div class="container">
	<c:if test="${not empty keyword }">
		<p> <strong>${keyword }</strong> 키워드로 검색된 결과 목록입니다.</p>
	</c:if>
	<div style="margin-bottom:0.5rem;">
		<c:choose>
			<c:when test="${dto.prevNum ne 0 }">
				<a href="detail.go?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}" class="btn btn-primary btn-sm">이전글</a>
			</c:when>
			<c:otherwise>
				<button disabled="disabled" class="btn btn-primary btn-sm">이전글</button>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${dto.nextNum ne 0 }">
				<a href="detail.go?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}" class="btn btn-primary btn-sm">다음글</a>
			</c:when>
			<c:otherwise>
				<button disabled="disabled" class="btn btn-primary btn-sm">다음글</button>
			</c:otherwise>
		</c:choose>
	</div>
	<table class="table table-bordered table-sm">
		<colgroup>
			<col class="col-xs-1"/>
			<col class="col-xs-9"/>
		</colgroup>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
			<th>등록일</th>
			<td>${dto.regdate}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.title }</td>
		</tr>
		<tr>
			<td colspan="4">${dto.content }</td>
		</tr>
	</table>
	
	<%-- 
		글 작성자와 로그인 된 아이디가 같을때만 기능을 제공해 준다. 
		즉, 본인이 작성한 글만 수정할수 있도록 하기 위해
	--%>
	<div class="btn-group btn-group-sm float-right" role="group" aria-label="...">
		<a href="list.go" class="btn btn-secondary">목록</a>
			<c:choose>
				<c:when test="${dto.writer eq id}">
					<a href ="updateform.go?num=${dto.num }" class="btn btn-secondary">수정</a>
					<a href="javascript:deleteConfirm()" class="btn btn-secondary">삭제</a>
				</c:when>
			<c:otherwise>
				<c:if test="${not empty isAdmin }">
					<a href="javascript:deleteConfirm()" class="btn btn-secondary">삭제</a>
				</c:if>
			</c:otherwise>
			</c:choose>
	</div>
	<div class="comments">
		<ul>
		<c:forEach items="${commentList }" var="tmp">
			<c:choose>
				<c:when test="${tmp.deleted ne 'yes' }">
					<li class="comment" id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >
						<c:if test="${tmp.num ne tmp.comment_group }">
							<img class="reply_icon" src="${pageContext.request.contextPath}/resources/images/re.gif"/>
						</c:if>
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
								<c:choose>
									<c:when test="${tmp.num ne tmp.comment_group}">
										<strong style="color:#B8B6B6">@${tmp.target_id}</strong>
										<strong>${tmp.writer}</strong>
									</c:when>
									<c:otherwise>
										 <span>${tmp.writer }</span>
									</c:otherwise>
								</c:choose>
								<span style="float:right;">
									<a href="javascript:" class="reply_link" style="color:#F1648A">답글</a>
									<c:choose>
										<c:when test="${id eq tmp.writer }">
											 | <a href="javascript:" class="comment-update-link" style="color:#F1648A">수정</a> |
											<a href="javascript:deleteComment(${tmp.num })" style="color:#F1648A">삭제</a>
										</c:when>
									</c:choose>
								${tmp.regdate }</span>
							</dt>
							<dd>
								<pre>${tmp.content }</pre>
							</dd>
						</dl>
						<!-- 대댓글의 등록 및 수정 -->
						<form class="comment-insert-form" action="comment_insert.go" method="post">
							<!-- 덧글 그룹 -->
							<input type="hidden" name="ref_group" value="${dto.num }" />
							<!-- 덧글 대상 -->
							<input type="hidden" name="target_id" value="${tmp.writer }" />
							<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
							<textarea class="form-control addReplyComment" name="content"><c:if test="${empty id }">로그인한 사용자만 댓글 등록이 가능합니다.</c:if></textarea>
							<button disabled type="submit" class="btn btn-primary addReplyBtn">댓글 등록</button>
						</form>			
						<c:if test="${id eq tmp.writer }">
							<form class="comment-update-form" action="comment_update.go" method="post">
								<input type="hidden" name="num" value="${tmp.num }" />
								<textarea class="form-control updateReplyComment" name="content">${tmp.content }</textarea>
								<button disabled type="submit"  class="btn btn-primary updateReplyBtn">수정</button>
							</form>
						</c:if>
					</li>				
				</c:when>
				<c:otherwise>
					<li <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >삭제된 댓글입니다.</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</ul>		
		<!--  댓글 페이징 구역 -->
		<nav aria-label="Search pages" class="d-flex">
			<ul class="pagination pagination-sm mx-auto">
			<c:choose>
				<c:when test="${re_startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="detail.go?num=${dto.num }&re_pageNum=${re_startPageNum-1 }">
							&laquo;
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="javascript:">&laquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${re_startPageNum }" 
				end="${re_endPageNum }" step="1">
				<c:choose>
					<c:when test="${i eq re_pageNum }">
						<li class="page-item active"><a class="page-link" href="detail.go?num=${dto.num }&re_pageNum=${i }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="detail.go?num=${dto.num }&re_pageNum=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<c:choose>
				<c:when test="${re_endPageNum lt re_totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="detail.go?num=${dto.num }&re_pageNum=${re_endPageNum+1 }">
							&raquo;
						</a>
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
		<!-- 게시글의 댓글폼 -->
		<form action="comment_insert.go" method="post" style="margin-top:0.5rem;">
			<div class="comment_form">
				<input type="hidden" name="ref_group" value="${dto.num }"/>
				<input type="hidden" name="target_id" value="${dto.writer }"/>
				<c:if test="${empty id }">로그인한 사용자만 댓글 등록이 가능합니다.</c:if>
				<textarea class="form-control" id="insert-boardContent" name="content"></textarea>
				<button  class="btn btn-primary" type="submit" disabled id="insertBtn">등록</button>
			</div>
		</form>
	</div>
	</div>
</div>
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
<script>
	//댓글 수정 링크 눌렀을때 호출
	$(".comment-update-link").click(function(){
		$(this)
		.parent().parent().parent().parent()
		.find(".comment-update-form")
		.slideToggle(200);
	});
	
	//댓글 수정 폼에 submit 이벤트 호출
	$(".comment-update-form").on("submit", function(){
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
	
	//댓글 삭제를 눌렀을때 호출
	function deleteComment(num){
		swal({
			  title: "삭제 하시겠습니까?",
			  text: "댓글을 삭제하시면 복구 하실 수 없습니다.",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
					$.ajax({
						url:"comment_delete.go",
						method:"post",
						data:{"num":num, "ref_group":${dto.num}},
						success:function(responseData){
							if(responseData.isSuccess){
								var sel="#comment"+num;
								$(sel).text("삭제된 댓글입니다.");
							}
						}
					});
			  } else {
			    swal("삭제를 취소 하셨습니다.");
			  }
			});
	}
	
	//폼에 submit 이벤트가 일어 났을때
	$(".comments form").on("submit", function(){
		var isLogin=${not empty id};
		if(isLogin==false){
			alert("로그인 페이지로 이동합니다.");
			location.href="${pageContext.request.contextPath}/users/loginform.go?url=${pageContext.request.contextPath}/board/detail.go?num=${dto.num}";
			return false; 
		}
	});
	$(".comments form textarea").on("click", function(){
		var isLogin=${not empty id};
		if(isLogin==false){
			swal("로그인창으로 가시겠습니까?", {
				  buttons: ["취소", true],
				})
				.then((isMove) => {
					if(isMove){
						location.href="${pageContext.request.contextPath}/users/loginform.go?url=${pageContext.request.contextPath}/board/detail.go?num=${dto.num}";
					}
				});
		}
	});
	//답글 달기 링크를 클릭했을때
	$(".comment .reply_link").click(function(){
		$(this)
		.parent().parent().parent().parent()
		.find(".comment-insert-form")
		.slideToggle(200);
		
		if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		}
	});
	function deleteConfirm(){
		swal({
			  title: "삭제 하시겠습니까?",
			  text: "글을 삭제하시면 복구 하실 수 없습니다.",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    location.href="delete.go?num=${dto.num}";
			  } else {
			    swal("삭제를 취소 하셨습니다.");
			  }
			});
	}
	
	
	// 작성시 빈 값일 경우 버튼 제출 막기
	$("#insert-boardContent").on("input",function(){
		var insertComment=$("#insert-boardContent").val();
		if(insertComment.length!=0){
			$("#insertBtn").removeAttr("disabled");
		}else{
			$("#insertBtn").attr("disabled","disabled");
		}
	});
	
	// 대댓글의 답글 빈 값일 경우 버튼 제출 막기
	$(".addReplyComment").on("input",function(){
		var addReplyComment=$(this).val();
		if(addReplyComment.length!=0){
			$(this).parent().find(".addReplyBtn").removeAttr("disabled");
		}else{
			$(this).parent().find(".addReplyBtn").attr("disabled","disabled");
		}
	});
	
	// 대댓글의 수정 빈 내용 제출 막기
	$(".updateReplyComment").on("input",function(){
		var updateReplyComment=$(this).val();
		if(updateReplyComment.length!=0){
			$(this).parent().find(".updateReplyBtn").removeAttr("disabled");
		}else{
			$(this).parent().find(".updateReplyBtn").attr("disabled","disabled");
		}
	});
</script>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
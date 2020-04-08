<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/detail.jsp</title>
<jsp:include page="../include/resource.jsp"/>
<style>
	.contents, table{
		width: 100%;
		border: 1px dotted #cecece;
		box-shadow: 3px 3px 5px 6px #ccc;
	}
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
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<div class="container">
	<c:if test="${not empty keyword }">
		<p> <strong>${keyword }</strong> 검색어로 검색된
		결과 자세히 보기 입니다.</p>
	</c:if>
	
	<h3>게시판 상세보기</h3></br>
	<div>
	<c:if test="${dto.prevNum ne 0 }">
		<a href="detail.go?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}" class="btn btn-primary btn-sm">이전글</a>
	</c:if>
	
	<c:if test="${dto.nextNum ne 0 }">
		<a href="detail.go?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}" class="btn btn-primary btn-sm">다음글</a>
	</c:if>	
	</div>
	<table class="table table-bordered table-condensed">
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
	</table>
	<div class="contents">${dto.content }</div>
	<c:if test="${dto.writer eq id }">
		<a href="updateform.go?num=${dto.num }" class="btn btn-primary btn-sm">
			수정
		</a>
		<a href="javascript:deleteConfirm()" class="btn btn-primary btn-sm">삭제</a>
	</c:if>
	<a href="list.go">목록보기</a>
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
								<span>${tmp.regdate }</span>
								<a href="javascript:" class="reply_link">답글</a> |
								<c:choose>
									<c:when test="${id eq tmp.writer }">
										<a href="javascript:" class="comment-update-link">수정</a> |
										<a href="javascript:deleteComment(${tmp.num })">삭제</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:">신고</a>
									</c:otherwise>
								</c:choose>
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
							<textarea class="form-control" id="addReplyComment" name="content"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
							<button disabled id="addReplyBtn" type="submit">등록</button>
						</form>			
						<c:if test="${id eq tmp.writer }">
							<form class="comment-update-form" action="comment_update.go" method="post">
								<input type="hidden" name="num" value="${tmp.num }" />
								<textarea class="form-control" id="updateReplyComment" name="content">${tmp.content }</textarea>
								<button disabled id="updateReplyBtn" type="submit">수정</button>
							</form>
						</c:if>
					</li>				
				</c:when>
				<c:otherwise>
					<li <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >삭제된 댓글 입니다.</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</ul>
		<div class="clearfix"></div>	
		
		<!-- 게시글의 댓글폼 -->
		<form action="comment_insert.go" method="post">
			<div class="comment_form">
				<input type="hidden" name="ref_group" value="${dto.num }"/>
				<input type="hidden" name="target_id" value="${dto.writer }"/>
				<c:if test="${empty id }">로그인이 필요합니다.</c:if>
				<textarea class="form-control" id="insert-boardContent" name="content"></textarea>
				<button  class="btn btn-primary" type="submit" disabled id="insertBtn">등록</button>
			</form>
		</div>
	</div>
	
<!--  댓글 페이징 구역 -->
<div class="page-display">
		<ul class="pagination">
		<c:choose>
			<c:when test="${re_startPageNum ne 1 }">
				<li>
					<a href="detail.go?num=${dto.num }&re_pageNum=${re_startPageNum-1 }">
						&laquo;
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${re_startPageNum }" 
			end="${re_endPageNum }" step="1">
			<c:choose>
				<c:when test="${i eq re_pageNum }">
					<li class="active"><a href="detail.go?num=${dto.num }&re_pageNum=${i }">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="detail.go?num=${dto.num }&re_pageNum=${i }">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${re_endPageNum lt re_totalPageCount }">
				<li>
					<a href="detail.go?num=${dto.num }&re_pageNum=${re_endPageNum+1 }">
						&raquo;
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		</ul>		
	</div>
<jsp:include page="../include/footer2.jsp"/>

<script>
	//댓글 수정 링크 눌렀을때 호출
	$(".comment-update-link").click(function(){
		$(this)
		.parent().parent().parent()
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
		var isDelete=confirm("확인을 누르면 댓글이 삭제 됩니다.");
		if(isDelete){
			$.ajax({
				url:"comment_delete.go",
				method:"post",
				data:{"num":num, "ref_group":${dto.num}},
				success:function(responseData){
					if(responseData.isSuccess){
						var sel="#comment"+num;
						$(sel).text("삭제된 댓글 입니다.");
					}
				}
			});
		}
	}
	
	//폼에 submit 이벤트가 일어 났을때
	$(".comments form").on("submit", function(){
		var isLogin=${not empty id};
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath}/users/loginform.go?url=${pageContext.request.contextPath}/board/detail.go?num=${dto.num}";
			return false; 
		}
	});
	$(".comments form textarea").on("click", function(){
		var isLogin=${not empty id};
		if(isLogin==false){
			var isMove=confirm("로그인 페이지로 이동 하시겠습니까?");
			if(isMove){
				location.href="${pageContext.request.contextPath}/users/loginform.go?url=${pageContext.request.contextPath}/board/detail.go?num=${dto.num}";
			}
		}
	});
	//답글 달기 링크를 클릭했을때
	$(".comment .reply_link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-insert-form")
		.slideToggle(200);
		
		if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		}
	});
	function deleteConfirm(){
		var isDelete=confirm("글을 삭제 하시 겠습니까?");
		if(isDelete){
			location.href="delete.go?num=${dto.num}";
		}
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
	$("#addReplyComment").on("input",function(){
		var addReplyComment=$("#addReplyComment").val();
		if(addReplyComment.length!=0){
			$("#addReplyBtn").removeAttr("disabled");
		}else{
			$("#addReplyBtn").attr("disabled","disabled");
		}
	});
	
	// 대댓글의 수정 빈 내용 제출 막기
	$("#updateReplyComment").on("input",function(){
		var updateReplyComment=$("#updateReplyComment").val();
		if(updateReplyComment.length!=0){
			$("#updateReplyBtn").removeAttr("disabled");
		}else{
			$("#updateReplyBtn").attr("disabled","disabled");
		}
	});
	
	
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/suggest/list.jsp</title>
<jsp:include page="../include/resource.jsp"/>
<style>
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
</style>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="suggest" name="category"/>
</jsp:include>
</head>
<body>
<div class="container">
	<h2>건의 사항 게시판 입니다.</h2>
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
						<span>${tmp.regdate }</span>
						<c:choose>
							<c:when test="${id eq tmp.sugId }">
								<a href="javascript:" class="suggest-update-link">수정</a>&nbsp;&nbsp;
								<a href="javascript:deleteConfirm(${tmp.num })">삭제</a>
							</c:when>
						</c:choose>
					</dt>
					<dd>
						<pre>${tmp.sugContent }</pre>
					</dd>
				</dl>
				<c:if test="${id eq tmp.sugId }">
					<form class="suggest-update-form" action="update.go" method="post">
						<input type="hidden" name="num" value="${tmp.num }" />
						<textarea class="form-control" rows="3" name="sugContent" id="update-sugContent">${tmp.sugContent }</textarea>
						<button type="submit">수정</button>
					</form>
				</c:if>
			</li>
		</c:forEach>
		</ul>
		<form action="insert.go" method="post">
			<div class="form-group">
				<input type="hidden" name="sugId" value="${id }" />
				<input type="hidden" name="sugProfile" value="${profile}"/>
				<c:if test="${not empty id}">
					<textarea class="form-control" rows="3" id="insert-sugContent" name="sugContent"></textarea>
					<button class="test" type="submit" disabled>등록</button>
				</c:if>
			</div>
		</form>
	</div>
	<div class="page-display">
		<ul class="pagination pagination-sm">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="list.go?pageNum=${startPageNum-1 }">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active">
						<a href="list.go?pageNum=${i }">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="list.go?pageNum=${i }">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li>
						<a href="list.go?pageNum=${endPageNum+1 }">&raquo;</a>
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
</div>
<script>
	
	// 게시글 수정 링크를 눌렀을때 호출되는 함수 등록
	$(".suggest-update-link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".suggest-update-form")
		.slideToggle(200);
	});
	// 게시글 수정 폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
	$(".suggest-update-form").on("submit", function(){
		// "update.do"
		var url=$(this).attr("action");
		//폼에 작성된 내용을 query 문자열로 읽어온다.
		// num=댓글번호&content=댓글내용
		var data=$(this).serialize();
		//이벤트가 일어난 폼을 선택해서 변수에 담아 놓는다.
		var $this=$(this);
		$.ajax({
			url:url,
			method:"post",
			data:data,
			success:function(responseData){
				// responseData : {isSuccess:true}
				if(responseData.isSuccess){
					//폼을 안보이게 한다 
					$this.slideUp(200);
					//폼에 입력한 내용 읽어오기
					var content=$this.find("textarea").val();
					//pre 요소에 수정 반영하기 
					$this.parent().find("pre").text(content);
				}
			}
		});
		// 폼 제출 막기 
		// ajax 는 페이지 전환 없이 실행되기 떄문에
		// 폼을 제출하면 페이지가 전환 되므로 
		// 폼 제출을 막아준다.
		return false;
	});
	
	var isInsertSug=false;
	
	$("#insert-sugContent").on("input",function(){
		var insertSug=$("#insert-sugContent").val();
		if(insertSug.length!=0){
			$(".test").removeAttr("disabled");
		}else{
			$(".test").attr("disabled","disabled");
		}
	});
	
	function deleteConfirm(num){
		var isDelete=confirm("글을 삭제 하시겠습니까?");
		if(isDelete){
			// ajax 요청
			$.ajax({
				url:"delete.go",
				method:"post",
				data:{"num":num},	
			})
			location.href="${pageContext.request.contextPath}/suggest/list.go";
		}
	}
</script>
</body>
</html>
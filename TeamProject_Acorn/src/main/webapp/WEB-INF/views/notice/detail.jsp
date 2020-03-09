<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/detail.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.contents, table{
		width:100%;
		border:1px dotted #cecece;
		box-shadow: 3px 3px 5px 6px #ccc;
	}
	/* 글 내용의 경계선 표시 */
	.content{
		border: 1px dotted #cecece;
	}
	/* 글 내용안에 있는 이미지의 크기 제한 */
	.content img{
		max-width: 100%;
	}
	/* 댓글에 관련된 css */
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
	/* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
	.comment form{
		display: none;
	}
	.comment{
		position: relative;
	}
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 10px;
		left: 30px;
	}
	.comments .user-img{
		width: 20px;
		height: 20px;
		border-radius: 50%;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="notice" name="category"/>
</jsp:include>
<div class="container">
	<ul class="breadcrumb">
		<li><a href="list.go">글목록 보기</a></li>
		<li><a href="insertform.go">새글 작성</a></li>
		<c:if test="${dto.writer eq id }">
			<li><a href="updateform.go?num=${dto.num }">글 수정하기</a></li>
			<li><a href="javascript:deleteConfirm()">삭제</a></li>
		</c:if>
		<li>글 상세보기</li>
	</ul>
	<c:if test="${not empty keyword }">
		<p> <strong>${keyword }</strong> 검색어로 검색된
		결과 자세히 보기 입니다.</p>
	</c:if>
	<h3>카페 글 상세 보기</h3>

	<c:if test="${dto.prevNum ne 0 }">
		<a href="detail.go?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}">이전글</a>
	</c:if>

	<c:if test="${dto.nextNum ne 0 }">
		<a href="detail.go?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}">다음글</a>
	</c:if>	
	<table class="table table-bordered table-condensed">
		<colgroup>
			<col class="col-xs-4"/>
			<col class="col-xs-8"/>
		</colgroup>
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${dto.regdate }</td>
		</tr>
	</table>
	<div class="contents">${dto.content }</div>
</div>
<script>
	function deleteConfirm(){
		var isDelete=confirm("글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.go?num=${dto.num}";
			
		}
	}
	//댓글 수정 링크를 눌렀을때 호출되는 함수 등록
	$(".comment-update-link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-update-form")
		.slideToggle(200);
	});
	
	//댓글 수정 폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
	$(".comment-update-form").on("submit", function(){
		// "comment_update.go"
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
	
	//댓글 삭제를 눌렀을때 호출되는 함수
	function deleteComment(num){
		var isDelete=confirm("확인을 누르면 댓글이 삭제 됩니다.");
		if(isDelete){
			// 페이지 전환 없이 ajax 요청을 통해서 삭제 하기
			$.ajax({
				url:"comment_delete.go", // "/notice/comment_delete.go" 요청
				method:"post",
				data:{"num":num},	// num 이라는 파라미터명으로 삭제할 댓글의 번호
				success:function(responseData){
					if(responseData.isSuccess){
						var sel="#comment"+num;
						$(sel).text("삭제된 댓글 입니다.");
					}
				}
			});
		}
	}
	
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form").on("submit", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath}/users/loginform.go?url=${pageContext.request.contextPath}/notice/detail.go?num=${dto.num}";
			return false;//폼 전송 막기 
		}
	});
	//폼에 click 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form textarea").on("click", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			var isMove=confirm("로그인 페이지로 이동 하시겠습니까?")
			if(isMove){
				location.href="${pageContext.request.contextPath}/users/loginform.go?url=${pageContext.request.contextPath}/notice/detail.go?num=${dto.num}";	
			}
		}
	});

	//답글 달기 링크를 클릭했을때 실행할 함수 등록
	$(".comment .reply_link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-insert-form")
		.slideToggle(200);
		
		// 답글 <=> 취소가 서로 토글 되도록 한다. 
		if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		}
	});
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/msg/detail.jsp</title>
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
</style>
</head>
<body>
<script>
	
</script>
<div class="container">
	<table class="table table-bordered table-condensed">
		<colgroup>
			<col class="col-xs-4"/>
			<col class="col-xs-8"/>
		</colgroup>
		<c:choose>
			<c:when test="${pageType eq 'sent' }">
				<tr>
					<th>받는 사람</th>
					<td>${dto.idRec}</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th>보낸 사람</th>
					<td>${dto.idSend}</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>보낸 날짜</th>
			<td>${dto.sendDate }</td>
		</tr>
		<tr>
			<th>원래 페이지</th>
			<td>${pageType }</td>
		</tr>
	</table>
	<div class="contents">${dto.content }</div>
	<c:choose>
		<c:when test="${pageType ne null}">
			<button type="button" onclick="location.href='list.go?pageNum=${pageNum }&pageType=${pageType}'">목록보기</button>
		</c:when>
		<c:otherwise>
			<button type="button" onclick="location.href='list.go?pageNum=${pageNum }'">목록보기</button>
			<c:if test="${empty dto.saved }">
				<form action="checksaved.go" method="post">
					<input type="hidden" name="num" value="${dto.num }" />
					<input type="hidden" name="pageNum" value="${pageNum }" />
					<button type="submit">보관하기</button>
				</form>
			</c:if>
		</c:otherwise>
	</c:choose>
	
</div>
</body>
</html>

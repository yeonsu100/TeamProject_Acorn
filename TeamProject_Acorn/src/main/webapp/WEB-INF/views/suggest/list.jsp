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
	.comments .user-img{
		width: 20px;
		height: 20px;
		border-radius: 50%;
	}
	.comments form textarea, .comments form button{
		float: left;
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
			<li>
				<dl>
					<dt>
						<c:choose>
							<c:when test="${empty profile }">
								<img class="user-img" src="${pageContext.request.contextPath}/resources/images/default_user.jpeg"/>
							</c:when>
							<c:otherwise>
								<img class="user-img" src="${pageContext.request.contextPath}${profile}"/>
							</c:otherwise>
						</c:choose>
						<span>${tmp.sugId }</span>
						<span>${tmp.regdate }</span>
						<c:choose>
							<c:when test="${id eq tmp.sugId }">
								<a href="javascript:" class="comment-update-link">수정</a>&nbsp;&nbsp;
								<a href="javascript:deleteComment(${tmp.num })">삭제</a>
							</c:when>
						</c:choose>
					</dt>
					<dd>
						<pre>${tmp.sugContent }</pre>
					</dd>
				</dl>
			</li>
		</c:forEach>
		</ul>
		<form action="insert.go" method="post">
			<div class="form-group">
				<input type="hidden" name="sugId" value="${id }" />
				<input type="hidden" name="sugProfile" value="${profile}"/>
				<c:if test="${not empty id}">
					<textarea class="form-control" rows="3" id="sugContent" name="sugContent"></textarea>
					<button type="submit">등록</button>
				</c:if>
			</div>
		</form>
	</div>
	<c:choose>
		<c:when test="${startPageNum ne 1 }">
			<li>
				<a href="list.go?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedKeyword}">&laquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="disabled">
				<a href="javascript:">&laquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/msg/savedlist.jsp</title>
<jsp:include page="../include/resource.jsp"/>
<style>
	body{padding-top: 0px;}
</style>
</head>
<body>
<jsp:include page="msgnav.jsp"/>
<div class="container">
	<h3>보관함</h3>
	<table class="table table-striped table-condensed">
		<colgroup>
			<col class="col-xs-2"/>
			<col class="col-xs-5"/>
			<col class="col-xs-2"/>
			<col class="col-xs-2"/>
		</colgroup>
		<thead>
			<tr>
				<th>보낸 사람</th>
				<th>제목</th>
				<th>보낸 시간</th>
				<th>읽은 시간</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.idSend }</td>
				<td>
					<a href="detail.go?num=${tmp.num }">${tmp.title }</a>
				</td>
				<td>${tmp.sendDate}</td>
				<td>${tmp.readDate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>	
	<div class="page-display">
		<ul class="pagination pagination-sm">
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
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active">
						<a href="list.go?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="list.go?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li>
						<a href="list.go?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedKeyword}">&raquo;</a>
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
</body>
</html>
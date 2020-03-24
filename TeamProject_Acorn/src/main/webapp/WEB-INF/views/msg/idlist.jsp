<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/msg/list.jsp</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<jsp:include page="msgnav.jsp"/>
<div class="container">
	<table class="table table-striped table-condensed">
		<thead>
			<tr>
				<th>아이디</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>
					<a href="sendform.go?userid=${tmp.userid }"></a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="page-display">
		<ul class="pagination pagination-sm">
		<c:choose>
			<c:when test="${pageType ne null }">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li>
							<a href="idlist.go?pageNum=${startPageNum-1 }">&laquo;</a>
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
								<a href="idlist.go?pageNum=${i }">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="idlist.go?pageNum=${i }">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
					<c:choose>
						<c:when test="${endPageNum lt totalPageCount }">
							<li>
								<a href="idlist.go?pageNum=${endPageNum+1 }">&raquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="disabled">
								<a href="javascript:">&raquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li>
							<a href="idlist.go?pageNum=${startPageNum-1 }">&laquo;</a>
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
								<a href="idlist.go?pageNum=${i }">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="idlist.go?pageNum=${i }">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
					<c:choose>
						<c:when test="${endPageNum lt totalPageCount }">
							<li>
								<a href="idlist.go?pageNum=${endPageNum+1 }">&raquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="disabled">
								<a href="javascript:">&raquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
			</c:otherwise>
		</c:choose>
		</ul>
	</div>
</div>
</body>
</html>
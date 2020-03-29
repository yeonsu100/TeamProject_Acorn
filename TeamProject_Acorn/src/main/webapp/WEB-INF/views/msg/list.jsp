<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/msg/list.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"/>
</head>
<body>
<jsp:include page="msgnav.jsp"/>
<div class="container">
		
	<table class="table table-striped table-condensed">
		<colgroup>
			<col class="col-xs-2"/>
			<col class="col-xs-5"/>
			<col class="col-xs-2"/>
			<col class="col-xs-2"/>
		</colgroup>
		<thead>
			<tr>
				<c:choose>
					<c:when test="${pageType eq 'sent' }">
						<th>받는 사람</th>
					</c:when>
					<c:otherwise>
						<th>보낸 사람</th>
					</c:otherwise>
				</c:choose>
				<th>제목</th>
				<th>보낸 시간</th>
				<th>읽은 시간</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<c:choose>
					<c:when test="${pageType eq 'sent' }">
						<td>${tmp.idRec }</td>
					</c:when>
					<c:otherwise>
						<td>${tmp.idSend }</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageType ne null }">
						<td>
							<a href="detail.go?num=${tmp.num }&pageNum=${pageNum}&pageType=${pageType}">${tmp.title }</a>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<a href="detail.go?num=${tmp.num }&pageNum=${pageNum}">${tmp.title }</a>
						</td>
					</c:otherwise>
				</c:choose>
				
				
				<td>${tmp.sendDate}</td>
				<td>${tmp.readDate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<a href="sendform.go" class="btn btn-primary">메시지 보내기</a>
	
	<nav aria-label="Search pages">
		<ul class="pagination pagination-sm" style="text-align:right;">
		<c:choose>
			<c:when test="${pageType ne null }">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li class="page-item">
							<a class="page-link" href="list.go?pageNum=${startPageNum-1 }&pageType=${pageType }">&laquo;</a>
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
								<a class="page-link" href="list.go?pageNum=${i }&pageType=${pageType }">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="list.go?pageNum=${i }&pageType=${pageType }">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
					<c:choose>
						<c:when test="${endPageNum lt totalPageCount }">
							<li class="page-item">
								<a class="page-link" href="list.go?pageNum=${endPageNum+1 }&pageType=${pageType }">&raquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<a class="page-link" href="javascript:">&raquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
			</c:when>
			<c:otherwise>
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
			</c:otherwise>
		</c:choose>
		</ul>
	</nav>
</div>
</body>
</html>
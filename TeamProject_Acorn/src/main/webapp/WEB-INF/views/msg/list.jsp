<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource_boot4.jsp"/>
<style>	
body{
	margin-top: 0px;
}
.title {
	display: inline-block;
	max-width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
table {
    table-layout: fixed;
    word-wrap: break-word;
}
.table th,
.table td {
	border-top: 1px solid #F1A4BA;
}
.table thead th {
  	border-bottom: 2px solid #F1A4BA;
}
.table td a{
	color:#212529;
}
.table-hover tbody tr:hover {
	background-color: #f5d7e0;
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
</style>
</head>
<style>

</style>
<body>
<jsp:include page="msgnav.jsp"/>
<div class="container">
	<table class="table table-hover table-sm">
		<thead>
			<tr>
				<c:choose>
					<c:when test="${pageType eq 'sent' }">
						<th style="width:20%">받는 사람</th>
						<th style="width:44%">제목</th>
						<th style="width:18%">보낸 시간</th>
						<th style="width:18%">읽은 시간</th>
					</c:when>
					<c:otherwise>
						<th style="width:20%">보낸 사람</th>
						<th style="width:58%">제목</th>
						<th style="width:22%">보낸 시간</th>
					</c:otherwise>
				</c:choose>
				
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<c:choose>
				<c:when test="${empty pageType }">
					<c:choose>
						<c:when test="${not empty tmp.readDate }">
							<tr style="color:#c9c9c9 !important">
						</c:when>
						<c:otherwise>
							<tr>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<tr>
				</c:otherwise>
			</c:choose>
			
				<c:choose>
					<c:when test="${pageType eq 'sent' }">
						<td class="align-middle">${tmp.idRec }</td>
					</c:when>
					<c:otherwise>
						<td class="align-middle">${tmp.idSend }</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageType ne null }">
						<td class="align-middle">
							<a class="title" href="detail.go?num=${tmp.num }&pageNum=${pageNum}&pageType=${pageType}">${tmp.title }</a>
						</td>
					</c:when>
					<c:otherwise>
						<td class="align-middle">
							<a class="title" href="detail.go?num=${tmp.num }&pageNum=${pageNum}" 
								<c:if test="${not empty tmp.readDate }"> style="color:#c9c9c9;"</c:if>>${tmp.title }</a>
						</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${pageType eq 'sent' }">
						<td class="align-middle">${tmp.sendDate}</td>
						<td class="align-middle">${tmp.readDate}</td>
					</c:when>
					<c:otherwise>
						<td class="align-middle">${tmp.sendDate}</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="text-right">
		<a href="sendform.go" class="btn btn-primary btn-sm">메시지 보내기</a>
	</div>
		
	<nav aria-label="Search pages">
		<ul class="pagination pagination-sm">
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
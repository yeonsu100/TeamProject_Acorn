<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"/>
<style>
h1{color: #F1648A;}
thead{background-color: #F1A4BA;}
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
	background-color: #F1C4DA;
}
.btn-primary{
	background-color:#F1648A;
	border:0;
	outline:0;
}
.btn-primary:hover{
	background-color:#F1C4DA;
	border:0;
	outline:0;
}
.btn-primary:focus, .btn-primary.focus {
	color: #fff;
	background-color: #F1648A;
	border: 0;
	box-shadow: 0 0 0 0.1rem #F1C4DA;
}
.btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active,
.show > .btn-primary.dropdown-toggle {
  color: #fff;
  background-color: #F1648A;
  border-color: #F1C4DA;
}
.btn-primary:not(:disabled):not(.disabled):active:focus, .btn-primary:not(:disabled):not(.disabled).active:focus,
.show > .btn-primary.dropdown-toggle:focus {
  box-shadow: 0 0 0 0.1rem #F1C4DA;
}
.page-link {
  color: #F1648A;
  border: 1px solid #F1C4DA;
}
.page-link:hover {
  color: #F1648A;
  background-color: #F1C4DA;
  border-color: #F1C4DA;
}
.page-item.active .page-link {
  color: #fff;
  background-color: #F1648A;
  border-color: #F1C4DA;
}
.page-item.disabled .page-link {
  border-color: #F1C4DA;
}
</style>
</head>
<body>
<jsp:include page="../include/navbar2.jsp">
	<jsp:param value="file" name="category" />
</jsp:include>

<div class="container">
	<h1>자료실</h1>
	<p>업무상 필요한 자료를 공유할 수 있는 자료실입니다. 운영목적에 맞지 않는 게시물은 관리자 권한으로 삭제될 수 있습니다.</p> <br/>	
	
	<c:if test="${not empty keyword }">
		<p>
			<strong>${keyword }</strong> 라는 키워드로
			<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
		</p>
	</c:if>
	
	<table class="table table-hover table-sm">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>파일 제목</th>
				<th>파일명</th>
				<th>파일 크기 (byte)</th>
				<th>다운로드 수</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
		</thead>
				
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>${tmp.title }</td>
				<td>
					<a href="download.go?num=${tmp.num }">
						${tmp.orgFileName }
					</a>
				</td>
				<td>${tmp.fileSize }</td>
				<td>${tmp.downCount }</td>
				<td>${tmp.regdate }</td>
				<td>
					<c:choose>
						<c:when test="${id eq tmp.writer}">
							<a href="javascript:deleteConfirm(${tmp.num })"><i class="fa fa-trash" aria-hidden="true"></i></a>
						</c:when>
						<c:otherwise>
							<c:if test="${not empty isAdmin }">
								<a href="javascript:deleteConfirm(${tmp.num })"><i class="fa fa-trash" aria-hidden="true"></i></a>
							</c:if>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="text-right">
			<a href="upload_form.go" class="btn btn-primary btn-sm">파일 업로드</a>
	</div>
	
	<nav aria-label="Search pages" class="d-flex">
		<ul class="pagination pagination-sm mx-auto">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li class="page-item">
					<a class="page-link" href="list.go?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedKeyword}">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="w" begin="${startPageNum }" end="${endPageNum }" step="1">
			<c:choose>
				<c:when test="${w eq pageNum }">
					<li class="page-item active">
						<a class="page-link" href="list.go?pageNum=${w }&condition=${condition}&keyword=${encodedKeyword}">${w }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="list.go?pageNum=${w }&condition=${condition}&keyword=${encodedKeyword}">${w }</a>
					</li>
				</c:otherwise>
			</c:choose>	
		</c:forEach>
		
			<c:choose>
				<c:when test="${endPageNum lt totalPageNum }">
					<li class="page-item">
						<a class="page-link" href="list.go?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedKeyword}">&raquo;</a>
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
	
	<form action="list.go" method="get">
		<label for="condition">검색 조건</label>
		<select name="condition" id="condition">
			<option value="titlename" <c:if test="${condition eq 'titlename' }">selected</c:if> >파일 제목 또는 파일명</option>
			<option value="title" <c:if test="${condition eq 'title' }">selected</c:if> >파일 제목</option>
			<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if> >작성자</option>
		</select>
		<input type="text" name="keyword" id="keyword" placeholder="키워드를 입력하세요..." value="${keyword }" />
		<button type="submit">검색</button>
	</form>
	
</div>

<script>
	function deleteConfirm(num){
		var isDelete=confirm("확인 버튼을 누르면 "+num+"번 게시물이 삭제됩니다.");
		if(isDelete){
			location.href="delete.go?num="+num;
		}
	}
</script>
<br/><br/><br/>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
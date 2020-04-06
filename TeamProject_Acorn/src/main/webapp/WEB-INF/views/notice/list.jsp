<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/list.jsp</title>
<jsp:include page="../include/resource.jsp" />
<style>
	h1{color: #6799FF;}
	thead{background-color: #B2CCFF;}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="notice" name="category"/>
</jsp:include>

<div class="container">

	
	<h1>공지사항</h1>
	<p>각종 공지사항을 확인하실 수 있는 게시판 입니다.</p> <br/>
	
	<c:choose>
		<c:when test="${not empty keyword }">
			<p>
				키워드 (<strong>${keyword }</strong>)에 해당하는 게시물 목록입니다.</br>
				총 <strong>${totalRow }</strong>개 게시물이 검색되었습니다.
			</p>
		</c:when>
		<c:otherwise>
			<p>총 <strong>${totalRow }</strong>개 게시물이 존재합니다.</p>
		</c:otherwise>
	</c:choose>
	
	<table class="table table-striped table-hover">
		<colgroup>
			<col class="col-xs-1"/>
			<col class="col-xs-2"/>
			<col class="col-xs-5"/>
			<col class="col-xs-1"/>
			<col class="col-xs-3"/>
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>
					<a href="detail.go?num=${tmp.num }&condition=${condition }&keyword=${encodedKeyword }">${tmp.title }</a>
				</td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="text-right">
		<button type="button" class="btn btn-outline-primary">
			<a href="insertform.go">공지사항 작성</a>
		</button>
	</div>
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
		<form action="list.go" method="get">
		<label for="condition">검색 조건</label>
		<select name="condition" id="condition">
			<option value="title"<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
			<option value="writer"<c:if test="${condition eq 'writer' }">selected</c:if> >작성자</option>
		</select>
		<input type="text" name="keyword" id="keyword" placeholder="키워드를 입력하세요..." value="${keyword }"/>
		<button type="submit">검색</button>
	</form>
</div>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
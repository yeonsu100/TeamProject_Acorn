<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	h1{color: #F1648A;}
	thead{background-color: #B2CCFF;}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="category" />
</jsp:include>

<div class="container">
	<h1>자료실</h1>
	<p>자료게시판 운영 목적과 맞지 않는 게시물은 관리자 권한으로 삭제될 수 있습니다.</p> <br/>
	
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
					<c:if test="${id eq tmp.writer }">
						<a href="javascript:deleteConfirm(${tmp.num })">삭제</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="text-right">
		<button type="button" class="btn btn-outline-primary">
			<a href="upload_form.go">파일 업로드하기</a></h3>
		</button>
	</div>
	
	<div class="page-display pager">
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
		
		<c:forEach var="w" begin="${startPageNum }" end="${endPageNum }" step="1">
			<c:choose>
				<c:when test="${w eq pageNum }">
					<li class="active">
						<a href="list.go?pageNum=${w }&condition=${condition}&keyword=${encodedKeyword}">${w }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="list.go?pageNum=${w }&condition=${condition}&keyword=${encodedKeyword}">${w }</a>
					</li>
				</c:otherwise>
			</c:choose>	
		</c:forEach>
		
			<c:choose>
				<c:when test="${endPageNum lt totalPageNum }">
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
		<label for="condition">검색하기</label>
		<select name="condition" id="condition">
			<option value="titlename" <c:if test="${condition eq 'titlename' }">selected</c:if> >파일 제목 또는 파일명</option>
			<option value="title" <c:if test="${condition eq 'title' }">selected</c:if> >파일 제목</option>
			<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if> >작성자</option>
		</select>
		<input type="text" name="keyword" id="keyword" placeholder="키워드를 입력하세요" value="${keyword }" />
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
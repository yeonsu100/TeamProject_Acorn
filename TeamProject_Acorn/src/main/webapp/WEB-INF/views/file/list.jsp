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
	h1{color:#6EE3F7;}
	h3{color : #FF9090;}
	thead{background-color:#B2EBF4;}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="category" />
</jsp:include>

<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.go">Show all uploaded files (List)</a></li>
	</ol>
	
	<h1>자료실</h1>
	
	<c:choose>
		<c:when test="${not empty keyword }">
			<p>
				The keyword (<strong>${keyword }</strong>) that you searched is here. </br>
				Count of it. : <strong>${totalRow }</strong>
			</p>
		</c:when>
		<c:otherwise>
			<p>Total : <strong>${totalRow }</strong> files are here.</p>
		</c:otherwise>
	</c:choose>
	
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>No.</th>
				<th>Writer</th>
				<th>Title</th>
				<th>File Name</th>
				<th>File Size</th>
				<th>Down Count</th>
				<th>Date</th>
				<th>Delete</th>
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
						<a href="javascript:deleteConfirm(${tmp.num })">Delete</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>

		</tbody>
	</table>
	
	<h3><a href="upload_form.go">Upload a File</a></h3>
	
	<div class="page-display pager">
		<ul class="pagination pagination-sm">
		
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedKeyword}">&laquo;</a>
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
		<label for="condition">Search for...</label>
		<select name="condition" id="condition">
			<option value="titlename" <c:if test="${condition eq 'titlename' }">selected</c:if> >Title + File Name</option>
			<option value="title" <c:if test="${condition eq 'title' }">selected</c:if> >Title</option>
			<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if> >Writer</option>
		</select>
		<input type="text" name="keyword" id="keyword" placeholder="Enter a Keyword..." value="${keyword }" />
		<button type="submit">Search</button>
	</form>
	
</div>

<script>
	function deleteConfirm(num){
		var isDelete=confirm("Are you sure delete this No."+num+" file?");
		if(isDelete){
			location.href="delete.go?num="+num;
		}
	}
</script>

</body>
</html>
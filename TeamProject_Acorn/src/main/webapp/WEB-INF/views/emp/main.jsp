<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="admin" name="category"/>
</jsp:include>
<div class="container">
	
	<h1>사원 목록</h1>
	<table class="table table-striped table-hover">
		<colgroup>
			<col class="col-xs-2"/>
			<col class="col-xs-1"/>
			<col class="col-xs-2"/>
			<col class="col-xs-1"/>
			<col class="col-xs-3"/>
			<col class="col-xs-1"/>
			<col class="col-xs-2"/>
		</colgroup>
		<thead>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>입사일</th>
				<th>정보 삭제<br/>(전체/가입정보)</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.empno }</td>
				<td>${tmp.ename }</td>
				<td>${tmp.pnum }</td>
				<td>${tmp.userid }</td>
				<td>${tmp.email }</td>
				<td>${tmp.hdate }</td>
				<td>
					<a href="${pageContext.request.contextPath }/emp/delete.go?empno=${tmp.empno}" onclick="return confirm('${tmp.empno}번 사원의 모든 정보를 삭제하시겠습니까?')"><span class="glyphicon glyphicon-trash"/></a> / 
					<a href="${pageContext.request.contextPath }/users/delete.go?empno=${tmp.empno}" onclick="return confirm('${tmp.empno}번 사원의 계정을 삭제하시겠습니까?')"><span class="glyphicon glyphicon-floppy-remove"/></a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="text-right">
		<a  class="btn btn-primary btn-sm" 
			href="${pageContext.request.contextPath }/emp/insertform.go">사원 정보 추가</a>
	</div>
	
	<div class="page-display">
		<ul class="pagination pagination-sm">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="main.go?pageNum=${startPageNum-1 }&keyword=${encodedKeyword}">&laquo;</a>
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
						<a href="main.go?pageNum=${i }&keyword=${encodedKeyword}">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="main.go?pageNum=${i }&keyword=${encodedKeyword}">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li>
						<a href="main.go?pageNum=${endPageNum+1 }&keyword=${encodedKeyword}">&raquo;</a>
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
 		<form action="main.go" method="get">
			<label for="keyword">사원 검색</label>
			<input type="text" name="keyword" id="keyword" placeholder="사원명을 입력하세요..."/>
			<button type="submit">검색</button>
		</form>
</div>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
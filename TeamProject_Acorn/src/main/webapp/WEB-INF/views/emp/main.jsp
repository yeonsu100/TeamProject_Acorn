<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource_boot4.jsp"></jsp:include>
<style>
h1{color: #F1648A;}
thead{
	background-color: #F1A4BA;
	vertical-align: inherit;
  	font-weight: bold;
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
  background-color: #F1A4BA;
  border-color: #F1A4BA;
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
<jsp:include page="../include/navbar2.jsp">
	<jsp:param value="admin" name="category"/>
</jsp:include>
</head>
<body>
<div class="container">
	
	<h1>사원 목록</h1>
	<p>바나프레소의 모든 임직원 목록입니다.</p> <br/>	
	
	<form action="main.go" method="get">
		<div class="input-group input-group-sm" style="width:25%;">
			<input class="form-control" type="text" name="keyword" 
				placeholder="사원명을 입력하세요..."/>
			<div class="input-group-append">
				<button class="btn btn-primary btn-sm" type="submit">검색</button>
			</div>
		</div>
	</form>
	
	<table class="table table-hover table-sm mt-3">
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
				<th>이메일 주소</th>
				<th>입사일</th>
				<th>퇴사</th>
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
					<a href="javascript:resignConfirm(${tmp.empno })">
						<span class="fas fa-trash-alt"/>
					</a>
					<script type="text/javascript">
					function resignConfirm(inputEmpno){
						swal({
							  title: inputEmpno+" 번 사원을 퇴사처리하시겠습니까?",
							  icon: "warning",
							  buttons: true,
							  dangerMode: true,
							})
							.then((willDelete) => {
								  if (willDelete) {
										location.href="${pageContext.request.contextPath }/emp/resign.go?empno="+inputEmpno
								  } else {
								    swal("취소");
								  }
								});
					}
					</script>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="text-right">
		<a class="btn btn-primary btn-sm" href="resignlist.go">퇴사자 목록</a>
		<a class="btn btn-primary btn-sm" 
			href="${pageContext.request.contextPath }/emp/insertform.go">사원 정보 추가</a>
	</div>
	
	<nav aria-label="Search pages" class="d-flex">
		<ul class="pagination pagination-sm mx-auto">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li class="page-item">
					<a class="page-link" href="main.go?pageNum=${startPageNum-1 }&keyword=${encodedKeyword}">&laquo;</a>
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
						<a class="page-link" href="main.go?pageNum=${i }&keyword=${encodedKeyword}">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="main.go?pageNum=${i }&keyword=${encodedKeyword}">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="main.go?pageNum=${endPageNum+1 }&keyword=${encodedKeyword}">&raquo;</a>
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
 		
</div>
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>

</body>
<jsp:include page="../include/footer2.jsp"/>
<jsp:include page="../include/msgbtn.jsp"/>
</html>
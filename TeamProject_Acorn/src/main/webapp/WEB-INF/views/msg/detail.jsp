<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** banapresso **</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.banapresso.com/ico_logo.ico">
<jsp:include page="../include/resource_boot4.jsp"></jsp:include>
<style>
body{
	margin-top: 1rem;
}
table{
	table-layout: fixed;
    word-wrap: break-word;
}
.container{
	font-size:14px;
	padding-top:20px;
}
.btn-group .btn-secondary{
	background-color:#F1648A;
	border:0;
	outline:0;
}
.btn-group .btn-secondary:hover{
	background-color:#F1A4BA;
	border:0;
	outline:0;
}
.btn-group .btn-secondary:focus, .btn-group .btn-secondary.focus {
	color: #fff;
	background-color: #F1648A;
	border: 0;
	box-shadow: 0 0 0 0.1rem #F1A4BA;
}
.btn-group .btn-secondary:not(:disabled):not(.disabled):active, .btn-group .btn-secondary:not(:disabled):not(.disabled).active{
  color: #fff;
  background-color: #F1648A;
  border-color: #F1A4BA;
}
.btn-group .btn-secondary:not(:disabled):not(.disabled):active:focus, .btn-group .btn-secondary:not(:disabled):not(.disabled).active:focus{
  box-shadow: 0 0 0 0.1rem #F1A4BA;
}
.table-bordered th,
.table-bordered td {
  	border: 2px solid #F1A4BA !important;
}
</style>
</head>
<body>
<div class="container">
	<table class="table table-bordered table-condensed">
		<c:choose>
			<c:when test="${pageType eq 'sent' }">
				<tr>
					<th style="width:30%">받는 사람</th>
					<td style="width:70%">${dto.idRec}</td>
				</tr>
			</c:when>
			<c:otherwise>
				<form action="sendform.go" method="post" id="reply">
					<input type="hidden" name="idRec" value="${dto.idSend }" />
				</form>
				<tr>
					<th style="width:30%">보낸 사람</th>
					<td style="width:70%">${dto.idSend}</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>보낸 날짜</th>
			<td>${dto.sendDate }</td>
		</tr>
		<tr>
			<td style="white-space:pre-wrap;" colspan="2">${dto.content }</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${pageType ne null}">
			<div class="btn-group btn-group-sm float-right" role="group" aria-label="...">
				<button class="btn btn-secondary" type="button" onclick="location.href='list.go?pageNum=${pageNum }&pageType=${pageType}'">목록</button>
				<c:choose>
					<c:when test="${pageType eq 'sent' }">
						<button class="btn btn-secondary" type="button" onclick="location.href='javascript:deleteSendConfirm()'">삭제</button>
					</c:when>
					<c:when test="${pageType eq 'saved' }">
						<button class="btn btn-secondary" type="button" onclick="location.href='javascript:deleteSavedConfirm()'">삭제</button>
					</c:when>
				</c:choose>
			</div>
		</c:when>
		<c:otherwise>
			<form action="checksaved.go" method="post" id="saveforms">
				<input type="hidden" name="num" value="${dto.num }" />
				<input type="hidden" name="pageNum" value="${pageNum }" />
			</form>
			<div class="btn-group btn-group-sm float-right" role="group" aria-label="...">
				<button class="btn btn-secondary" type="button" onclick="location.href='list.go?pageNum=${pageNum }'">목록</button>
				<button class="btn btn-secondary" type="button" onclick="location.href='javascript:deleteRecConfirm()'">삭제</button>
				<c:if test="${empty dto.saved }">
					<button class="btn btn-secondary" type="submit" form="saveforms" value="submit">보관</button>
				</c:if>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
<script>
function deleteRecConfirm(){
	swal({
		  title: "글을 삭제 하시겠습니까?",
		  text: "글을 삭제하시면 복구 하실 수 없습니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  location.href="recdel.go?num=${dto.num}&pageNum=${pageNum}";
		  } else {
		    swal("삭제를 취소 하셨습니다.");
		  }
		});
}
function deleteSendConfirm(){
	swal({
		  title: "글을 삭제 하시겠습니까?",
		  text: "글을 삭제하시면 복구 하실 수 없습니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  location.href="senddel.go?num=${dto.num}&pageNum=${pageNum}&pageType=${pageType}";
		  } else {
		    swal("삭제를 취소 하셨습니다.");
		  }
		});
}
function deleteSavedConfirm(){
	swal({
		  title: "글을 삭제 하시겠습니까?",
		  text: "글을 삭제하시면 복구 하실 수 없습니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  location.href="saveddel.go?num=${dto.num}&pageNum=${pageNum}&pageType=${pageType}";
		  } else {
		    swal("삭제를 취소 하셨습니다.");
		  }
		});
}
</script>
</body>
</html>

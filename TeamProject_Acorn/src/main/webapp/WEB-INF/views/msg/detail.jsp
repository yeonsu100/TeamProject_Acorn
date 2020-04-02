<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/msg/detail.jsp</title>
<jsp:include page="../include/resource_boot4.jsp"></jsp:include>
<style>
table{
	table-layout: fixed;
    word-wrap: break-word;
}
.container{
	font-size:14px;
	padding-top:20px;
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
<script>
function deleteRecConfirm(){
	var isDelete=confirm("글을 삭제 하시 겠습니까?");
	if(isDelete){
		location.href="recdel.go?num=${dto.num}&pageNum=${pageNum}";
	}
}
function deleteSendConfirm(){
	var isDelete=confirm("글을 삭제 하시 겠습니까?");
	if(isDelete){
		location.href="senddel.go?num=${dto.num}&pageNum=${pageNum}&pageType=${pageType}";
	}
}
function deleteSavedConfirm(){
	var isDelete=confirm("글을 삭제 하시 겠습니까?");
	if(isDelete){
		location.href="saveddel.go?num=${dto.num}&pageNum=${pageNum}&pageType=${pageType}";
	}
}
</script>
</body>
</html>

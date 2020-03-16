<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/mytrello/doing/list.jsp</title>
<jsp:include page="../../include/resource.jsp"/>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"/>

<div class="container">
	<h1>현재 하고 있는 업무</h1>
	<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th>No.</th>
			<th>프로젝트명</th>
			<th>세부 업무 사항</th>
			<th>입력 날짜</th>
			<th>수정하기</th>
			<th>삭제하기</th>
		</tr>
	</thead>
	<tbody>
			<c:forEach var="tmp" items="${requestScope.list }">	
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.title }</td>
					<td>${tmp.content }</td>
					<td>${tmp.regdate }</td>
					<td><a href="updateform.go?num=${tmp.num }"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a href="delete.go?num=${tmp.num }"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h3><a href="insertform.go">Add an assignment</a></h3>
</div>

</body>
</html>
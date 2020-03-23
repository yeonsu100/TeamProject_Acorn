<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<jsp:include page="include/resource.jsp"/>

<style>
	*{
		list-style: none;
	}
	body, html{
		margin: 0;
		padding: 0;
		width: 100%;
		height: 100%;
		background: #333;
	}
	.section-top{
		width: 100%;
		height: 100%;
		overflow: hidden;
		position: relative;
		background-repeat: no-repeat;
		background-size: cover;
		animation: slide 10s infinite;
	}
	.metro{
		color: white;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	.item{
		width: 100px;
		height: 100px;
		float: left;
		background: #B2CCFF;
		margin: 4px;
		cursor: pointer;
		text-align: center;
		position: relative;
		transition: 0.5s;
	}
	.item :hover{
		transform: scale(0.9);
	}
	.item i{
		font-size: 36px;
		line-height: 90px;
		opacity: 0.8;
	}
	.item span{
		opacity: 0.8;
		position: absolute;
		bottom: 6px;
		left: 6px;
		font-size: 15px;
	}
	.i1{
		width: 208px;
	}

</style>
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<div class="section-top">
	<div class="metro">
		<div class="l1">
			<li class="item i1">
				<i class="glyphicon glyphicon-bullhorn"></i>
				<span>Notice</span>
			</li>
			
			<li class="item i2">
				<i class="glyphicon glyphicon-pencil"></i>
				<span>Board</span>
			</li>
		</div>
		<div class="l2">
			<li class="item i3">
				<i class="glyphicon glyphicon-inbox"></i>
				<span>Suggest</span>
			</li>
			
			<li class="item i4">
				<i class="glyphicon glyphicon-floppy-save"></i>
				<span>Web Hard</span>
			</li>
			
			<li class="item i5">
				<i class="glyphicon glyphicon-th-list"></i>
				<span>To Do</span>
			</li>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${empty sessionScope.isAdmin }">
		</c:when>
		<c:otherwise>
			<a href="emp/insertform.go">사원 추가(임시)</a>
		</c:otherwise>
	</c:choose>
</div>

</body>
</html>

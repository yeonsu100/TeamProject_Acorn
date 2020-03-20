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
	body, html{
		margin: 0;
		padding: 0;
		width: 100%,
		height: 100%;
	}
	.section-top{
		width: 100%;
		height: 100%;
		overflow: hidden;
		position: relative;
		background-color: #000000;
		background-repeat: no-repeat;
		background-size: cover;
		animation: slide 10s infinite;
	}
	.content{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		text-transform: uppercase;
		text-align: center;
	}
	.content h1{
		color: white;
		font-size: 60px;
		letter-spacing: 16px;
	}
	.content a{
		background: #D9E5FF;
		padding: 10px 24px;
		color: black;
		text-decoration: none;
		font-size: 18px;
		border-radius: 20px;
	}
	p{
		font-size: 20px;
		padding: 10px;
		line-height: 24px;
	}
	@keyframes slide {
		0%{
			background-color: #6799FF;
		}
		33%{
			background-color: #4374D9;
		}
		67%{
			background-color: #003399;
		}
	}
</style>

</head>
<body>
<jsp:include page="include/navbar.jsp"/>

<div class="section-top">
	<div class="content">
		<h1>Main Page</h1>
		<a href="${pageContext.request.contextPath }/notice/list.go"></a>
		
	</div>
	
	<c:choose>
		<c:when test="${empty sessionScope.isAdmin }">
		</c:when>
		<c:otherwise>
			<a href="emp/insertform.go">사원 추가(임시)</a>
		</c:otherwise>
	</c:choose>
</div>

<p>
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
</p>

</body>
</html>
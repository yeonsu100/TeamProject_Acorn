<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.logo-image{
	width: 9rem;
	height: 1.5rem;
    visibility: visible;
    
}
.navbar{
	background-color:#FFF;
	margin-bottom:1rem;
	border-bottom: 1px solid #f5f5f5;
}
.navbar-light .navbar-text{
	color:black;
}
.navbar-expand-md .navbar-nav .nav-link {
	padding-right: 1rem;
	padding-left: 1rem;
}
.navbar-toggler{
	margin-top:0.5rem;
	margin-bottom:0.5rem;
}
.navbar-nav .nav-item .nav-link span{
	padding-bottom: 0.5rem;
}
.navbar-nav .nav-item.active .nav-link span{
	color:#F1648A;
	font-weight:bold;
	border-bottom: 3px solid #F1648A;
}
.navbar-nav .nav-item .nav-link:hover span{
	color:#F1648A;
	font-weight:bold;
	border-bottom: 3px solid #F1648A;
}
.navbar-nav .nav-item .nav-link span:not(:disabled):not(.disabled):active, 
.navbar-nav .nav-item .nav-link span:not(:disabled):not(.disabled).active{
	color:#F1648A;
	font-weight:bold;
	border-bottom: 3px solid #F1648A;
}
.navbar-nav .nav-item .nav-link{
	color:black;
}
.navbar-nav .nav-item.active .nav-link{
	color:#F1648A;
	font-weight:bold;
}
</style>
<nav class="navbar fixed-top navbar-expand-lg navbar-light py-0">
<div class="container">
	<a class="navbar-brand" href="${pageContext.request.contextPath }/home.go">
		<img src="${pageContext.request.contextPath }/resources/images/bana_logo_1.png" class="logo-image" >
	</a>
	<button class="navbar-toggler" data-toggle="collapse" data-target="#one" type="button" 
			aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse" id="one">
		<ul class="navbar-nav">
			<li class="nav-item <c:if test="${param.category eq 'notice' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/notice/list.go"><span><i class="fas fa-bullhorn"></i>&nbsp;공지사항</span></a></li>
			<li class="nav-item <c:if test="${param.category eq 'board' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/board/list.go"><span><i class="fas fa-pencil-alt"></i>&nbsp; 게시판</span></a></li>
			<li class="nav-item <c:if test="${param.category eq 'suggest' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/suggest/list.go"><span><i class="fas fa-envelope-open-text"></i>&nbsp; 건의함</span></a></li>
			<li class="nav-item <c:if test="${param.category eq 'file' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/file/list.go"><span><i class="fas fa-download"></i>&nbsp; 자료실</span></a></li>
			<li class="nav-item <c:if test="${param.category eq 'mytrello' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/mytrello/list.go"><span><i class="fas fa-tasks"></i>&nbsp; 체크 리스트</span></a></li>
			<c:if test="${not empty isAdmin}">
				<li class="nav-item <c:if test="${param.category eq 'admin' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/emp/main.go"><span><i class="fas fa-wrench"></i>&nbsp; 관리</span></a></li>
			</c:if>
		</ul>
		
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<div class="ml-auto">
				<a class="btn btn-primary navbar-btn btn-xs" href="${pageContext.request.contextPath }/home.go">로그인</a>
				<a class="btn btn-info navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/signup_checkform.go">계정 생성</a>
				</div>
			</c:when>
			
			<c:otherwise>
				<p class="navbar-text ml-auto" style="margin-top:10px;margin-bottom:10px;">
					<i class="fas fa-user"></i>
					<strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.go">${id }</a></strong>님 환영합니다!  &nbsp;| &nbsp;  
					<a class="navbar-link" href="${pageContext.request.contextPath }/users/logout.go" onclick="return confirm('로그아웃 하시겠습니까?')"><i class="fas fa-door-open"></i> 로그아웃</a>
				</p>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
	.logo-image{
		width: 4rem;
		height: 4rem;
	    visibility: visible;
	    
	}
</style>
<nav class="navbar navbar-fixed-top navbar-expand-sm navbar-light bg-light">
	<a class="navbar-brand" href="${pageContext.request.contextPath }/home.go">
		<img src="${pageContext.request.contextPath }/resources/images/bana_logo_4.png" class="logo-image" >
	</a>
	<button class="navbar-toggler" data-toggle="collapse" data-target="#one" type="button" 
			aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse" id="one">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item <c:if test="${param.category eq 'notice' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/notice/list.go"><span class="glyphicon glyphicon-bullhorn"></span> 공지사항</a></li>
			<li class="nav-item <c:if test="${param.category eq 'board' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/board/list.go"><span class="glyphicon glyphicon-pencil"></span> 사내 게시판 </a></li>
			<li class="nav-item <c:if test="${param.category eq 'suggest' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/suggest/list.go"><span class="glyphicon glyphicon-inbox"></span> 건의함</a></li>
			<li class="nav-item <c:if test="${param.category eq 'file' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/file/list.go"><span class="glyphicon glyphicon-floppy-save"></span> 자료실</a></li>
			<li class="nav-item <c:if test="${param.category eq 'mytrello' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/mytrello/list.go"><span class="glyphicon glyphicon-list"></span> 체크 리스트</a></li>
			<c:if test="${not empty isAdmin}">
				<li class="nav-item <c:if test="${param.category eq 'admin' }">active </c:if>"> 
				<a class="nav-link" href="${pageContext.request.contextPath }/emp/main.go"><span class="glyphicon glyphicon-wrench"></span> 관리</a></li>
			</c:if>
		</ul>
		
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<div class="pull-right">
				<a class="btn btn-primary navbar-btn btn-xs" href="${pageContext.request.contextPath }/home.go">로그인</a>
				<a class="btn btn-info navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/signup_checkform.go">계정 생성</a>
				</div>
			</c:when>
			
			<c:otherwise>
				<p class="navbar-text pull-right"><i class="fas fa-user"></i>
				사용자 (<strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.go">${id }</a></strong>)님 환영합니다!  &nbsp;| &nbsp;  
				<a class="navbar-link" href="${pageContext.request.contextPath }/users/logout.go" onclick="return confirm('로그아웃 하시겠습니까?')"><i class="fas fa-door-open"></i> 로그아웃</a>
				</p>
			</c:otherwise>
		</c:choose>
	</div>
	
</nav>
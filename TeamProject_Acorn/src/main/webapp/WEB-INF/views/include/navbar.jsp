<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
   

<div class="navbar navbar-default navbar-fixed-top">		
	<div class="container">
	<div class="navbar-header">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/home.go">
			<span class="glyphicon glyphicon-home"></span>
		</a>
		<button class="navbar-toggle"
				data-toggle="collapse"
				data-target="#one">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	
	<div class="collapse navbar-collapse" id="one">
		<ul class="nav navbar-nav">
			<li <c:if test="${param.category eq 'notice' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/notice/list.go"><span class="glyphicon glyphicon-bullhorn"></span> 공지사항</a></li>
			<li <c:if test="${param.category eq 'board' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/board/list.go"><span class="glyphicon glyphicon-pencil"></span> 사내 게시판 </a></li>
			<li <c:if test="${param.category eq 'suggest' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/suggest/list.go"><span class="glyphicon glyphicon-inbox"></span> 건의함</a></li>
			<li <c:if test="${param.category eq 'file' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/file/list.go"><span class="glyphicon glyphicon-floppy-save"></span> 자료실</a></li>
			<li <c:if test="${param.category eq 'mytrello' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/mytrello/list.go"><span class="glyphicon glyphicon-list"></span> 체크 리스트</a></li>
		</ul>
<<<<<<< HEAD
		
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<div class="pull-right">
				<a class="btn btn-primary navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/loginform.go">로그인</a>
				<a class="btn btn-info navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/signup_checkform.go">계정 생성</a>
				</div>
			</c:when>
			<c:otherwise>
				<p class="navbar-text pull-right">
				<i class="fas fa-user"></i>
				사용자 : <strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.go">${id } 님 환영합니다! </a></strong>
				<img src="${pageContext.request.contextPath }${profile }" style="width:35px; height:35px; border-radius:50%;" />
				<a class="navbar-link" href="${pageContext.request.contextPath }/users/logout.go"><i class="fas fa-door-open"></i> 로그아웃</a>
				</p>
			</c:otherwise>
		</c:choose>
=======
			<p class="navbar-text pull-right">
			<i class="fas fa-user"></i>
			Signed as <strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.go">${id }</a></strong> | 
			<a class="navbar-link" href="${pageContext.request.contextPath }/users/logout.go">Signed Out <i class="fas fa-door-open"></i></a>
			</p>
>>>>>>> branch 'master' of https://github.com/yeonsu100/TeamProject_Acorn.git
		</div>
	</div>
</div>
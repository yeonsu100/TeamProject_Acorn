<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    
<div class="navbar navbar-inverse navbar-fixed-top">		
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
				<a href="${pageContext.request.contextPath }/notice/list.go">Notice <span class="glyphicon glyphicon-bullhorn"></span></a></li>
			<li <c:if test="${param.category eq 'board' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/board/list.go">Board <span class="glyphicon glyphicon-pencil"></span></a></li>
			<li <c:if test="${param.category eq 'suggest' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/suggest/list.go">Suggest <span class="glyphicon glyphicon-inbox"></span></a></li>
			<li <c:if test="${param.category eq 'file' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/file/list.go">Web Hard <span class="glyphicon glyphicon-floppy-save"></span></a></li>
		</ul>
		
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<div class="pull-right">
				<a class="btn btn-primary navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/loginform.go">Sign In</a>
				<a class="btn btn-info navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/signup_checkform.go">Create an account</a>
				</div>
			</c:when>
			<c:otherwise>
				<p class="navbar-text pull-right">
				<a class="navbar-link" href="${pageContext.request.contextPath }/msg/list.go"><i class="far fa-comment-dots"></i></a>
				<i class="fas fa-user"></i>
				Signed as <strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.go">${id }</a></strong>
				<img src="${pageContext.request.contextPath }${profile }" style="width:35px; height:35px; border-radius:50%;" />
				<a class="navbar-link" href="${pageContext.request.contextPath }/users/logout.go">Signed Out <i class="fas fa-door-open"></i></a>
				</p>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</div>
    
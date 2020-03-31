<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<<<<<<< HEAD
<ul class="nav nav-tabs" style="border-bottom:none; font-size:14px;">
  <li class="nav-item">
    <a class="nav-link <c:if test="${empty pageType }">active</c:if>" href="${pageContext.request.contextPath }/msg/list.go">받은 메시지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <c:if test="${pageType eq 'sent' }">active</c:if>" href="${pageContext.request.contextPath }/msg/list.go?pageType=sent">보낸 메시지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <c:if test="${pageType eq 'saved' }">active</c:if>" href="${pageContext.request.contextPath }/msg/list.go?pageType=saved">보관함</a>
  </li>
</ul>

=======

<div class="container">
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/msg/sendform.go">메시지 쓰기</a></li>
		<li><a href="${pageContext.request.contextPath }/msg/list.go">받은 메시지</a></li>
		<li><a href="${pageContext.request.contextPath }/msg/list.go?pageType=sent">보낸 메시지</a></li>
		<li><a href="${pageContext.request.contextPath }/msg/list.go?pageType=saved">보관함</a></li>
	</ol>
</div>
>>>>>>> refs/heads/master

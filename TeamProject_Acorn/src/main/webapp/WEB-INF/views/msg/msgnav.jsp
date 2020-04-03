<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<style>
.nav-tabs{
	padding-left: 1rem;
}
.nav-link{
	color:black;
}
.nav-tabs .nav-link.active{
	color:#F1648A;
	background-color: #fff;
	border:none;
	font-weight:bold;
	border-bottom: 3px solid #F1648A;
}
.nav-tabs .nav-link:hover{
	color:#F1648A;
	background-color: #fff;
	border:none;
	font-weight:bold;
	border-bottom: 3px solid #F1648A;
}
.nav-tabs, .nav-tabs .nav-link:focus, .nav-tabs .nav-link {
	border:none;
}
</style>
<ul class="nav nav-tabs" style="font-size:14px;margin-bottom:10px;margin-top:10px;">
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

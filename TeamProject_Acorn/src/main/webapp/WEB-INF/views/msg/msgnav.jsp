<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="topnav">		
	<a href="${pageContext.request.contextPath }/msg/list.go">받은 메시지</a>
	<a href="${pageContext.request.contextPath }/msg/list.go?pageType=sent">보낸 메시지</a>
	<a href="${pageContext.request.contextPath }/msg/list.go?pageType=saved">보관함</a>
	<a href="${pageContext.request.contextPath }/msg/idlist.go">메시지 보내기</a>
</div>

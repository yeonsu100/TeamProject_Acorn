<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/emp/insert.jsp</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<p>
		<strong>${dto.ename }</strong> 사원의 데이터가 추가 되었습니다.
		<ul>
			<li>
				<a href="${pageContext.request.contextPath }/emp/insertform.go">
					입력하러 가기
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/home.go">
					메인 화면으로 돌아가기
				</a>
			</li>
		</ul>
		
		
	</p>
</div>
</body>
</html>

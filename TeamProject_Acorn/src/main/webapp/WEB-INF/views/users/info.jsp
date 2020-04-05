<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	#profileLink img{
		width: 50px;
		height: 50px;
		border-radius: 50%;
	}
	#profileForm{
		display: none;
	}
	table{
		width: 100%;
	}
	th, td {
		padding: 20px;
		border: 1px solid #000000;
	}
	th{
		font-weight: bold;
	    border-left: 8px solid #F1648A;
	}
	
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="container">
	<h1>개인 정보 페이지</h1>
	<table>
		<tr>
			<th scope="row">아이디</th>
			<td>${dto.userid }</td>
		</tr>
		<tr>
			<th scope="row">프로필 이미지</th>
			<td>
				<a href="javascript:" id="profileLink">
					<c:choose>
						<c:when test="${empty dto.profile }">
							<img src="${pageContext.request.contextPath }/resources/images/default_user.jpeg"/>
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath }${dto.profile}"/>
						</c:otherwise>
					</c:choose>
				</a>
			</td>
		</tr>
		<tr>
			<th scope="row">비밀번호</th>
			<td><a href="pwd_updateform.go">수정하기</a></td>
		</tr>
		<tr>
			<th scope="row">이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<th scope="row">입사일</th>
			<td>${dto.hdate }</td>
		</tr>
		<tr>
			<th scope="row">내가 작성한 글</th>
			<td>${dto.title }</td>
		</tr>
	</table>
</div>

<form action="profile_upload.go" method="post"
	enctype="multipart/form-data" id="profileForm">
	<label for="profileImage">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage"
		accept=".jpg, .jpeg, .png, .JPG, .JPEG, .PNG"/>
</form>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	$("#profileLink").click(function(){
		$("#profileImage").click();
	});
	$("#profileImage").on("change", function(){
		$("#profileForm").submit();
	});
	
	$("#profileForm").ajaxForm(function(responseData){
		console.log(responseData);
		var src="${pageContext.request.contextPath }"+responseData.savedPath;
		$("#profileLink img").attr("src", src);
	});
	
</script>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
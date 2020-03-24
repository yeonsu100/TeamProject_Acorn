<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/mytrello/list.jsp</title>
<jsp:include page="../include/resource.jsp" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"> </script>
<style>
	h1{color: #6799FF;}
	.txtb{
		width: 100%;
		border: none;
		border-bottom: 2px solid #000;
		background: none;
		padding: 10px;
		outline: none;
		font-size: 18px;
	}
	h3{
		margin: 10px 0;
	}
	.task{
		width: 100%;
		background: #D9E5FF;
		padding: 18px;
		margin: 6px 0;
		overflow: hidden;
	}
	.task i{
		float: right;
		color: #6799FF;
		margin-left: 20px;
		cursor: pointer;
	}
	.comp .task{
		background: rgba(0, 0, 0, 0.5);
		color: #fff;
	}
</style>
</head>

<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="mytrello" name="category"/>
</jsp:include>

<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.go">오늘의 할 일</a></li>
	</ol>

	<input type="text" class="txtb" placeholder="할 일 입력" />
	<div class="notcomp">
		<h3>해야할 업무 목록</h3>
	</div>
	
	<div class="comp">
		<h3>완료된 업무 목록</h3>	
	</div>
</div>

<script type="text/javascript">
	$(".txtb").on("keyup", function(e){
		// 13 : Enter Key
		if(e.keyCode==13 && $(".txtb").val() != "")
		{
			var task=$("<div class='task'></div>").text($(".txtb").val());
			
			var del=$("<i class='fas fa-trash-alt'></i>").click(function(){
				var p=$(this).parent();
				p.fadeOut(function(){
					p.remove();
				});	
			});
			
			var check=$("<i class='fas fa-check'></i>").click(function(){
				var p=$(this).parent();
				p.fadeOut(function(){
					$(".comp").append(p);
					p.fadeIn();
				});	
				$(this).remove();
			});
			
			task.append(del, check);
			$(".notcomp").append(task);
			// 입력값 초기화 시키기
			$(".txtb").val("");
		}
	});
</script>
<jsp:include page="../include/msgbtn.jsp"/>
</body>
</html>
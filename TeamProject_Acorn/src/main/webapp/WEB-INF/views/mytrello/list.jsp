<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/mytrello/list.jsp</title>
<jsp:include page="../include/resource.jsp"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<style>
	.container{
		max-width: 800px;
		margin: auto;
		padding: 10px;
	}
	
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
		background: rgba(255, 255, 255, 0.5);
		padding: 18px;
		margin: 6px 0;
		overflow: hidden;
	}
	
	.task i{
		float: right;
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
<jsp:include page="../include/navbar.jsp"/>

<div class="container">
	<input type="text" class="txtb" placeholder="할 일 입력" />
	<div class="notcomp">
		<h3>해야할 업무 목록</h3>
		
		<div class="task">
			task
			<i class="fas fa-trash-alt"></i>
			<i class="fas fa-check"></i>
		</div>
		
		<div class="task">
			task
			<i class="fas fa-trash-alt"></i>
			<i class="fas fa-check"></i>
		</div>
	</div>
	
	<div class="comp">
		<h3>완료된 업무 목록</h3>
		<div class="task">
			task
			<i class="fas fa-trash-alt"></i>
		</div>
		
		<div class="task">
			task
			<i class="fas fa-trash-alt"></i>
		</div>
	</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/list.jsp</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="shop" name="category"/>
</jsp:include>

<div class="container">
	<h3>List of Products</h3>
	<div class="row">
		<c:forEach var="tmp" items="${list }">
			<div class="col-xs-4" align="center">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>${tmp.name }</h4>
					</div>
					<div class="panel-body">
						<img class="img-responsive img-thumbnail" src="${pageContext.request.contextPath }/resources/images/piglet.png" alt="" />
						<p>Price : $<strong>${tmp.price }</strong></p>
						<p>Quantity : <strong>${tmp.remainCount }</strong></p>
					</div>
					<div class="panel-footer">
						<a class="btn btn-success" href="buy.go?num=${tmp.num }">Buy now</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

</body>
</html>
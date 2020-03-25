<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
td {border: 1px #DDD solid; padding: 5px; cursor: pointer;}

.selected {
    background-color: brown;
    color: #FFF;
}
</style>
</head>
<body>
<script>
function highlight(e){
	if(selected[0]) selected[0].className="";
	e.target.parentNode.className="selected";
}

var table = document.getElementById("idTable"),
	selected = table.getElementsByClassName("selected");
table.onclick=highlight;

function fnselect(){
	var $row=$(this).parent().find('td');
    var clickedID=$row.eq(0).text();
   // alert(clickeedID);
}

$("#submitId").click(function(){
    var value =$(".selected td:first").html();
    value = value || "No row Selected";
    $("#idRec").value(value);
});

</script>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title">아이디 검색</h4>
</div>
<div class="modal-body">
	<table class="table table-striped table-condensed" id="idTable">
		<thead>
			<tr>
				<th>아이디</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.userid }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<button type="button" id="submitId" >확인</button>	
</div>
</body>
</html>
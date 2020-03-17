<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style>

	 .badge {
	     position: absolute;
	     top: 0;
	     right: 0;
	     height: 20px;
	     border-radius: 50%;
	     background-color: red;
	     justify-content: center;
		 align-content: center;
	 }
</style>
<script type="text/javascript">
function popupOpen(){
	var popUrl = "${pageContext.request.contextPath }/msg/list.go";
	var popOption = "width=560, height=600, resizable=no, scrollbars=yes, status=no;";
		window.open(popUrl,"쪽지함",popOption);
}
</script> 
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"${pageContext.request.contextPath }/msg/checknewmsg.go",
		success: function(response){
			if(response.count==0){
				$("#msgCount").hide();
			}else{
				$("#msgCount").show();
				$("#msgCount").html(response.count);
			}
		}
	})
	setInterval(function(){
		$.ajax({
			url:"${pageContext.request.contextPath }/msg/checknewmsg.go",
			success: function(response){
				if(response.count==0){
					$("#msgCount").hide();
				}else{
					$("#msgCount").show();
					$("#msgCount").html(response.count);
				}
			}
		})
	}, 2000);
});
</script>
<div style="position:fixed; bottom:5px; right:5px;">
	<a href="javascript:popupOpen();">
		<i class="far fa-comment-dots fa-4x badge-wrapper" >
			<span class="badge badge-light" id="msgCount"></span>
		</i>
	</a>
</div>
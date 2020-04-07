<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style>
	
	.counter {
	    position: relative;
	    top: -35px;
	    left: 60px;
	    z-index: 2;
	    padding: 1px 7px;
	    margin-left: -23px;
	    font-size: 11px;
	    font-weight:bold;
	    color: #fff;
	    background-color: #fe1212;
	    border-radius: 10em;
	 }
	 .fa-comment-dots{
	 	color:#F1648A
	 }
	 .fa-comment-dots:hover{
	 	color:#F1A4BA
	 }
</style>
<script type="text/javascript">
function popupOpen(){
	var popUrl = "${pageContext.request.contextPath }/msg/list.go";
	var popOption = "width=560, height=580, resizable=no, scrollbars=yes, status=no;";
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
	<span class="counter counter-lg" id="msgCount"></span>
	<a href="javascript:popupOpen();">
		<i class="far fa-comment-dots fa-4x" ></i>
	</a>
		
</div>
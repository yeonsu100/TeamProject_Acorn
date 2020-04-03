<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
	.footer-bs {
    background-color: #3c3d41;
	padding: 60px 40px;
	color: rgba(255,255,255,1.00);
	margin-bottom: 20px;
	border-bottom-right-radius: 6px;
	border-top-left-radius: 0px;
	border-bottom-left-radius: 6px;
}
.footer-bs .footer-brand, .footer-bs .footer-nav, .footer-bs .footer-social, .footer-bs .footer-ns { padding:10px 25px; }
.footer-bs .footer-nav, .footer-bs .footer-social, .footer-bs .footer-ns { border-color: transparent; }
.footer-bs .footer-brand h2 { margin:0px 0px 10px; }
.footer-bs .footer-brand p { font-size:12px; color:rgba(255,255,255,0.70); }

.footer-bs .footer-nav ul.pages { list-style:none; padding:0px; }
.footer-bs .footer-nav ul.pages li { padding:5px 0px;}
.footer-bs .footer-nav ul.pages a { color:rgba(255,255,255,1.00); font-weight:bold; text-transform:uppercase; }
.footer-bs .footer-nav ul.pages a:hover { color:rgba(255,255,255,0.80); text-decoration:none; }
.footer-bs .footer-nav h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
	margin-bottom:10px;
}

.footer-bs .footer-nav ul.list { list-style:none; padding:0px; }
.footer-bs .footer-nav ul.list li { padding:5px 0px;}
.footer-bs .footer-nav ul.list a { color:rgba(255,255,255,0.80); }
.footer-bs .footer-nav ul.list a:hover { color:rgba(255,255,255,0.60); text-decoration:none; }

.footer-bs .footer-social ul { list-style:none; padding:0px; }
.footer-bs .footer-social h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
}
.footer-bs .footer-social li { padding:5px 4px;}
.footer-bs .footer-social a { color:rgba(255,255,255,1.00);}
.footer-bs .footer-social a:hover { color:rgba(255,255,255,0.80); text-decoration:none; }

.footer-bs .footer-ns h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
	margin-bottom:10px;
}
.footer-bs .footer-ns p { font-size:12px; color:rgba(255,255,255,0.70); }

@media (min-width: 768px) {
	.footer-bs .footer-nav, .footer-bs .footer-social, .footer-bs .footer-ns { border-left:solid 1px rgba(255,255,255,0.10); }
}

</style>


<div class="container">
<div></br></div>
    <!----------- Footer ------------>
    <footer class="footer-bs">
        <div class="row">
        	<div class="col-md-3 footer-brand animated fadeInLeft">
            	<img src="${pageContext.request.contextPath }/resources/images/bana.png"/>
                <p></br></p>
                <p>©Acorn Academy</br>2Class - Team_Third, </br>All rights reserved</p>
            </div>
        	<div class="col-md-4 footer-nav animated fadeInUp">
            	<h4>Menu —</h4>
            	<div class="col-md-6">
                    <ul class="pages">
                        <li><a href="${pageContext.request.contextPath }/notice/list.go">Notice</a></li>
                        <li><a href="${pageContext.request.contextPath }/board/list.go">Board</a></li>
                        <li><a href="${pageContext.request.contextPath }/suggest/list.go">Suggest</a></li>
                        <li><a href="${pageContext.request.contextPath }/file/list.go">File</a></li>
                        <li><a href="${pageContext.request.contextPath }/mytrello/list.go">ToDo</a></li>
                    </ul>
                </div>
            </div>
        	<div class="col-md-2 footer-social animated fadeInDown">
            	<h4>Member ㅡ</h4>
            	<ul>
                	<li><a href="https://github.com/yeonsu100" target="_blank"><p>백연수</p></a></li>
                	<li><a href="https://github.com/2ee30" target="_blank"><p>이상명</p></a></li>
                	<li><a href=https://github.com/Maltitols target="_blank"><p>이창호</p></a></li>
                	<li><a href=https://github.com/KIMMINJUNN target="_blank"><p>김철언</p></a></li>
                	<li><a href=https://github.com/gkstjrgh4 target="_blank"><p>한석호</p></a></li>
                </ul>
            </div>
        </div>
    </footer>
    </div>
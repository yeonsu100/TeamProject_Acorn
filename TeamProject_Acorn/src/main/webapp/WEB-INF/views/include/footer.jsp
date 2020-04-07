<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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

img{
	width: 90px;
	height: 90px;
	align: center;
}

</style>


<div class="container">
<div></br></div>
    <!----------- Footer ------------>
    <footer class="footer-bs">
        <div class="row">
        	<div class="col-md-3 footer-brand animated fadeInLeft">
            	<img src="${pageContext.request.contextPath }/resources/images/bana_logo_4.png"/> <br/><br/>
                <p>
                	상호명 : (주)바나프레소 <br/>
                	대표자명 : 주바나 <br/>
                	소재지 : 서울시 강남구 테헤란로 124 <br/>
                	대표전화 : 02-538-3747 <br/>
                	이메일  : admin@banapresoso.com
                </p>
            </div>
        	<div class="col-md-4 footer-nav animated fadeInUp">
	        	<h4>VISION —</h4>
	            	<div class="col-md-20">
	                   <p>"고객이 만족하는 한 잔의 행복"</p> <br/><br/>
	                
	                <h4>MISSION —</h4>
	                   <p>
						1. 우리는 항상 고객을 먼저 생각한다. <br/>
						2. 우리는 최고의 품질, 최상의 맛을 제공한다. <br/>
						3. 우리는 2030년까지 글로벌 기업으로 도약한다. <br/>
						</p>
	                </div>
            </div>
        	<div class="col-md-3 footer-nav animated fadeInUp">
	        	<h4>SITE MAP —</h4>
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
        </div>
    </footer>
    <section style="text-align:center; margin:3px auto; color: #F1648A;"><p>Copyright©2020 by <strong>Team_acorn</strong></p></section>
    
    </div>
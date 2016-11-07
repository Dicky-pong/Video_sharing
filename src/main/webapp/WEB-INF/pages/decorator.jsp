<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>跆拳道&nbsp;视频分享平台&nbsp;-&nbsp;
	<sitemesh:write property='title'></sitemesh:write>
</title>
<link href="${path}/resources/css/login.css" rel="stylesheet"/>

<!--引入头部页面 -->
<%@include file="webCss.jsp"%>
<!-- 头部 -->
<sitemesh:write property='head' ></sitemesh:write>
</head>

<body id="wrapper">
<div class="wrap-body">
	<header>
		<div class="wrap-header">
			<div class="zerogrid">
				<div class="row">
					<a href="index.html" class="logo"><img src="${path }/resources/images/logo.png" /></a>
					<ul class="quick-link">
						<li><a href="#" title="Upload Video"><i class="fa fa-upload"></i></a></li>
						<li><a class="theme-login" href="#" title="Log in"><i class="fa fa-user"></i></a></li>
						<li><a class="theme-register" href="#" title="Warning"><i class="fa fa-bell"></i></a></li>
					</ul>
					<ul class="social">
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- <div class="bottom">
			<div class="zerogrid">
				<div class="row">
					<span>Welcome to Us - Contact Us at <a href="contact.html">HERE</a></span>
				</div>
			</div>
		</div> -->
    </header>
	<!-- 头部end -->
	<!--菜单start-->
	<a href="#" class="nav-toggle">Toggle Navigation</a>
    <nav class="cmn-tile-nav">
		<ul class="clearfix">
			<li class="colour-1"><a href="gallery.html">跆拳道</a></li>
			<li class="colour-2"><a href="gallery.html">散打</a></li>
			<li class="colour-3"><a href="gallery.html">空手道</a></li>
			<li class="colour-4"><a href="gallery.html">泰拳</a></li>
			<li class="colour-5"><a href="gallery.html">柔道</a></li>
			<li class="colour-6"><a href="gallery.html">截拳道</a></li>
			<li class="colour-7"><a href="gallery.html">中国套路</a></li>
			<li class="colour-8"><a href="gallery.html">更多</a></li>
		</ul>
    </nav>
	<!-- 菜单end -->
	<div>
		<div id="content" class="span-24 last">
			<sitemesh:write property='body' />
		</div>
	</div>
	
	<footer>
		<div class="zerogrid top-footer">
			<div class="row">
				<div class="col-1-5">
					<a href="#"><img src="${path }/resources/images/15.jpg" /></a>
				</div>
				<div class="col-1-5">
					<a href="#"><img src="${path }/resources/images/16.jpg" /></a>
				</div>
				<div class="col-1-5">
					<a href="#"><img src="${path }/resources/images/17.jpg" /></a>
				</div>
				<div class="col-1-5">
					<a href="#"><img src="${path }/resources/images/18.jpg" /></a>
				</div>
				<div class="col-1-5">
					<a href="#"><img src="${path }/resources/images/19.jpg" /></a>
				</div>
			</div>
		</div>
		<div class="zerogrid wrap-footer">
			<div class="row">
				<div class="col-1-4 col-footer-1">
					<div class="wrap-col">
						<a href="index.html" class="logo"><img src="${path}/resources/images/logo.png" /></a>
						<p>Ut volutpat consectetur aliquam. Curabitur auctor in nis ulum ornare. Sed consequat, augue condimentum fermentum gravida, metus elit vehicula dui.</p>
					</div>
				</div>
				<div class="col-1-4 col-footer-2">
					<div class="wrap-col">
						<h3>Categories</h3>
						<ul>
							<li><a href="#">Action</a></li>
							<li><a href="#">Romantic</a></li>
							<li><a href="#">Cartoon</a></li>
							<li><a href="#">Zombies</a></li>
						</ul>
					</div>
				</div>
				<div class="col-1-4 col-footer-3">
					<div class="wrap-col">
						<h3>Recent Posts</h3>
						<ul>
							<li><a href="#">New Videos</a></li>
							<li><a href="#">Featured Videos</a></li>
							<li><a href="#">Most Viewed Videos</a></li>
							<li><a href="#">Sports Videos</a></li>
						</ul>
					</div>
				</div>
				<div class="col-1-4 col-footer-4">
					<div class="wrap-col">
						<h3>Flickr Photos</h3>
						<div class="row">
							<div class="col-1-4">
								<div class="wrap-col">
									<a href="#"><img src="${path }/resources/images/6.jpg" /></a>
									<a href="#"><img src="${path }/resources/images/10.jpg" /></a>
									<a href="#"><img src="${path }/resources/images/13.jpg" /></a>
								</div>
							</div>
							<div class="col-1-4">
								<div class="wrap-col">
									<a href="#"><img src="${path }/resources/images/7.jpg" /></a>
									<a href="#"><img src="${path }/resources/images/11.jpg" /></a>
									<a href="#"><img src="${path }/resources/images/6.jpg" /></a>
								</div>
							</div>
							<div class="col-1-4">
								<div class="wrap-col">
									<a href="#"><img src="${path }/resources/images/8.jpg" /></a>
									<a href="#"><img src="${path }/resources/images/12.jpg" /></a>
									<a href="#"><img src="${path }/resources/images/10.jpg" /></a>
								</div>
							</div>
							<div class="col-1-4">
								<div class="wrap-col">
									<a href="#"><img src="${path }/resources/images/9.jpg" /></a>
									<a href="#"><img src="${path }/resources/images/13.jpg" /></a>
									<a href="#"><img src="${path }/resources/images/8.jpg" /></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="zerogrid copyright">
			<div class="wrapper">
				Copyright 2015 - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
				<ul class="quick-link f-right">
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms of Use</a></li>
				</ul>
			</div>
		</div>
	</footer>

<!-- <script type="text/javascript">

$(document).ready(function(){
	
	//退出按钮
	$("#logout").on("click",function(){
    		window.location.href = basePath+"logout.do";
   	});
	
});
function mySwitch(id){
    $("#"+id).show();
    $('.Cover_layer').show();
    
}
function myHide(id){
    $("#"+id).hide();
    $('.Cover_layer').hide();
}

</script> -->
</div>
</body>
</html>
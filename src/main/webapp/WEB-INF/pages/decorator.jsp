<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>资源分享平台<sitemesh:write property='title' />
</title>
<!--引入头部页面 -->
<%@include file="/webCss.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/reset.css" type="text/css" media="all"/>

<!-- 头部 -->
<sitemesh:write property='head' />

	<script src="${path}/resources/js/responsiveslides.js"></script>
	<script>
		$(function () {
		  $("#slider").responsiveSlides({
			auto: true,
			pager: false,
			nav: true,
			speed: 500,
			maxwidth: 960,
			namespace: "centered-btns"
		  });
		});
	</script>
	
</head>
<body id="page1">
<div class="body1">
	<div class="body1">
		<div class="main zerogrid">
<!-- header -->
			<header>
				<div class="wrapper row">
				<h1><a href="index.html" id="logo"><img src="${path }/resources/images/logo.png" /></a></h1>
				<nav>
					<ul id="menu">
						<li id="nav1" class="active"><a href="index.html">Home<span>Welcome!</span></a></li>
						<li id="nav2"><a href="News.html">News<span>Fresh</span></a></li>
						<li id="nav3"><a href="Services.html">Services<span>for you</span></a></li>
						<li id="nav4"><a href="Products.html">Products<span>The best</span></a></li>
						<li id="nav5"><a href="Contacts.html">Contacts<span>Our Address</span></a></li>
					</ul>
				</nav>
				</div>

				<div class="wrapper row">
					<%-- <div class="slider">
					  	<div class="rslides_container">
							<ul class="rslides" id="slider">
								<li><img src="${path}/resources/images/img1.jpg" alt=""></li>
								<li><img src="${path}/resources/images/img2.jpg" alt=""></li>
								<li><img src="${path}/resources/images/img3.jpg" alt=""></li>
								<li><img src="${path}/resources/images/img4.jpg" alt=""></li>
							</ul>
						</div>
					</div> --%>
				</div>
			</header>
<!-- header end-->
		</div>
	</div>
</div>

	<div>
		<div id="content" class="span-24 last">
			<sitemesh:write property='body' />
		</div>
	</div>

		<div class="main zerogrid">
<!-- footer -->
			<footer>
				<a href="http://www.zerotheme.com/432/free-responsive-html5-css3-website-templates.html" target="_blank">Html5 Templates</a> by <a href="http://www.templatemonster.com/" target="_blank">Templatesmonster.com</a><br>
				<a href="http://www.zerotheme.com/432/free-responsive-html5-css3-website-templates.html" target="_blank">Responsive Themes</a> by <a href="http://www.zerotheme.com/" target="_blank">Zerotheme.com</a><br>
			</footer>
<!-- footer end -->
		</div>
<script type="text/javascript"> Cufon.now(); </script>
		
</body>
</html>
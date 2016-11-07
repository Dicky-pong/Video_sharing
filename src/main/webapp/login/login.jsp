<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
response.flushBuffer();
%>
<%
String path = request.getContextPath();
//request
application.setAttribute("path",path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
application.setAttribute("basePath",basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="description" content="跆拳道视频分享平台" />
<meta name="keywords" content="跆拳道视频分享平台" />
<meta name="baidu-site-verification" content="v4SVMECT1g" />
<title>跆拳道视频分享平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script type="application/x-javascript">
	addEventListener("load", function() {
		 setTimeout(hideURLbar, 0);
	}, false);
	 
	function hideURLbar(){ window.scrollTo(0,1); } 
</script>
</head>

<body>
<section id="container" class="index-page">
		<div class="wrap-container zerogrid">
			<!------------------------------------->
			<div class="row">
				<div class="header">
					<h2>Most Viewed Videos</h2>
				</div>
				<div class="row">
				<div class="most-viewed">
					<div class="col-2-4">
						<div class="wrap-col">
							<div class="zoom-container">
								<a href="single.html">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img src="${path}/resources/images/4.jpg" />
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="extra">
					<div class="col-1-4">
						<div class="wrap-col">
							<div class="zoom-container">
								<a href="single.html">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img src="${path}/resources/images/1.jpg" />
								</a>
							</div>
							<div class="zoom-container">
								<a href="single.html">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img src="${path}/resources/images/2.jpg" />
								</a>
							</div>
						</div>
					</div>
					<div class="col-1-4">
						<div class="wrap-col">
							<div class="zoom-container">
								<a href="single.html">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img src="${path}/resources/images/5.jpg" />
								</a>
							</div>
							<div class="zoom-container">
								<a href="single.html">
									<span class="zoom-caption">
										<i class="icon-play fa fa-play"></i>
									</span>
									<img src="${path}/resources/images/14.jpg" />
								</a>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
			<div class="row" >
				<div id="main-content" class="col-2-3">
					<div class="wrap-content">
						<section class="vid-tv">
							<div class="header">
								<h2>TV</h2>
							</div>
							<div class="row">
								<div id="owl-demo-1" class="owl-carousel">
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/1.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/2.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/4.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/14.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
								</div>
							</div>
						</section>
						
						<section class="vid-sport">
							<div class="header">
								<h2>Sport</h2>
							</div>
							<div class="row"><!--Start Box-->
								<div id="owl-demo-2" class="owl-carousel">
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/1.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/2.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/4.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/14.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
								</div>
							</div>
						</section>
						
						<section class="vid-music">
							<div class="header">
								<h2>Music</h2>
							</div>
							<div class="row"><!--Start Box-->
								<div id="owl-demo-3" class="owl-carousel">
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/1.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/2.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/4.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/14.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/3.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
									<div class="item wrap-vid">
										<div class="zoom-container">
											<a href="single.html">
												<span class="zoom-caption">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="${path}/resources/images/5.jpg" />
											</a>
										</div>
										<h3 class="vid-name"><a href="#">Video's Name</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>25/3/2015</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
				<div id="sidebar" class="col-1-3">
					<form id="form-container" action="">
						<!--<input type="submit" id="searchsubmit" value="" />-->
						<a class="search-submit-button" href="javascript:void(0)">
							<i class="fa fa-search"></i>
						</a>
						<div id="searchtext">
							<input type="text" id="s" name="s" placeholder="Search Something...">
						</div>
					</form>
					<!---- Start Widget ---->
					<div class="widget wid-post">
						<div class="wid-header">
							<h5>Latest Posts</h5>
						</div>
						<div class="wid-content">
							<div class="post wrap-vid">
								<div class="zoom-container">
									<a href="single.html">
										<span class="zoom-caption">
											<i class="icon-play fa fa-play"></i>
										</span>
										<img src="${path}/resources/images/4.jpg" />
									</a>
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
									<a href="single.html">
										<span class="zoom-caption">
											<i class="icon-play fa fa-play"></i>
										</span>
										<img src="${path}/resources/images/14.jpg" />
									</a>
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
									<a href="single.html">
										<span class="zoom-caption">
											<i class="icon-play fa fa-play"></i>
										</span>
										<img src="${path}/resources/images/3.jpg" />
									</a>
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget wid-news">
						<div class="wid-header">
							<h5>Top News</h5>
						</div>
						<div class="wid-content">
							<div class="row">
								<div class="wrap-vid">
									<div class="zoom-container">
										<a href="single.html">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img src="${path}/resources/images/1.jpg" />
										</a>
									</div>
									<h3 class="vid-name">Video's Name</h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="wrap-vid">
									<div class="zoom-container">
										<a href="single.html">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img src="${path}/resources/images/2.jpg" />
										</a>
									</div>
									<h3 class="vid-name">Video's Name</h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="wrap-vid">
									<div class="zoom-container">
										<a href="single.html">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
											<img src="${path}/resources/images/4.jpg" />
										</a>
									</div>
									<h3 class="vid-name">Video's Name</h3>
									<div class="info">
										<h5>By <a href="#">Kelvin</a></h5>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 登录弹窗start -->
	<div class="theme-popover">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>登录</h3>
     </div>
     <div class="theme-popbod dform">
           <form class="theme-signin" id="loginForm" action="<%=request.getContextPath()%>/login.do" method='post'>
                <ol>
					<li><h4>请先登录</h4></li>
					<li><strong>用户名：</strong><input type="text" name="username" id="username" value="${errorUsername }" placeholder="请输入登录用户名" /></li>
					<li><strong>密码：</strong><input type="password" name="password" placeholder="请输入登录密码" id="password" /></li>
					<li><strong>验证码：</strong><input type="text" name="veryCode" placeholder="请输入验证码" id="veryCode" maxlength="4" />
                        <img id="imgObj" alt="" src="${path}/verifyCode.jpeg" onclick="changeImg()"/></li>
					<li><input class="btn btn-primary" type="submit" name="submit" onclick="ajaxLogin_post()"
						value=" 登 录 " /></li>
				</ol>
           </form>
     </div>
	</div>
	<!-- 登录弹窗end -->
	
	<!-- 注册弹窗start -->
	<div class="theme-popover aa">
     <div class="theme-poptit aa">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>注册</h3>
     </div>
     <div class="theme-popbod dform">
     <form class="theme-signin" id="registerForm" action="<%=request.getContextPath()%>/cmsuser/register.do" method='post'>
                <ol>
					<li><h4>请先注册</h4></li>
					<li><strong>手机号码：</strong><input type="text" name="cellphone" id="cellphone" value="${errorUsername }" placeholder="请输入登录用户名" /></li>
					<li><strong>设置登录密码：</strong><input type="password" name="password" placeholder="请输入登录密码" id="password" /></li>
					<li><strong>再次输入密码：</strong><input type="text" name="regpassword" placeholder="请输入验证码" id="regpassword" maxlength="4" /></li>
                    <li><strong>验证码：</strong><input type="text" name="smscode" placeholder="请输入验证码" id="smscode" maxlength="4" />
                    <span><a class="verification_code_b_a" href="javascript:void(0);" onclick="onGetRegisterSMSCode(this)">获取验证码</a>
					</span></li>
					<li><input class="btn btn-primary" type="submit" name="submit" onclick="onNextRegister()"
						value=" 注册 " /></li>
				</ol>
	</form>
     </div>
	</div>
	<!-- 注册弹窗end -->
<!-- Slider -->
	<script src="${path}/resources/js/jquery-2.1.1.js"></script>
	<script src="${path}/resourcesjs/demo.js"></script>
	<script src="${path}/resources/js/classie.js"></script>
	<!-- Carousel -->
	<script src="${path}/resources/js/owl.carousel.js"></script>
    <script>
    var wait = 180;
    $(document).ready(function() {
    	$('.theme-login').click(function(){
    		$('.theme-popover-mask').fadeIn(100);
    		$('.theme-popover').slideDown(200);
    	})
    	$('.theme-poptit .close').click(function(){
    		$('.theme-popover-mask').fadeOut(100);
    		$('.theme-popover').slideUp(200);
    	})
    	$('.theme-register').click(function(){
    		$('.theme-popover-mask').fadeIn(100);
    		$('.theme-popover').slideDown(200);
    	})
    	$('.theme-poptit .close').click(function(){
    		$('.theme-popover-mask').fadeOut(100);
    		$('.theme-popover').slideUp(200);
    	})
      $("#owl-demo-1").owlCarousel({
        items : 4,
        lazyLoad : true,
        navigation : true
      });
	  $("#owl-demo-2").owlCarousel({
        items : 4,
        lazyLoad : true,
        navigation : true
      });
	  $("#owl-demo-3").owlCarousel({
        items : 4,
        lazyLoad : true,
        navigation : true
      });
    });
    //获取图片验证码
    function changeImg(){    
	    var imgSrc = $("#imgObj");    
	    var src = imgSrc.attr("src");    
	    imgSrc.attr("src",chgUrl(src));    
	}
    //改变图片验证码
    function chgUrl(url){
	    var timestamp = (new Date()).valueOf();    
//	     url = url.substring(0,17);
	    if((url.indexOf("&")>=0)){
	        url = url + "×tamp=" + timestamp;
	    }else{
	        url = url + "?timestamp=" + timestamp;    
	    }
	    return url;
	}
    //登录
    function ajaxLogin_post(){
		var userName = $("#username").val();
		var password = $("#password").val();
		var veryCode = $("#veryCode").val();
		if(userName == null || userName == "" || userName == "请输入邮箱登陆"){
			setErrorTips("用户名不能为空");
			$("#userName").focus();
			return;
		}
		if(password == null || password == ""){
			setErrorTips("密码不能为空");
			$("#password").focus();
			return;
		}else if(password.length < 6){
			setErrorTips("密码格式错误");
			$("#password").focus();
			return;
		}
		if(veryCode == null || veryCode == "" || veryCode == "请输入验证码"){
			setErrorTips("验证码不能为空");
			$("#veryCode").focus();
			return;
		}
		var rememberMe = $("#rememberUserName").val();
		if(rememberMe == "0"){
			if(userName != null && userName != ""){
				$.cookie('username', userName, {expires:30});
			}
		}else{
			if(userName != null && userName != ""){
				$.cookie('username', "");
			}
			
		}
		$("#loginForm").submit();
	}
    //注册
    function onNextRegister() {
    	if(validateInput()) {
    		$.ajax({
    			url:path+'/user/register.do',
    			type:'POST',
    			data:{
    				loginName : $.trim($("#cellphone").val()),
    				password : $("#password").val(),
    				verifyCode : $.trim($("#smscode").val())
    			},
    			dataType:'json',
    			success:function(data) {
    				if(data.msgCode == '1') {
    					window.location.href = path + "/store/toStoreBaseView.do";
    				}else{
    					$("#tips").html(data.msg);
    				}
    			}
    		});
    	}
    }
    //获取短信验证码
    function onGetRegisterSMSCode(event) {
    	if(wait < 180) return false;
    	
    	var cellphone = $.trim($("#cellphone").val());
    	if(!cellphone) {
    		$('#cellphone').focus();
    		$("#cellphone").parent().next().show();
    		return false;
    	}else{
    		var regNum = /^\d{11}$/;
    		//正则手机号码
    		if(cellphone.length != 11 || !regNum.test(cellphone)) {
    			$('#cellphone').focus();
    			$("#cellphone").parent().next().show();
    			return false;
    		}else{
    			$("#cellphone").parent().next().hide();
    		}
    	}
    	var url_="${path}/message/page/getRegisterSMSCode.do?random="+new Date().getTime();
    	alert(url_);
    	//手机是否已存在,验证码是否正确
    	$.ajax({
    		url:url_,
    		type : "POST",
			async : false,
    		data:{
    			cellphone:cellphone,
	        },
    		dataType:'json',
    		success:function(data) {
    			alert('');
    		},
    		error : function(e) {
				console.log(e);
    		}
    	});
    }

    </script>
</body>
</html>
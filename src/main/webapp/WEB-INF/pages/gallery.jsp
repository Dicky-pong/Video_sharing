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
<script type="text/javascript" src="${path}/resources/js/Plugins/pagination/jquery.pagination.js"></script>
<script type="text/javascript" src="${path}/resources/js/Plugins/jTemplates/jquery-jtemplates.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/js/Plugins/pagination/pagination.css" />
<script type="text/javascript" src="${path}/resources/js/gallery/gallery.js"></script>
<script type="application/x-javascript">

	addEventListener("load", function() {
		 setTimeout(hideURLbar, 0);
	}, false);
	 
	function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<style>
      .checkDiv {
            padding: 0;
            margin: 0;
            /*margin-top:0;*/
            top: 0;
            left: 0;
            position: absolute;
            display: none;
        }

        .cb {
            width: 15px;
            height: 15px;
            /*padding: 0 5px 0 0;
            clear: left;
            float: left;*/
        }

        .Atag a:link, .Atag a:visited, .Atag a:hover, .Atag a:active {
            color: #000000;
            text-decoration: none;
        }

        .black_overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1100;
            -moz-opacity: 0.8;
            opacity: .85;
            filter: alpha(opacity=88);
        }

        .white_content {
            display: none;
            position: fixed;
            top: 18%;
            left: 20%;
            width: 800px;
            height: 450px;
            /*padding: 20px;
            border: 2px solid black;*/
            background-color: black;
            z-index: 1101;
            overflow: hidden;
        }

        .nowrap {
            white-space: nowrap;
            padding-top: 5px;
            padding-bottom: 5px;
            margin-left: 5px;
        }
</style>
</head>
    
<body id="wrapper" >

	<section id="container" class="index-page">
		<div class="wrap-container zerogrid">
			<div class="row">
				<div id="main-content" class="col-2-3">
					<section class="all">
						<div class="header">
							<h2>All Post</h2>
						</div>
						<div id="dealListView">
                				</div>
						  <%-- 分页组件 Star --%>
						<div id="Pagination" class="pagination"></div>
						<p style="display: none">
							<textarea id="deal-List" rows="0" cols="0">
					<!--
					{#template MAIN}
							{#if $T.data.length > 0}
							{#foreach $T.data as item}
							<div class="row">
							<div class="col-1-4">
								<div class="wrap-col">
									<div class="wrap-vid">
										<div class="zoom-container">
											<a href="#">
												<span class="zoom-caption"  onclick="viewFile('{$T.item.fileUrl}','{$T.item.fileName}')">
													<i class="icon-play fa fa-play"></i>
												</span>
												<img src="{$T.item.vframeUrl}"/>
											</a>
										</div>
										<h3 class="vid-name"><a href="#">{$T.item.fileName}</a></h3>
										<div class="info">
											<h5>By <a href="#">Kelvin</a></h5>
											<span><i class="fa fa-calendar"></i>{$T.item.createDate}</span> 
											<span><i class="fa fa-heart"></i>1,200</span>
										</div>
									</div>
								</div>
							</div>
						</div>
  							{#/for}
  						{#/if}
  						{#if $T.data.length == 0} 
				  			<tr>
				  				<td class="wifi_statistics_list_con_td" align="center" valign="middle" colspan="6">暂无数据,请重新查询</td></tr>
				  			</tr>
				  		{#/if}	
 					{#/template MAIN}
 					-->
				</textarea>
				</p>
									<%-- 分页组件 END --%>
					</section>
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
										<img src="images/4.jpg" />
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
										<img src="images/14.jpg" />
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
										<img src="images/3.jpg" />
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
											<img src="images/1.jpg" />
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
											<img src="images/2.jpg" />
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
											<img src="images/4.jpg" />
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
	
 <!--弹出层-->
    <div id="light" class="white_content" onmouseover="$(this).find('div').show();"
         onmouseout="$(this).find('div').hide();">
        <div id="lightDiv" style="position:absolute;z-index:1102;display:none;color: white"><h4>&nbsp;</h4></div>
    </div>
    <div id="fade" class="black_overlay"></div>
    <!--/弹出层结束-->
	
	<script>
		new UISearch( document.getElementById( 'sb-search' ) );
	</script>
	<!-- Carousel -->
    <script>
    $(document).ready(function() {

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

    });
    </script>
</div>
</body></html>
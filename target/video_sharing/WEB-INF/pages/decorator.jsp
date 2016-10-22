<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet"  href="${path}/resources/css/login/login.css" type="text/css"/>
<title>跆拳道&nbsp;视频分享平台&nbsp;-&nbsp;
	<sitemesh:write property='title'></sitemesh:write>
</title>
<!--引入头部页面 -->
<%@include file="webCss.jsp"%>
<!-- 头部 -->
<sitemesh:write property='head' ></sitemesh:write>
</head>

<body>

	<div class="Cover_layer"></div>
	
	<%-- <input id="userId" name="userId" type="hidden" value="${CMS_USER_INFO.id}" />
	<input id="userName" name="userName" type="hidden" value="${CMS_USER_INFO.loginName}" /> --%>

	<!-- 头部start -->
	<c:choose>
		<c:when test="${CMS_USER_INFO.loginName ==null}">
	<div id="header">
		<div class="page-container" id="nav">
			<div id="logo" class="logo">
				<a href="/" target="_self" class="hide-text">跆拳道视频分享平台</a>
			</div>


			<button type="button"
				class="navbar-toggle visible-xs-block js-show-menu">
				<i class="icon-menu"></i>
			</button>
			<ul class="nav-item">
				<li class="set-btn visible-xs-block"><a href="/user/newlogin"
					target="_self">登录</a> / <a href="/user/newsignup" target="_self">注册</a></li>
				<li id="nav-item-index"><a href="/" target="_self">首页</a></li>
				<li><a href="http://coding.imooc.com" target="_self">实战</a></li>
				<li><a href="/course/program" target="_self">路径</a></li>
				<li><a href="/wenda" target="_self">猿问</a></li>
				<li><a href="/article" target="_self">手记</a></li>

			</ul>
			<div id="login-area">
				<ul class="header-unlogin clearfix">
					<li class="header-app"><a href="/mobile/app"> <span
							class="icon-appdownload"></span>
					</a>
						<div class="QR-download">
							<p id="app-text">跆拳道视频分享APP下载</p>
							<p id="app-type">iPhone / Android / iPad</p>
							<img src="/static/img/index/QR-code.jpg">
						</div></li>
					<li class="header-signin"><a href="#" id="js-signin-btn" onclick="mySwitch('signin')">登录</a>
					</li>
					<li class="header-signup"><a href="#" id="js-signup-btn">注册</a>
					</li>
				</ul>
			</div>
			<!--
<div class="app-down-area r">
    <a href="/mobile/app">
        <i class="header-app-icon"></i>慕课APP
    </a>
</div>
-->
			<div class="search-warp clearfix"
				style="min-width: 32px; height: 60px;">

				<div class="search-area" data-search="top-banner">
					<input class="search-input" data-suggest-trigger="suggest-trigger"
						placeholder="请输入想搜索的内容..." type="text" autocomplete="off">
						<input type="hidden" class="btn_search"
						data-search-btn="search-btn">
							<ul class="search-area-result"
								data-suggest-result="suggest-result">
							</ul>
				</div>
				<div class="showhide-search" data-show="no">
					<i class="icon-search"></i>
				</div>
			</div>
		</div>
	</div>
	</c:when>
		<c:otherwise>
		<div id="header">
		<div class="page-container" id="nav">
        <div id="logo" class="logo"><a href="/" target="_self" class="hide-text">慕课网</a></div>


        <button type="button" class="navbar-toggle visible-xs-block js-show-menu">
            <i class="icon-menu"></i>
        </button>
        <ul class="nav-item">
                        <li class="set-btn visible-xs-block js-header-avator"><a href="/u/1922977" target="_self"><img width="40" height="40" src="http://img.mukewang.com/5333a0780001a6e702200220-100-100.jpg"></a></li>
                        <li id="nav-item-index">
                 <a href="/" target="_self">首页</a>
            </li>
            <li>
                <a href="http://coding.imooc.com" target="_self">实战</a>
            </li>
            <li><a href="/course/program" target="_self">路径</a></li>
            <li><a href="/wenda" target="_self">猿问</a></li>
            <li><a href="/article" target="_self">手记</a></li>
                                            <li class="visible-xs-block"><a href="/user/setprofile" target="_self">我的设置</a></li>
                <li class="visible-xs-block"><a href="/passport/user/logout?referer=http://www.imooc.com" target="_self">退出</a></li>
            
        </ul>
                <div id="login-area">
            <ul class="clearfix logined">
                <li class="header-app">
                    <a href="/mobile/app">
                        <span class="icon-appdownload"></span>
                    </a>
                    <div class="QR-download">
                        <p id="app-text">慕课网APP下载</p>
                        <p id="app-type">iPhone / Android / iPad</p>
                        <img src="/static/img/index/QR-code.jpg">
                    </div>
                </li>
                <li class="remind_warp">
                    <!-- <i class="msg_remind"></i> -->
                    <a target="_blank" href="/u/1922977/notices">
                        <i class="icon-notifi"></i>
                        <span class="msg_icon" style="display: none;"></span>
                    </a>
                </li>
        	    <li class="my_message">
                    <i class="msg_remind" style="display: none;"></i>
                    <a href="/u/1922977/messages" title="我的消息" target="_blank">
                        <!-- <span class="msg_icon" style="display: none;"></span> -->
                        <i class="icon-mail"></i>
                        <span style="display: none;">我的消息</span>
                    </a>
                </li>
                <li class="set_btn user-card-box">
                    <a id="header-avator" class="user-card-item js-header-avator" action-type="my_menu" href="/u/1922977" target="_self">
                        <img width="40" height="40" src="http://img.mukewang.com/5333a0780001a6e702200220-100-100.jpg">
                        <i class="myspace_remind" style="display: none;"></i>
                        <span style="display: none;">动态提醒</span>
                    </a>
                    <div class="g-user-card"><div class="card-inner">                        <div class="card-top">                            <a href="/u/1922977"><img src="http://img.mukewang.com/5333a0780001a6e702200220-100-100.jpg" alt="恶魔小丑" class="l"></a>                            <a href="/u/1922977"><span class="name text-ellipsis">恶魔小丑</span></a>                            <p class="meta">                <a href="/u/1922977/experience">经验<b id="js-user-mp">1624</b></a>                <a href="/u/1922977/credit">积分<b id="js-user-credit">0</b></a></p>                            <a href="/mall/index" class="setup linkToMall">积分商城</a>                        </div><div class="card-history">                            <span class="history-item">                                <span class="tit text-ellipsis">初识Java微信公众号开发</span>                                <span class="media-name text-ellipsis">5-2 开发模式接入</span>                                <i class="icon-clock"></i><a href="/video/7227" class="continue">继续</a></span></div><div class="card-sets clearfix">                            <a href="/user/setprofile" target="_blank" class="l mr30">个人设置</a>                            <a href="/passport/user/logout?referer=http://www.imooc.com" class="r">退出</a>                        </div>            </div>            <i class="card-arr"></i></div>
                </li>
            </ul>
        </div>
                <!--
        <div class="app-down-area r">
            <a href="/mobile/app">
                <i class="header-app-icon"></i>慕课APP
            </a>
        </div>
        -->


        <div class="search-warp clearfix" style="min-width: 32px; height: 60px;">
            
            <div class="search-area" data-search="top-banner">
                <input class="search-input" data-suggest-trigger="suggest-trigger" placeholder="请输入想搜索的内容..." type="text" autocomplete="off">
                <input type="hidden" class="btn_search" data-search-btn="search-btn">
                <ul class="search-area-result" data-suggest-result="suggest-result">
                </ul>
            </div>
            <div class="showhide-search" data-show="no"><i class="icon-search"></i></div>
        </div>
    </div>
    </div>
		</c:otherwise>
	</c:choose>
	<!-- 头部end -->
	
	
	<div>
		<div id="content" class="span-24 last">
			<sitemesh:write property='body' />
		</div>
	</div>
	
	<div id="footer">
    <div class="waper">
        <div class="footerwaper clearfix">
            <div class="followus r">
                <a class="followus-weixin" href="javascript:;" target="_blank" title="微信">
                    <div class="flw-weixin-box"></div>
                </a>
                <a class="followus-weibo" href="http://weibo.com/u/3306361973" target="_blank" title="新浪微博"></a>
                <a class="followus-qzone" href="http://user.qzone.qq.com/1059809142/" target="_blank" title="QQ空间"></a>
            </div>
            <div class="footer_intro l">
                <div class="footer_link">
                    <ul>
                        <li><a href="http://www.imooc.com/" target="_blank">网站首页</a></li>
                        <li><a href="/about/cooperate" target="_blank" title="企业合作">企业合作</a></li>
                        <li><a href="/about/job" target="_blank">人才招聘</a></li>
                        <li> <a href="/about/contact" target="_blank">联系我们</a></li>
                        <li><a href="/corp/index" target="_blank">合作专区</a></li>
                        <li><a href="/about/us" target="_blank">关于我们</a></li>
                        <li> <a href="/about/recruit" target="_blank">讲师招募</a></li>
                        <li> <a href="/user/feedback" target="_blank">意见反馈</a></li>
                        <li> <a href="/about/friendly" target="_blank">友情链接</a></li>
                    </ul>
                </div>
                <p>Copyright © 2016 imooc.com All Rights Reserved | 京ICP备 13046642号-2</p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

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

</script>
</body>
</html>
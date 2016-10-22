<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
response.flushBuffer();
String sysNoticeId = request.getParameter("sysNoticeId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统公告</title>
<%@include file="/webCss.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/login/sysNotice.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/js/Plugins/pagination/pagination.css" />
<!-- 列表页模板控件 -->
<script type="text/javascript" src="${path}/resources/js/Plugins/jTemplates/jquery-jtemplates.js"></script>
<script type="text/javascript" src="${path}/resources/js/Plugins/pagination/jquery.pagination.js"></script>
</head>

<body>
<div class="ad_container">
	<div class="ad_head">
    	<div class="ad_head_box">
    		<div class="ad_head_logo">
            	<img src="${path }/resources/images/logo.png" />
            </div>
            <div class="ad_head_font">
            	<a class="ad_head_font_red" href="http://yun.yidiandian.net">一点点云</a>|
                <a href="http://www.yiql.net/business_union/login/login.jsp">登录</a>|
                <a href="../help/help.html">帮助</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    
    <div class="ad_main">
    	<div class="ad_main_box">
        	<div class="ad_main_box_details">
            	<div class="ad_main_box_details_con">
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    
    
    </div>
    
    <div class="ad_foot">
    	<div class="ad_foot_box">
        	<p class="ad_foot_box_p">copyright@2016.亿企联 All rights reserved.</p>
            <p>粤ICP备14099822号</p>
        </div>
    </div>
</div>

<script>

	$(function(){
		var browser_height=document.documentElement.clientHeight-202;
		var browser_width=document.documentElement.clientWidth;
		$(".ad_main").css("min-height",browser_height);
		var sysNoticeId = GetQueryString("sysNoticeId");
		loadSysNoticeContent(sysNoticeId);
	});
	
	function GetQueryString(name)
	{
	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r!=null)return  unescape(r[2]); return null;
	}
	
	function loadSysNoticeContent(sysNoticeId) {
		$(".ad_main_box_details_con").html("");
		var url_ = webRoot + "/user/method/findSysNoticeContent.do?current_date=" + new Date().getTime();
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			url : url_,
			data :{sysNoticeId:sysNoticeId},
			success : function(data) {
				
				if(data != null){
					var html_ = "<div class='ad_main_box_details_con_t'><span>";
						html_ += data.noticeTitle;
						html_ += "</span></div><div class='ad_main_box_details_con_info'>";
						html_ += "<span class='ad_main_box_details_con_info_sapn'>来自<a href='javascript:void(0);'>亿企联</a></span>";
						html_ += "<span class='ad_main_box_details_con_info_sapn'>";
						html_ += data.updateDate + " " + data.updateTime;
						html_ += "</span></div><div class='ad_main_box_details_con_c'>";
						if(data.contentImgUrl != null){
							html_ += "<img src="+data.contentImgUrl+" />";
						}
						html_ += "<p>";
						html_ += data.noticeContent;
						html_ += "</p></div>";
					$(".ad_main_box_details_con").html(html_);
				}
				
			},
			error : function(e) {

			}
		});
	}

</script>

</body>
</html>

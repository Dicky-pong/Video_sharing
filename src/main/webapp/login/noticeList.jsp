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
    	
            <div id="ContextList" class="Content"></div>
			<p style="display: none">
				<textarea id="sysNotice-List" rows="0" cols="0">
										<!--
										  	{#template MAIN} 
										  		{#if $T.data.length > 0}
											  		{#foreach $T.data as sn}
											  			<div class="ad_main_box_div">
											            	<div class="ad_main_box_div_img">
											                	<a class="ad_main_box_div_img_a" href="noticeContent.jsp?sysNoticeId={$T.sn.id}" target="_blank" >
											                		<img src="{$T.sn.titleImgUrl} "  />
											                	</a>
											                </div>
											                <div class="ad_main_box_div_font">
											                	<div class="ad_main_box_div_font_title">
											                		<a href="noticeContent.jsp?sysNoticeId={$T.sn.id}" target="_blank">{$T.sn.noticeTitle}</a>
											                	</div>
											                    <div class="ad_main_box_div_font_info">
											                    	<span class="ad_main_box_div_font_info_sapn">
											                    		来自<a href="javascript:void(0);">亿企联</a>
											                    	</span>
											                        <span class="ad_main_box_div_font_info_sapn">
											                        	{$T.sn.updateDate}  {$T.sn.updateTime}
											                        </span>
											                    </div>
											                    <div class="ad_main_box_div_font_p">
											                    	<p>
											                    	<span class="ad_main_box_div_font_info_sapn">
											                    		摘要：
											                    	</span>
											                    	{$T.sn.noticeCummary}
											                    	</p>
											                    </div>
											                </div>
											                <div class="clear"></div>
											            </div>
											  		{#/for}
											  	{#/if}
											  	{#if $T.data.length == 0} 
											  	
										  		{#/if}
								            {#/template MAIN}
								        -->
									</textarea>
			</p>
            
            <div class="clear"></div>
            <div id="Pagination" class="pagination"></div>
            	
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
<script>

	var pageIndex = 0;     //页索引
	var pageSize = 10;    //每页显示的条数
	var pageTotal = 0;
	$(function(){
		var browser_height=document.documentElement.clientHeight-202;
		var browser_width=document.documentElement.clientWidth;
		$(".ad_main").css("min-height",browser_height);
		allPageSize();
	});
	
	//获取总页数
	function allPageSize() {
		var url_ = webRoot + "/user/method/allSysNoticePageSize.do?current_date=" + new Date().getTime();
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			url : url_,
			success : function(data) {
				pageTotal = data;
					//获取总页数后 初始化控件分页取数据--ajax分页方法
				initPagination("Pagination",pageTotal,pageSize,"loadSysNotice");
			},
			error : function(e) {

			}
		});
	}
	
	function loadSysNotice(pageIndex) {
		var url_ = webRoot + "/user/method/findAllSysNotice.do?current_date=" + new Date().getTime();
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			url : url_,
			data :{pageIndex:pageIndex,pageSize:pageSize},
			success : function(data) {
					$("#ContextList").setTemplateElement("sysNotice-List");
					$("#ContextList").processTemplate(data);
			},
			error : function(e) {

			}
		});
	}
	
	function openNoticeContent(sysNoticeId){
		window.location = webRoot + "/user/toNoticeContent.do?sysNoticeId="+sysNoticeId;
	}

</script>

</body>
</html>

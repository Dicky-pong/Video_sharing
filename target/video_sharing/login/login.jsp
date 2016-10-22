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
<meta name="description" content="cms-信息发布系统" />
<meta name="keywords" content="cms-信息发布系统" />
<meta name="baidu-site-verification" content="v4SVMECT1g" />
<title>cms-信息发布系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="/webCss.jsp"%>
<script type="application/x-javascript">
	addEventListener("load", function() {
		 setTimeout(hideURLbar, 0);
	}, false);
	 
	function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<meta name="keywords" content="" />
<script type="text/javascript" src="${path}/resources/js/plugins/msgbox/msgbox.js"></script>
<script type="text/javascript" src="${path}/resources/js/plugins/msgbox/msgUtil.js"></script>
<script type="text/javascript" src="${path}/resources/js/DD_roundies_min.js"></script>
<script type="text/javascript" src="${path}/resources/js/jqueryUtil/jquery.cookie.js"></script>
</head>
<body>

<div class="login_background">
    <img src="${path }/resources/images/loginbg .png" width="100%" height="100%" />
    <div class="login_content">
    	<div class="login_top_left clearfix">
            <div class="login_logo"><img src="${path }/resources/images/logo.png" alt=""/></div>
            <div class="login_top_text">信息发布系统</div>
        </div>
<!--         <div class="login"> -->
        	<div class="login_opacity"></div>
        	<div class="login_div">
                <div class="welconme_login">欢迎登陆</div>
                <form name='loginForm' id="loginForm" action="<%=request.getContextPath()%>/login.do" method='post'>
                	
                	<!--error tips start-->
                 <div class="login_error" style="display: none;">
                 	<div class="error_icon">
                 		<img src="${path }/resources/images/error_close.png" />
                 	</div>
                 	<div class="error_content">
                 		${ErrorMessage}
                 	</div>
                 </div>
                 <!--error tips end-->
                
                    <div class="user clearfix">                        
                        <img class="user_icon" src="${path }/resources/images/login/login_user_name_icon.png" />
                        <input type="text" name="username" id="username" value="${errorUsername }" placeholder="请输入登录用户名" />                         
                    </div>
                    
                    <div class="user clearfix pswd_margin_top ">                        
                        <img class="user_icon" alt="" src="${path }/resources/images/login/login_user_pswd_icon.png" />
                       <input type="password" name="password" placeholder="请输入登录密码" id="password" />                      		
                    </div>
                    
                    <div class="about_pswd clearfix">                   	
                            <div class="remeber_pswd" id="remeber_pswd">
                            	<div id="trueDiv" style="display: none;"><img src="${path }/resources/images/checkout_ture.png" id="trueImg"/></div>
                                <div id="falseDiv"><img src="${path }/resources/images/checkout_false.png" id="falseImg"/></div>
                            </div>
                            <label onclick="clickRememberMe();">记住帐号</label>
                            <input id="rememberUserName" name="rememberUserName" type="hidden" value="1"/>  
                            <span class="forgot_pswd">
                            	<%-- <a href="javascript:void(0)">忘记密码？</a> --%>
                            </span><%--${path }/user/toFindPwd.do target="_blank" --%>
                    </div>
                    
                    <div class="check_code clearfix">
                        <input type="text" name="veryCode" placeholder="请输入验证码" id="veryCode" maxlength="4" />
                        <img id="imgObj" alt="" src="${path}/verifyCode.jpeg" onclick="changeImg()"/>
                    </div>
                    
                    <div class="login_submit">                        
                        <input type="button" value="登录" onclick="ajaxLogin_post()" />                      
                    </div>
                                         
                </form>
           	</div>        
<!--       	</div> -->
    </div>       
</div>
    
<script type="text/javascript" >
	
	document.onkeydown=keyListener;
	function keyListener(e){
	    e = e ? e : event;// 兼容FF
	    if(e.keyCode == 13){
	    	ajaxLogin_post();
	    }
	}

	$(document).ready(function(c) {
		
		var uName = $.cookie('username');    
	     if(uName != null && uName != "null" && uName != "") {  
	     	$("#username").val(uName);  
	        $("#falseDiv").hide();	
			$("#trueDiv").show();
			$("#rememberUserName").val("0"); 
	     } 
		var ErrorMessage = '${ErrorMessage}';
		if(ErrorMessage != null && ErrorMessage != ""){
			$(".login_error").show();
		}
		DD_roundies.addRule('.div_circle', '45px 45px 45px 45px', true);
		$('.close').on('click', function(c){
			$('.login-form').fadeOut('slow', function(c){
		  		$('.login-form').remove();
			});
		});	  
		// 勾选记住密码
		$("#falseImg").on("click",function(){
			$("#falseDiv").hide();	
			$("#trueDiv").show();
			$("#rememberUserName").val("0");
			
		});
		// 取消勾选记住密码
		$("#trueImg").on("click",function(){
			$("#falseDiv").show();	
			$("#trueDiv").hide();
			$("#rememberUserName").val("1");
		});
		$("#check_code").onlyNum();
	});
	
	function changeImg(){    
	    var imgSrc = $("#imgObj");    
	    var src = imgSrc.attr("src");    
	    imgSrc.attr("src",chgUrl(src));    
	}
	
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
	
	function setErrorTips(errorMessage){
		$(".error_content").html(errorMessage);
		$(".login_error").show();
	}
	
	function clickRememberMe(){
		var userName = $("#username").val();
		var rememberMe = $("#rememberUserName").val();
		if(rememberMe == "1"){
			$("#falseDiv").hide();	
			$("#trueDiv").show();
			$("#rememberUserName").val("0");
		}else{
			$("#falseDiv").show();	
			$("#trueDiv").hide();
			$("#rememberUserName").val("1");
		}
	}
</script>
</body>
</html>
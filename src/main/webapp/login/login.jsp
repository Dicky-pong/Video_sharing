<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>互动式登录界面设计</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/login/login.css" />
    <script type="text/javascript" src="${path}/resources/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/bootstrap.min.js"></script>
	
</head>
<body>
<!-- Interactive Login - START -->
<div class="container-fluid">
    <div class="row">
        <div class="loginpanel">
			<i id="loading" class="hidden fa fa-spinner fa-spin bigicon"></i>
            <h3>欢迎登录</h3>
             <form name='loginForm' id="loginForm" action="<%=request.getContextPath()%>/login.do" method='post'>
            
            <div>
                <span class="fa fa-user userspan redborder"></span><input id="username" type="text" placeholder="登录账号" onkeypress="check_values();" class="field" required="required" >
                <span class="fa fa-lock  userspan redborder"></span><input id="password" type="password" placeholder="输入密码" onkeypress="check_values();" class="field" required="required" >

			<div class="about_pswd clearfix">
							<input id="checkbox" type="checkbox"  class="check_box" />
							<label onclick="clickRememberMe();" class="remeber" >记住帐号</label> 
							<input id="rememberUserName" name="rememberUserName" type="hidden" value="1" /> 
							<span class="forgot_pswd"><a href="${path }/login/NewFile.html" target="_blank">忘记密码？</a></span>

						</div>
						
			 <div class="check_code clearfix">
                        
                            <input type="text" name="veryCode" placeholder="请输入验证码" id="veryCode" maxlength="4" required="required" onkeypress="check_values();"/>
                            
                            <img id="imgObj" alt="" src="${path}/verifyCode.jpeg" onclick="changeImg()"/>
                                                  
                        </div>
			
						
				<div class="buttonwrapper">
					<button id="loginbtn" class="btn btn-warning loginbutton">
						<span class="fa fa-check"></span>
					</button>
					<span id="lockbtn" class="fa fa-lock lockbutton redborder"></span>
				</div>
				
				  <div class="register">
                        		 <label></>没有账号？</label><a href="javascript:void(0);" onclick="openPage('2');" >立即注册</a>
                 </div> 
                  </form>      
            </div>
        </div>
    </div>
</div>

<!-- Interactive Login - END -->
<!-- 亿企联登录框 start-->

<!-- 亿企联登录框 end-->

<script type="text/javascript">


    function check_values() {
        if ($("#username").val().length != 0 && $("#password").val().length != 0 && $("#veryCode").val().length!=0) {
            $("#loginbtn").animate({ left: '0' , duration: 'slow'});;
            $("#lockbtn").animate({ left: '260px' , duration: 'slow'});;
        }
    }

			
	$("#loginbtn").click(function(){
		$('#loading').removeClass('hidden');
		//这里书写登录相关后台处理，例如: Ajax请求用户名和密码验证
	});

</script>
</body>
</html>
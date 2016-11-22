<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>互动式登录界面设计</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/login/login.css" />
    <script type="text/javascript" src="${path }/resources/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${path }/resources/js/bootstrap.min.js"></script>
	
</head>
<body>
<!-- Interactive Login - START -->
<div class="container-fluid">
    <div class="row">
        <div class="loginpanel">
			<i id="loading" class="hidden fa fa-spinner fa-spin bigicon"></i>
            <h2>
				<span class="fa fa-quote-left "></span> 登录 <span class="fa fa-quote-right "></span>
			</h2>
            <div>
                <input id="username" type="text" placeholder="登录账号" onkeypress="check_values();">
                <input id="password" type="password" placeholder="输入密码" onkeypress="check_values();">

				<div class="buttonwrapper">
					<button id="loginbtn" class="btn btn-warning loginbutton">
						<span class="fa fa-check"></span>
					</button>
					<span id="lockbtn" class="fa fa-lock lockbutton redborder"></span>
				</div>
            </div>
        </div>
    </div>
</div>
<!-- Interactive Login - END -->
<script type="text/javascript">


    function check_values() {
        if ($("#username").val().length != 0 && $("#password").val().length != 0) {
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
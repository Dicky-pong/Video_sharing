var delayedCountdown = null;
var forgetCountdown = null;
$(document).ready(function(){
//	var $("#messagesid_register") = $("#messagesid_register");
//	var $("#messagesid_forgetFwd") = $("#messagesid_forgetFwd");
});

/*login js*/
function changeImg(){    
    var imgSrc = $("#imgObj");    
    var src = imgSrc.attr("src");    
    imgSrc.attr("src",chgUrl(src));    
}    
//时间戳    
//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳    
function chgUrl(url){
    var timestamp = (new Date()).valueOf();    
//     url = url.substring(0,17);
    if((url.indexOf("&")>=0)){
        url = url + "×tamp=" + timestamp;
    }else{
        url = url + "?timestamp=" + timestamp;    
    }
    return url;
}
   
function isRightCode(){
    var code = $("#veryCode").attr("value");
    code = "c=" + code;
    $.ajax({
        type:"POST",
        url:"resultServlet",
        data:code,
        success:callback
    });
} 
   
function callback(data){    
    $("#info").html(data);    
}
/*login END*/


/*注册Register-js*/

function regVerifyCode(){
	//点击发送验证码后 先禁止按钮 防止重复点击
	var $register_code = $("#register_get_mobile_vcode");
	$register_code.removeClass("button btn-gray").addClass("button btn-disabled");
	$register_code.removeAttr("onclick");
	
	//获取输入框值进行效验
	var phoneNumber = jsTrim($("#name_regiester").val());
	var psw = jsTrim($("#password_regiester").val());
	var psw1 = jsTrim($("#password_regiester1").val());
	var operType = "1"; //注册
	
	var message = validFormData_register(phoneNumber,psw,psw1,"1");
	
	if(message == "success"){
		$.ajax({
			cache: true,
            type: "POST",
            url : webRoot + "/user/sendRegVerifyCode.do?phoneNumber=" + phoneNumber + "&operType=" + operType + "&current_date=" + new Date().getTime(),
            dataType: "json",
            async: false,
			success: function(data){
				
				if(data.state == 0){
					switchVerifyCodeCss(120,$register_code,"register");
					$("#msg_register").text("");
					$("#succPoint").text("请查收短信，验证码已发送到你的手机：" + phoneNumber.substring(0, 3) + "****" + phoneNumber.substring(7, 12));
				}else if(data.state == 1){
					$("#msg_register").text("获取验证码失败,更新短信信息失败");
				}else if(data.state == 2){
					$("#msg_register").text("获取验证码失败,该手机号已存在");
				}else if(data.state == 3){
					$("#msg_register").text("验证码获取失败,短信渠道有误");
				}else if(data.state == 4){
					$("#msg_register").text("验证码获取失败,短信发送失败");
				}else if(data.state == 5){
					$("#msg_register").text("验证码获取失败,短信余额不足,请联系客服");
				}else if(data.state == 6){
					$("#msg_register").text("验证码获取失败,短信状态有误");
				}
				
				if(data.state != 0){
					switchVerifyCodeCss(0,$register_code,"register");
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
            	
            }
        });
		
	}else{
		$("#msg_register").text(message);
		//验证失败后 重新绑定按钮click事件以及样式的改变
		$register_code.removeClass().addClass("button btn-gray");
		$register_code.attr("onclick","regVerifyCode();");
	}
}

function validData(){
	
	var name = jsTrim($("#name_regiester").val());
	var psw = jsTrim($("#password_regiester").val());
	var psw1 = jsTrim($("#password_regiester1").val());
	var verifyCode = jsTrim($("#verifyCode_regiester").val());
	
	var message = validFormData_register(name,psw,psw1,"0");
	console.log(message);
	$("#succPoint").text("");
	if(message == "success"){
		//遮盖界面进行ajax等待
		showLoading("register_loading","register_divCover");
		//$("#registerForm").submit();
		$.ajax({
            cache: true,
            type: "POST",
            url:webRoot+"/user/toRegister.do?verifyCode=" + verifyCode,
            data:$('#registerForm').serialize(),
            dataType: "json",
//            async: false,
//            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            error: function(request) {
            	$("#msg_register").text("注册失败,请稍后再试...");
            	closeLoading("register_loading","register_divCover");
            },
            success: function(data) {
            	console.log(data);
            	if(data.state == "true"){
            		var $register_code = $("#register_get_mobile_vcode");
            		switchVerifyCodeCss(0,$register_code,"register");
            		LoadLogin();
            	}else if(data.state == "false"){
            		$("#msg_register").text(data.message);
            		//0:成功 3:验证码失效 4:操作类型有误 5:操作类型ID有误 6:验证码有误 7:验证码已失效或已被使用
            	}else{
            		$("#msg_register").text(data.message);
            	}
            	
            	/*else if(data.state == "3"){
            		$("#msg_register").text("验证码已过期,请重新获取验证码");
            	}else if(data.state == "4" || data.state == "5"){
            		$("#msg_register").text("验证码错误,请重新获取验证码");
            	}else if(data.state == "6"){
            		$("#msg_register").text("验证码输入错误,请重新输入");
            	}else if(data.state == "7"){
            		$("#msg_register").text("验证码已被使用,请重新获取");
            	}else if(data.state == "8"){
            		$("#msg_register").text("验证码不存在,请重新获取");
            	}else if(data.state == "9"){
            		$("#msg_register").text("该用户已存在,请重新输入");
            	}else if(data.state == "10"){
            		$("#msg_register").text("用户名格式错误");
            	}else if(data.state == "11"){
            		$("#msg_register").text("密码不能少于6位");
            	}*/
            	if(data.state!="true"){
            		closeLoading("register_loading","register_divCover");
            	}
            }
        });
		
	}else{
		$("#msg_register").text(message);
	}
	
}

function validFormData_register(name,pwd,confirmPwd,validType){
	var verifyCode = jsTrim($("#verifyCode_regiester").val());
	var message;
	var textRegular = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
	if(name == "" || name =="填写手机号"){
		message = "用户名不能为空!";
		return message;
	}
	if(!textRegular.test(name) || name.length < 11){
		message = "用户名格式不正确!";
		return message;
	}
	if(pwd == "" || pwd =="设置密码"){
		message = "密码不能为空!";
		return message;
	}
	if(pwd.length < 6){
		message = "密码不能少于6位";
		return message;
	}
	if(confirmPwd == "" || confirmPwd =="确认密码"){
		message = "确认密码不能为空!";
		return message;
	}
	if(pwd != confirmPwd){
		message = "两次输入的密码不一样!";
		return message;
	}
	if(validType == "0"){
		if(verifyCode == "" || verifyCode =="输入验证码"){
			message = "验证码不能为空";
			return message;
		}else if(verifyCode.length < 6){
			message = "验证码输入错误";
			return message;
		}
	}
	if($("#YAccount").attr("checked")=="checked"){
		
	}else{
		message = "必须同步开通Y账户";
		return message
	}
	
	return "success";
	
}

function showSuccess(){
	$("#loading").removeClass("loading");
	$("#loading").addClass("operationSuccess");
//		$("#divCover").hide();
}
function showOK(){
	$("#registerSuccess").addClass("operationSuccess1");
	$("#loading").removeClass("operationSuccess");
}




function LoadLogin(){
	var secs = 3; //倒计时的秒数
	for(var i=secs;i>=0;i--)
	{
	   window.setTimeout('executeLogin(' + i + ')', (secs-i) * 1000);
	}
}

function executeLogin(num){
	$("#msg_register").html("");
	$("#register_succPoint").html("注册成功,系统将在 "+num+" 秒后自动登录!");
	
	if(num == 0) {
		var username = $("#name_regiester").val();
		var password = $("#password_regiester").val();
		$("#register_Return_Status").val($.md5(username));
		$("#username").val(username);
		$("#password").val(password);
		ajaxLogin_post();
	}
}

/*注册js End*/
	
	
	
/*忘记密码 js*/	
	function validRegInfo(){
		var phoneNumber = jsTrim($("#name_forgetPwd").val());
		var operType = "4"; //找回密码
		
		var message = validFormData(phoneNumber,"","","0");
		
		if(message == "success"){
			$.ajax({
				cache: true,
                type: "POST",
                url : webRoot + "/user/sendRegVerifyCode.do?current_date=" + new Date().getTime(),
                data:{"phoneNumber":phoneNumber,"operType":operType},
                dataType: "json",
                async: false,
				success: function(data){
					if(data.state == 0){
						var $forgetPwd_code = $("#forget_get_mobile_vcode");
						switchVerifyCodeCss(120,$forgetPwd_code,"forget");
						$("#msg_forgetPwd").text("");
						$("#validPhone").text("请查收短信，验证码已发送到你的手机：" + phoneNumber.substring(0, 3) + "****" + phoneNumber.substring(7, 12));
					}else if(data.state == 1){
						$("#msg_forgetPwd").text("获取验证码失败,更新短信信息失败");
					}else if(data.state == 2){
						$("#msg_forgetPwd").text("获取验证码失败,该手机号不存在");
					}else if(data.state == 3){
						$("#msg_forgetPwd").text("验证码获取失败,短信渠道有误");
					}else if(data.state == 4){
						$("#msg_forgetPwd").text("验证码获取失败,短信发送失败");
					}else if(data.state == 5){
						$("#msg_forgetPwd").text("验证码获取失败,短信余额不足,请联系客服");
					}else if(data.state == 6){
						$("#msg_forgetPwd").text("验证码获取失败,短信状态有误");
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
                	
                }
            });
			
		}else{
			$("#msg_forgetPwd").text(message);
		}
	}
	
	function validVerifyCode(){
		var phoneNumber = jsTrim($("#name_forgetPwd").val());
		var operType = "4"; //找回密码
		var verifyCode = jsTrim($("#verifyCode_forgetPwd").val());
		var message = validFormData("","","","1");
		$("#validPhone").text("");
		if(message == "success"){
			//清楚定时器
			clearTimeout(forgetCountdown);
			//定时开始前的样式
			var $forgetPwd_code = $("#forget_get_mobile_vcode");
			countdownNum(0,$forgetPwd_code,"forget");
			
			$.ajax({
				cache: true,
                type: "POST",
                url : webRoot + "/user/validVerifyCode.do",
                data:{"phoneNumber":phoneNumber,"operType":operType,"verifyCode":verifyCode},
                dataType: "json",
                async: false,
				success: function(data){
                	//0:成功 3:验证码失效 4:操作类型有误 5:操作类型ID有误 6:验证码有误 7:验证码已失效或已被使用 8:验证码不存在
                	if(data.state == "0"){
                		$("#msg_forgetPwd").text("");
                		$("#validPhone").text("验证码通过验证,请点击下一步设置新密码");
                		showSetNewPwd();
                	}else{
                		$("#msg_forgetPwd").text(data.message);
                	}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
                	
                }
            });
			
		}else{
			$("#msg_forgetPwd").text(message);
		}
	}

	function validPwd(){
		
		var name = jsTrim($("#name_forgetPwd").val());
		var psw = jsTrim($("#password_forgetPwd").val());
		var psw1 = jsTrim($("#password_forgetPwd1").val());
		var verifyCode = jsTrim($("#verifyCode_forgetPwd").val());
		
		var message = validFormData(name,psw,psw1,"2");
		$("#succPoint").text("");
		if(message == "success"){
			//遮盖界面进行ajax等待
			showLoading("forgetPwd_loading","forgetPwd_divCover");
			
			$.ajax({
                cache: true,
                type: "POST",
                url:webRoot+"/user/toForgetPwd.do",
                data:{"phoneNumber":name,"password":psw,"verifyCode":verifyCode},
                dataType: "json",
                async: false,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                error: function(request) {
                	$("#pwdMessages").text("找回密码失败,请稍后再试...");
                	closeLoading("forgetPwd_loading","forgetPwd_divCover");
                },
                success: function(data) {
                	console.log(data);
                	if(data.state == "0"){
            			Load();
                	}else{
                		$("#pwdMessages").text(data.message);
                	}//0:成功 3:验证码失效 4:操作类型有误 5:操作类型ID有误 6:验证码有误 7:验证码已失效或已被使用
                	/*else if(data.state == "3"){
                		$("#pwdMessages").text("验证码已过期,请重新获取验证码");
                	}else if(data.state == "4" || data.state == "5"){
                		$("#pwdMessages").text("验证码错误,请重新获取验证码");
                	}else if(data.state == "6"){
                		$("#pwdMessages").text("验证码输入错误,请重新输入");
                	}else if(data.state == "7"){
                		$("#pwdMessages").text("验证码已被使用,请重新获取");
                	}else if(data.state == "8"){
                		$("#pwdMessages").text("验证码不存在,请重新获取");
                	}*/
                	
                	if(data.state != "0"){
                		closeLoading("forgetPwd_loading","forgetPwd_divCover");
                	}
                }
            });
			
		}else{
			$("#pwdMessages").text(message);
		}
		
	}
	
	function validFormData(name,pwd,confirmPwd,validType){
		var verifyCode = jsTrim($("#verifyCode_forgetPwd").val());
		var message;
		var textRegular = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
		if(validType == "0"){
			if(name == "" || name =="填写手机号"){
				message = "用户名不能为空!";
				return message;
			}
			if(!textRegular.test(name) || name.length < 11){
				message = "用户名格式不正确!";
				return message;
			}
			return "success";
		}
		if(validType == "1"){
			if(verifyCode == "" || verifyCode =="输入验证码"){
				message = "验证码不能为空";
				return message;
			}else if(verifyCode.length < 6){
				message = "验证码输入错误";
				return message;
			}
			return "success";
		}
		if(validType == "2"){
			if(pwd == "" || pwd =="设置密码"){
				message = "密码不能为空!";
				return message;
			}
			if(pwd.length < 6){
				message = "密码不能少于6位";
				return message;
			}
			if(confirmPwd == "" || confirmPwd =="确认密码"){
				message = "确认密码不能为空!";
				return message;
			}
			if(pwd != confirmPwd){
				message = "两次输入的密码不一样!";
				return message;
			}
			return "success";
		}
		
	}
	
	function showNextBtn(){
		
		//var verifyCode = $("#verifyCode_forgetPwd").val().trim();
		var varverifyCode=$("#verifyCode_forgetPwd").val().length;
		var isLen = varverifyCode > 5;
		if(isLen){
			$("#next").removeClass("button btn-disabled").addClass("button btn-green");
			$("#next").attr("onclick","validVerifyCode();");
		}else{
			$("#next").removeClass("button btn-green").addClass("button btn-disabled");
			$("#next").removeAttr("onclick");
		}
	}
	
	function showSetNewPwd(){
		$("#succPoint").text("");
		//$("#pwdMessages").text("");
		$("#validPhone").text("");
		$("#msg_forgetPwd").text("");
		$("#forgetPwd_form").hide();
		$("#forgetPwd_text").html("设置新密码");
		$("#setNewPwd").show();
	}
	
	function showRegForm(){
		$("#succPoint").text("");
		$("#pwdMessages").text("");
		$("#validPhone").text("");
		$("#msg_forgetPwd").text("");
		$("#forgetPwd_form").show();
		$("#forgetPwd_text").html("找回密码");
		$("#setNewPwd").hide();
	}
	
	function showLoading(loadid,divCover){
		$("#"+loadid).addClass("loading");
		$("#"+divCover).show();
	}
	
	function closeLoading(loadid,divCover){
		$("#"+loadid).removeClass("loading");
		$("#"+divCover).hide();
	}
	function showSuccess(){
		$("#loading").removeClass("loading");
		$("#loading").addClass("operationSuccess");
// 		$("#divCover").hide();
	}
	function showOK(){
		$("#registerSuccess").addClass("operationSuccess1");
		$("#loading").removeClass("operationSuccess");
	}
	
	
	function Load(){
		var secs = 3; //倒计时的秒数
		for(var i=secs;i>=0;i--)
		{
		   window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000);
		}
	}
	
	function doUpdate(num){
		$("#forgetPwd_succPoint").html("找回密码成功,系统将在 "+num+" 秒后自动跳转到登录页面!");
		if(num == 0) {
			closeLoading("forgetPwd_loading","forgetPwd_divCover");
			showRegForm();
			document.execCommand('Refresh');
			$(".login_btn_function").click();
			
		}
	}
	
	function switchVerifyCodeCss(wait,o,type) {
        /*if (wait == 0) {
            o.removeClass("button btn-disabled").addClass("button btn-gray");    
            o.attr("onclick","regVerifyCode()");
            o.text("获取验证码");
        } else {*/
        	o.removeClass("button btn-gray").addClass("button btn-disabled");
        	o.removeAttr('onclick');
//        	o.text(wait + "秒后重新获取");
        	/*wait--;*/
            countdownNum(wait,o,type);
//        }
    }
	
	function countdownNum(num,o,type){
		--num;
		o.text(num + " 秒后重新获取");
		if(num<=0){
			
			o.removeClass("button btn-disabled").addClass("button btn-gray");
			if(type=="forget"){
				clearTimeout(forgetCountdown);
				o.attr("onclick","validRegInfo()");
			}else{
				clearTimeout(delayedCountdown);
				o.attr("onclick","regVerifyCode()");
			}
            o.text("获取验证码");
		}else{
			if(type=="forget"){
				forgetCountdown = setTimeout(function(){
					countdownNum(num,o,type);
				},1000);
			}else{
				delayedCountdown = setTimeout(function(){
					countdownNum(num,o,type);
				},1000);
			}
		}
	}
/*忘记密码 js END*/
	
	function ajaxLogin_post(){
		var username = $("#username").val();
		var password = $("#password").val();
		var registerStatus = $("#register_Return_Status").val();
		var veryCode = $("#veryCode").val();
		if(username == null || username==""){
			$("#messagesid").html("用户名不能为空");
			$("#login_username_label").focus();
			$("#username").css("background-color","#ffe7e7");
			return;
		}else{
			$("#username").css("background-color","");
		}
		if(password == null || password==""){
			$("#messagesid").html("密码不能为空");
			$("#login_password_label").focus();
			$("#password").css("background-color","#ffe7e7");
			return;
		}else{
			$("#password").css("background-color","");
		} 
		
		if(registerStatus == null || registerStatus == ""){
			if(veryCode == null || veryCode == ""){
				$("#messagesid").html("验证码不能为空");
				$("#login_veryCode_label").focus();
				$("#veryCode").css("background-color","#ffe7e7");
				return;
			}else{
				$("#veryCode").css("background-color","");
			}
		}
		$("#loginForm").submit();
	}
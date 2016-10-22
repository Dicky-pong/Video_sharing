function validData(userName) {
		var textRegular = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
		if (userName == "" || null == userName) {
			$("#nameTip").html("&nbsp;&nbsp;&nbsp;&nbsp;请输入手机号码");
			return false;
		} else if (!textRegular.test(userName) || userName.length < 11) {
			$("#nameTip").html("&nbsp;&nbsp;&nbsp;&nbsp;手机号码格式不正确!");
			return false;
		} else {
			return true;
		}
	}
	
	
	function validPassword(){
		var textRegular = /^[a-zA-Z]+$/;
		var password = $("#pw").val();
		var pwd = $("#pwd").val();
		if(password == "" || password == null){
			$("#passwordTip").html("登录密码不能为空");
			return false;
		}else if(!textRegular.test(password.subString(0,1))){
			$("#passwordTip").html("密码不是以字母开头");
			return false;
		}else if(password.length < 6 || password.length >18){
			$("#passwordTip").html("密码长度为6-18位");
			return false;
		}else{
			$("#passwordTip").html("");
			return true;
		}
	}
	
	function validEmail(){
		var email = $("#email").val();
		var textEmailRegular = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
		if(email == "" || email == null){
			$("#emailTip").html("注册邮箱不能为空");
			return false;
		}else if(!textEmailRegular.test(email)){
			$("#emailTip").html("邮箱格式不正确");
			return false;
		}else{
			$("#emailTip").html("");
			return true;
		}
	}
	
	function validPwd(){
		var password = $("#pw").val();
		var pwd = $("#pwd").val();
		var textRegular = /^(\w){6,18}$/; 
		if(pwd == "" || password == null){
			$("#pwdTip").html("密码不能为空");
			return false;
		}else if(!textRegular.test(pwd)){
			$("#pwdTip").html("密码只能输入6-20个字母、数字、下划线");
			return false;
		}else if(password != pwd){
			$("#pwdTip").html("密码不一致!");
			return false;
		}else{
			$("#pwdTip").html("");
			return true;
		}
	}
	
	function validNickName(){
		var nickName = $("#nickName").val();
		
		if(nickName != ""){
			$("#nickNameTip").html("");
			$.ajax({
				type : "POST",
				url : webRoot + "/user/validNickName.do?current_date="+ new Date().getTime(),
				data : {
					"nickName" : nickName,
				},
				dataType : "json",
				async : false,
				success : function(data) {
					if (data.state == "0") {
						$("#nickNameTip").html("该用户可用");
						isNickName = true;
					}else if(data.state == "14"){
						$("#nickNameTip").html("该用户已存在,请重新输入");
						isNickName = false;
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
				}
			});
		}else{
			$("#nickNameTip").html("会员名称不能为空");
			isNickName = false;
		}
	}
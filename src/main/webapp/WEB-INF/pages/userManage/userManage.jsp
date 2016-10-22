<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<script type="text/javascript" src="${path}/resources/js/jqueryUtil/jquery.md5.js"></script>
	
	<title>亿企联系统发布</title>
</head>
<body>

<div class="system_content_right_top">
	<!-- 系统公告第一页start -->
	<div class="announcemen-content">
		<div class="announcemen-content-top">用户管理</div>
		<div class="announcemen-content-conditions" >
			<div class="announcemen-content-conditions-body">
				<sec:authorize ifAnyGranted="ROLE_ADMIN">
					<div class="userAddBtn click_open_id"  popName="useradd_m">
						<div class="userAddBtn_left"><img src="${path}/resources/images/userAdd.png"></div><div class="userAddBtn_right">新增用户</div>
					</div>
				</sec:authorize>
				<div class="conditionRow">
					<table class="conditionTable">
						<thead>
							<tr>
								<th style="width: 14%">用户编号</th>
								<th style="width: 16%">登陆账号</th>
								<th style="width: 20%">创建时间</th>
								<th style="width: 14%">权限</th>
								<th style="width: 20%">备注</th>
								<th style="width: 16%">操作</th>
							</tr>
						</thead>
						
						<tbody id="userManage_ContextList" >
						</tbody>
					</table>
					<!-- 分页插件 -->
					<div id="userManage_Pagination" class="pagination"></div>
					<sec:authorize ifAnyGranted="ROLE_ADMIN">
						<p style="display: none">
							<textarea id="userManage-List" rows="0" cols="0">
								  <!--
								  {#template MAIN} 
								  		{#if $T.data.length > 0}
									  		{#foreach $T.data as cmsUser}
									  			<tr>
										  			<td align="center" valign="middle">
										  				{$T.cmsUser$index+1}
										  			</td>
										  			<td align="center" valign="middle">
										  				{$T.cmsUser.loginName}
										  			</td>
										  			<td align="center" valign="middle">
										  				{$T.cmsUser.createDate}
										  			</td>
										  			<td align="center" valign="middle">
										  				
										  			</td>
										  			<td align="center" valign="middle">
										  				
										  			</td>
										  			<td align="center" valign="middle" class="conditionTableLast">
										  				{#if $T.cmsUser.loginName == 'admin'}
												  			<div class="click_open_id"  popName="useradd_dite" onclick="edit_CmsUser({$T.cmsUser$index+1},'{$T.cmsUser.id}','{$T.cmsUser.loginName}')">编辑</div>
														{#else}
															<div class="click_open_id"  popName="useradd_dite" onclick="edit_CmsUser({$T.cmsUser$index+1},'{$T.cmsUser.id}','{$T.cmsUser.loginName}')">编辑</div>
															<div class="click_open_id"  popName="cmsUser_del" onclick="delCmsUser('{$T.cmsUser.id}','{$T.cmsUser.loginName}')">删除</div>
														{#/if}
								  					</td>
										  		</tr>
									  		{#/for}
									  	{#/if}
									  	{#if $T.data.length == 0} 
								  			<tr>
								  				<td align="center" valign="middle" colspan="10">暂无数据,请重新查询</td></tr>
								  			</tr>
								  		{#/if}
					              {#/template MAIN}
					              -->
					        </textarea>
						</p>
					</sec:authorize>
					<sec:authorize ifAnyGranted="ROLE_LOGIN">
						<p style="display: none">
							<textarea id="userManage-List" rows="0" cols="0">
								  <!--
								  {#template MAIN} 
								  		{#if $T.data.length > 0}
									  		{#foreach $T.data as cmsUser}
									  			<tr>
										  			<td align="center" valign="middle">
										  				{$T.cmsUser$index+1}
										  			</td>
										  			<td align="center" valign="middle">
										  				{$T.cmsUser.loginName}
										  			</td>
										  			<td align="center" valign="middle">
										  				{$T.cmsUser.createDate}
										  			</td>
										  			<td align="center" valign="middle">
										  				
										  			</td>
										  			<td align="center" valign="middle">
										  				
										  			</td>
										  			<td align="center" valign="middle" class="conditionTableLast">
											  			无
								  					</td>
										  		</tr>
									  		{#/for}
									  	{#/if}
									  	{#if $T.data.length == 0} 
								  			<tr>
								  				<td align="center" valign="middle" colspan="10">暂无数据,请重新查询</td></tr>
								  			</tr>
								  		{#/if}
					              {#/template MAIN}
					              -->
					        </textarea>
						</p>
					</sec:authorize>
				</div>
			</div>
		</div>

	</div>
	<!-- 系统公告第一页end -->
</div>
<!-- 弹出框 -->
<!--删除账号  弹出框 start-->
<div class="Pop_layer" id="cmsUser_del" popName="cmsUser_del"  style="display:none;">
    <div class="latest_activity_pop">
        <div class="latest_activity_pop_close">
            <a class="latest_activity_pop_close_a  click_close_id"  popName="cmsUser_del"  href="javascript:void(0);"></a>
        </div>
        <div class="latest_activity_pop_con">
            <div class="latest_activity_pop_con_t">
                删除用户
            </div>
            <div class="latest_activity_pop_con_c" style="text-align:center;">
                是否确定删除<<em id="del_name_show"></em>>此账号?
            </div>
        </div>
        <div class="latest_activity_pop_btn">
            <a class="latest_activity_pop_btn_follow click_close_id deleteBtn" id="cmsUser_deleteBtn" popName="cmsUser_del" href="javascript:void(0);">确认</a>
           <!--  <a class="latest_activity_pop_btn_no click_close_id"  popName="user_management" href="javascript:void(0);">取消</a> -->
        </div>
    </div>
</div>
<!--删除该商品 弹出框 end-->
<!-- 新增用户弹出框 start -->
 <div class="Pop_layer" id="useradd_m" popName="useradd_m" style="display: none;" >
    <div class="Pop_layer_box" style="width: 550px;">
        <div class="pop_layer_title">
            <span class="pop_layer_title_span">新增用户</span>
            <span class="pop_layer_title_span_close">
                <a class="pop_layer_title_span_close_a click_close_id" popName="useradd_m"  href="javascript:void(0);"></a>
            </span>
        </div>
        <div class="new_member_pop" style="width: 550px;">            
            <div class="new_member_pop_box">  
            	<div class="userContent">
            	<form action='' method='post' >
            		<table class="userContentTable" >
            			<tr>
            				<td class="user_left">用户编号</td>
            				<td class="user_right user_right_r" id="dataline"></td>
            			</tr>
            			<tr>
            				<td class="user_left">登录账号</td>
            				<td class="user_right">
            					<input type="text" class="accountName" id="loginName" value="" placeholder="请输入登录用户名" maxlength="16">
            					<span class="user_info">登录账号不能为空</span>
            				</td>
            			</tr>
            			<tr>
            				<td class="user_left">登录密码</td>
            				<td class="user_right">
            					<input type="password"  class="systemPassword" id="passWord" value="" placeholder="请输入登录密码" maxlength="16">
            					<span class="user_info">登录密码不能为空</span>
            				</td>
            			</tr>
            			<tr>
            				<td class="user_left">确定密码</td>
            				<td class="user_right">
            					<input type="password" class="dbPassword" id="dbPassword" maxlength="16">
            					<span class="user_info">重复输入密码不能为空</span>
            				</td>
            			</tr>
            			<tr>
            				<td class="user_left">用户权限</td>
            				<td class="user_right">
            					<!-- <select>
            						<option value="">dfa</option>
            					</select> -->
            					<select name="" id="" class="spname" style="font-size: 14px;font-family:Microsoft YaHei;">
									<option value="0" selected>请选择</option>
								</select>
            				</td>
            			</tr>
            		</table>
            		</form>
            	</div>
            <div class="clear"></div>
            </div>
        </div>
        <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
            <a class="perfect_information_pop_button_sure"  popName="useradd_m" href="javascript:void(0);" onclick="addCmsUser()">确定</a>
            <a class="perfect_information_pop_button_cancel click_close_id"  popName="useradd_m" href="javascript:void(0);">取消</a>
        </div>
    </div>
</div>   
<!-- 新增用户弹出框 end -->

<!-- 编辑弹出框 start -->
 <div class="Pop_layer" id="useradd_dite" popName="useradd_dite" style="display: none;" >
    <div class="Pop_layer_box" style="width: 550px;">
        <div class="pop_layer_title">
            <span class="pop_layer_title_span">编辑用户</span>
            <span class="pop_layer_title_span_close">
                <a class="pop_layer_title_span_close_a click_close_id"  popName="useradd_dite"  href="javascript:void(0);"></a>
            </span>
        </div>
        <div class="new_member_pop" style="width: 550px;">            
            <div class="new_member_pop_box">  
            	<div class="userContent">
            	<form action='' method='post' >
            		<table class="userContentTable" >
            			<tr>
            				<td class="user_left">用户编号</td>
            				<td class="user_right user_right_r" id="edit_dataline"></td>
            			</tr>
            			<tr>
            				<td class="user_left">登录账号</td>
            				<td class="user_right user_right_r" id="edit_loginName">
            					
            				</td>
            			</tr>
            			<tr>
            				<td class="user_left">登录密码</td>
            				<td class="user_right">
            					<input type="password"  class="edit_systemPassword" id="edit_passWord" maxlength="16">
            					<span class="user_info">登陆密码不能为空</span>
            				</td>
            			</tr>
            			<tr>
            				<td class="user_left">确定密码</td>
            				<td class="user_right">
            					<input type="password" class="edit_dbPassword" id="edit_dbPassWord" maxlength="16">
            					<span class="user_info">重复输入密码不能为空</span>
            				</td>
            			</tr>
            			<tr>
            				<td class="user_left">用户权限</td>
            				<td class="user_right">
            					<!-- <select>
            						<option value="">dfa</option>
            					</select> -->
            					<select name="" id="" class="spname" >
									<option value="0" selected>请选择</option>
								</select>
								<span class="user_info">请选择用去权限</span>
            				</td>
            			</tr>
            		</table>
            	</form>
            	</div>
            <div class="clear"></div>
            </div>
        </div>
        <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
            <a class="perfect_information_pop_button_sure "  popName="useradd_dite" id="edit_CmsUser" href="javascript:void(0); ">确定</a>
            <a class="perfect_information_pop_button_cancel click_close_id"  popName="useradd_dite" href="javascript:void(0);">取消</a>
        </div>
    </div>
</div>   
<!-- 编辑弹出框 end -->


<script type="text/javascript">
//用户管理表单验证
var validation=false;
$(function(){
	//分页总条数
	initPagination_UserManage();
    // 登陆账号
    $(".accountName").blur(function(){
    	validationLoginName()
	});
	// 验证密码
	$(".systemPassword").blur(function(){
		validationPassWord()
	});
	// 验证重复密码
	$(".dbPassword").blur(function(){
		validationdbPassWord()
	});
	//修改-密码验证
	$(".edit_systemPassword").blur(function(){
		validationEdit_PassWord()
	});
	//修改-重复密码验证
	$(".edit_dbPassword").blur(function(){
		if($(".edit_dbPassword").val() == ""){
	    	$(".edit_dbPassword").css("borderColor","#dd8293");
	    	$(".edit_dbPassword").next(".user_info").css("visibility","visible");
	    	$(".edit_dbPassword").focus();
	    	return false;
	    }else if ($(".edit_dbPassword").val()!=$(".edit_systemPassword").val()) {
	    	$(".edit_dbPassword").css("borderColor","#dd8293");
	    	$(".edit_dbPassword").next(".user_info").css("visibility","visible").html("密码不一致");
	    	$(".edit_dbPassword").focus();
	    	return false;
	    }
	    else{
	        $(this).css("borderColor","#dedede");
		    $(this).next(".user_info").css("visibility","hidden");
		    return true;
	    }
	});
	
});

function validationLoginName(){
	var reg= /^[a-zA-Z][a-zA-Z0-9_]+$/;
	if($(".accountName").val() == ""){
    	$(".accountName").css("borderColor","#dd8293");
    	$(".accountName").next(".user_info").css("visibility","visible");
    	return false;
    }else if( $(".accountName").val().match(reg) == null){
        $(".accountName").css("borderColor","#dd8293");
    	$(".accountName").next(".user_info").css("visibility","visible").html("登录账号不正确（以字母开头,允许数字与下划线）");
    	return false;
    }else if( $(".accountName").val().length < 6 || $(".accountName").val().length > 17 ){
        $(".accountName").css("borderColor","#dd8293");
        $(".accountName").next(".user_info").css("visibility","visible").html("登录名长度为6-16个字符");
        return false;
    }else{
        $(".accountName").css("borderColor","#dedede");
        $(".accountName").next(".user_info").css("visibility","hidden");
        return true;
    }
}

function validationPassWord(){
	if($(".systemPassword").val() == ""){
    	$(".systemPassword").css("borderColor","#dd8293");
    	$(".systemPassword").next(".user_info").css("visibility","visible");
    	return false;
    }else if( $(".systemPassword").val().length < 6 || $(".systemPassword").val().length > 16 ){
        $(".systemPassword").css("borderColor","#dd8293");
        $(".systemPassword").next(".user_info").css("visibility","visible").html("密码长度为6-16个字符");
        return false;
    }else{
        $(".systemPassword").css("borderColor","#dedede");
	    $(".systemPassword").next(".user_info").css("visibility","hidden");
	    return true;
    }
}

function validationdbPassWord(){
	if($(".dbPassword").val() == ""){
    	$(".dbPassword").css("borderColor","#dd8293");
    	$(".dbPassword").next(".user_info").css("visibility","visible");
    	return false;
    }else if ($(".dbPassword").val()!=$(".systemPassword").val()) {
    	$(".dbPassword").css("borderColor","#dd8293");
    	$(".dbPassword").next(".user_info").css("visibility","visible").html("密码不一致");
    	return false;
    }
    else{
        $(".dbPassword").css("borderColor","#dedede");
	    $(".dbPassword").next(".user_info").css("visibility","hidden");
	    return true;
    }
}

function validationEdit_PassWord(){
	if($(".edit_systemPassword").val() == ""){
    	$(".edit_systemPassword").css("borderColor","#dd8293");
    	$(".edit_systemPassword").next(".user_info").css("visibility","visible");
    	return false;
    }else if( $(".edit_systemPassword").val().length < 6 || $(".edit_systemPassword").val().length > 16 ){
        $(".edit_systemPassword").css("borderColor","#dd8293");
        $(".edit_systemPassword").next(".user_info").css("visibility","visible").html("密码长度为6-16个字符");
        return false;
    }else{
        $(".edit_systemPassword").css("borderColor","#dedede");
	    $(".edit_systemPassword").next(".user_info").css("visibility","hidden");
	    return true;
    }
}


var pageIndex = 0;    //初始化页索引
var pageSize = 10;    //每页显示的条数
var pageTotal = 0;	  //初始化总条数
//获取总页数
function initPagination_UserManage() {
	
	var url_ = basePath+"/cmsuser/queryCmsUserPageSize.do";
	$.ajax({
		url : url_,
		type : "POST",
		async : false,
		dataType : "json",
		success : function(data) {
			if(null != data){
				pageTotal = data;
				//获取总页数后 初始化控件分页取数据--ajax分页方法
				initPagination("userManage_Pagination",pageTotal,pageSize,"loadCmsUsersPageInfo");
				
				//设置新增用户时的序号
				$("#dataline").html(pageTotal+1);
			}
		},
		error : function(e) {
			alertErrors("操作失败，请刷新再试", 3000);
		}
	});
}
//加载分页内容
function loadCmsUsersPageInfo(pageIndex) {
	var url_ = webRoot + "/cmsuser/queryCmsUserList.do";
	var data = {pageIndex:pageIndex,pageSize:pageSize}
	$.ajax({
		url : url_,
		data :data,
		type : "POST",
		async : false,
		dataType : "json",
		success : function(data) {
			if(null != data){
				//数据填充模板
				$("#userManage_ContextList").setTemplateElement("userManage-List");
				$("#userManage_ContextList").processTemplate(data);
				
			}
		},
		error : function(e) {
			alertErrors("操作失败，请刷新再试", 3000);
		}
	});
}

function clearInput(){
	validation = false;
	$("#loginName").val("");
	$("#passWord").val("");
	$("#dbPassword").val("");
	$("#edit_passWord").val("");
	$("#edit_dbPassWord").val("");
}

function addCmsUser(){
	var $loginName = $("#loginName");
	var $passWord = $("#passWord");
	var $dbPassWord = $("#dbPassword");
	if(!validationLoginName()){
		$loginName.focus();
		return;
	}else if(!validationPassWord()){
		$passWord.focus();
		return;
	}else if(!validationdbPassWord()){
		$dbPassWord.focus();
		return;
	}else{
		var url_ = basePath + "/cmsuser/addCmsUsers.do";
		var data = {
				loginName:$loginName.val(),
				password:$.md5($passWord.val())
				
		}
		$.ajax({
			url : url_,
			data :data,
			type : "POST",
			async : false,
			dataType : "json",
			success : function(data) {
				if(null != data){
					if(data.msgCode == 0){
						alertSuccess("新增用户成功!", 2000);
						initPagination_UserManage();
						click_close("useradd_m");
						clearInput();
					}else if(data.msgCode == 10003){
						$(this).css("borderColor","#dd8293");
				        $(".accountName").next(".user_info").css("visibility","visible").html(data.msg);
					}
				}
			},
			error : function(e) {
				alertErrors("操作失败，请稍后再试", 2000);
			}
		});
		
	}
}

//编辑cms用户信息
function edit_CmsUser(serialNum,userId,userName){
	$("#edit_dataline").html(serialNum);
	$("#edit_loginName").html(userName);
	$("#edit_CmsUser").unbind("click");
	$("#edit_CmsUser").click(function(){
		var password = $("#edit_passWord").val();
		var dbPassword = $("#edit_dbPassWord").val();
		if(!validationEdit_PassWord()){
			$("#edit_passWord").focus();
			return;
		}else if(dbPassword == ""){
			$("#edit_dbPassWord").focus();
			return;
		}else if(password==dbPassword){
			//密码加密后传送至后台
			password = $.md5(password);
			var url_ = basePath + "/cmsuser/editCmsUsers.do";
			var data = {
					id:userId,
					password:password
			}
			$.ajax({
				url : url_,
				data :data,
				type : "POST",
				async : false,
				dataType : "json",
				success : function(data) {
					if(null != data){
						if(data.msgCode == 0){
							alertSuccess("修改用户成功!", 2000);
							initPagination_UserManage();
							click_close("useradd_dite");
							clearInput();
						}
					}
				},
				error : function(e) {
					alertErrors("操作失败，请稍后再试", 2000);
				}
			});
		}
	});
}

function delCmsUser(id,loginName){
	$("#del_name_show").html(loginName);
	
	$("#cmsUser_deleteBtn").unbind("click");
	$("#cmsUser_deleteBtn").click(function(){
		
		var url_ = basePath + "/cmsuser/delCmsUsers.do";
		var data = {
				id:id
		}
		$.ajax({
			url : url_,
			data :data,
			type : "POST",
			async : false,
			dataType : "json",
			success : function(data) {
				if(null != data){
					if(data.msgCode == 0){
						alertSuccess("删除用户成功!", 2000);
						initPagination_UserManage();
						click_close("cmsUser_del");
					}
				}
			},
			error : function(e) {
				alertErrors("操作失败，请稍后再试", 2000);
			}
		});
		
	});
	
}

</script> 
</body>
</html>
$(function() {
	//密码框禁止复制，粘贴
	$("input:password").bind("copy cut paste",function(e){
        return false;
     });
});
//文本框内提示切换
function focusEvent(o,_this){
	$("#"+_this.id).hide();
	$("#"+o).val("");
	$("#"+o).focus();
	$("#"+o).css("background-color","");
	$("#"+o).css("display","inline-block");
}
function blurEvent(o,_this){
	if(_this.value == ""){
		$("#"+o).show();
		$("#"+_this.id).hide();
	}
}
//----------------------------------------------------------------------
//<summary>
//限制只能输入数字
//</summary>
//----------------------------------------------------------------------
$.fn.onlyNum = function () {
 $(this).keypress(function (event) {
     var eventObj = event || e;
     var keyCode = eventObj.keyCode || eventObj.which;
     if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 1 && keyCode <= 31))
         return true;
     else
         return false;
 }).focus(function () {
 //禁用输入法
     this.style.imeMode = 'disabled';
 }).bind("paste", function () {
 //获取剪切板的内容
     var clipboard = window.clipboardData.getData("Text");
     if (/^\d+$/.test(clipboard))
         return true;
     else
         return false;
 });
};
//----------------------------------------------------------------------
//<summary>
//限制只能输入字母
//</summary>
//----------------------------------------------------------------------
$.fn.onlyAlpha = function () {
 $(this).keypress(function (event) {
     var eventObj = event || e;
     var keyCode = eventObj.keyCode || eventObj.which;
     if ((keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (keyCode >= 1 && keyCode <= 31))
         return true;
     else
         return false;
 }).focus(function () {
     this.style.imeMode = 'disabled';
 }).bind("paste", function () {
     var clipboard = window.clipboardData.getData("Text");
     if (/^[a-zA-Z]+$/.test(clipboard))
         return true;
     else
         return false;
 });
};
//----------------------------------------------------------------------
//<summary>
//限制只能输入数字和字母
//</summary>
//----------------------------------------------------------------------
$.fn.onlyNumAlpha = function () {
 $(this).keypress(function (event) {
     var eventObj = event || e;
     var keyCode = eventObj.keyCode || eventObj.which;
     if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (keyCode >= 1 && keyCode <= 31))
         return true;
     else
         return false;
 }).focus(function () {
     this.style.imeMode = 'disabled';
 }).bind("paste", function () {
	 var str1=window.clipboardData.getData("text");  
	 //var clipboard = window.clipboardData.getData("Text");
     if (/^(\d|[a-zA-Z])+$/.test(""))
         return true;
     else
         return false;
 });
};

//文本框只能输入数字，并屏蔽输入法和粘贴  
$.fn.numeral = function() {
	$(this).css("ime-mode", "disabled");
	this.bind("keypress", function(e) {
		var code = (e.keyCode ? e.keyCode : e.which); //兼容火狐 IE      
		if (!$.browser.msie && (e.keyCode == 0x8)) //火狐下不能使用退格键     
		{
			return;
		}
		return code >= 48 && code <= 57;
	});
	this.bind("blur", function() {
		if (this.value.lastIndexOf(".") == (this.value.length - 1)) {
			this.value = this.value.substr(0, this.value.length - 1);
		} else if (isNaN(this.value)) {
			this.value = "";
		}
	});
	this.bind("paste", function() {
		var s = clipboardData.getData('text');
		if (!/\D/.test(s))
			;
		value = s.replace(/^a*/, '');
		return false;
	});
	this.bind("dragenter", function() {
		return false;
	});
	this.bind("keyup", function() {
		if (/(^a+)/.test(this.value)) {
			this.value = this.value.replace(/^a*/, '');
		}
	});
	this.bind("contextmenu",function(e){   
        return false;   
  });
};


function noAccessDiv(){
	var userState = $("#UserState").val();
	if(userState == 1){
		
		$(".tips-lginfo").fadeIn();
	}
	
	var href = window.location+"";
	var href_after = href.lastIndexOf("/");
	var href_after_url = href.substring(href.length,href_after);
	
	if(href_after_url=="/toSysManage.do"){
		
	}else{
		if(userState!=0){
			//showNoAccessDiv();
    	}
	}
}

function showNoAccessDiv(){
	var html ="";
	html += "<h2>您还需完善您的资料,才能更好的应用我们平台的服务!</h2><br /><br />";
  	html += "<p style=''>点击<a href='"+basePath+"manage/toSysManage.do'>这里</a>,立即完善您的资料!</p>";
  	jQuery.facebox(html);
}

function perfectInfo(){
	var url = basePath+"main/toSysManage.do";
	window.location = url;
}


function jsTrim(str) {
    return str.replace(/\ /g, "");
}

//公共分页方法
function initPagination(o,pageTotal,pageSize,method){
	var pageIndex = 0;
	 $("#"+o).pagination(pageTotal, {            
     callback: PageCallback,            
     prev_text: '上一页',             
     next_text: '下一页',              
     items_per_page: pageSize,              
     num_display_entries: 5,        
     current_page: pageIndex,           
     num_edge_entries: 1         
 });                   
 function PageCallback(index,item, jq) {
	 var m = method;
	 pageIndex = index+1;
	 
	 eval(m+'(pageIndex)');
 }
}


function clickApp(state,url){
	
	if(state==0 || state==2){
		window.location.href=url;
	}else{
		showNoAccessDiv();
	}
	
}

function showOperateDiv(){
	$(".Cover_layer").show();
	$('#are_you_sure').css('left', $(window).width() / 2 - ($('.Pop_layer').width() / 2))
  	$('#are_you_sure').css('top', $(window).height() / 2 - ($('.Pop_layer').height() / 2))
	$("#are_you_sure").fadeIn();
}

//$(document).keyup(function(event){
//	if(event.keyCode == 27){
//		$('.Pop_layer').hide();
//		$(".Cover_layer").fadeOut();
//	}
//});
/**
 * 延伸左边菜单栏长度,动态与右边内容框长度相等
 */
function extensionLength(){
	if($(".content_left").height() > $(".content_right").height()){
			$(".content_right").css("height",$(".content_left").height()) 
	}else{
		$(".content_left").css("height",$(".content_right").height()) 
	}
}

/**
 * 取消按钮,关闭弹出窗体
 * @param id  弹出窗体的id
 */
function cancelAndClose(id){
	$(".Cover_layer").fadeOut();
	$("#"+id).hide();
}

/**
 * 滚动到页面中 当前传值id的控件位置
 * @param id
 */
function mScroll(id){
	$("html,body").stop(true);
	$("html,body").animate({scrollTop: $("#"+id).offset().top-100}, 1000);
}
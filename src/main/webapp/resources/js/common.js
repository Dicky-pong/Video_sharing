
$(function() {
	//密码框禁止复制，粘贴
	$("input:password").bind("copy cut paste",function(e){
        return false;
     });
	
	var browser_height=document.documentElement.clientHeight-223;
	$(".content_top").css("min-height",browser_height);
	$(".content").css("min-height",browser_height);
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


//
function initPaginations(o,pageTotal,pageSize,method){
	
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
	 var pageIndexs = $("#Pagination .current").eq(1).html();
	 
	 function PageCallback(index,item, jq) {
		 var m = method;
		 pageIndex = index+1;
		 eval(m+'(pageIndex)');
	 }
}
//


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
 * 打开窗体
 */
function onOpenOperateWindow(id) {
	$(".Cover_layer").show();
	$("#" + id).css('left', $(window).width() / 2 - ($("#" + id).width() / 2));
	$("#" + id).css('top', $(window).height() / 2 - ($("#" + id).height() / 2));
	$("#" + id).fadeIn();
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

/**
 * 开始时间小于结束时间
 * @param start
 * @param end
 * @returns {Boolean}
 */


var reg={
		// 整数或一位有效小数;
		fix1:function(str){
			return (/^((([1-9]+\d*)|\d+)(\.\d)?)$/.test(str));
		},
		// 整数或两们以内有效小数;
		fix2:function(str){
			return (/^((([1-9]+\d*)|\d+)(\.\d{1,2})?)$/.test(str));
		},
		// 小于十的整数或一位有效小数;
		less_ten:function(str){
			return (/^\d+(\.\d)?$/.test(str));
		},
		// 无特殊字符;
		not_chars:function(str){
			return (/^[\u4e00-\u9fa5\w\.]+$/.test(str));
		},
		// 纯数字;
		number:function(str){
			return (/^(([1-9]+\d*)|\d+)$/.test(str));
		}
	}

	function regTest(){
		var name=true, //卡券名称;
			vip_style=true, //卡券类型;
			card_num=true, //卡券数量;
			use_style=true; //使用类型;
		if(!reg.not_chars($("#couponsName").val())){
			alert("卡券名称不合法");
		}
		if($("input[name='crad_type']:checked").val()==0){
			if(!reg.fix2($("#vouchers").val())){
				alert("代金券面值不合法")
			}
		}else{
			if(!reg.fix1($("#discountCoupons").val())){
				alert("折扣券面值不合法")
			}
		};
		if($("input[name='limitCountNumType']:checked")==1){
			
			if(!reg.number($("#countNum").val())){
				alert("卡券数量不合法");
			}
		}
		if($("input[name='limitLowestConsumeType']:checked")==1){
			
			if(!reg.number($("#lowestConsume").val())){
				alert("消费限制不合法");
			}
		}

	}



function time_dif(start,end,fn){
	var end=end.substr(0,10);
	var start=start.substr(0,10);
	if((new Date(end+" 00:00:00").getTime()-new Date(start).getTime())<0){
		// 若结束日期小于开始日期,返回false;
		alert("开始时间不能大于结束时间");
		return false;
	}
	return true;
}


function time_dif_day(end,fn){
	var date=new Date();
		y=date.getFullYear();
		m=date.getMonth()+1;
		d=date.getDate();
		var end=end.substr(0,10);
	fn((new Date(end+" 00:00:00").getTime()-new Date(y+"-"+m+"-"+d+" 00:00:00").getTime())/1000/60/60/24);
}
	

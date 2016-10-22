//选择图片后确认进入编辑框中
var imagesNode = 0;
var htmls;
var pageIndex = 0;     //页索引
var pageSize = 10;    //每页显示的条数
var pageTotal = 0;
$(function(){
	

	/*// 点击发布时判断是否为空
	$(".ReleaseForm").click(function(){
	})
	$(".contentNameText").blur(function(){
		if( $(this).val() =="" || $(this).val()=="0"){
			 $(this).closest(".releaseNte-contentName").find(".user_info").css("visibility","visible");
			 return false;
		}else{
			$(this).closest(".releaseNte-contentName").find(".user_info").css("visibility","hidden");
		}
	})*/
	
	
	//绑定素材库框中的选择图片层的事件
	$("#imageFormat").on("click", "li",function() {
		
		if($(this).hasClass("on")){
			$("#"+$(this).attr("id")+"_mask").hide();
	        $(this).removeClass("on");
	    }else{
	    	if(addLogo && $("#imageFormat li.on").length>0) return false;
	    	$("#"+$(this).attr("id")+"_mask").show();
	        $(this).addClass("on");    
	    }
	 });
	
	//绑定编辑框中的删除按钮事件
	$(".goods_desc").on("click",".js_delete",function(e){
		
		
		$("#editWrp"+$(this).attr("id")).remove();
		$(".editWrp"+$(this).attr("id")).remove();
		eachs()
	});
	
	//绑定编辑框中的向上移动按钮事件
	$(".goods_desc").on("click",".js_up",function(e){
	
		//编辑框移动
		var $o = $("#editWrp"+$(this).attr("id"));
		var lastId = $o.prev().attr("id");
		$("#"+lastId).before($o);
		//提交数据移动
		var $i = $(".editWrp"+$(this).attr("id"));
		var $lasti = $("."+lastId);
		$i.insertBefore($lasti);
		
		eachs();
		
		return;
	});
	
	
	//绑定编辑框中的向上移动按钮事件
	$(".goods_desc").on("click",".js_down",function(e){
		
		//编辑框移动
		var $o = $("#editWrp"+$(this).attr("id"));
		var lastId = $o.next().attr("id");
		$o.insertAfter($("#"+lastId));
		 
		//提交数据移动
		var $i = $(".editWrp"+$(this).attr("id"));
		var $lasti = $("."+lastId);
		$i.insertAfter($lasti);
		eachs()
		
	});
	
	// 成功案例
	// 点击删除logo
	$(".success_case_top").on({
		"click":function(){
			var opsition = $(this).find(".success_case_logo_input").val();
			var opsition=$(this).closest("li").index()+1;
			delteSucc(opsition);
		}
	},".success_case_logo")
	//},".successDelete>img")

	

	 // 点击发布公告事件
	 $(".conditionsBtn").click(function(){
	 	$(this).closest(".announcemen-content").hide();
	 	$(this).closest(".announcemen-content").next(".releaseNte-content").show();
	 })

	 // 公告名称字数控制
	$("#noticeTitle2").keyup(function(){
		var commodityText = $(".contentNameText").val();
		var ommodityName = commodityText.length;
		$(".counter").text(20-ommodityName);
	})

	 
	// 添加文字
	$(".AddTextareaSure").on("click",function(){
		var length = parseInt($(".AddTextTextarea textarea").val().length);
//		if(length > 2000) {
//			alertInfo("输入文字超出最大限制", 3000);
//			return false;
//		}else if((parseInt($("#frm_tips_num").html()) - parseInt($("#CommoInfoText").val().length)) < 0) {
//			alertInfo("输入文字超出最大限制", 3000);
//			return false;
//		}
		var o = $("#.AddTextTextarea textarea").val();
		
		
		var html_ = "<p class='editWrp_"+imagesNode+"'>"+o+"</p>";
		//用于展示内容详情（不含操作）
		//$("#CommoInfoShow").append(html_);
		html_ = "<p>"+o+"</p>";
		appendHtml(html_);
		imagesNode++;
		
		
		$("#.AddTextTextarea textarea").val("");
//		$("#frm_tips_num").html(2000-parseInt($("#CommoInfo p").text().length));
		
		

		
	})
	
	
	// 添加图片	
	$(".addImg").on("click",function(){
		
		queryImageList();
		$('#Pop_layer').css('left', $(window).width() / 2 - ($('#Pop_layer').width() / 2))
	  	$('#Pop_layer').css('top', $(window).height() / 2 - ($('#Pop_layer').height() / 2))
		$(".Cover_layer").show();
		$("#Pop_layer").fadeIn();

	})
	$(".addImgSure").on("click",function(){
		selectImageVal();
	})
	$("#system_content_right").on("click",".create-next-imgs-left",function(){
		$(this).toggleClass("create-add-box");
		// var thisImages = $(".create-add-box").find("img").clone();
	})
	
	imagesNode = $("#CommoInfo img").length;
	eachs()
	
})


function onUpLoadImgMaterail() {
	//判断上传图片大小问题
	var f = document.getElementById("noticeFileToUpload").files;
	//上次修改时间  f[0].lastModifiedDate k名称  f[0].name 大小 字节  f[0].s	ize 类型  f[0].type
	var fileSize = 0;
	if(f!=null){
		fileSize = Math.round(f[0].size*100/(1024 * 1024))/100;
	}
	
    if(parseFloat(fileSize)>parseFloat(2.0)){
    	alertErrors("图片大小不能超过2M",2000);
    	return;
    }
    ajaxUploadImage('noticeFileToUpload');
}

//本地上传图片到素材库并添加到列表中
function ajaxUploadImage(fileId){
	var userId = $("#userId").val();
	var ajaxCallUrl = webRoot+"/material/method/uploadImage.do?&_t=" + new Date().getTime();
	$.ajaxFileUpload({
      url:ajaxCallUrl,  
      secureuri:false,  
      fileElementId:fileId,//file标签的id  
      dataType: 'json',//返回数据的类型  
      data:{userId:userId,type:1},//一同上传的数据  
      success: function (data) {
    	  
    	  if(!data.id){
    		  if(data.state=='7') {
    			  alertErrors("图片格式错误,限于JPG,JPEG,PNG,BMP格式",1500);
    			  return false;
    		  }
    		  alertErrors("图片上传失败,请刷新后重试",1500);
    	  }else{
    		  alertSuccess("图片上传成功!",1500);
    		  var html_ = "";
    		  html_ += "<li class='dialog_wrp_img_pop_con_li' id='"+data.id+"' title='"+data.imageUrl+"' ><a href='javascript:void(0)' class='dialog_wrp_img_pop_con_li_a'>";
    		  html_ += "<img class='dialog_wrp_img_pop_con_li_img' src='"+data.imageUrl+"' /></a>";
    		  html_ += "<p class='dialog_wrp_img_pop_con_li_p'>"+data.imageName+"</p>";
    		  html_ += "<div class='dialog_wrp_img_pop_con_li_mask' id='"+data.id+"_mask' style='display:none;'><div class='dialog_wrp_img_pop_con_li_inner'></div><div class='dialog_wrp_img_pop_con_li_icon'></div></div></li>";
    		  if($("#imageFormat li").length == 0) {
    			  $("#imageFormat").append(html_);
    		  }else{
    			  $("#imageFormat li:nth-child(1)").before(html_);        			  
    		  }
    			  
    	  }
    	  eachs()
      },  
      error: function (data, status, e) {
    	  alertErrors("图片上传失败",1500);
      }
  	});
}

function eachs(){
	$(".edit_wrp").each(function(i){
		$(this).attr("id","editWrp_"+i);
		$(this).find(".icon18_common").attr("id","_"+i);
	})
	
	$("#CommoInfoShow").html("");
	$("#CommoInfo p,#CommoInfo img").each(function(){
		$("#CommoInfoShow").append($(this).clone(true))
		
	})
	$("#CommoInfoShow *").each(function(i){
		$(this).attr("class","editWrp_"+i)
	})
	

	
	
}

//选中图片显示在页面
var addLogo=false;
function selectImageVal(){
	var $lis = $("#imageFormat li");
	if(addLogo){
		if($("#imageFormat li.on").length>0){
			$(".fileEnterImg").html("<img src='"+$("#imageFormat li.on").find(".dialog_wrp_img_pop_con_li_img").attr("src")+"'>")
		}
	}else{
		$lis.each(function(index){
			
			if($(this).hasClass("on")){
				var html_ = "<img src='"+$(this).attr("title")+"' width='450' class='editWrp_"+imagesNode+"' />";
				//用于最后存储数据的html
				$("#CommoInfoShow").append(html_);
				
				//添加进操作框中增添html
				html_ = "<img src='"+$(this).attr("title")+"' />";
				appendHtml(html_);
				//用作于编辑窗口的id设置
				imagesNode++;
			}
		});
	}
	addLogo=false;
	
}

//查询图片素材库中的多图片列表
var loadtimes = 0;
function queryImageList(){
	var userId = $("#userId").val();
	var data_ = {
			userId:userId,
			materialType:1
	};
	if(loadtimes>0){
		//取消选中效果
		var $lis = $("#imageFormat li");
		$lis.each(function(index){
			var id = $(this).attr("id");
			$("#"+id).removeClass("on");
			$("#"+id+"_mask").hide();
		});
		
		return;
	}else{
		$.ajax({
            type: "POST",
            url : webRoot+"/material/method/queryMaterialList.do",
            data:data_,
            dataType: "json",
            async: false,
			success: function(data){
				var html_ = "";
				for (var int = 0; int < data.length; int++) {
					html_ += "<li class='dialog_wrp_img_pop_con_li' id='"+data[int].id+"' title='"+data[int].imageUrl+"' ><a href='javascript:void(0)' class='dialog_wrp_img_pop_con_li_a'>";
					html_ += "<img class='dialog_wrp_img_pop_con_li_img' src='"+data[int].imageUrl+"' /></a>";
					html_ += "<p class='dialog_wrp_img_pop_con_li_p'>"+data[int].imageName+"</p>";
					html_ += "<div class='dialog_wrp_img_pop_con_li_mask' id='"+data[int].id+"_mask' style='display:none;'><div class='dialog_wrp_img_pop_con_li_inner'></div><div class='dialog_wrp_img_pop_con_li_icon'></div></div></li>";	
				}
 				$("#imageFormat").html(html_);
 				loadtimes++;
 				eachs()
			},
        });
	}
}

//添加选择的图片进入编辑窗
function appendHtml(o){
	$(".edit_wrp").each(function(i){
		$(this).attr("id","editWrp_"+i);
	})
	var imagesNode=$(".edit_wrp").length;
	var html_ = "<div class='edit_wrp' id='editWrp_"+imagesNode+"'>";
	html_ += o;
	html_ += "<div class='edit_mask'><span class='vm_box'></span>";
	html_ += 
		"<a href='javascript:void(0);' id='_"+imagesNode+"' class='icon18_common up_gray js_up'>up</a>"+
  		"<a href='javascript:void(0);' id='_"+imagesNode+"' class='icon18_common down_gray js_down'>down</a>"+
  		"<a href='javascript:void(0);' id='_"+imagesNode+"' class='icon18_common del_gray js_delete'></a>";
  	html_ += "</div></div>";
	$("#CommoInfo").append(html_);

	$("#CommoInfoShow").html("");
	$("#CommoInfo p,#CommoInfo img").each(function(){
		$("#CommoInfoShow").append($(this).clone(true))
		
	})
	
}

function saveOrUpdateNoticeMessage(){
	var CommoInfoShow = $("#CommoInfoShow").html();
	var editCommoInfo = $("#CommoInfo").html();
	var noticeTitle = $("#noticeTitle2").val();
	var titleImg = $(".fileEnterImg img").attr("src");
//	var isHighlight =$('.contentBright input:radio[name="isHighlight"]:checked').val();
	var noticeLevel =$('.contentBright input[name="noticeLevel"]:checked').val();
	var vals;
	var htmls="";
	$(".contentNameRight p").each(function(){
		console.log($(this).html());
		console.log($(this).html().replace(/\s*/g,"")!="");
		if($(this).html().replace(/\s*/g,"")!=""){
			vals=$(this).html();
			var lens=vals.length>20?20:vals.lengh;
			htmls=$(this).html().substring(0,lens);
			return false;
		}
	})
	var noticeCummary = htmls ;
	var sysNoticeId = $("#sysNoticeId").val();
	var operId = $("#userId").val(); 
	if( noticeTitle =="" || noticeTitle.length==0){
		 $(".contentNameText").closest(".releaseNte-contentName").find(".user_info").css("visibility","visible");
		return;
	}else{
		$(".contentNameText").closest(".releaseNte-contentName").find(".user_info").css("visibility","hidden");
	}
	if( $(".fileEnterImg").html() ==""){
		$(".fileEnterImg").closest(".contentNameRight").find(".user_info").css("visibility","visible");
		return;
	}else{
		$(".fileEnterImg").closest(".contentNameRight").find(".user_info").css("visibility","hidden");
	}
	if (CommoInfoShow==""||CommoInfoShow.length==0 ) {
		$(".goods_desc").closest(".contentNameRight").find(".user_info").css("visibility","visible");
		return;
	}else{
		$(".goods_desc").closest(".contentNameRight").find(".user_info").css("visibility","hidden");
	}
 	if(CommoInfoShow.length > 5000) {
		alertInfo("图文详情不能超过5000字符", 2000);
		return;
	}
	$.ajax({
        type: "POST",
        url : webRoot+"/sysNotice/method/saveSysNotice.do",
        data:{
        	id:sysNoticeId,
        	operId:operId,
        	noticeTitle:noticeTitle,
        	noticeContent:CommoInfoShow,
        	edit_noticeContent:editCommoInfo,
        	titleImgUrl:titleImg,
//        	isHighlight:isHighlight,
        	noticeCummary:noticeCummary,
        	noticeLevel:noticeLevel,
        },
        dataType: "json",
		success: function(data){
			if(data.msgCode == '1') {
				alertSuccess(data.msg, 2000);
				loadSysNotice(0)
				$(".announcemen-content").show();
			 	$(".announcemen-content").next(".releaseNte-content").hide();
			 	clear();
			 	allNoticePageSize();
			 	
			}else{
				alertErrors("提交失败，请刷新再试", 3000);
			}
		},
    }); 
}

function clear(){
	$("#CommoInfoShow").html("");
	$("#CommoInfo").html("");
	$("#noticeTitle2").val("");
	$(".fileEnterImg").html("");
}

//公告详情展示
function showNoticeDetail(sysNoticeId){
	var url_ = webRoot + "/sysNotice/method/showNoticeDetail.do";
	var data = {
			sysNoticeId:sysNoticeId,
	}
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		url : url_,
		data : data,
		success : function(data) {
			
			if(data.msgCode!='0'){
				$("#CommoInfoShow").html(data.noticeContent);
				$("#title").html(data.noticeTitle);
				$("#operName").html(data.operName);
				$("#time").html(data.updateDate);
			}else{
				alertErrors("操作失败，请刷新再试", 3000);
			}
		},
		error : function(e) {

		}
	});
	$(".announcemen-content").hide();
 	$(".announcemen-content").siblings(".systemDetails").show();
}

//获取总页数
function allNoticePageSize() {
	var title = jsTrim($("#noticeTitle1").val());
	$("#noticeTitle1").val(title);
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var url_ = webRoot + "/sysNotice/method/allSysNoticePageSize.do?startDate=" +startDate+ "&endDate="+endDate+"&current_date=" + new Date().getTime();
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		url : url_,
		data : $('#topSearch').serialize(),
		success : function(data) {
			pageTotal = data;
				//获取总页数后 初始化控件分页取数据--ajax分页方法
			initPagination("Pagination",pageTotal,pageSize,"loadSysNotice");
		},
		error : function(e) {
			alertErrors("操作失败，请刷新再试", 3000);
		}
	});
}



function loadSysNotice(pageIndex) {
	var title = jsTrim($("#noticeTitle1").val());
	$("#noticeTitle1").val(title);
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var url_ = webRoot + "/sysNotice/method/findAllSysNotice.do?startDate=" +startDate+ 
																"&endDate="+endDate+
																"&pageIndex="+pageIndex+
																"&pageSize="+pageSize+
																"&current_date=" + new Date().getTime();
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		url : url_,
		data : $('#topSearch').serialize(),
		success : function(data) {
				$("#ContextList").setTemplateElement("SysNoticeConfig-List");
				$("#ContextList").processTemplate(data);
		},
		error : function(e) {
			alertErrors("操作失败，请刷新再试", 3000);
		}
	});
}

//绑定删除确认事件
function openNoticeDel(divId,noticeId){
	$("#delNotice").unbind("click");
	$("#delNotice").click(function(){
		deleteSysNotice(noticeId);
	});
	
}

//删除系统公告
function deleteSysNotice(sysNoticeId){
		
	var url_ = webRoot + "/sysNotice/method/delteSysNoticeState.do";
	var data = {
			sysNoticeId:sysNoticeId
	}
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		url : url_,
		data : data,
		success : function(data) {
			alertSuccess(data.msg, 2000);
			allNoticePageSize();
		},
		error : function(e) {

		}
	});
}

//编辑系统公告
function updateNoticeDetail(sysNoticeId){
	var url_ = webRoot + "/sysNotice/method/showNoticeDetail.do";
	var data = {
			sysNoticeId:sysNoticeId,
	}
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		url : url_,
		data : data,
		success : function(data) {
				$("#CommoInfoShow").html(data.noticeContent);
				$("#CommoInfo").html(data.edit_noticeContent);
				$(".fileEnterImg").html("<img src="+data.titleImgUrl+">");
				$("#noticeTitle2").val(data.noticeTitle);
				var commodityText = $(".contentNameText").val();
				var ommodityName = commodityText.length;
				$(".counter").text(20-ommodityName);
				$('.contentBright input:radio[name="isHighlight"]:checked').val(data.isHighLight);
				$('.contentBright input[name="noticeLevel"]:checked').val(data.noticeLevel);
		},
		error : function(e) {

		}
	});
	$(".announcemen-content").hide();
	$(".announcemen-content").siblings(".releaseNte-content").show();
	$("#sysNoticeId").val(sysNoticeId);
	
}
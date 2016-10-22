<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/system_announcemen.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/system-release.css" />
<script type="text/javascript" src="${path}/resources/js/util/formReg.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品属性</title>
</head>  
<body>
		<!-- 右边内容区start -->
		<div class="system_content_right_top">
				<!-- 内容区 -->
				<div class="categoryContent">
					<div class="announcemen-content-top">属性管理</div>
					<div class="announcemen-content-conditions" >
						<div class="attributeContent">
							<div class="attributeList">
								<div class="">属性列表</div>
								<div class="attributeValue">属性值列表</div>
							</div>
							<table class="category-table">
								<thead>
									<tr>
										<td sign="attr">
											<input type="text" class="goods_type_search" placeholder="请输入名称"/>
											<div class="category-table-topAdd " popName="attrAdd"><span>添加</span></div>
											<div class="category-table-topDelete " popName="attrDelete"><span>删除</span></div>
										</td>
										<td sign="attrVal">
											<input type="text" class="goods_type_search" placeholder="请输入名称"/>
											<div class="category-table-topAdd " popName="attrValAdd"><span>添加</span></div>
											<div class="category-table-topDelete" popName="attrValDelete"><span>删除</span></div>
										</td>
									</tr>
								</thead>
								<tr>
									<td>
										<div class="category-scroll categoryTrOne">
											<ol id="attrList">
												
											</ol>
										</div>
									</td>
									<td class="createTdCow1">
										<div class="category-scroll  categoryTrTwo" >
											<ol class="theOl" id="attrValList">
												
											</ol>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			<!-- 内容区end -->
			<!-- 添加类目 弹出框start -->
			<div class="Pop_layer" popName=attrAdd id="attrAdd" style="display: none;" >
               <div class="Pop_layer_box" style="width: 500px;">
                   <div class="pop_layer_title">
                       <span class="pop_layer_title_span" id="AddAttrPop">添加属性</span>
                       <span class="pop_layer_title_span_close">
                           <a class="pop_layer_title_span_close_a click_close_id" popName="attrAdd"  href="javascript:void(0);"></a>
                       </span>
                   </div>
                   <div class="new_member_pop" style="width: 500px;">            
                       <div class="new_member_pop_box">	                            
                       	<div class="successSelect">
                       		<span id="attrTitle">属性名称：</span>
                       		<input type="text" id="attrName">
                       	</div>
                       <div class="clear"></div>
                       </div>
                   </div>
                   <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
                       <a class="perfect_information_pop_button_sure click_close_id AddCategorySureOne" popName="attrAdd" id="addAttr" href="javascript:void(0); ">确定</a>
                       <a class="perfect_information_pop_button_cancel click_close_id"  popName="attrAdd" href="javascript:void(0);">取消</a>
                   </div>
               </div>
           </div>
			<!-- 添加类目 弹出框end -->
			
			<!-- 删除类目弹出框start -->
			<div class="Pop_layer"  popName="attrDelete" id="attrDelete"  style="display:none;">
               <div class="latest_activity_pop">
                   <div class="latest_activity_pop_close">
                       <a class="latest_activity_pop_close_a  click_close_id"  popName="attrDelete"  href="javascript:void(0);"></a>
                   </div>
                   <div class="latest_activity_pop_con">
                       <div class="latest_activity_pop_con_t" id="DelAttrPop"> 删除属性
                       </div>
                       <div class="latest_activity_pop_con_c" style="text-align:center;">确认要删除<span id="attrNameS"></span>？
                       </div>
                   </div>
                   <div class="latest_activity_pop_btn">
                       <a class="latest_activity_pop_btn_follow click_close_id deleteBtn" popName="attrDelete" id="delAttr" href="javascript:void(0);">确认</a>
                       <a class="latest_activity_pop_btn_no click_close_id" popName="attrDelete" href="javascript:void(0);">取消</a>
                   </div>
               </div>
           </div>
			<!-- 删除类目弹出框end -->
		</div>
	
	<div class="clear"></div>
	<!-- 右边内容区end -->
		
		
	<script>
		var attrId_global = "";
		$(function(){
			getAttrList('','');
			$(".goods_type_search").keyup(function(){
				var pinyingChar = '';
				var attr = '';
				var sign = $(this).parent().attr("sign");
				var searchName = $(this).val();
				if(formReg.englishReg(searchName)){
					pinyingChar = searchName.toLowerCase();
				}else{
					catName = searchName;
				}
				if(sign == "attr"){					
					$(".category-table").find("td:nth-child(2)").css("visibility","hidden");
					$(".attributeValue").hide();
					getAttrList(attr,pinyingChar);
				}else if(sign == "attrVal"){
					var attrId = "";
		    		$("#attrList li").each(function(){
		    			if($(this).hasClass("addBG")){
		    				attrId = $(this).attr("attrId");
		    				attrId_global = attrId;
		    			}
		    		});
		    		if(attrId == ""){
		    			alertErrors("请先选中查询属性",1500);
		    			return;
		    		}
					getAttrValList(attrId,attr,pinyingChar);
				}
				
			});
			
			$("body").children().off("click","#attrList li");
			$("body").children().on("click","#attrList li", function(){
				$(this).addClass("addBG");
				$(this).siblings("li").removeClass("addBG");
				var attrId = $(this).attr("attrId");
				attrId_global = attrId;
				$(".category-table").find("td:nth-child(2)").css("visibility","visible");
				$(".attributeValue").show();
				getAttrValList(attrId,'','');
				
			});
			
			$("body").children().off("click","#attrValList li");
			$("body").children().on("click","#attrValList li", function(){
				$(this).addClass("addBG");
				$(this).siblings("li").removeClass("addBG");
			});
			
			//添加属性、属性值
		    $(".category-table-topAdd").click(function(){
		    	var sign = $(this).parent().attr("sign");
		    	if(sign == "attr"){		    		
			    	openAttrAdd("attrAdd");
		    	}else if(sign == "attrVal"){
		    		var attrId = "";
		    		$("#attrList li").each(function(){
		    			if($(this).hasClass("addBG")){
		    				attrId = $(this).attr("attrId");
		    				attrId_global = attrId;
		    			}
		    		});
		    		if(attrId == ""){
		    			alertErrors("请先选中添加属性",1500);
		    			return;
		    		}
		    		openAttrValAdd("attrAdd");
		    	}
		    });
			
		 	//删除属性、属性值
		    $(".category-table-topDelete").click(function(){
		    	var sign = $(this).parent().attr("sign");
		    	var attrName = "";
		    	var attrId = "";
		    	if(sign == "attr"){
		    		$("#attrList li").each(function(){
			    		if($(this).hasClass("addBG")){
			    			attrName = $(this).html();
			    			attrId = $(this).attr("attrId");
			    		}
			    	});
		    		if(attrId == ""){
		    			alertErrors("请先选中删除属性名",1500);
		    			return;
		    		}
		    	}else if(sign == "attrVal"){
		    		$("#attrValList li").each(function(){
			    		if($(this).hasClass("addBG")){
			    			attrName = $(this).html();
			    			attrId = $(this).attr("attrValId");
			    		}
			    	});
		    		if(attrId == ""){
		    			alertErrors("请先选中删除属性值",1500);
		    			return;
		    		}
		    	}
		    	openAttrDel("attrDelete",sign,attrName,attrId);
		    	
		    });
		});
		
		
		function openAttrAdd(divId){
			$("#AddAttrPop").html("添加属性");
			$("#attrTitle").html("属性名称：");
			$("#attrName").val("");
			click_open(divId);
			$("#addAttr").unbind("click");
			$("#attrName").unbind("keyup");
			$("#addAttr").click(function (){
				addAttr();
			});
			$("#attrName").keyup(function(e){
			  	if(e.which == 13){
			  		addAttr();
			  	}
			});
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId))
		}
		
		function openAttrValAdd(divId){
			$("#AddAttrPop").html("添加属性值");
			$("#attrTitle").html("属性值：");
			$("#attrName").val("");
			click_open(divId);
			$("#addAttr").unbind("click");
			$("#attrName").unbind("keyup");
			$("#addAttr").click(function (){
				addAttrVal();
			});
			$("#attrName").keyup(function(e){
			  	if(e.which == 13){
			  		addAttrVal();
			  	}
			});
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId))
		}
		
		function openAttrDel(divId,sign,attrName,attrId){
			click_open(divId);
			$("#delAttr").unbind("click");
			if(sign=="attr"){
				$("#DelAttrPop").html("删除属性");
				$("#attrNameS").html("&nbsp属性"+attrName);
				$("#delAttr").click(function (){
					deleteAttr(attrId);
				});
			}else if(sign=="attrVal"){
				$("#DelAttrPop").html("删除属性值");
				$("#attrNameS").html("属性值&nbsp"+attrName);
				$("#delAttr").click(function (){
					deleteAttrVal(attrId);
				});
			}
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId));
		}
		
		function getAttrList(attrVal,pinyingChar){
			alertLoading("数据正在操作,请稍后...", 15000);
			var url_ = webRoot + "/page/GoodsAttr/attrList.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	attrVal:attrVal,
		        	pinyingChar:pinyingChar
		        },
		        dataType: "json",
		        success: function(result){
		        	alertHide();
		        	var msgCode = result.msgCode;
		        	var data = result.data;
		        	if(msgCode == 0){
		        		$str = '';
		        		if(data!=null && data.length > 0){		        			
			        		for(var i=0; i<data.length; i++){
			        			$str += '<li attrId="'+data[i].id+'">'+data[i].attrVal+'</li>'
			        		}
		        		}
		        	}
		            $('#attrList').html($str);
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		function getAttrValList(attrId,attrVal,pinyingChar){
			alertLoading("数据正在操作,请稍后...", 5000);
			var url_ = webRoot + "/page/GoodsAttr/attrValList.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	attrId:attrId,
		        	attrValueVal:attrVal,
		        	pinyingChar:pinyingChar
		        },
		        dataType: "json",
		        success: function(result){
		        	alertHide();
		        	var msgCode = result.msgCode;
		        	var data = result.data;
		        	if(msgCode == 0){
		        		$str = '';
		        		if(data!=null && data.length > 0){		        			
			        		for(var i=0; i<data.length; i++){
			        			$str += '<li attrValId="'+data[i].id+'">'+data[i].attrValueVal+'</li>'
			        		}
		        		}
		        	}
		            $('#attrValList').html($str);
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		function addAttr(){
			var attrVal = $("#attrName").val();
			if(attrVal == ""){
				alertErrors("属性名不能为空",1500);
				return;
			}
			$("#addAttr").unbind("click");
			$("#attrName").unbind("keyup");
			var url_ = webRoot + "/page/GoodsAttr/addAttr.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	attrVal:attrVal
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("添加成功",1500);	
		        	}else if(msgCode == 10006){
		        		alertSuccess("已存在该属性名",1500);
		        	}else{
		        		alertErrors("添加失败",1500);
		        	}
		        	click_close("attrAdd");
		        	getAttrList('','');
		         },
		         error:function(){
					alertErrors("添加失败",1500);
					$("#addAttr").click(function(){
						addAttr();
					});
					$("#attrName").keyup(function(e){
					  	if(e.which == 13){
					  		addAttr();
					  	}
					});
				}
		    });
		}
		
		function addAttrVal(){
			var attrVal = $("#attrName").val();
			if(attrVal == ""){
				alertErrors("属性值不能为空",1500);
				return;
			}
			$("#addAttr").unbind("click");
			$("#attrName").unbind("keyup");
			var url_ = webRoot + "/page/GoodsAttr/addAttrVal.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	attrId:attrId_global,
		        	attrValueVal:attrVal
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("添加成功",1500);	
		        	}else if(msgCode == 10006){
		        		alertSuccess("已存在该属性值",1500);
		        	}else{
		        		alertErrors("添加失败",1500);
		        	}
		        	click_close("attrAdd");
		        	getAttrValList(attrId_global,'','');
		         },
		         error:function(){
					alertErrors("添加失败",1500);
					$("#addAttr").click(function(){
						addAttrVal();
					});
					$("#attrName").keyup(function(e){
					  	if(e.which == 13){
					  		addAttrVal();
					  	}
					});
				}
		    });
		}
		
		function deleteAttr(attrId){
			$("#delAttr").unbind("click");
			var url_ = webRoot + "/page/GoodsAttr/deleteAttr.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	id:attrId
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("删除成功",1500);	
		        	}else if(msgCode == 10002){
		        		alertErrors("存在关联，需先删除关联",1500);
		        	}else{
		        		alertErrors("删除失败",1500);
		        	}
		        	click_close("attrDelete");
		        	getAttrList('','');
		        	$('#attrValList').html("");
		         },
		         error:function(){
					alertErrors("删除失败",1500);
					$("#delAttr").click(function(){
						deleteAttr(attrId);
					});
				}
		    });
		}
		
		function deleteAttrVal(attrValId){	
			$("#delAttr").unbind("click");
			var url_ = webRoot + "/page/GoodsAttr/deleteAttrVal.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	id:attrValId
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("删除成功",1500);	
		        	}else{
		        		alertErrors("删除失败",1500);
		        	}
		        	click_close("attrDelete");
		        	getAttrValList(attrId_global,'','');
		         },
		         error:function(){
					alertErrors("删除失败",1500);
					$("#delAttr").click(function(){
						deleteAttrVal(attrValId);
					});
				}
		    });
		}
	</script>

</body>
</html>
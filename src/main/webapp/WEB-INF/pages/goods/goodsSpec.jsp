<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/system_announcemen.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/system-release.css" />
<script type="text/javascript" src="${path}/resources/js/util/formReg.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品规格</title>
</head>  
<body>
		<!-- 右边内容区start -->
		<div class="system_content_right_top">
				<!-- 内容区 -->
				<div class="categoryContent">
					<div class="announcemen-content-top">规格管理</div>
					<div class="announcemen-content-conditions" >
						<div class="attributeContent">
							<div class="attributeList">
								<div class="">规格列表</div>
								<div class="attributeValue">规格值列表</div>
							</div>
							<table class="category-table">
								<thead>
									<tr>
										<td sign="spec">
											<input type="text" class="goods_type_search" placeholder="请输入名称"/>
											<div class="category-table-topAdd " popName="specAdd"><span>添加</span></div>
											<div class="category-table-topDelete" popName="specDelete"><span>删除</span></div>
										</td>
										<td sign="specVal">
											<input type="text" class="goods_type_search" placeholder="请输入名称"/>
											<div class="category-table-topAdd" popName="specValAdd"><span>添加</span></div>
											<div class="category-table-topDelete" popName="specValDelete"><span>删除</span></div>
										</td>
									</tr>
								</thead>
								<tr>
									<td>
										<div class="category-scroll categoryTrOne">
											<ol id="specList">
												
											</ol>
										</div>
									</td>
									<td class="createTdCow1">
										<div class="category-scroll  categoryTrTwo" >
											<ol class="theOl" id="specValList">
												
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
			<div class="Pop_layer" popName=specAdd id="specAdd" style="display: none;" >
               <div class="Pop_layer_box" style="width: 500px;">
                   <div class="pop_layer_title">
                       <span class="pop_layer_title_span" id="AddSpecPop">添加规格</span>
                       <span class="pop_layer_title_span_close">
                           <a class="pop_layer_title_span_close_a click_close_id" popName="specAdd"  href="javascript:void(0);"></a>
                       </span>
                   </div>
                   <div class="new_member_pop" style="width: 500px;">            
                       <div class="new_member_pop_box">	                            
                       	<div class="successSelect">
                       		<span id="specTitle">规格名称：</span>
                       		<input type="text" id="specName">
                       	</div>
                       <div class="clear"></div>
                       </div>
                   </div>
                   <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
                       <a class="perfect_information_pop_button_sure click_close_id AddCategorySureOne" popName="specAdd" id="addSpec" href="javascript:void(0); ">确定</a>
                       <a class="perfect_information_pop_button_cancel click_close_id"  popName="specAdd" href="javascript:void(0);">取消</a>
                   </div>
               </div>
           </div>
			<!-- 添加类目 弹出框end -->
			
			<!-- 删除类目弹出框start -->
			<div class="Pop_layer"  popName="specDelete" id="specDelete"  style="display:none;">
               <div class="latest_activity_pop">
                   <div class="latest_activity_pop_close">
                       <a class="latest_activity_pop_close_a  click_close_id"  popName="specDelete"  href="javascript:void(0);"></a>
                   </div>
                   <div class="latest_activity_pop_con">
                       <div class="latest_activity_pop_con_t" id="DelSpecPop"> 删除规格
                       </div>
                       <div class="latest_activity_pop_con_c" style="text-align:center;">确认要删除<span id="specNameS"></span>？
                       </div>
                   </div>
                   <div class="latest_activity_pop_btn">
                       <a class="latest_activity_pop_btn_follow click_close_id deleteBtn" popName="specDelete" id="delSpec" href="javascript:void(0);">确认</a>
                       <a class="latest_activity_pop_btn_no click_close_id" popName="specDelete" href="javascript:void(0);">取消</a>
                   </div>
               </div>
           </div>
			<!-- 删除类目弹出框end -->
		</div>
	
	<div class="clear"></div>
	<!-- 右边内容区end -->
		
		
	<script>
		var specId_global = "";
		$(function(){
			getSpecList('','');
			$(".goods_type_search").keyup(function(){
				var pinyingChar = '';
				var spec = '';
				var sign = $(this).parent().attr("sign");
				var searchName = $(this).val();
				if(formReg.englishReg(searchName)){
					pinyingChar = searchName.toLowerCase();
				}else{
					catName = searchName;
				}
				if(sign == "spec"){			
					$(".category-table").find("td:nth-child(2)").css("visibility","hidden");
					$(".attributeValue").hide();
					getSpecList(spec,pinyingChar);
				}else if(sign == "specVal"){
					var specId = "";
		    		$("#specList li").each(function(){
		    			if($(this).hasClass("addBG")){
		    				specId = $(this).attr("specId");
		    				specId_global = specId;
		    			}
		    		});
		    		if(specId == ""){
		    			alertErrors("请先选中查询规格",1500);
		    			return;
		    		}
					getSpecValList(specId,spec,pinyingChar);
				}
				
			});
			
			$("body").children().off("click","#specList li");
			$("body").children().on("click","#specList li", function(){
				$(this).addClass("addBG");
				$(this).siblings("li").removeClass("addBG");
				var specId = $(this).attr("specId");
				specId_global = specId;
				$(".category-table").find("td:nth-child(2)").css("visibility","visible");
				$(".attributeValue").show();
				getSpecValList(specId,'','');
				
			});
			
			$("body").children().off("click","#specValList li");
			$("body").children().on("click","#specValList li", function(){
				$(this).addClass("addBG");
				$(this).siblings("li").removeClass("addBG");
			});
			
			//添加规格、规格值
		    $(".category-table-topAdd").click(function(){
		    	var sign = $(this).parent().attr("sign");
		    	if(sign == "spec"){		    		
			    	openSpecAdd("specAdd");
		    	}else if(sign == "specVal"){
		    		var specId = "";
		    		$("#specList li").each(function(){
		    			if($(this).hasClass("addBG")){
		    				specId = $(this).attr("specId");
		    				specId_global = specId;
		    			}
		    		});
		    		if(specId == ""){
		    			alertErrors("请先选中添加规格",1500);
		    			return;
		    		}
		    		openSpecValAdd("specAdd");
		    	}
		    });
			
		 	//删除规格、规格值
		    $(".category-table-topDelete").click(function(){
		    	var sign = $(this).parent().attr("sign");
		    	var specName = "";
		    	var specId = "";
		    	if(sign == "spec"){
		    		$("#specList li").each(function(){
			    		if($(this).hasClass("addBG")){
			    			specName = $(this).html();
			    			specId = $(this).attr("specId");
			    		}
			    	});
		    		if(specId == ""){
		    			alertErrors("请先选中删除规格名",1500);
		    			return;
		    		}
		    	}else if(sign == "specVal"){
		    		$("#specValList li").each(function(){
			    		if($(this).hasClass("addBG")){
			    			specName = $(this).html();
			    			specId = $(this).attr("specValId");
			    		}
			    	});
		    		if(specId == ""){
		    			alertErrors("请先选中删除规格值",1500);
		    			return;
		    		}
		    	}
		    	openSpecDel("specDelete",sign,specName,specId);
		    	
		    });
		});
		
		
		function openSpecAdd(divId){
			$("#AddSpecPop").html("添加规格");
			$("#specTitle").html("规格名称：");
			$("#specName").val("");
			click_open(divId);
			$("#addSpec").unbind("click");
			$("#specName").unbind("keyup");
			$("#addSpec").click(function (){
				addSpec();
			});
			$("#specName").keyup(function(e){
			  	if(e.which == 13){
			  		addAttr();
			  	}
			});
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId))
		}
		
		function openSpecValAdd(divId){
			$("#AddSpecPop").html("添加规格值");
			$("#specTitle").html("规格值：");
			$("#specName").val("");
			click_open(divId);
			$("#addSpec").unbind("click");
			$("#specName").unbind("keyup");
			$("#addSpec").click(function (){
				addSpecVal();
			});
			$("#specName").keyup(function(e){
			  	if(e.which == 13){
			  		addSpecVal();
			  	}
			});
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId))
		}
		
		function openSpecDel(divId,sign,specName,specId){
			click_open(divId);
			$("#delSpec").unbind("click");
			if(sign=="spec"){
				$("#DelSpecPop").html("删除规格");
				$("#specNameS").html("规格&nbsp"+specName);
				$("#delSpec").click(function (){
					deleteSpec(specId);
				});
			}else if(sign=="specVal"){
				$("#DelSpecPop").html("删除规格值");
				$("#specNameS").html("规格值&nbsp"+specName)
				$("#delSpec").click(function (){
					deleteSpecVal(specId);
				});
			}
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId));
		}
		
		function getSpecList(specVal,pinyingChar){
			alertLoading("数据正在操作,请稍后...", 15000);
			var url_ = webRoot + "/page/GoodsSpec/specList.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	specVal:specVal,
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
			        			$str += '<li specId="'+data[i].id+'">'+data[i].specVal+'</li>'
			        		}
		        		}
		        	}
		            $('#specList').html($str);
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		function getSpecValList(specId,specVal,pinyingChar){
			alertLoading("数据正在操作,请稍后...", 5000);
			var url_ = webRoot + "/page/GoodsSpec/specValList.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	specId:specId,
		        	specValueVal:specVal,
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
			        			$str += '<li specValId="'+data[i].id+'">'+data[i].specValueVal+'</li>'
			        		}
		        		}
		        	}
		            $('#specValList').html($str);
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		function addSpec(){
			var specVal = $("#specName").val();
			if(specVal == ""){
				alertErrors("规格名不能为空",1500);
				return;
			}
			$("#addSpec").unbind("click");
			$("#specName").unbind("keyup");
			var url_ = webRoot + "/page/GoodsSpec/addSpec.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	specVal:specVal
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("添加成功",1500);	
		        	}else if(msgCode == 10006){
		        		alertSuccess("已存在该规格名",1500);
		        	}else{
		        		alertErrors("添加失败",1500);
		        	}
		        	click_close("specAdd");
		        	getSpecList('','');
		         },
		         error:function(){
					alertErrors("添加失败",1500);
					$("#addSpec").click(function(){
						addSpec();
					});
					$("#specName").keyup(function(e){
					  	if(e.which == 13){
					  		addSpec();
					  	}
					});
				}
		    });
		}
		
		function addSpecVal(){
			var specVal = $("#specName").val();
			if(specVal == ""){
				alertErrors("规格值不能为空",1500);
				return;
			}
			$("#addSpec").unbind("click");
			$("#specName").unbind("keyup");
			var url_ = webRoot + "/page/GoodsSpec/addSpecVal.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	specId:specId_global,
		        	specValueVal:specVal
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("添加成功",1500);	
		        	}else if(msgCode == 10006){
		        		alertSuccess("已存在该规格值",1500);
		        	}else{
		        		alertErrors("添加失败",1500);
		        	}
		        	click_close("specAdd");
		        	getSpecValList(specId_global,'','');
		         },
		         error:function(){
					alertErrors("添加失败",1500);
					$("#addSpec").click(function(){
						addSpecVal();
					});
					$("#specName").keyup(function(e){
					  	if(e.which == 13){
					  		addSpecVal();
					  	}
					});
				}
		    });
		}
		
		function deleteSpec(specId){
			$("#delSpec").unbind("click");
			var url_ = webRoot + "/page/GoodsSpec/deleteSpec.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	id:specId
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
		        	click_close("specDelete");
		        	getSpecList('','');
		        	$('#specValList').html("");
		         },
		         error:function(){
					alertErrors("删除失败",1500);
					$("#delSpec").click(function(){
						deleteSpec(specId);
					});
				}
		    });
		}
		
		function deleteSpecVal(specValId){	
			$("#delSpec").unbind("click");
			var url_ = webRoot + "/page/GoodsSpec/deleteSpecVal.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	id:specValId
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("删除成功",1500);	
		        	}else{
		        		alertErrors("删除失败",1500);
		        	}
		        	click_close("specDelete");
		        	getSpecValList(specId_global,'','');
		         },
		         error:function(){
					alertErrors("删除失败",1500);
					$("#delSpec").click(function(){
						deleteSpecVal(specValId);
					});
				}
		    });
		}
	</script>

</body>
</html>
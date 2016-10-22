<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/system_announcemen.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/system-release.css" />
<script type="text/javascript" src="${path}/resources/js/util/formReg.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>类目与商品属性关联</title>
</head>  
<body>
		<!-- 右边内容区start -->
			<div class="system_content_right_top">
					<!-- 内容区 -->
					<div class="categoryContent">
						<div class="announcemen-content-top">类目与商品属性关联</div>
						<div class="announcemen-content-conditions" >
							<div class="brandContent">
								<table class="brandContenthead">
									<tr>
										<td>类目列表</td>
										<td>已有属性列表</td>
										<td>属性值列表</td>
									</tr>
								</table>
								<table class="category-table">
									<thead>
										<tr>
											<td class="categoryTd">
												<input type="text" class="goods_type_search seachCatName" placeholder="请输入名称" style="width: 70%; margin: 7px 0;" />
												<div class="system_search" id="category_search" style="display:none">
													
												</div>
											</td>
											<td>
												<input type="text" class="goods_type_search seachAttrName" placeholder="请输入名称"/>
												<div class="category-table-topAdd" popName="AddCatAttr"><span>添加</span></div>
												<div class="category-table-topDelete" popName="DeleteCatAttr"><span>删除</span></div>
											</td>
											<td>												
											</td>
										</tr>
									</thead>
									<tr>
										<td>
											<div class="category-scroll" id="categorylist">
												
											</div>
										</td>
										<td class="createTdCow1">
											<div class="category-scroll" >
												<ol class="theOl" id="attrlist">
												
												</ol>
												
											</div>
										</td>
										<td class="createTdCow2">
											<div class="category-scroll">
												<ol id="attrVallist">
												
												</ol>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- 内容区end -->
					<!-- 添加属性列表有数据 弹出框end -->
					<!-- 添加属性列表 无数据弹出框start -->
					<div class="Pop_layer" popName="AddCatAttr"  id="AddCatAttr" style="display: none;" >
	                <div class="Pop_layer_box" style="width: 600px;">
	                    <div class="pop_layer_title">
	                        <span class="pop_layer_title_span">添加类目属性</span>
	                        <span class="pop_layer_title_span_close">
	                            <a class="pop_layer_title_span_close_a click_close_id" popName="AddCatAttr"  href="javascript:void(0);"></a>
	                        </span>
	                    </div>
	                    <div class="new_member_pop" style="width: 600px;">            
	                        <div class="new_member_pop_box">	                            
	                        	<table class="category-table" style="width: 60%;height: 250px;">
									<thead>
										<tr>
											<td>
												<input type="text" class="goods_type_search seachAttr" placeholder="请输入名称" style="width: 70%;";/>
											</td>
										</tr>
									</thead>
									<tr>
										<td>
											<div class="category-scroll" id="attrAllList" style="height:200px ">
												
											</div>

										</td>
									</tr>
								</table>
								<div style="margin:10px auto;text-align: center;color:#04b0f7;margin-bottom: 40px;">你已选中<span id="attrcount">0</span>项</div>
	                        <div class="clear"></div>
	                        </div>
	                    </div>
	                    <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
	                        <a class="perfect_information_pop_button_sure AddCategorySureThree  click_close_id" popName="AddCatAttr" href="javascript:void(0); " id="addAttrs" style="border:0">添加</a>
	                        <a class="perfect_information_pop_button_cancel click_close_id" popName="AddList" href="javascript:void(0);">取消</a>
	                    </div>
	                </div>
	            </div>
					<!-- 添加属性列表无数据 弹出框end -->
					<!-- 删除属性列表弹出框start -->
					<div class="Pop_layer"  popName="DeleteCatAttr" id="DeleteCatAttr"  style="display:none;">
	                <div class="latest_activity_pop">
	                    <div class="latest_activity_pop_close">
	                        <a class="latest_activity_pop_close_a  click_close_id"  popName="DeleteCatAttr"  href="javascript:void(0);"></a>
	                    </div>
	                    <div class="latest_activity_pop_con">
	                        <div class="latest_activity_pop_con_t">
	                            删除类目属性
	                        </div>
	                        <div class="latest_activity_pop_con_c" style="text-align:center;">
	                            确认删除当前类目下的属性<span id="attrName"> </span>？
	                        </div>
	                    </div>
	                    <div class="latest_activity_pop_btn">
	                        <a class="latest_activity_pop_btn_follow click_close_id deleteBtn" popName="DeleteCatAttr" id="delCatAttr" href="javascript:void(0);">确认</a>
	                        <a class="latest_activity_pop_btn_no click_close_id" popName="DeleteCatAttr" href="javascript:void(0);">取消</a>
	                    </div>
	                </div>
	            </div>
					<!-- 删除属性列表弹出框end -->
		</div>
	
	<div class="clear"></div>
	<!-- 右边内容区end -->
		
		
	<script>
		var categoryId_global = "";
		var attrIds_global = "";
		$(function(){
			getCategoryListJson();
			
			$("body").children().off("click",".nav_child");
		   	$("body").children().on("click",".nav_child", function(){
			      $(".nav_child").removeClass("addBG");
			      $(this).addClass("addBG");
			      var catId = $(this).attr("catId");
			      if(catId!=undefined && catId!=""){
			    	  getCatAttrList(catId,'','');
			      }else{
			    	  $("#attrlist").html("");
			      }
			      $("#attrVallist").html("");
		    });
		   	
		   	$("body").children().off("click","#attrlist li");
		   	$("body").children().on("click","#attrlist li", function(){
			      $("#attrlist li").removeClass("addBG");
			      $(this).addClass("addBG");
		    });
		   	
		   	
		   	$("body").children().off("click","#attrAllList li");
		   	$("body").children().on("click","#attrAllList li", function(){
			      $("#attrAllList li").removeClass("addBG");
			      $(this).addClass("addBG");
		    });
		   	
			$(".seachCatName").keyup(function(){
				var pinyingChar = '';
				var catName = '';
				var searchName = $(this).val();
				if(formReg.englishReg(searchName)){
					pinyingChar = searchName.toLowerCase();
				}else{
					catName = searchName;
				}
				if(pinyingChar=='' && catName ==''){
					$("#category_search").hide();
				}else{
					getCategoryList(catName,pinyingChar);
					$("#category_search").show();
				}
				
			});
			
			$(".seachAttr").keyup(function(){
				var pinyingChar = '';
				var attrName = '';
				var searchName = $(this).val();
				if(formReg.englishReg(searchName)){
					pinyingChar = searchName.toLowerCase();
				}else{
					attrName = searchName;
				}
				$("#attrcount").html("0");
				getAttrList(categoryId_global,attrName,pinyingChar);
			});
			
			$(".seachAttrName").keyup(function(){
				var pinyingChar = '';
				var attrVal = '';
				var categoryId ='';
				var searchName = $(this).val();
				if(formReg.englishReg(searchName)){
					pinyingChar = searchName.toLowerCase();
				}else{
					attrVal = searchName;
				}
				$(".nav_child").each(function(){
				      if($(this).hasClass("addBG")){				    	  
					      var catId = $(this).attr("catId");
					      if(catId!=null && catId!=undefined && catId!=""){
					    	  categoryId = catId;
					    	  return true;
					      }
				      }
			    });
				if(categoryId == ""){
					alertErrors("请先选中三级类目",1500);
					return;
				}
				getCatAttrList(categoryId,attrVal,pinyingChar)
				$("#attrVallist").html("");
			});

			//添加分类属性关联
		    $(".category-table-topAdd").click(function(){
		    	openCatAttrAdd("AddCatAttr");
		    });
			
		 	//删除分类属性关联
		    $(".category-table-topDelete").click(function(){
		    	openCatAttrDel("DeleteCatAttr")
		    });
		});
		
		
		function openCatAttrAdd(divId,catId,attrIds){
			var attrName = "";
	    	var attrIds = "";
	    	attrIds_global = "";
	    	$("#attrcount").html("0");
	    	var categoryId = "";
	    	$(".nav_child").each(function(){
			      if($(this).hasClass("addBG")){
			    	  var catId = $(this).attr("catId");
			    	  if(catId!=undefined && catId!=""){
			    		  categoryId = catId;
			    		  return true;
				      }
			      }
		    });
	    	if(categoryId == ""){
	    		alertErrors("必须选中添加三级类目",1500);
	    		return;
	    	}else{
	    		categoryId_global = categoryId;
	    	}
			getAttrList(categoryId_global,'','');
			click_open(divId);
			$("#addAttrs").unbind("click");
    		$("#addAttrs").click(function(){
				addCatAttr("AddCatAttr",categoryId_global,attrIds_global);
			});
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId))
		}
		
		function openCatAttrDel(divId){
			var attrName = "";
	    	var attrIds = "";
	    	$("#attrlist li").each(function(){
	    		if($(this).hasClass("addBG")){
	    			attrName = $(this).html();
	    			attrIds = $(this).attr("attrId");
	    			return true;
	    		}
	    	});
	    	if(attrIds == ""){
	    		alertErrors("请先选中删除属性",1500);
	    		return;
	    	}
	    	var categoryId = "";
	    	$(".nav_child").each(function(){
			      if($(this).hasClass("addBG")){
			    	  var catId = $(this).attr("catId");
			    	  if(catId!=undefined && catId!=""){
			    		  categoryId = catId;
			    		  return true;
				      }
			      }
		    });
	    	if(categoryId == ""){
	    		alertErrors("必须选中删除三级类目",1500);
	    		return;
	    	}
			$("#attrName").html(attrName)
			click_open(divId);
			$("#delCatAttr").unbind("click");
			$("#delCatAttr").click(function (){
				deleteCatAttr(divId,categoryId,attrIds);
			});
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId))
		}
		
		//分类Json
		function getCategoryListJson(){	
			var categoryListJson = sessionStorage.getItem("CategoryListJson");
			if(!categoryListJson){
				alertLoading("数据正在操作,请稍后...", 15000);
				var url_ = webRoot + "/page/GoodsCategory/categoryListJson.do";
				$.ajax({
			        type: "POST",
			        url: url_,
			        dataType: "json",
			        success: function(result){
			        	alertHide();
			        	var msgCode = result.msgCode;
			        	var data = result.data;
			        	if(msgCode == 0){
			        		$str = '';
			        		if(data!=null && data.length > 0){		        			
				        		$str += '<ul class="animenu__nav">';
				        		for(var i=0; i<data.length; i++){
				        			var catName = data[i].catName;
				        			var catId = data[i].id;
				        			var listi = data[i].childList;
				        			if(listi != undefined && listi != null && listi.length > 0){			        				
					        			$str += '    <li class="animenu__nav_li">';
				        			}else{
				        				$str += '    <li class="animenu__nav_not nav_child">';
				        			}
				        			$str += '    <p class="animenu__nav_p">'+catName+'</p>';
			        				$str += '    <ul class="animenu__nav animenu__nav__child"  catId="'+catId+'">';
				        			if(listi != undefined && listi != null && listi.length > 0){		        				
					        			for(var j=0; j<listi.length; j++){	
					        				var catNamej = listi[j].catName;
						        			var catIdj = listi[j].id;
						        			var listj = listi[j].childList;
						        			if(listj != undefined && listj != null && listj.length > 0){
							        			$str += '        <li class="animenu__nav_li">';				        				
						        			}else{
						        				$str += '        <li class="nav_child">';
						        			}
						        			$str += '        	<p class="animenu__nav_p">'+catNamej+'</p>';
						        			$str += '        	<ul class="animenu__nav__child" catId="'+catIdj+'">';
						        			if(listj != undefined && listj != null && listj.length > 0){					        				
							        			for(var z=0; z<listj.length; z++){	
							        				var catName = listj[z].catName;
								        			var catId = listj[z].id;
								        			$str += '		        <li class="nav_child" catId="'+catId+'">'+catName+'</li>';
							        			}
						        			}
					        				$str += '	        </ul>';
						        			$str += '        </li>';
					        			}
				        			}
			        				$str += '    </ul>';            
				        			$str += '	 </li>';
				        		}
			        			$str += '</ul>';
			        		}
			        	}
			            $('#categorylist').html($str);
			            sessionStorage.setItem("CategoryListJson",$str);
			            linkages(".category-scroll",".animenu__nav_p",".animenu__nav__child");
			        },
			        error : function(){
			        	alertHide();
			        }
				});
			}else{
				$('#categorylist').html(categoryListJson);
	            linkages(".category-scroll",".animenu__nav_p",".animenu__nav__child");
			}
		    
		}
		
		//分类
		function getCategoryList(catName,pinyingChar){	
			var url_ = webRoot + "/page/GoodsCategory/categoryList.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	catName:catName,
		        	pinyingChar:pinyingChar
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	var data = result.data;
		        	if(msgCode == 0){
		        		$str = '';
		        		if(data!=null && data.length > 0){
		        			$str += '<ul>';
			        		for(var i=0; i<data.length; i++){
			        			$str += '<li catId="'+data[i].id+'" catLevel="'+data[i].catLevel+'">'+data[i].catName+'</li>'
			        		}
			        		$str += '</ul>';
		        		}
		        	}
		            $('#category_search').html($str);
		            $("#category_search li").click(function(){
		            	var catLevel = $(this).attr("catLevel");
		            	var catId = $(this).attr("catId");
		            	if(catLevel == 3){
		            		$(".nav_child").each(function(){
		            			if($(this).attr("catId")==catId){
		            				$(".nav_child").removeClass("addBG");
		            				$(".animenu__nav__child").hide();
		            				$("#attrVallist").html("");
		            				$(this).addClass("addBG");
		            				$(this).parents(".animenu__nav__child").show();
		            				if(catId!=undefined && catId!=""){
			          			    	  getCatAttrList(catId,'','');
			          			    }else{
			          			    	  $("#attrlist").html("");
			          			    }
		            			}
		            		})
		            	}else{
		            		$(".nav_child").removeClass("addBG");
		            		$(".animenu__nav__child").hide();
		            		$("#attrlist").html("");
		            		$("#attrVallist").html("");
		            		$(".animenu__nav__child").each(function(){
		            			if($(this).attr("catId")==catId){
		            				$(this).show();
		            				$(this).parents(".animenu__nav__child").show();
		            			}
		            		});
		            	}
		            	$("#category_search").hide();
		            });
		        }
		    });
		}
		
		//属性
		function getCatAttrList(categoryId,attrVal,pinyingChar){	
			alertLoading("数据正在操作,请稍后...", 5000);
			var url_ = webRoot + "/page/GoodsAttr/catAttrList.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data:{
		        	categoryId : categoryId,
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
			        			$str += '<li onclick="getAttrValList(\''+data[i].id+'\')" attrId="'+data[i].id+'">'+data[i].attrVal+'</li>';
			        		}
		        		}
		            	$('#attrlist').html($str);
		        	}
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		//属性值
		function getAttrValList(attrId){
			alertLoading("数据正在操作,请稍后...", 5000);
			var url_ = webRoot + "/page/GoodsAttr/attrValList.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data:{
		        	attrId : attrId
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
			        			$str += '<li>'+data[i].attrValueVal+'</li>';
			        		}
		        		}
			            $('#attrVallist').html($str);
		        	}
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		//属性总表
		function getAttrList(categoryId,attrVal,pinyingChar){	
			alertLoading("数据正在操作,请稍后...", 5000);
			var url_ = webRoot + "/page/GoodsAttr/catAttrListOthers.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data:{
		        	categoryId : categoryId,
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
			        			$str += '<div class="addrow"><input name="attr" type="checkbox" value="'+data[i].id+'"><li>'+data[i].attrVal+'</li></div>';
			        		}
			            	$('#attrAllList').html($str);
			            	$('.addrow input').click(function () { 
			            		var count = 0;
			            		var attrIds = "";
			            		$('.addrow input').each(function () {
			            			if($(this).attr("checked") == "checked"){	
			            				count++;
				            			attrIds = attrIds + $(this).val()+",";
			            			}
 				            	});
			            		if(attrIds!=""){			            			
				            		attrIds = attrIds.substring(0,attrIds.length-1);
			            		}
			            		$("#attrcount").html(count);
			            		attrIds_global = attrIds;
			            	}); 
			            	
		        		}else{
		        			$('#attrAllList').html('<div class="notList" >请到<a href="javascript:void(0);" onclick="toUrl()">商品属性管理</a>中添加</div>');
		        		}
		        	}
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		//删除类目属性关联
		function deleteCatAttr(divId,catId,attrIds){	
			$("#delCatAttr").unbind("click");
			var url_ = webRoot + "/page/GoodsAttr/deleteCatAttr.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	catId:catId,
		        	attrIds:attrIds
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("删除成功",1500);	
		        	}else{
		        		alertErrors("删除失败",1500);
		        	}
		        	click_close(divId);
		        	getCatAttrList(catId,'','');
		        	$("#attrVallist").html("");
		         },
		         error:function(){
					alertErrors("删除失败",1500);
					$("#delCatAttr").click(function(){
						deleteCatAttr(divId,catId,attrIds);
					});
				}
		    });
		}
		
		//添加类目属性关联
		function addCatAttr(divId,catId,attrIds){
			if(attrIds == ""){
	    		alertErrors("请先选中添加属性",1500);
	    		return;
	    	}
			$("#addAttrs").unbind("click");
			var url_ = webRoot + "/page/GoodsAttr/addCatAttr.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	catId:catId,
		        	attrIds:attrIds
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("添加成功",1500);	
		        	}else{
		        		alertErrors("添加失败",1500);
		        	}
		        	click_close(divId);
		        	getCatAttrList(catId,'','');
		        	$("#attrVallist").html("");
		         },
		         error:function(){
					alertErrors("添加失败",1500);
					$("#addAttrs").click(function(){
						addCatAttr(divId,catId,attrIds);
					});
				}
		    });
		}
		
		function toUrl(){
			var URL = webRoot+"/page/GoodsAttr/attr.do";
			$(".content_next_dd").removeClass("systemOn");
			$(".content_next_dd").each(function(){
				if($(this).attr("url")=="/page/GoodsAttr/attr"){
					$(this).addClass("systemOn");
				}
			});
			click_close("AddCatAttr");
			$("#contentRight").load(URL);
		}
	</script>

</body>
</html>
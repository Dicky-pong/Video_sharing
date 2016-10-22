<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/system_announcemen.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/system-release.css" />
<script type="text/javascript" src="${path}/resources/js/util/formReg.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>类目与品牌关联</title>
</head>  
<body>
		<!-- 右边内容区start -->
			<div class="system_content_right_top">
					<!-- 内容区 -->
					<div class="categoryContent">
						<div class="announcemen-content-top">类目与品牌关联</div>
						<div class="announcemen-content-conditions" >
							<div class="brandContent">
								<table class="brandContenthead"  style="margin:5px auto;width: 70%;">
									<tr>
										<td>类目列表</td>
										<td>已有品牌列表</td>
									</tr>
								</table>
								<table class="category-table objadd">
									<thead>
										<tr>
											<td class="categoryTd">
												<input type="text" class="goods_type_search seachCatName" placeholder="请输入名称" style="width: 70%; margin: 7px 0;" />
												<div class="system_search" id="category_search" style="display:none">
													
												</div>
											</td>
											<td>
												<input type="text" class="goods_type_search seachBrandName" placeholder="请输入名称"/>
												<div class="category-table-topAdd" popName="AddCatBrand"><span>添加</span></div>
												<div class="category-table-topDelete" popName="DeleteCatBrand"><span>删除</span></div>
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
												<ol class="theOl" id="Brandlist">
												
												</ol>
												
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- 内容区end -->
					<!-- 添加品牌列表有数据 弹出框end -->
					<!-- 添加品牌列表 无数据弹出框start -->
					<div class="Pop_layer" popName="AddCatBrand"  id="AddCatBrand" style="display: none;" >
	                <div class="Pop_layer_box" style="width: 600px;">
	                    <div class="pop_layer_title">
	                        <span class="pop_layer_title_span">添加类目品牌</span>
	                        <span class="pop_layer_title_span_close">
	                            <a class="pop_layer_title_span_close_a click_close_id" popName="AddCatBrand"  href="javascript:void(0);"></a>
	                        </span>
	                    </div>
	                    <div class="new_member_pop" style="width: 600px;">            
	                        <div class="new_member_pop_box">	                            
	                        	<table class="category-table" style="width: 60%;height: 250px;">
									<thead>
										<tr>
											<td>
												<input type="text" class="goods_type_search seachBrand" placeholder="请输入名称" style="width: 70%;";/>
											</td>
										</tr>
									</thead>
									<tr>
										<td>
											<div class="category-scroll" id="BrandAllList" style="height:200px ">
												
											</div>

										</td>
									</tr>
								</table>
								<div style="margin:10px auto;text-align: center;color:#04b0f7;margin-bottom: 40px;">你已选中<span id="Brandcount">0</span>项</div>
	                        <div class="clear"></div>
	                        </div>
	                    </div>
	                    <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
	                        <a class="perfect_information_pop_button_sure AddCategorySureThree  click_close_id" popName="AddCatBrand" href="javascript:void(0); " id="addBrands" style="border:0">添加</a>
	                        <a class="perfect_information_pop_button_cancel click_close_id" popName="AddList" href="javascript:void(0);">取消</a>
	                    </div>
	                </div>
	            </div>
					<!-- 添加品牌列表无数据 弹出框end -->
					<!-- 删除品牌列表弹出框start -->
					<div class="Pop_layer"  popName="DeleteCatBrand" id="DeleteCatBrand"  style="display:none;">
	                <div class="latest_activity_pop">
	                    <div class="latest_activity_pop_close">
	                        <a class="latest_activity_pop_close_a  click_close_id"  popName="DeleteCatBrand"  href="javascript:void(0);"></a>
	                    </div>
	                    <div class="latest_activity_pop_con">
	                        <div class="latest_activity_pop_con_t">
	                            删除类目品牌
	                        </div>
	                        <div class="latest_activity_pop_con_c" style="text-align:center;">
	                            确认删除当前类目下的品牌&nbsp<span id="BrandName"> </span>？
	                        </div>
	                    </div>
	                    <div class="latest_activity_pop_btn">
	                        <a class="latest_activity_pop_btn_follow click_close_id deleteBtn" popName="DeleteCatBrand" id="delCatBrand" href="javascript:void(0);">确认</a>
	                        <a class="latest_activity_pop_btn_no click_close_id" popName="DeleteCatBrand" href="javascript:void(0);">取消</a>
	                    </div>
	                </div>
	            </div>
					<!-- 删除品牌列表弹出框end -->
		</div>
	
	<div class="clear"></div>
	<!-- 右边内容区end -->
		
		
	<script>
		var categoryId_global = "";
		var BrandIds_global = "";
		$(function(){
			getCategoryListJson();
			
			$("body").children().off("click",".nav_child");
		   	$("body").children().on("click",".nav_child", function(){
			      $(".nav_child").removeClass("addBG");
			      $(this).addClass("addBG");
			      var catId = $(this).attr("catId");
			      if(catId!=undefined && catId!=""){
			    	  getCatBrandList(catId,'','');
			      }else{
			    	  $("#Brandlist").html("");
			      }
			      $("#BrandVallist").html("");
		    });
		   	
		   	$("body").children().off("click","#Brandlist li");
		   	$("body").children().on("click","#Brandlist li", function(){
			      $("#Brandlist li").removeClass("addBG");
			      $(this).addClass("addBG");
		    });
		   	
		   	$("body").children().off("click","#BrandAllList li");
		   	$("body").children().on("click","#BrandAllList li", function(){
			      $("#BrandAllList li").removeClass("addBG");
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
			
			$(".seachBrand").keyup(function(){
				var pinyingChar = '';
				var BrandName = '';
				var searchName = $(this).val();
				if(formReg.englishReg(searchName)){
					pinyingChar = searchName.toLowerCase();
				}else{
					BrandName = searchName;
				}
				$("#Brandcount").html("0");
				getBrandList(categoryId_global,BrandName,pinyingChar);
			});
			
			$(".seachBrandName").keyup(function(){
				var pinyingChar = '';
				var BrandVal = '';
				var categoryId ='';
				var searchName = $(this).val();
				if(formReg.englishReg(searchName)){
					pinyingChar = searchName.toLowerCase();
				}else{
					BrandVal = searchName;
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
				getCatBrandList(categoryId,BrandVal,pinyingChar)
				$("#BrandVallist").html("");
			});

			//添加分类品牌关联
		    $(".category-table-topAdd").click(function(){
		    	openCatBrandAdd("AddCatBrand");
		    });
			
		 	//删除分类品牌关联
		    $(".category-table-topDelete").click(function(){
		    	openCatBrandDel("DeleteCatBrand")
		    });
		});
		
		
		function openCatBrandAdd(divId,catId,BrandIds){
			var BrandName = "";
	    	var BrandIds = "";
	    	BrandIds_global = "";
	    	$("#Brandcount").html("0");
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
			getBrandList(categoryId_global,'','');
			click_open(divId);
			$("#addBrands").unbind("click");
    		$("#addBrands").click(function(){
				addCatBrand("AddCatBrand",categoryId_global,BrandIds_global);
			});
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId))
		}
		
		function openCatBrandDel(divId){
			var BrandName = "";
	    	var BrandIds = "";
	    	$("#Brandlist li").each(function(){
	    		if($(this).hasClass("addBG")){
	    			BrandName = $(this).html();
	    			BrandIds = $(this).attr("BrandId");
	    			return true;
	    		}
	    	});
	    	if(BrandIds == ""){
	    		alertErrors("请先选中删除品牌",1500);
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
			$("#BrandName").html(BrandName)
			click_open(divId);
			$("#delCatBrand").unbind("click");
			$("#delCatBrand").click(function (){
				deleteCatBrand(divId,categoryId,BrandIds);
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
					        				var catName = listi[j].catName;
						        			var catId = listi[j].id;
						        			var listj = listi[j].childList;
						        			if(listj != undefined && listj != null && listj.length > 0){
							        			$str += '        <li class="animenu__nav_li">';				        				
						        			}else{
						        				$str += '        <li class="nav_child">';
						        			}
						        			$str += '        	<p class="animenu__nav_p">'+catName+'</p>';
					        				$str += '        	<ul class="animenu__nav__child" catId="'+catId+'">';
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
		            				$("#BrandVallist").html("");
		            				$(this).addClass("addBG");
		            				$(this).parents(".animenu__nav__child").show();
		            				if(catId!=undefined && catId!=""){
			          			    	  getCatBrandList(catId,'','');
			          			    }else{
			          			    	  $("#Brandlist").html("");
			          			    }
		            			}
		            		})
		            	}else{
		            		$(".nav_child").removeClass("addBG");
		            		$(".animenu__nav__child").hide();
		            		$("#Brandlist").html("");
		            		$("#BrandVallist").html("");
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
		
		//品牌
		function getCatBrandList(categoryId,BrandVal,pinyingChar){	
			alertLoading("数据正在操作,请稍后...", 5000);
			var url_ = webRoot + "/page/GoodsBrand/catBrandList.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data:{
		        	categoryId : categoryId,
		        	brandVal:BrandVal,
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
			        			$str += '<li BrandId="'+data[i].id+'">'+data[i].brandName+'</li>';
			        		}
		        		}
		            	$('#Brandlist').html($str);
		        	}
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		
		//品牌总表
		function getBrandList(categoryId,brandName,pinyingChar){
			alertLoading("数据正在操作,请稍后...", 5000);
			var url_ = webRoot + "/page/GoodsBrand/catBrandListOthers.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data:{
		        	categoryId : categoryId,
		        	brandName:brandName,
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
			        			$str += '<div class="addrow"><input name="Brand" type="checkbox" value="'+data[i].id+'"><li>'+data[i].brandName+'</li></div>';
			        		}
			            	$('#BrandAllList').html($str);
			            	$('.addrow input').click(function () { 
			            		var count = 0;
			            		var BrandIds = "";
			            		$('.addrow input').each(function () {
			            			if($(this).attr("checked") == "checked"){	
			            				count++;
				            			BrandIds = BrandIds + $(this).val()+",";
			            			}
 				            	});
			            		if(BrandIds!=""){			            			
				            		BrandIds = BrandIds.substring(0,BrandIds.length-1);
			            		}
			            		$("#Brandcount").html(count);
			            		BrandIds_global = BrandIds;
			            	}); 
			            	
		        		}else{
		        			$('#BrandAllList').html('<div class="notList" style="padding: 50px; line-height:25px;">没有搜索到相关品牌，点击  <a href="javascript:;" id="addBrand">添加</a> 将关键字添加到品牌库</div>');
		            		$("#addBrand").unbind("click");
		            		$("#addBrand").click(function(){
		        				addBrand();
		        			});
		        		}
		        	}
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		//删除类目品牌关联
		function deleteCatBrand(divId,catId,BrandIds){	
			$("#delCatBrand").unbind("click");
			var url_ = webRoot + "/page/GoodsBrand/deleteCatBrand.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	catId:catId,
		        	brandIds:BrandIds
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
		        	getCatBrandList(catId,'','');
		        	$("#BrandVallist").html("");
		         },
		         error:function(){
					alertErrors("删除失败",1500);
					$("#delCatBrand").click(function(){
						deleteCatBrand(divId,catId,BrandIds);
					});
				}
		    });
		}
		
		//添加类目品牌关联
		function addCatBrand(divId,catId,BrandIds){
			if(BrandIds == ""){
	    		alertErrors("请先选中添加品牌",1500);
	    		return;
	    	}
			$("#addBrands").unbind("click");
			var url_ = webRoot + "/page/GoodsBrand/addCatBrand.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	catId:catId,
		        	brandIds:BrandIds
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
		        	getCatBrandList(catId,'','');
		        	$("#BrandVallist").html("");
		         },
		         error:function(){
					alertErrors("添加失败",1500);
					$("#addBrands").click(function(){
						addCatBrand(divId,catId,BrandIds);
					});
				}
		    });
		}
		
		//添加品牌
		function addBrand(){
			var brandName = $(".seachBrand").val();
			if(brandName == ""){
				alertErrors("品牌名称不能为空",1500);
				return;
			}
			$("#addBrand").unbind("click");
			var url_ = webRoot + "/page/GoodsBrand/addBrand.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	brandName:brandName
		        },
		        dataType: "json",
		        success: function(result){
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("添加成功",1500);	
		        	}else if(msgCode == 10006){
		        		alertSuccess("已存在该品牌名称",1500);
		        	}else{
		        		alertErrors("添加失败",1500);
		        	}
		        	getBrandList(categoryId_global,'','');
		        	$("#addBrand").click(function(){
						addBrand();
					});
		         },
		         error:function(){
					alertErrors("添加失败",1500);
					$("#addBrand").click(function(){
						addBrand();
					});
				}
		    });
		}
	</script>

</body>
</html>
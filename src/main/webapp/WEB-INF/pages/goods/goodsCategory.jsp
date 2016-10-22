<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/system_announcemen.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/system-release.css" />
<script type="text/javascript" src="${path}/resources/js/util/formReg.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品类目</title>
</head>  
<body>
	<!-- 右边内容区start -->
		<div class="system_content_right_top">
			<!-- 内容区 -->
			<div class="categoryContent">
				<div class="announcemen-content-top">类目管理</div>
				<div class="announcemen-content-conditions" >
					<div>
						<table class="category-table">
							<thead>
								<tr>
									<td sign="one">
										<input type="text" id="search_one" class="goods_type_search" placeholder="请输入名称"/>
										<div class="category-table-topAdd  " popName="categoryAdd"><span>添加</span></div>
										<div class="category-table-topDelete " popName="categoryDelete"><span>删除</span></div>
									</td>
									<td sign="two">
										<input type="text" id="search_two" class="goods_type_search" placeholder="请输入名称"/>
										<div class="category-table-topAdd " popName="categoryAdd"><span>添加</span></div>
										<div class="category-table-topDelete " popName="categoryDelete"><span>删除</span></div>
									</td>
									<td sign="thr">
										<input type="text"id="search_thr" class="goods_type_search" placeholder="请输入名称"/>
										<div class="category-table-topAdd" popName="categoryAdd"><span>添加</span></div>
										<div class="category-table-topDelete" popName="categoryDelete"><span>删除</span></div>
									</td>
								</tr>
							</thead>
							<tr>
								<td sign="two">
									<div class="category-scroll categoryTrOne" id="cat_one">
										<ol id="catlist_one">
											
										</ol>
									</div>
								</td>
								<td sign="thr" class="createTdCow1">
									<div class="category-scroll  categoryTrTwo" id="cat_two">
										<ol id="catlist_two">
										
										</ol>
									</div>
								</td>
								<td class="createTdCow2">
									<div class="category-scroll categoryTrThree"  id="cat_thr">
										<ol id="catlist_thr">
											
										</ol>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 内容区end -->
			<!-- 弹出框 -->
			<!-- 添加类目 弹出框start -->
			<div class="Pop_layer" popName=categoryAdd id="categoryAdd" style="display: none;" >
               <div class="Pop_layer_box" style="width: 500px;">
                   <div class="pop_layer_title">
                       <span class="pop_layer_title_span" id="AddCatPop">添加一级类目</span>
                       <span class="pop_layer_title_span_close">
                           <a class="pop_layer_title_span_close_a click_close_id" popName="categoryAdd"  href="javascript:void(0);"></a>
                       </span>
                   </div>
                   <div class="new_member_pop" style="width: 500px;">            
                       <div class="new_member_pop_box">	                            
                       	<div class="successSelect">
                       		类目名称：
                       		<input type="text" id="catName">
                       	</div>
                       <div class="clear"></div>
                       </div>
                   </div>
                   <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
                       <a class="perfect_information_pop_button_sure click_close_id AddCategorySureOne" popName="categoryAdd" id="addCat" href="javascript:void(0); ">确定</a>
                       <a class="perfect_information_pop_button_cancel click_close_id"  popName="categoryAdd" href="javascript:void(0);">取消</a>
                   </div>
               </div>
           </div>
			<!-- 添加类目 弹出框end -->
			
			<!-- 删除类目弹出框start -->
			<div class="Pop_layer"  popName="categoryDelete" id="categoryDelete"  style="display:none;">
               <div class="latest_activity_pop">
                   <div class="latest_activity_pop_close">
                       <a class="latest_activity_pop_close_a  click_close_id"  popName="categoryDelete"  href="javascript:void(0);"></a>
                   </div>
                   <div class="latest_activity_pop_con">
                       <div class="latest_activity_pop_con_t" id="DelCatPop"> 删除一级类目
                       </div>
                       <div class="latest_activity_pop_con_c" style="text-align:center;">确认要删除&nbsp<span id="catNameS"></span>&nbsp类目？
                       </div>
                   </div>
                   <div class="latest_activity_pop_btn">
                       <a class="latest_activity_pop_btn_follow click_close_id deleteBtn" popName="categoryDelete" id="delCat" href="javascript:void(0);">确认</a>
                       <a class="latest_activity_pop_btn_no click_close_id" popName="categoryDelete" href="javascript:void(0);">取消</a>
                   </div>
               </div>
           </div>
			<!-- 删除类目弹出框end -->
		</div>
	
	<div class="clear"></div>
	<!-- 右边内容区end -->
		
		
	<script>
		var catIdOne = 0;
		var catIdTwo = 0;
		$(function(){
			getCategoryList(0,'one','','');
			$(".goods_type_search").keyup(function(){
				var pinyingChar = '';
				var catName = '';
				var sign = $(this).parent().attr("sign");
				var searchName = $(this).val();
				$(".goods_type_search").val("");
				$(this).val(searchName);
				if(formReg.englishReg(searchName)){
					pinyingChar = searchName.toLowerCase();
				}else{
					catName = searchName;
				}
				if(sign == 'one'){
					$(".category-table").find("td:nth-child(2)").css("visibility","hidden");
					$(".category-table").find("td:nth-child(3)").css("visibility","hidden");
					getCategoryList(0,sign,catName,pinyingChar);
				}else if(sign == 'two'){
					if(catIdOne==0){
						location.reload();
					}
					$(".category-table").find("td:nth-child(2)").css("visibility","visible");
					$(".category-table").find("td:nth-child(3)").css("visibility","hidden");
					getCategoryList(catIdOne,sign,catName,pinyingChar);
				}else if(sign == 'thr'){
					if(catIdTwo==0){
						location.reload();
					}
					getCategoryList(catIdTwo,sign,catName,pinyingChar);
				}
			});
			
			$("body").children().off("click",".category-scroll li");
			$("body").children().on("click",".category-scroll li", function(){
				$(this).addClass("addBG");
				$(this).siblings("li").removeClass("addBG");
				var sign = $(this).parents("td").attr("sign");
				if(sign == "two"){
					var catId = $(this).attr("catId");
					catIdOne = catId;
					getCategoryList(catId,sign,'','');
					$(".category-table").find("td:nth-child(2)").css("visibility","visible");
					$(".category-table").find("td:nth-child(3)").css("visibility","hidden");
				}else if(sign == "thr"){
					var catId = $(this).attr("catId");
					catIdTwo = catId;
					getCategoryList(catId,sign,'','');
					$(".category-table").find("td:nth-child(3)").css("visibility","visible");
				}
				
				
			});

			//添加分类
		    $(".category-table-topAdd").click(function(){
		    	var sign = $(this).parent().attr("sign");
		    	openCatAdd("categoryAdd",sign);
		    });
			
		 	//删除分类
		    $(".category-table-topDelete").click(function(){
		    	var sign = $(this).parent().attr("sign");
		    	var catName = "";
		    	var catId = "";
		    	$("#catlist_"+sign+" li").each(function(){
		    		if($(this).hasClass("addBG")){
		    			catName = $(this).html();
		    			catId = $(this).attr("catId");
		    		}
		    	});
		    	if(catId != ""){		    		
			    	openCatDel("categoryDelete",sign,catName,catId);
		    	}else{
		    		alertErrors("请先选中删除分类",1500);
		    	}
		    });
		});
		
		
		function openCatAdd(divId,sign){
			var parentId = "";
			var prevSign = "";
			if(sign=="one"){
				parentId = "0";
				$("#AddCatPop").html("添加一级类目");
			}else if(sign=="two"){
				$("#AddCatPop").html("添加二级类目");
				prevSign="one";
			}else if(sign=="thr"){
				$("#AddCatPop").html("添加三级类目");
				prevSign="two";
			}
			if(prevSign!=""){				
				$("#catlist_"+prevSign+" li").each(function(){
		    		if($(this).hasClass("addBG")){
		    			parentId = $(this).attr("catId");
		    		}
		    	});
			}
			if(parentId==""){
				alertErrors("请先选中上级分类",1500);
				return;
			}
			$("#catName").val("");
			click_open(divId);
			$("#addCat").unbind("click");
			$("#addCat").click(function (){
				var parentId = "";
				var catLevel = "";
				var catName = $("#catName").val();
				if(catName == ""){
					alertErrors("分类名不能为空",1500);
				}
				addCategory(catName,sign);
			});
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId))
		}
		
		function openCatDel(divId,sign,catName,catId){
			if(sign=="one"){
				$("#DelCatPop").html("删除一级类目");
			}else if(sign=="two"){
				$("#DelCatPop").html("删除二级类目");
			}else if(sign=="thr"){
				$("#DelCatPop").html("删除三级类目");
			}
			$("#catNameS").html(catName);
			click_open(divId);
			$("#delCat").unbind("click");
			$("#delCat").click(function (){
				deleteCategory(catId,sign);
			});
			isMove($("#"+divId+" .pop_layer_title"),$("#"+divId))
		}
		
		function getCategoryList(parentId,sign,catName,pinyingChar){
			alertLoading("数据正在操作,请稍后...", 5000);
			var url_ = webRoot + "/page/GoodsCategory/categoryList.do";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	parentId:parentId,
		        	catName:catName,
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
			        			$str += '<li catId="'+data[i].id+'">'+data[i].catName+'</li>'
			        		}
		        		}
		        	}
		            $('#catlist_'+sign).html($str);
		        },
		        error : function(){
		        	alertHide();
		        }
		    });
		}
		
		function addCategory(catName,sign){
			$("#addCat").unbind("click");
			var url_ = webRoot + "/page/GoodsCategory/addCategory.do";
			var catLevel = "";
			var parentId = "";
			var fristCatId = "";
			var secondCatId = "";
			if(sign=="one"){
				catLevel = 1;
				parentId = 0;
			}else if(sign=="two"){
				catLevel = 2;
				parentId = catIdOne;
				fristCatId = catIdOne;
			}else if(sign=="thr"){
				catLevel = 3;
				parentId = catIdTwo;
				fristCatId = catIdOne;
				secondCatId = catIdTwo;
			}
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	parentId:parentId,
		        	catName:catName,
		        	catLevel:catLevel,
		        	fristCatId:fristCatId,
		        	secondCatId:secondCatId
		        },
		        dataType: "json",
		        success: function(result){
		        	sessionStorage.setItem("CategoryListJson","");
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("添加成功",1500);	
		        	}else if(msgCode == 10006){
		        		alertSuccess("已存在该类目",1500);
		        	}else{
		        		alertErrors("添加失败",1500);
		        	}
		        	click_close("categoryAdd");
		        	getCategoryList(parentId,sign,'','');
		         },
		         error:function(){
					alertErrors("添加失败",1500);
					$("#addCat").bind(function(){
						addCategory(catName,sign);
					});
				}
		    });
		}
		
		function deleteCategory(catId,sign){	
			$("#delCat").unbind("click");
			var url_ = webRoot + "/page/GoodsCategory/deleteCategory.do";
			var parentId = "";
			$.ajax({
		        type: "POST",
		        url: url_,
		        data: {
		        	id:catId
		        },
		        dataType: "json",
		        success: function(result){
		        	sessionStorage.setItem("CategoryListJson","");
		        	var msgCode = result.msgCode;
		        	if(msgCode == 0){
		        		alertSuccess("删除成功",1500);	
		        	}else{
		        		alertErrors("删除失败",1500);
		        	}
		        	click_close("categoryAdd");
		        	if(sign=="one"){
						parentId = 0;
						$(".category-table").find("td:nth-child(2)").css("visibility","hidden");
						$(".category-table").find("td:nth-child(3)").css("visibility","hidden");
					}else if(sign=="two"){
						parentId = catIdOne;
						$(".category-table").find("td:nth-child(2)").css("visibility","visible");
						$(".category-table").find("td:nth-child(3)").css("visibility","hidden");
					}else if(sign=="thr"){
						parentId = catIdTwo;
					}
		        	getCategoryList(parentId,sign,'','');
		         },
		         error:function(){
					alertErrors("删除失败",1500);
					$("#delCat").bind(function(){
						deleteCategory(catId);
					});
				}
		    });
		}
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>亿企联系统发布</title>
	<script type="text/javascript" src="${path}/resources/js/notice/announcemen.js"></script>

</head>
<body>
				<div class="system_content_right_top">
					<!-- 成功案例主页start-->
					<div class="success_case_content">
						<div class="announcemen-content-top">成功案例</div>
						<div class="announcemen-content-conditions" >
							<div class="success_case_top">
								<ul>
									
								</ul>
							</div>
							<div class="success_case_body">
		                        <form action="" id="topSearchs">
		                        <table class="conditionsEnd">
                              <tr>
                                  <td style="width: 35%"><div class="app-case-left-width">企业名称：</div>
                                  <input id="enterpriseName" name="enterpriseName" type=text class="case-input"  style="width: 70%;margin-left: 5px;"></td>
                                  <td class="tb-float">
                                      <div class="app-case-inventory"><div class="app-case-left-width">起止日期：</div>
                                      <input id="startDate" name="startDate" type="text" onchange="show_Time('show_starttime',this.value)"
									onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\')||\'2030-10-01\'}',readOnly:true})" class="case-input">
									<img onclick="WdatePicker({el:'startDate'})" 
									src="${path}/resources/js/plugins/my97DatePicker/skin/datePicker.gif"
									width="16" height="22" align="absmiddle"  />
									
									&nbsp;-&nbsp;
								
									
								<input id="endDate" name="endDate" type="text" onchange="show_Time('show_endtime',this.value)"
									onfocus="WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2030-10-01',readOnly:true})" class="case-input">
									<img onclick="WdatePicker({el:'endDate'})"
									src="${path}/resources/js/plugins/my97DatePicker/skin/datePicker.gif"
									width="16" height="22" align="absmiddle" />
									</div>
									
								
				
                                      <label for="manages-c-delete">
                                      	<div class="app-case-qk">
                                      		<input type="reset" value="清空条件" id="manages-c-delete" style="display: none">清空条件
                                      	</div>
                                      </label>
                                      <label for="case-ss0"><div class="app-case-ss"><input type="button" onclick="allSuccPageSize();" value="搜索"  style="display:none;width:108px;height:38px" id="case-ss0" >搜&nbsp;&nbsp;索</div></label>
                                  </td>
                              </tr>
                              <tr>
                     		      <td><div class="app-case-left-width" style="width: 23%">来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源：
                     		      </div><!-- <input name="registType" id="registType" type="text" class="case-input"  style="width: 70%;margin-left: 5px;"> -->
                     		      <select  name="registType" id="registType" style="width: 73%;margin-left: 5px;border:1px solid #dedede;height:36px;">
                     		      <option value="">-请选择-</option>
                     		      <option value="0">运营平台</option>
                     		      <option value="1">亿企联</option>
                     		      </select>
                     		      </td>
                              </tr>
                          </table>
                      </form>
		                    </div>
		                    <div>
		                    	<table class="conditionTable">
									<thead>
										<tr>
											<th style="width: 18%">企业名称</th>
											<th style="width: 25%">地址</th>
											<th style="width: 18%">注册时间</th>
											<th style="width: 15%">来源</th>
											<th  style="width: 24%">操作</th>
										</tr>
									</thead>
									<tbody id="ContextLists" >
										
									</tbody>
								</table>
								
					<div id="Paginations" class="pagination"></div>
			<p style="display: none">
			<input type="hidden" id="indexPage" value="" />
			<textarea id="SuccConfig-List" rows="0" cols="0">
				  <!--
				  {#template MAIN} 
				  		{#if $T.data.length > 0}
					  		{#foreach $T.data as sn}
					  			<tr>
						  			<td align="center" valign="middle">
						  				{$T.sn.enterpriseName}
						  			</td>
						  			<td align="center" valign="middle">
						  				{$T.sn.enterpriseAddressProvince+$T.sn.enterpriseAddressCity+$T.sn.enterpriseAddressArea+$T.sn.enterpriseAddressDetail}
						  			</td>
						  			<td align="center" valign="middle">
						  				{$T.sn.createDate}
						  			</td>
						  			<td align="center" valign="middle">
						  			{#if $T.sn.registType == 0} 
				  						运营平台
				  					{#/if}
				  					{#if $T.sn.registType == 1} 
				  						亿企联
				  					{#/if}
						  			</td>
						  			<td align="center" valign="middle" class="conditionTableLast">
						  				
				  					<div class="lookDetails"><a href="javascript:void(0);" onclick="showUsersDetail('{$T.sn.id}');" >查看 </a></div>
				  			
				  					<div class="click_open_id" onclick="openUpdate('{$T.sn.id}');"  popName="successSet"><a href="javascript:void(0);">修改 </a></div>
						  				
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
		                    </div>
						</div>
					</div>
					<!-- 成功案例主页end -->
					<div class="infoDetails" style="display: none">
						<div class="announcemen-content-top">信息详情</div>
						<div class="announcemen-content-conditions" >
							<table  class="infoDetailsTable">
								
							</table>
						</div>
					</div>
					<!--设为成功案例  弹出框 start-->
		            <div class="Pop_layer" popName="successSet" style="display: none;" >
	                <div class="Pop_layer_box" style="width: 500px;">
	                    <div class="pop_layer_title">
	                        <span class="pop_layer_title_span">设为成功案例</span>
	                        <span class="pop_layer_title_span_close">
	                            <a class="pop_layer_title_span_close_a click_close_id" popName="successSet"  href="javascript:void(0);"></a>
	                        </span>
	                    </div>
	                    <div class="new_member_pop" style="width: 500px;">            
	                        <div class="new_member_pop_box">	                            
	                        	<div class="successSelect">
	                        		设置顺序 
	                        		<select id="opvalue">
	                        			<option>1</option>
	                        			<option>2</option>
	                        			<option>3</option>
	                        			<option>4</option>
	                        			<option>5</option>
	                        			<option>6</option>
	                        			<option>7</option>
	                        		</select>
	                        	</div>
	                        <div class="clear"></div>
	                        </div>
	                    </div>
	                    <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
	                        <a class="perfect_information_pop_button_sure click_close_id " id="updateArr" popName="successSet" href="javascript:void(0); ">确定</a>
	                        <a class="perfect_information_pop_button_cancel click_close_id"  popName="successSet" href="javascript:void(0);">取消</a>
	                    </div>
	                </div>
	            </div>
	            <!--设为成功案例 弹出框 end-->
				</div>
			
			<div class="clear"></div>
			<!-- 右边内容区end -->

		</div>
	</div>
	<div class="clear"></div>
	<!-- 内容区end -->
<!-- 	<script type="text/javascript">
	$(function(){
		if($(".system_content_left").height() > $(".system_content_right").height()){
			$(".system_content_right").css("height",$(".system_content_left").height()) 
		}else{
			$(".system_content_left").css("height",$(".system_content_right").height()) 
		}
	})
	</script> -->
	<script type="text/javascript">
	$(function(){
		//分页总条数
		allSuccPageSize();
		findArray();
	/* 	 // 点击查看
		$(".lookDetails").click(function(){
			$(this).closest(".success_case_content").hide();
			$(this).closest(".success_case_content").next(".infoDetails").show();
		}) 
 */		
	})
	
	//加载分页内容
	function loadUsersInfo(pageIndex) {
	var enterpriseName = jsTrim($("#enterpriseName").val());
	$("#enterpriseName").val(enterpriseName);
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var enterpriseName = $("#enterpriseName").val();
	var registType = $("#registType").val();
	var url_ = webRoot + "/succCase/findUserInfo.do?startDate=" +startDate+ 
																"&endDate="+endDate+
																"&pageIndex="+pageIndex+
																"&pageSize="+pageSize+
																"&current_date=" + new Date().getTime();
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		url : url_,
		data : $('#topSearchs').serialize(),
		success : function(data) {
				$("#ContextLists").setTemplateElement("SuccConfig-List");
				$("#ContextLists").processTemplate(data);
		},
		error : function(e) {
			alertErrors("操作失败，请刷新再试", 3000);
		}
	});
}
	 //获取总页数
	function allSuccPageSize() {
		var enterpriseName = jsTrim($("#enterpriseName").val());
		$("#enterpriseName").val(enterpriseName);
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var enterpriseName = $("#enterpriseName").val();
		var registType = $("#registType").val();
		var url_ = webRoot + "/succCase/allSuccPageSize.do?startDate=" +startDate+ "&endDate="+endDate+"&current_date=" + new Date().getTime();
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			url : url_,
			data : $('#topSearchs').serialize(),
			success : function(data) {
				pageTotal = data;
					//获取总页数后 初始化控件分页取数据--ajax分页方法
				initPagination("Paginations",pageTotal,pageSize,"loadUsersInfo");
			},
			error : function(e) {
				alertErrors("操作失败，请刷新再试", 3000);
			}
		});
	}
	 
	 function showUsersDetail(userId){
		
		 var url_ = webRoot + "/succCase/showUsersDetail.do";
			var data = {userId:userId,}
			var i=0;
			$.ajax({
				type : "POST",
				async : false,
				dataType : "json",
				url : url_,
				data : data,
				success : function(data) {
					if(data != null){
						var type ;
						if(data.registType == 1){
							type = "亿企联";
						}else{
							type = "运营平台"
						}
						var html_ = "<thead><tr><td colspan='2'><h2>商户信息</h2></td></tr></thead><tr><td>商户logo</td><td><div class='success_case_logo' style='margin:0'>";
						html_ +="<img src="+data.enterpriseLogo+"></div></td></tr><tr><td>商户名</td><td>";
						html_ += data.enterpriseName;
						html_ += "</td></tr><tr><td>商户简称</td><td>";
						html_ += data.nickName;
						html_ += "</td></tr><tr><td>法人姓名</td><td>"
						html_ += data.contactName;
						html_ += "</td></tr><tr><td>负责人姓名</td><td>";
						html_ += data.contactName ;
						html_ += "</td></tr><tr><td>详细地址</td><td>";
						html_ += data.enterpriseAddressProvince+data.enterpriseAddressCity+data.enterpriseAddressArea+data.enterpriseAddressDetail;
						html_ += "</td></tr><tr><td>联系方式</td><td>";
						html_ += data.contactPhone;
						html_ += "</td></tr><tr><td>邮箱</td><td>";
						html_ += data.loginName;
						html_ += "</td></tr><tr><td>行业类别</td><td>";
						html_ += data.enterpriseIndustryType;
						html_ += "</td></tr><tr><td>商户来源</td><td>";
						html_ += type;
						html_ += "</td></tr><tr><td>创建时间</td><td>";
						html_ += data.createDate;
						$(".infoDetailsTable").html(html_);
					}else{
						alertErrors("操作失败，请刷新再试", 3000);
					}
				},
				
				error : function(e) {
				}
			});
		 	$(".success_case_content").hide();
 			$(".success_case_content").next(".infoDetails").show();
		
	 }
	//绑定修改序号事件
	 function openUpdate(userId){
	 	$("#updateArr").unbind("click");
	 	$("#updateArr").click(function(){
	 		updateArray(userId);
	 	});
	 	
	 }
	function updateArray(userId){
		var opId = "";
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			url : webRoot + "/succCase/findArrayByUserId.do?current_date=" + new Date().getTime(),
			data : {userId:userId},
			success : function(data) {
				if(data!=null){
				 opId = data.position;
				}
			},
			
			error : function(e) {
				alertErrors("操作失败，请刷新再试", 3000);
			}
		});
		
		var opvalue = $("#opvalue").val();
		if(opId == opvalue){
			return;
		}
		var url_ = webRoot + "/succCase/saveOrUpdateArray.do?current_date=" + new Date().getTime();
		var data = {userId:userId,opvalue:opvalue,}
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			url : url_,
			data : data,
			success : function(data) {
				findArray();
				alertSuccess("更新成功",2500);
			},
			
			error : function(e) {
				alertErrors("操作失败，请刷新再试", 3000);
			}
		});
		
		
	}
	
	function findArray(){
		
		var url_ = webRoot + "/succCase/findArray.do?current_date=" + new Date().getTime();
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			url : url_,
			success : function(data) {
				var ulhtml="";
				for(var i=0;i<7;i++){
					
 					ulhtml+="<li><div class='success_case_logo'><div class='successNoimg'><img src='${path}/resources/images/success/noImg.png'><div>暂无图片</div></div></div><div class='opgName opgNameSty' >___________</div></li>";
 				}
				$(".success_case_top ul").html(ulhtml);
				
				if(data!=null){
 				for(var i=0;i<data.length;i++){
 					$(".success_case_top ul li").eq(data[i].position-1).html("<div class='success_case_logo'><img src="+data[i].enterpriseLogo+" class='success_case_logo_img'><div class='successDelete'><img src='${path}/resources/images/success/success_whilt.png' ><div>删除</div></div></div><div class='opgName'>"+data[i].enterpriseName+"</div>")
  					/* if(i==data[i].position){
 					ulhtml+="<li><div class='success_case_logo'><img src="+data[i].enterpriseLogo+" class='success_case_logo_img'><div class='successDelete'><img src='${path}/resources/images/success/success_whilt.png' ><div>删除</div></div></div><div class='opgName'>"+data[i].enterpriseName+"</div></li>";
  					}else{
						ulhtml+="<li><div class='success_case_logo'><div class='successNoimg'><img src='${path}/resources/images/success/noImg.png'><div>暂无图片</div></div></div><div class='opgName opgNameSty' >___________</div></li>";
	
  					} */
 				}
				}
			},
			error : function(e) {
				alertErrors("操作失败，请刷新再试", 3000);
			}
		});
	}
	
	function delteSucc(opsition){
		var data = {optionId:opsition,}
		var url_ = webRoot + "/succCase/delteSucc.do?current_date=" + new Date().getTime();
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			data:data,
			url : url_,
			success : function(data) {
				if(data.msgCode=='1'){
					alertSuccess(data.msg,2500);
				}else if(data.msgCode=='2'){
					alertErrors(data.msg, 3000);				
				}
			},
			error : function(e) {
				alertErrors("操作失败，请刷新再试", 3000);
			}
		});
		findArray();
	}
	
	
	
	
	
	

//		$(".success_case_top ul").html(ulhtml);
//	 $.each(data,function(i){
//		 if(data[i].enterpriseLogo==""){
//			$(this).html('<div class="success_case_logo"><div class="successNoimg"><img src="${path}/resources/images/success/noImg.png"><div>暂无图片</div></div></div><div class="opgName opgNameSty" >___________')
//			}else{
//		 $(this).html('<div class="success_case_logo"><img src='+data[i].enterpriseLogo+' class="success_case_logo_img"><div class="successDelete"><img src="${path}/resources/images/success/success_whilt.png" class="dafd"><div>删除</div></div></div><div class="opgName">'+data[i].enterpriseName+'</div>')
//			}
//		 // $(this).find(".success_case_logo_img").attr("src",data[i].enterpriseLogo);
//			//$(this).find(".opgName").html(data[i].enterpriseName); 
//		}); 
			//	 					$(this).html('<div class="success_case_logo"><div class="successNoimg"><img src="${path}/resources/images/success/noImg.png"><div>暂无图片</div></div></div><div class="opgName opgNameSty" >___________')
//				}else{
//			 $(this).html('<div class="success_case_logo"><img src='+data[i].enterpriseLogo+' class="success_case_logo_img"><div class="successDelete"><img src="${path}/resources/images/success/success_whilt.png" class="dafd"><div>删除</div></div></div><div class="opgName">'+data[i].enterpriseName+'</div>')
//				}
//			 // $(this).find(".success_case_logo_img").attr("src",data[i].enterpriseLogo);
//				//$(this).find(".opgName").html(data[i].enterpriseName); 
//			}); 
	
	
	</script> 

</body>
</html>
﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>亿企联系统发布</title>
	<script type="text/javascript" src="${path}/resources/js/notice/announcemen.js"></script>
</head>
<body>

<div class="system_content_right_top" >
	<!-- 系统公告第一页start -->
	<div class="announcemen-content">
		<div class="announcemen-content-top">系统公告</div>
		<div class="announcemen-content-conditions" >
			<div class="announcemen-content-conditions-top">
				<form action="" id="topSearch">
					<!-- 有数据的情况start -->
                          <table class="conditionsEnd">
                              <tr>
                                  <td style="width: 35%"><div class="app-case-left-width">标&nbsp;&nbsp;&nbsp;&nbsp;题：</div>
                                  <input id="noticeTitle1" name="noticeTitle" type=text class="case-input"  style="width: 70%;margin-left: 5px;"></td>
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
                                      <label for="case-ss0"><div class="app-case-ss"><input type="button" onclick="allNoticePageSize();" value="搜索"  style="display:none;width:108px;height:38px" id="case-ss0" >搜&nbsp;&nbsp;索</div></label>
                                  </td>
                              </tr>
                          </table>
                      </form>
			</div>
			<div class="announcemen-content-conditions-body">
				<div class="userAddBtn conditionsBtn">
					<div class="userAddBtn_left">
							<img src="${path}/resources/images/notice/announce.png">
					</div>
					<div class="userAddBtn_right">发布公告</div>
				</div>
				
				<div class="conditionRow">
					<table class="conditionTable">
						<thead>
							<tr>
								<th style="width: 14%">标题</th>
								<th style="width: 24%">摘要</th>
								<th style="width: 14%">发布时间</th>
								<th style="width: 14%">最近修改时间</th>
								<th style="width: 12%">发布人</th>
								<th style="width: 22%">操作</th>
							</tr>
						</thead>
						<tbody id="ContextList" >
						</tbody>
					</table>
					<!-- 有数据的情况end -->
					<div id="Pagination" class="pagination"></div>
			<p style="display: none">
			<input type="hidden" id="indexPage" value="" />
			<textarea id="SysNoticeConfig-List" rows="0" cols="0">
				  <!--
				  {#template MAIN} 
				  		{#if $T.data.length > 0}
					  		{#foreach $T.data as sn}
					  			<tr>
						  			<td align="center" valign="middle">
						  				{$T.sn.noticeTitle}
						  			</td>
						  			<td align="center" valign="middle">
						  				{$T.sn.noticeCummary}
						  			</td>
						  			<td align="center" valign="middle">
						  				{$T.sn.createDate}
						  			</td>
						  			<td align="center" valign="middle">
						  				{$T.sn.updateDate}
						  			</td>
						  			<td align="center" valign="middle">
						  				{$T.sn.operName}
						  			</td>
						  			<td align="center" valign="middle" class="conditionTableLast">
						  				
				  					<div><a href="javascript:void(0);" onclick="showNoticeDetail('{$T.sn.id}');"class="systemDetailsOPEN">详情 </a></div>
				  			
				  					<div><a href="javascript:void(0);" onclick="updateNoticeDetail('{$T.sn.id}');">修改 </a></div>
						  				
				  				<div><a href="javascript:void(0);" onclick="openNoticeDel('noticeDelete','{$T.sn.id}')"class="click_open_id conditionTableDelete"  popName="announcemen-delete">删除 </a></div>
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

			<!-- 分页 -->
			<div class="manages-page"></div>
		</div>

	</div>
	<!-- 系统公告第一页end -->

	<!-- 发布公告start -->
	<div class="releaseNte-content" style="display: none">
		<div class="announcemen-content-top">发布公告</div>
		<div class="announcemen-content-conditions" >
			<div class="releaseNte-contentName">
				<div class="contentNameLeft">公告名称</div>
				<div class="contentNameRight">
				<input id="noticeTitle2" name="noticeTitle" type="text" class="contentNameText" placeholder="最多20字" maxlength="20">还能输入<span class="counter">20</span>字
				<input id="sysNoticeId" name="noticeTitle" type="hidden" >
				<div class="user_info">公告名称不能为空</div>
				</div>
			</div>
			<div class="releaseNte-contentName">
				<div class="contentNameLeft">标题图片</div>
				<div class="contentNameRight">
				<div class="releaseCar">文件大小不超过2M，文件格式为bmp、png、jpg、jpeg</div>
				<div class="releaseEnter click_open_id addImg" popName="announcemenAddImages" >上传文件</div>
				<div class="fileEnterImg"></div>
				<div class="user_info">标题图片不能为空</div>
				</div>
			</div>
			<div class="releaseNte-contentName">
				<div class="contentNameLeft">公告内容</div>
				<div class="contentNameRight">
					<div class="goods_desc" style="width:auto;">
					<div class="goods_desc_content" style="width:auto;">
					<div id="CommoInfo" style="table-layout: fixed;word-break: break-all;overflow: hidden;">
     				</div>
						<div id = "addcontent" class="contentNameBoxAdd">
							<div class="addContentbottom">
								<div class="click_open_id addImg" popName="announcemenAddImages" style="cursor: pointer;">
									<img src="${path}/resources/images/notice/addimage.png">
									<div >添加图片</div>
								</div>
								<div class="click_open_id addTextarea" popName="announcemenAddText" style="cursor: pointer;">
									<img src="${path}/resources/images/notice/addtext.png">
									<div>添加文字</div>
								</div>
							</div>
						</div>
					</div>
					</div>
					<div class="user_info">公告内容不能为空</div>
				</div>
		<!-- 	<div class="releaseNte-contentName">
				<div class="contentNameLeft">是否高亮</div>
				<div class="contentNameRight">
					<div class="contentBright"> 
						<input type="radio"name="isHighlight" value="0" checked="checked"> 高亮
						<input type="radio" name="isHighlight" value="1"> 正常
					</div>
				</div>-->
			</div> 
			<div class="releaseNte-contentName">
				<div class="contentNameLeft">是否推荐</div>
				<div class="contentNameRight">
					<div class="contentBright">
						<input type="radio" id="noticeLevel" name="noticeLevel" value="1"checked="checked"> 是
						<input type="radio" id="noticeLevel" name="noticeLevel" value="2"> 否
					</div>
				</div>
			</div>
			</div>
			<div class="ReleaseForm" onclick="saveOrUpdateNoticeMessage()">发&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;布</div>
		<!-- </div> -->
	</div>
		<!-- 发布公告end -->
		
		<!-- 详情start -->
		<div class="systemDetails" style="display: none">
			<div class="announcemen-content-top">发布详情</div>
			<div class="announcemen-content-conditions systemDetailsDIV">
				<h1 id="title"></h1>
				<div>
					来自<span style="color: red" id="operName"></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<time id="time"></time>
				</div>
				<div id="CommoInfoShow"
					class="goods_desc_content js_goods_desc_content"></div>
			</div>
		</div>
		<!-- 详情end -->

		<!-- 弹出框 -->
<!--删除该商品  弹出框 start-->
         <div class="Pop_layer"  id="announcemen-delete" popName="announcemen-delete"  style="display:none;">
             <div class="latest_activity_pop">
                 <div class="latest_activity_pop_close">
                     <a class="latest_activity_pop_close_a  click_close_id"   popName="announcemen-delete"  href="javascript:void(0);"></a>
                 </div>
                 <div class="latest_activity_pop_con">
                     <div class="latest_activity_pop_con_t">
                         删除公告
                     </div>
                     <div class="latest_activity_pop_con_c" style="text-align:center;">
                         确认要删除该公告吗？
                     </div>
                 </div>
                 <div class="latest_activity_pop_btn">
                     <a class="latest_activity_pop_btn_follow click_close_id deleteBtn" id="delNotice"  popName="announcemen-delete" href="javascript:void(0);">确认</a>
                     <a class="latest_activity_pop_btn_no click_close_id"  popName="announcemen-delete" href="javascript:void(0);">取消</a>
                 </div>
             </div>
         </div>
         <!--删除该商品 弹出框 end-->
         <!-- 添加图片弹出框 start -->
          <div id="Pop_layer" class="Pop_layer"  popName="announcemenAddImages" style="display: none;text-align: left;" >
             <div class="Pop_layer_box">
                 <div class="pop_layer_title">
                     <span class="pop_layer_title_span">选择图片</span>
                     <span class="pop_layer_title_span_close">
                         <a class="pop_layer_title_span_close_a click_close_id"  popName="announcemenAddImages"  href="javascript:void(0);"></a>
                     </span>
                 </div>
                 <div class="new_member_pop" style="width: 850px;">            
                    <div class="dialog_wrp_img_pop">
		        	<div class="dialog_wrp_img_pop_btn" style="overflow:hidden;position:relative;">
					<label for="noticeFileToUpload">
		                <div id="filesDiv" class="dialog_wrp_img_pop_btn dialog_wrp_img_pop_btn_wechat" style="float:right;width:80px;text-align:center;position:relative;padding: 0 10px;height: 30px;line-height: 30px;background: #ff0202;cursor: pointer;color: #fff;z-index:2;border-radius: 5px;overflow: hidden;margin: 5px 10px;">
							本地上传
		                </div>
               		</label>
                 <input class="apply_wechat_one_merchant_file_btn_a" style="width:0;height:0;opacity:0;position:absolute;z-index:0" accept='.BMP,.jpg,.jpeg,.png' type="file" id="noticeFileToUpload"  onchange="onUpLoadImgMaterail()" name="file"/>
		            </div>
		            <div class="dialog_wrp_img_pop_con">
		            	<ul id="imageFormat" class="dialog_wrp_img_pop_con_ul">
		                    <div style="clear:both;"/>
		                </ul>
		            </div>
		        </div>
                     
                     <div class="clear"></div>
                     </div>
                 </div>
                 <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
                     <a class="perfect_information_pop_button_sure click_close_id addImgSure" popName="announcemenAddImages" href="javascript:void(0); ">确定</a>
                     <a class="perfect_information_pop_button_cancel click_close_id"  popName="announcemenAddImages" href="javascript:void(0);">取消</a>
                 </div>
             </div>
         </div>   
         <!-- 添加图片弹出框 end -->

         <!-- 添加文字弹出框 start -->
         <div class="Pop_layer" popName="announcemenAddText" style="display: none;text-align: left;" >
             <div class="Pop_layer_box" style="width: 650px;">
                 <div class="pop_layer_title">
                     <span class="pop_layer_title_span">添加文字</span>
                     <span class="pop_layer_title_span_close">
                         <a class="pop_layer_title_span_close_a click_close_id" popName="announcemenAddText"  href="javascript:void(0);"></a>
                     </span>
                 </div>
                 <div class="new_member_pop" style="width: 650px;">            
                     <div class="new_member_pop_box">	                            
                     	<div class="AddTextTextarea">
                     		<textarea cols="90" rows="16" maxlength="1000"></textarea>
                     	</div>
                     <div class="clear"></div>
                     </div>
                 </div>
                 <div class="perfect_information_pop_button perfect_information_pop_button_wechat">
                     <a class="perfect_information_pop_button_sure click_close_id AddTextareaSure" popName="announcemenAddText" href="javascript:void(0); ">确定</a>
                     <a class="perfect_information_pop_button_cancel click_close_id"  popName="announcemenAddText" href="javascript:void(0);">取消</a>
                 </div>
             </div>
         </div>
         <!-- 添加文字弹出框 end -->
         <script type="text/javascript">
         $(function(){
		//分页总条数
			allNoticePageSize();
			$(".releaseEnter ").click(function(){
				addLogo=true;
			})
			
			$("#Pop_layer .click_close_id").click(function(){
				addLogo=false;
			})
         })
	</script> 

</body>
</html>
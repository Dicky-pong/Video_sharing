/**
 * 微商城首页js
 */
$(function() {
	$("input[name='templateContent']").each(  
			function(){  
				var tempUrl = basePath + "template/loadStoreTemplateData.do?templateId="+$(this).val()+"&serial="+ $(this).attr("data-serial")
					+"&current_date=" + new Date().getTime();
				$("#templateContent_"+$(this).val()).load(tempUrl,{random:Math.random()});
			}  
		);
});

var mallIndex = {
	/**
	 * 点击商品名称修改， 显示input
	 */
	onEditMallName : function(e) {
		var id = $(e).attr("data-id");
		$("#spanHtml_" + id).hide();
		$("#inputSpan_" + id).show();
		$("#templateButton_" + id).hide();
		$("#mallNameInput_" + id).focus();
	},

	/**
	 * 鼠标移开输入框，如果没有更改则还原，否则发送请求替换结果
	 */
	onBlurUpdateName : function(oldName, value, id) {
		if(oldName.trim() == value.trim()) {
			$("templateButton_" + id).show();
			$("#spanHtml_" + id).text(value.replace(/</,"&lt;")).show();
			$("#inputSpan_" + id).hide();
			$("#templateTitle_" + id).text(value.replace(/</,"&lt;"));
			return;
		}
		var url_ = basePath + "/template/method/modityTemplateName.do";
		var data = {
				templateId : id,
				templateName : value
		};
		$.ajax({
			url : url_,
			data : data,
			type : "POST",
			async : false,
			dataType : "json",
			success : function(data) {
				if (data == "0") {
					$("templateButton_" + id).show();
					$("#spanHtml_" + id).text(value.replace(/</,"&lt;")).show();
					$("#inputSpan_" + id).hide();
					$("#templateTitle_" + id).text(value.replace(/</,"&lt;"));
				}
			},
			error : function(data){
				alert("error");
			}
		});
	}
};
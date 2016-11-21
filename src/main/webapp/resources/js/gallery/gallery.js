/**
 * 交易详情
 */

var params = {};
var pageIndexs = 0;

$(function(){
	//设置复选框鼠标事件隐藏和显示
    $(".videoDiv").mouseover(function(){
        $(this).find(".checkDiv").show();
    });
	onLoadStoreDeals();
});



//===========================分页加载时间========================================
function onLoadStoreDeals() {
//	$(".alert_cover").show();
//	alertLoading("正在加载，请稍后", 10000);
	var param = params;
	param['pageIndex'] = 1;
	param['pageSize'] = 16;
	param['isQueryList'] = false;
	$.ajax({
		url:basePath + 'file/ajaxMyFile.do',
		type: 'POST',
		dataType: 'json',
		data:param,
		success:function(data){
			//if(data != null){
				var pageTotal = data.pageCount;
				//if(pageTotal && pageTotal > 0) {
					//初始化分页控件
					initPagination("Pagination",pageTotal, data.pageSize,"initPage");
					
			//	}else{
				/*	alertHide();
					$(".alert_cover").hide();
					$("#dealListView").html("");
					$("#Pagination").html("");
				}*/
				
		//	}
		},
		error : function(e) {
			/*alertHide();
			$(".alert_cover").hide();*/
		}
	});
}

function initPage(pageIndex) {
	var param = params;
	pageIndexs = pageIndex;
	param['pageIndex'] = pageIndex;
	param['pageSize'] = 16;
	param['isQueryList'] = true;
	
	$.ajax({
		url:basePath + 'file/ajaxMyFile.do',
		data:param,
		type : "POST",
		async : false,
		dataType : "json",
		success : function(data) {
		//	alertHide();
		//	$(".alert_cover").hide();
		//	if(null != data){
			console.log(data);
				$("#dealListView").setTemplateElement("deal-List");
				$("#dealListView").processTemplate(data);
		//	}
		}
	});
}
//==============================================================================
function viewFile(fileUrl,fileName){
    $.get(path+"/file/getDownloadUrl.do",{key:fileUrl},
        function(data){
            //1.在新窗口播放视频
            //window.open(data.downloadUrl);
            //2.弹出iframe层-多媒体
            /*layer.open({
                type: 2,
                title: false,
                area: ['800px', '450px'],
                shade: 0.8,
                //maxmin: true,
                //closeBtn: 0,
                //shadeClose: true,
                content: data.downloadUrl
                //content:"<video style='position:fixed; top:0; left:0; width:100%; height:100%' src='" + data.downloadUrl +
                //    "' controls='controls' autoplay='autoplay' height='450px' width='800px'></video>"

            });
            $('iframe').attr("allowfullscreen","");
            layer.msg(fileName+'正在播放',{time:2000});*/
            //3.自定义弹出层预览文件
            var fileType = fileUrl.substring(fileUrl.lastIndexOf(".")+1).toLowerCase();
            if(/^(doc|docx|xls|xlsx|ppt|pptx|pdf|txt)$/.test(fileType)){    //文本文件预览
                //window.open("http://officeweb365.com/o/?i="+9755+"&furl="+data.downloadUrl);  //office web 365
                var textUrl = encodeURIComponent(data.downloadUrl);
                //window.open("http://view.officeapps.live.com/op/view.aspx?src="+textUrl);    //微软office
                window.open("http://docs.google.com/viewer?url="+textUrl+"&embedded=true");  //google doc
            }else if(/^(flv|mp4|webm|ogg)$/.test(fileType)){    //视频文件预览
                var videoStr = "<video style='width:100%; height:450px' src='" + data.downloadUrl +
                    "' controls='controls' autoplay='autoplay' height='450px' width='800px'></video>";
                $('#lightDiv').find('h4').append(fileName);
                $('#light').append(videoStr);
                opendiv();
            }else if(/^(mp3|acc)$/.test(fileType)){
                layer.open({
                    type: 1,
                    title: [fileName,'background-color:#A94442;color:white;border-bottom:0;'],
                    closeBtn: 1,
                    area: "auto",
                    offset:'rb',
                    shade: 0,
                    content: "<div style='background-color:#101010'><audio src='"+data.downloadUrl+"' controls autoplay>无法播放音乐，格式不支持!</audio></div>"
                });
            }else if(/^(gif|jpg|jpeg|png)$/.test(fileType)){    //图像预览
                var photoJson = {
                    "title": "", //相册标题
                    "id": 123, //相册id
                    "start": 0, //初始显示的图片序号，默认0
                    "data": [
                        {
                            "alt": fileName,
                            "pid": 0, //图片id
                            "src": data.downloadUrl, //原图地址
                            "thumb": "" //缩略图地址
                        }
                    ]
                };
                layer.ready(function(){ //为了layer.ext.js加载完毕再执行
                    layer.photos({
                        photos: photoJson
                    });
                });
            }else{
                layer.alert(fileName+' 不支持在线预览，请下载文件后用合适的工具打开！', {
                    icon:5,
                    offset:'10%',
                    title:'提示'
                });
            }
        });
}
//=======================================================================================
//观看视频
function opendiv(){
    document.getElementById('light').style.display='block';
    document.getElementById('fade').style.display='block';
    document.body.style.overflow="hidden";	//设置滚动条隐藏
}
function closediv(){
    document.getElementById('light').style.display='none';
    document.getElementById('fade').style.display='none';
    document.body.style.overflow="auto";		//关闭弹窗重新显示滚动条
}
$('#fade').click(function(){    //移除video标签并关闭弹出层
    $('video').remove();
    closediv();
});
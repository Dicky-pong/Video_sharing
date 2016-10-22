var d;
$(document).ready(function (){
	var xmlURL = basePath+"city.xml";
    $.ajax({
        url:xmlURL,
        dataType:"xml",
        success:function(data){
            d = data;
            $(data).find("province").each(function (i){
                //往province中添加值
                $("<option></option>").html($(this).attr("name")).attr("value",$(this).attr("name")).appendTo("#province");
            });
            chpro($("#province").attr("value"));  //选中的值传给chpro函数
        }
    });
});

var c;
function chpro(val){
	
    $("#city").empty();  //清空
    //遍历province的name为val下的city
    $(d).find("province[name='"+val+"']").find("city").each(function (i){
        //往city中添加值  设置属性value的值为当前对象的属性name的值
        $("<option></option>").html($(this).attr("name")).attr("value",$(this).attr("name")).appendTo("#city");
        c = val;
        chcity($("#city").attr("value"));
    });
}

function chcity(val){
    $("#area").empty();
    //遍历province的name为c下的city的name为val下的area
    $(d).find("province[name='"+c+"']").find("city[name='"+val+"']").find("area").each(function (i){
		$("<option></option>").html($(this).attr("name")).attr("value",$(this).attr("name")).appendTo("#area");
    });
}

function loadAddressXml(){
	
}
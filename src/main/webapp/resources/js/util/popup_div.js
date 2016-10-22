

function couponsPopDiv(title,context,bar){
	
	$(".Cover_layer").show();
	$("#createSuccess_div").css("left", $(window).width() / 2 - ($("#createSuccess_div").width() / 2))
  	$("#createSuccess_div").css("top", $(window).height() / 2 - ($("#createSuccess_div").height() / 2))
	$("#createSuccess_div").fadeIn();
	$("#coupons_title_div").html(title);
	$("#coupons_context_div").html(context);
	$("#coupons_operation_bar").html(bar);
	
}

function closeCouponsDiv(){
	$(".Cover_layer").fadeOut();
	$("#createSuccess_div").hide();
}
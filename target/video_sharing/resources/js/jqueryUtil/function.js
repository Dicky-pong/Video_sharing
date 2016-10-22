$(function(){
	
	if($(".lmw660").height()<$(".lmw330").height()){$(".lmw660").height($(".lmw330").height());}else{$(".lmw330").height($(".lmw660").height());}
	if($(".lmw690").height()<$(".lmw300").height()){$(".lmw690").height($(".lmw300").height());}else{$(".lmw300").height($(".lmw690").height());}
	if($(".lmw400").height()<$(".lmw590").height()){$(".lmw400").height($(".lmw590").height());}else{$(".lmw590").height($(".lmw400").height());}
	var lmw244=$(".lmw244");
	var h244=0;
	for(var i=0;i<$(lmw244).length;i++){
		if($(lmw244).eq(i).height()>h244){h244=$(lmw244).eq(i).height();}
	}
	$(lmw244).height(h244);
	var lmw328=$(".lmw328");
	var h328=0;
	for(var i=0;i<$(lmw328).length;i++){
		if($(lmw328).eq(i).height()>h328){h328=$(lmw328).eq(i).height();}
	}
	$(lmw328).height(h328);
	var lmw495=$(".lmw495");
	var h495=0;
	for(var i=0;i<$(lmw495).length;i++){
		if($(lmw495).eq(i).height()>h495){h495=$(lmw495).eq(i).height();}
	}
	$(lmw495).height(h495);
	
	$(".list2 tr").hover(
		function(){
			$(this).addClass("onhover");
		},function(){
			$(this).removeClass("onhover");
		}
	);
	$(".tab2 tr").hover(
		function(){
			$(this).addClass("onhover");
		},function(){
			$(this).removeClass("onhover");
		}
	);
	$(".tab3 td").hover(
		function(){
			$(this).addClass("onhover");
		},function(){
			$(this).removeClass("onhover");
		}
	);
	$(".list3 li").hover(
		function(){
			$(this).addClass("onhover");
		},function(){
			$(this).removeClass("onhover");
		}
	);
	
	$(".menu li").hover(
		function(){
			$(".menu li dl").hide();
			$(this).find("dl").stop().show();
			$(this).find("dl").css({"z-index":1});
		},function(){
			$(this).find("dl").stop().hide();
			$(this).find("dl").css({"z-index":0});
		}
	);
	
	$("#baiduTJ").attr("src","http://tongji.baidu.com/web/welcome/ico?s=630eda1b155b251b552e104334e4c77b");
	
	window.onresize=findDimensions;
	
	$(".ntab").scroll(function(){
		$(".ntab1").show()
		$(".ntab1 table tr").html($(".ntab table").last().find("tr").eq(0).html())
		$(".ntab1 table tr th").each(function(){
			$(this).width($(".ntab table").last().find("th").eq($(this).index()).width())
		})
		$(".ntab1").css("top",$(this).scrollTop())
	})
});

function findDimensions(){
	var winWidth = 0;
	var winHeight = 0;
	if(window.innerWidth){
		winHeight = window.innerHeight;
	}else if((document.body) && (document.body.clientWidth)){
		winHeight = document.body.clientHeight;
	}
	if(document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth){
		winHeight = document.documentElement.clientHeight;
	}
	$(".winTips .tips").attr("style","margin:"+(winHeight-$(".winTips .tips").height())/2+"px auto;")
} 

function winTips(f){
	if(f=="s"){
		$(".winTips").fadeIn(200);
	}else if(f=="h"){
		$(".winTips").fadeOut(200);
	}
	findDimensions();
}

function demandsShowErr(str,t){
	$(".txt").focus();
	$(".errbox").html(str);
	$(".errbox").slideDown(200);
	setTimeout("$('.errbox').slideUp(200)",t)
}

$(window).scroll(function(){
	$(".rbtn").css("top",$(window).scrollTop()+71)
})

function backTop(){
	$(window.top.document).find("html,body").animate({scrollTop:0},300);
}

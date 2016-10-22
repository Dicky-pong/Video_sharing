
// 左侧内容区导航
	/*
    *  联动效果
    *  运用方法   页面加载完 运行 linkages(scopes,controllers,objectives);
    *  scopes: 区域；   controllers:  点击的元素    objectives: 需要操作的元素
    */
	var linkages=function (scopes,controllers,objectives){
        // $(controllers,$(scopes)).hide();
        $(objectives,$(scopes)).hide();
        $(scopes).on("click",controllers,function(){
          $(objectives,$(scopes)).addClass("slideToggles");
          if($(this).next(objectives).is(":animated")) return false;
          $(this).next(objectives).removeClass("slideToggles").slideToggle(0);
          $(this).parents(objectives).removeClass("slideToggles");
          $(".slideToggles",$(scopes)).slideUp(100);
        })
    }
  $(function(){
    linkages(".system_content_left_nav",".content_maneges_dd",".content_next_dl");


  	$(".addNextLevel").click(function(){
  		if($(this).next(".content_next_dl").is("animated")) return false; 
  		if($(this).hasClass("addNextLevel_dd")){
          $(this).removeClass("addNextLevel_dd");
  		}else{
          $(this).addClass("addNextLevel_dd");
  		}

    })
    $(".content_maneges_dd").click(function(){
      $(this).siblings().find("dl>dd").removeClass("systemOn");
      $(this).siblings().removeClass("addNextLevel_dd");
    })
    $(".system_content_left_nav_dl>dd").click(function(){
      $(this).closest("dl").find("dd").removeClass("systemInfo");
      $(this).addClass("systemInfo");
      $(".content_next_dd").click(function(){
        $(this).addClass("systemOn");
        $(this).siblings(".content_next_dd").removeClass("systemOn");
      })


    })


})
  	



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link rel="stylesheet" href="/static/moco/v1.0/dist/css/moco.min.css?t=201610172229" type="text/css" />
<link rel="stylesheet"  href="${path}/resources/css/main.css" type="text/css"/>

<script type="text/javascript">

eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}('!4(){3 6=a;3 l=4(){3 b,e=9 y("(^| )"+"c=([^;]*)(;|$)");j(b=h.g.z(e)){k w(b[2])}x{k a}};3 8=4(t){3 f=l();3 7=9 o();7.A(7.d()+B*i*i*r);h.g="c="+t+";s="+7.M()+";N=/;L=O.m";j(t&&t!=f){Q.P.G()}};3 5=9 E();5.H=4(){K(6);6=a;8(0)};5.J=4(){8(1)};6=I(4(){5.n="";8(1)},F);5.n=\'R://p.u.m/p/v/q/D.C?t=\'+9 o().d()}()',54,54,'|||var|function|imgobj|timer|exp|setcookie|new|null|arr|IMCDNS|getTime|reg|_0|cookie|document|60|if|return|getcookie|com|src|Date|static|common|1000|expires||mukewang|img|unescape|else|RegExp|match|setTime|24|png|logo|Image|3000|reload|onload|setTimeout|onerror|clearTimeout|domain|toGMTString|path|imooc|location|window|http'.split('|'),0,{}))

</script>
<script type="text/javascript">

//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外  
function banBackSpace(e){     
    var ev = e || window.event;//获取event对象     
    var obj = ev.target || ev.srcElement;//获取事件源     
      
    var t = obj.type || obj.getAttribute('type');//获取事件源类型    
      
    //获取作为判断条件的事件类型  
    var vReadOnly = obj.getAttribute('readonly');  
    var vEnabled = obj.getAttribute('enabled');  
    //处理null值情况  
    vReadOnly = (vReadOnly == null) ? false : vReadOnly;  
    vEnabled = (vEnabled == null) ? true : vEnabled;  
      
    //当敲Backspace键时，事件源类型为密码或单行、多行文本的，  
    //并且readonly属性为true或enabled属性为false的，则退格键失效  
    var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea")   
                && (vReadOnly==true || vEnabled!=true))?true:false;  
     
    //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效  
    var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")  
                ?true:false;          
      
    //判断  
    if(flag2){  
        return false;  
    }  
    if(flag1){     
        return false;     
    }     
}  
  
//禁止后退键 作用于Firefox、Opera  
document.onkeypress=banBackSpace;  
//禁止后退键  作用于IE、Chrome  
document.onkeydown=banBackSpace; 

/* $(function(){
	$('#scroll').owlCarousel({
		items: 4,
		autoPlay: true,
		navigation: true,
		navigationText: ["",""],
		scrollPerPage: true
	});
	
	DD_roundies.addRule('.div_circle', '45px 45px 45px 45px', true);
}); */

</script>

<script type="text/javascript">

var OP_CONFIG={"module":"index","page":"index"};
var isLogin = 0;
var is_choice = "";
var seajsTimestamp="v=201610172229";

</script>




<script>
var _hmt = _hmt || [];
</script>


<style type="text/css">
    .warn-info{
        font-size: 16px;
        line-height: 28px;
    }
    .warn-tip{
        color: #999;
        margin-top: 30px;
    }
    .warn-tip a{
        color: #08c !important;
    }
    </style>
<link rel="stylesheet" href="http://static.mukewang.com/static/css/??base.css,common/common-less.css?t=4,index_v2-less.css?v=1.0,poplogin-less.css?v=201610172229" type="text/css" />
</head>
<body  id="index">
<div class="bk">

</div>
<!-- 页面展示层 start -->
	<div class="g-banner pr">
		<div class="menuwrap"></div>
		<div class="submenu a hide">
			<div class="innerBox"
				style="background-image: url(/static/img/home/fe.png); background-size: 100%;">
				<div class="subinnerBox">
					<div class="title">分类目录</div>

					<span class="bold mr10">基础：</span> <a target="_blank"
						href="/course/list?c=html">HTML/CSS</a><span class="ml10 mr10">/</span>
					<a target="_blank" href="/course/list?c=javascript">JavaScript</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=jquery">jQuery</a><br /> <span
						class="bold mr10">进阶：</span> <a target="_blank"
						href="/course/list?c=html5">Html5</a><span class="ml10 mr10">/</span>
					<a target="_blank" href="/course/list?c=CSS3">CSS3</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=nodejs">Node.js</a><span class="ml10 mr10">/</span>
					<a target="_blank" href="/course/list?c=angularjs">AngularJS</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=bootstrap">Bootstrap</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=Reactjs">React</a><span class="ml10 mr10">/</span>
					<a target="_blank" href="/course/list?c=sassless">Sass/Less</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=vuejs">Vue.js</a><span class="ml10 mr10">/</span>
					<a target="_blank" href="/course/list?c=webapp">WebApp</a><br /> <span
						class="bold mr10">其它：</span> <a target="_blank"
						href="/course/list?c=fetool">前端工具</a>


					<div class="title recommend">推荐</div>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏前端推荐位'])"
							href="/learn/473" data-track="syqd-1-1"
							data-ast="qianduantj_1_473">课程 | CSS3图片动态提示效果</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏前端推荐位'])"
							href="/learn/24" data-track="syqd-1-2" data-ast="qianduantj_1_24">课程
							| HTML5之元素与标签结构</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏前端推荐位'])"
							href="/learn/141" data-track="syqd-1-3"
							data-ast="qianduantj_1_141">课程 | 玩转Bootstrap（基础）</a>
					</p>
				</div>
			</div>
		</div>

		<div class="submenu b hide">
			<div class="innerBox "
				style="background-image: url(/static/img/home/be.png); background-size: 100%;">
				<div class="subinnerBox">
					<div class="title">分类目录</div>
					<a target="_blank" href="/course/list?c=php">PHP</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=java">Java</a><span class="ml10 mr10">/</span>

					<a target="_blank" href="/course/list?c=python">Python</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=C">C</a><span class="ml10 mr10">/</span> <a
						target="_blank" href="/course/list?c=C+puls+puls">C++</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=Go">Go</a><span class="ml10 mr10">/</span> <a
						target="_blank" href="/course/list?c=C%23">C#</a><span
						class="ml10 mr10">/</span>

					<div class="title recommend">推荐</div>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏后端推荐位'])"
							href="/learn/466" data-track="syhd-1-1"
							data-ast="houduantj_1_466">课程 | 使用Struts2+Hibernate开发学生信息管理功能</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏后端推荐位'])"
							href="/learn/115" data-track="syhd-1-2"
							data-ast="houduantj_1_115">课程 | PHP实现验证码制作</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏后端推荐位'])"
							href="/learn/491" data-track="syhd-1-3"
							data-ast="houduantj_1_491">课程 | 与《Yii框架》不得不说的故事—扩展篇</a>
					</p>
				</div>
			</div>
		</div>

		<div class="submenu c hide">
			<div class="innerBox "
				style="background-image: url(/static/img/home/mobile.png); background-size: 100%;">
				<div class="subinnerBox">
					<div class="title">分类目录</div>
					<a target="_blank" href="/course/list?c=android">Android</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=ios">iOS</a><span class="ml10 mr10">/</span>

					<a target="_blank" href="/course/list?c=Unity+3D">Unity 3D</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=Cocos2d-x">Cocos2d-x</a><span
						class="ml10 mr10">/</span>

					<div class="title recommend">推荐</div>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏移动推荐位'])"
							href="/learn/720" data-track="syyd-1-1" data-ast="yidongtj_1_720">课程
							| Android Data Binding实战-高级篇</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏移动推荐位'])"
							href="/learn/442" data-track="syyd-1-2" data-ast="yidongtj_1_442">课程
							| iOS动画案例之会跳舞的界面(下)</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏移动推荐位'])"
							href="/learn/468" data-track="syyd-1-3" data-ast="yidongtj_1_468">课程
							| Android-Volley详解</a>
					</p>
				</div>
			</div>
		</div>

		<div class="submenu d hide">
			<div class="innerBox "
				style="background-image: url(/static/img/home/data.png); background-size: 100%;">
				<div class="subinnerBox">
					<div class="title">分类目录</div>
					<a target="_blank" href="/course/list?c=mysql">MySQL</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=mongodb">MongoDB</a><span class="ml10 mr10">/</span>

					<a target="_blank" href="/course/list?c=Oracle">Oracle</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=SQL+Server">SQL Server</a><span
						class="ml10 mr10">/</span>

					<div class="title recommend">推荐</div>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏数据库推荐位'])"
							href="/learn/614" data-track="sydata-1-1"
							data-ast="shujutj_1_614">课程 | MongoDB复制集—复制集安全</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏数据库推荐位'])"
							href="/learn/589" data-track="sydata-1-2"
							data-ast="shujutj_1_589">课程 | MySQL5.7复制功能实战</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏数据库推荐位'])"
							href="/learn/449" data-track="sydata-1-3"
							data-ast="shujutj_1_449">课程 | MySQL开发技巧（三）</a>
					</p>
				</div>
			</div>
		</div>



		<div class="submenu e hide">
			<div class="innerBox "
				style="background-image: url(/static/img/home/yjs.png); background-size: 100%;">
				<div class="subinnerBox">
					<div class="title">分类目录</div>
					<a target="_blank"
						href="/course/list?c=%E5%A4%A7%E6%95%B0%E6%8D%AE">大数据</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=cloudcomputing">云计算</a><span
						class="ml10 mr10">/</span>

					<div class="title recommend">推荐</div>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏云计算推荐位'])"
							href="/learn/640" data-track="sycloud-1-1"
							data-ast="shejitj_1_640">课程 | R语言之数据可视化</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏云计算推荐位'])"
							href="/learn/736" data-track="sycloud-1-2"
							data-ast="shejitj_1_736">课程 | Python-走进Requests库</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏云计算推荐位'])"
							href="/learn/292" data-track="sycloud-1-3"
							data-ast="shejitj_1_292">课程 | 云计算 - 引领阿里生态的技术发展之路</a>
					</p>
				</div>
			</div>
		</div>

		<div class="submenu f hide">
			<div class="innerBox "
				style="background-image: url(/static/img/home/yw.png); background-size: 100%;">
				<div class="subinnerBox">
					<div class="title">分类目录</div>
					<a target="_blank" href="/course/list?c=test">测试</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=linux">Linux</a><span class="ml10 mr10">/</span>

					<div class="title recommend">推荐</div>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏运维推荐位'])"
							href="/learn/522" data-track="syyw-1-1" data-ast="shejitj_1_522">课程
							| Shell典型应用之主控脚本实现</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏运维推荐位'])"
							href="/learn/540" data-track="syyw-1-2" data-ast="shejitj_1_540">课程
							| Shell典型应用之应用日志分析</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏运维推荐位'])"
							href="/learn/481" data-track="syyw-1-3" data-ast="shejitj_1_481">课程
							| Linux权限管理之基本权限</a>
					</p>
				</div>
			</div>
		</div>

		<div class="submenu g hide">
			<div class="innerBox "
				style="background-image: url(/static/img/home/photo.png); background-size: 100%;">
				<div class="subinnerBox">
					<div class="title">分类目录</div>
					<a target="_blank" href="/course/list?c=photoshop">Photoshop</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=maya">Maya</a><span class="ml10 mr10">/</span>

					<a target="_blank" href="/course/list?c=premiere">Premiere</a><span
						class="ml10 mr10">/</span> <a target="_blank"
						href="/course/list?c=ZBrush">ZBrush</a><span class="ml10 mr10">/</span>

					<div class="title recommend">推荐</div>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏视觉推荐位'])"
							href="/learn/576" data-track="sysj-1-1" data-ast="shejitj_1_576">课程
							| 跟我学做变形金刚CG短片</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏视觉推荐位'])"
							href="/learn/549" data-track="sysj-1-2" data-ast="shejitj_1_549">课程
							| 手机UI设计基础-尺寸</a>
					</p>
					<p class="w625 h32">
						<a target="_blank"
							onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏视觉推荐位'])"
							href="/learn/160" data-track="sysj-1-3" data-ast="shejitj_1_160">课程
							| “Doge”变身术 </a>
					</p>
				</div>
			</div>
		</div>


		<div class="menuContent">
			<div class="item" data-id="a">
				<a href="/course/list?c=fe" target="_blank"> <span class="group">前端开发</span>
					<i class='icon-right2'></i>
				</a>
			</div>

			<div class="item" data-id="b">
				<a href="/course/list?c=be" target="_blank"> <span class="group">后端开发</span>
					<i class='icon-right2'></i>
				</a>
			</div>
			<div class="item" data-id="c">
				<a href="/course/list?c=mobile" target="_blank"> <span
					class="group">移动开发</span> <i class='icon-right2'></i>
				</a>
			</div>
			<div class="item" data-id="d">
				<a href="/course/list?c=data" target="_blank"> <span
					class="group">数据库</span> <i class='icon-right2'></i>
				</a>
			</div>
			<div class="item" data-id="e">
				<a href="/course/list?c=cb" target="_blank"> <span class="group">云计算&大数据</span>
					<i class='icon-right2'></i>
				</a>
			</div>
			<div class="item" data-id="f">
				<a href="/course/list?c=op" target="_blank"> <span class="group">运维&测试</span>
					<i class='icon-right2'></i>
				</a>
			</div>
			<div class="item" data-id="g">
				<a class="bbn" href="/course/list?c=photo" target="_blank"> <span
					class="group">视觉设计</span> <i class='icon-right2'></i>
				</a>
			</div>
		</div>

		<div class="g-banner-content">



			<a target="_blank"
				onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏幻灯推荐位'])"
				href=" http://coding.imooc.com/class/57.html"
				data-track="banner-1-1" data-ast="bigbanner1_1_57"
				class="click-help">
				<div class="banner-slide"
					style="background-image: url(http://img.mukewang.com/580826ad0001ed0012000460.jpg);">
					<div class="inner"></div>
				</div>
			</a> <a target="_blank"
				onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏幻灯推荐位'])"
				href=" http://coding.imooc.com/class/56.html"
				data-track="banner-1-2" data-ast="bigbanner1_1_56"
				class="click-help">
				<div class="banner-slide"
					style="background-image: url(http://img.mukewang.com/580826df000156bf12000460.jpg);">
					<div class="inner"></div>
				</div>
			</a> <a target="_blank"
				onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏幻灯推荐位'])"
				href=" http://coding.imooc.com/class/38.html"
				data-track="banner-1-3" data-ast="bigbanner1_1_38"
				class="click-help">
				<div class="banner-slide"
					style="background-image: url(http://img.mukewang.com/580826ff00016c6412000460.jpg);">
					<div class="inner"></div>
				</div>
			</a>
		</div>
		<div class="banner-dots"></div>
		<a href="javascript:;" class="banner-anchor prev"
			style="display: none">上一张</a> <a href="javascript:;"
			class="banner-anchor next" style="display: none">下一张</a>
		<div class="cb"></div>

	</div>
<!-- 页面展示层 end -->

<!-- 视频显示层 start -->
<div class="outwrap-recomend">
    <div class="contentwrap">
        <div class="recomend">实战推荐 <a class="fr" onclick="_hmt.push(['_trackEvent', '首页', 'click', '二屏实战推荐更多'])" href="http://coding.imooc.com" target="_blank"><span class="more">更多<i class="icon-right2"></i></span></a> </div>
        <div class="recomendContent clearfix moco-course-list">
           
            
                <div class="moco-course-wrap">
                    <a onclick="_hmt.push(['_trackEvent', '首页', 'click', '二屏实战推荐'])" href="http://coding.imooc.com/class/48.html" target="_blank" data-track="sztj-1-1" data-ast="xiaomutj_1_48">
                    <div class="moco-course-box">
                        <img src="http://szimg.mukewang.com/576376440001766205400300-360-202.jpg" height="124" width="100%">
                        <div class="moco-course-intro">
                            <h3> 前端到后台ThinkPHP开发整站</h3>
                            <p>  用PHP+MySQL+Ajax，页面静态化、数据库备份技术实现你“小全栈”梦想。 </p>
                        </div>
                        <div class="moco-course-bottom"><span class="l color-red">￥128.00</span> <span class="r">1629人在学</span></div>
                    </div>
                    </a>
                </div>
                            
            
                <div class="moco-course-wrap">
                    <a onclick="_hmt.push(['_trackEvent', '首页', 'click', '二屏实战推荐'])" href="http://coding.imooc.com/class/69.html" target="_blank" data-track="sztj-1-2" data-ast="xiaomutj_1_69">
                    <div class="moco-course-box">
                        <img src="http://szimg.mukewang.com/57ec8a820001c60b05400300-360-202.jpg" height="124" width="100%">
                        <div class="moco-course-intro">
                            <h3> React Native联动LBS开发创意App一步到位 </h3>
                            <p>  以讲师真实上线的iOS APP项目讲解，轻松实现一款APP从0到1的突破</p>
                        </div>
                        <div class="moco-course-bottom"><span class="l color-red">￥128.00</span> <span class="r">129人在学</span></div>
                    </div>
                    </a>
                </div>
                            
            
                <div class="moco-course-wrap">
                    <a onclick="_hmt.push(['_trackEvent', '首页', 'click', '二屏实战推荐'])" href="http://coding.imooc.com/class/57.html" target="_blank" data-track="sztj-1-3" data-ast="xiaomutj_1_57">
                    <div class="moco-course-box">
                        <img src="http://szimg.mukewang.com/579190240001d51d05400300-360-202.jpg" height="124" width="100%">
                        <div class="moco-course-intro">
                            <h3> Yii2.0全力出击打造完整电商平台</h3>
                            <p>  完整电商业务流程详解、企业级实战开发环境，购物、下单、支付、收货......各功能模块逐一开发，打造一个京东模式电商平台</p>
                        </div>
                        <div class="moco-course-bottom"><span class="l color-red">￥268.00</span> <span class="r">487人在学</span></div>
                    </div>
                    </a>
                </div>
                            
            
                <div class="moco-course-wrap">
                    <a onclick="_hmt.push(['_trackEvent', '首页', 'click', '二屏实战推荐'])" href="http://coding.imooc.com/class/50.html" target="_blank" data-track="sztj-1-4" data-ast="xiaomutj_1_50">
                    <div class="moco-course-box">
                        <img src="http://szimg.mukewang.com/576b84c10001b1c005400300-360-202.jpg" height="124" width="100%">
                        <div class="moco-course-intro">
                            <h3> 所向披靡的响应式开发</h3>
                            <p>  忘记设备尺寸，一套代码适配多终端，响应式开发让用户体验和开发效率完美结合</p>
                        </div>
                        <div class="moco-course-bottom"><span class="l color-red">￥128.00</span> <span class="r">1593人在学</span></div>
                    </div>
                    </a>
                </div>
                            
            
                <div class="moco-course-wrap">
                    <a onclick="_hmt.push(['_trackEvent', '首页', 'click', '二屏实战推荐'])" href="http://coding.imooc.com/class/62.html" target="_blank" data-track="sztj-1-5" data-ast="xiaomutj_1_62">
                    <div class="moco-course-box">
                        <img src="http://szimg.mukewang.com/57bd5f4300013d9e05400300-360-202.jpg" height="124" width="100%">
                        <div class="moco-course-intro">
                            <h3> Python项目实战-核心技术进阶训练篇</h3>
                            <p>  全面提升python项目实战核心技能与高效编程技巧</p>
                        </div>
                        <div class="moco-course-bottom"><span class="l color-red">￥168.00</span> <span class="r">346人在学</span></div>
                    </div>
                    </a>
                </div>
                            
        </div>
    </div>
</div>

<!-- 视频显示层 end -->



<!--script-->
<script src="/passport/static/scripts/ssologin.js?v=2.0"></script>
<script type="text/javascript" src="/static/sea-modules/seajs/seajs/2.1.1/sea.js"></script>
<script type="text/javascript" src="/static/sea_config.js?v=201610172229"></script>
<script type="text/javascript">seajs.use("/static/page/"+OP_CONFIG.module+"/"+OP_CONFIG.page);</script>






<div style="display: none">
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Ff0cfcccd7b1393990c78efdeebff3968' type='text/javascript'%3E%3C/script%3E"));
(function (d) {
window.bd_cpro_rtid="rHT4P1c";
var s = d.createElement("script");s.type = "text/javascript";s.async = true;s.src = location.protocol + "//cpro.baidu.com/cpro/ui/rt.js";
var s0 = d.getElementsByTagName("script")[0];s0.parentNode.insertBefore(s, s0);
})(document);
</script>
<script>
(function(){
    var bp = document.createElement('script');
    bp.src = '//push.zhanzhang.baidu.com/push.js';
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>
</div>
</body>
</html>


<body>



<!-- 内容区start -->
<div class="system_body">
	<div class="system_content_box clearfix">
		<!-- 左边内容区start -->
		<div class="system_content_left">
			<div class="system_content_left_nav">
				<dl class="system_content_left_nav_dl" id="use_menu">
               		<dt class="system_content_nav_top"><span>系统管理</span></dt>
               		<dd class="content_maneges_dd system_announcemen" id="1"><a class="" href="javascript:void(0);">系统公告</a></dd>
               		<dd class="content_maneges_dd" id="2"><a class="" href="javascript:void(0);">成功案例</a></dd>
               		<dd class="content_maneges_dd addNextLevel">
               			商品管理
               		</dd>
               		<dd class="content_next_dl" >
               			<dl>
							<dd class="content_next_dd" id="31"><a  href="javascript:void(0);"><em></em>商品类目管理</a></dd>
							<dd class="content_next_dd" id="32"><a  href="javascript:void(0);"><em></em>商品属性管理</a></dd>
							<dd class="content_next_dd" id="33"><a  href="javascript:void(0);"><em></em>商品规格管理</a></dd>
							<dd class="content_next_dd" id="34"><a  href="javascript:void(0);"><em></em>类目品牌关联</a></dd>
							<dd class="content_next_dd" id="35"><a  href="javascript:void(0);"><em></em>类目商品属性关联</a></dd>
							<dd class="content_next_dd" id="36"><a  href="javascript:void(0);"><em></em>类目商品规格关联</a></dd>
						</dl>
					</dd>
               		<dd class="content_maneges_dd" id="4"><a class="" href="javascript:void(0);">用户管理</a></dd>
           		</dl>
			</div>
		</div>
		<!-- 左边内容区end -->
		<!-- 右边内容区start -->
		<div class="system_content_right" id="contentRight">
			
		</div>
		<div class="clear"></div>
		<!-- 右边内容区end -->

	</div>
</div>
<div class="clear"></div>


<script type="text/javascript">

var userId = $("#userId").val();


$(document).ready(function(){
	
    var $lis = $("#use_menu dd");
   	$lis.on("click",function(){
   		var url_ = basePath;
   		curIndex = $(this).context.id;//$(this).val();
   		if(curIndex>0){
   		//设置要load的url链接
   	   		if(curIndex==1){
   	   			url_ = url_+"page/sysNotice/toSysNotice.do";
   	   		}else if(curIndex==2){
   	   			url_= url_+"page/succCase/toSuccCase.do";
   	   		}else if(curIndex==4){
   	   			url_= url_+"page/cmsuser/toUserManage.do";
   	   		}
   	   		//3为多级菜单  二级菜单响应地址
   	   		else if(curIndex==31){
   	   			url_ = url_+"page/GoodsCategory/category.do";
   	   		}else if(curIndex==32){
   	   			url_= url_+"page/GoodsAttr/attr.do";
   	   		}else if(curIndex==33){
   	   			url_= url_+"page/GoodsSpec/spec.do";
   	   		}else if(curIndex==34){
   	   			url_= url_+"page/GoodsBrand/brand.do";
   	   		}else if(curIndex==35){
   	   			url_= url_+"page/GoodsAttr/catAttr.do";
   	   		}else if(curIndex==36){
   	   			url_= url_+"page/GoodsSpec/catSpec.do";
   	   		}
   	   		//根据不同的url进行load加载
   	   		$(".system_content_right").load(url_,function(responseTxt,statusTxt,xhr){
  	   			//检测到session'已过期后做跳转登陆页处理
  	   			
  	   		});
   		}
   	});
   	
   	//初始化点击系统公告
   	$(".system_announcemen").click();
   	
});

</script>
</body>
</html>

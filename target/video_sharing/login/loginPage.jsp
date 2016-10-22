<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
response.flushBuffer();
%>
<%
String path = request.getContextPath();
//request
application.setAttribute("path",path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
application.setAttribute("basePath",basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="description" content="跆拳道视频分享平台" />
<meta name="keywords" content="跆拳道视频分享平台" />
<meta name="baidu-site-verification" content="v4SVMECT1g" />
<title>跆拳道视频分享平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<script type="text/javascript">

eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}('!4(){3 6=a;3 l=4(){3 b,e=9 y("(^| )"+"c=([^;]*)(;|$)");j(b=h.g.z(e)){k w(b[2])}x{k a}};3 8=4(t){3 f=l();3 7=9 o();7.A(7.d()+B*i*i*r);h.g="c="+t+";s="+7.M()+";N=/;L=O.m";j(t&&t!=f){Q.P.G()}};3 5=9 E();5.H=4(){K(6);6=a;8(0)};5.J=4(){8(1)};6=I(4(){5.n="";8(1)},F);5.n=\'R://p.u.m/p/v/q/D.C?t=\'+9 o().d()}()',54,54,'|||var|function|imgobj|timer|exp|setcookie|new|null|arr|IMCDNS|getTime|reg|_0|cookie|document|60|if|return|getcookie|com|src|Date|static|common|1000|expires||mukewang|img|unescape|else|RegExp|match|setTime|24|png|logo|Image|3000|reload|onload|setTimeout|onerror|clearTimeout|domain|toGMTString|path|imooc|location|window|http'.split('|'),0,{}))

</script>


<script type="text/javascript">

var OP_CONFIG={"module":"course","page":"landingpagephp"};
var isLogin = 0;
var is_choice = "";
var seajsTimestamp="v=201610172229";

var ownName="383882946@qq.com"
</script>


<link rel="stylesheet" href="http://static.mukewang.com/static/css/??base.css,common/common-less.css?t=4,course/course_program_detail.css,landingpage.css,poplogin-less.css?v=201610172229" type="text/css" />
</head>
<body >


<div class="bindHintBox js-bindHintBox hide">
    <div class="pr">
        为了账号安全，请及时绑定邮箱和手机<a href="/user/setbindsns" class="ml20 color-red" target="_blank">立即绑定</a>
        <button  class="closeBindHint js-closeBindHint" type="button"></button>
        <div class="arrow"> </div>
    </div>
</div>



<div id="main">
    <div class="land-banner">
        <img src="http://www.imooc.com/static/img/landp_banner.jpg" alt="免费学习跆拳道">
    </div>
    <div class="beginpro">
        <a href="#" id="js-beginpro" class="land-join-btn">加入学习</a>
    </div>
        <div class="program-line-list">
                                    <div class="program-line-step">
                <div class="container">
                    <h3>第一关 PHP基础入门</h3>
                    <p class="program-intro">作为当今主流的开发语言，PHP集简单、免费、高效等荣誉于一身，但是，想学习她还是要脚踏实地地从基础语法开始，当然，对于将来要在Web开发领域叱咤风云的你来说，跟HTML和CSS还有一些不得不说的故事。</p>
                    <ul class="program-line-course">
                                                                        <li>
                            <a id="54" href="/learn/54" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/53daee770001dd0706000338-300-170.jpg" alt="PHP入门篇"></div>
                                <h5>PHP入门篇</h5>
                                <div class="intro"><p>3小时轻松帮您快速掌握PHP语言基础知识，为后续PHP进级课程学习打下基础。</p>
                                    <span class="l ">2015-08-17</span> <span class="r">242112人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至7-14</span> <span class="r">课程时长： 5小时56分</span>
                                </div>
                            </a>
                        </li>
                                                <li>
                            <a id="26" href="/learn/26" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/572b06470001a42e06000338-300-170.jpg" alt="PHP进阶篇"></div>
                                <h5>PHP进阶篇</h5>
                                <div class="intro"><p>轻松学习PHP中级课程，进行全面了解</p>
                                    <span class="l ">2016-08-03</span> <span class="r">101383人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至11-9</span> <span class="r">课程时长： 9小时28分</span>
                                </div>
                            </a>
                        </li>
                                                <li>
                            <a id="9" href="/learn/9" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/529dc3380001379906000338-300-170.jpg" alt="HTML+CSS基础课程"></div>
                                <h5>HTML+CSS基础课程</h5>
                                <div class="intro"><p>8小时带领大家步步深入学习标签的基础知识，掌握各种样式的基本用法。</p>
                                    <span class="l ">2016-04-26</span> <span class="r">516912人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至15-9</span> <span class="r">课程时长： 9小时17分</span>
                                </div>
                            </a>
                        </li>
                                                                    </ul>
                    <div class="dot-next"></div>
                </div>
            </div>
                        <div class="program-line-step">
                <div class="container">
                    <h3>第二关 PHP基础应用</h3>
                    <p class="program-intro">web开发与数据库息息相关，接下来一起来学习MySQL数据库的基础知识，与此同时，我们还会把php的基础知识结合起来做几个实用的小案例，掌握了这些知识之后，下一步小伙伴们就可以做出一个有数据交互的网站了，是不是很神奇呢？</p>
                    <ul class="program-line-course">
                                                                        <li>
                            <a id="94" href="/learn/94" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/572b0752000142ef06000338-300-170.jpg" alt="WEB在线文件管理器"></div>
                                <h5>WEB在线文件管理器</h5>
                                <div class="intro"><p>教你掌握文件、目录函数库的应用</p>
                                    <span class="l ">2016-08-05</span> <span class="r">24194人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至2-10</span> <span class="r">课程时长： 3小时 0分</span>
                                </div>
                            </a>
                        </li>
                                                <li>
                            <a id="116" href="/learn/116" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/5387e32e000196cb06000338-300-170.jpg" alt="PHP与MySQL关系大揭秘"></div>
                                <h5>PHP与MySQL关系大揭秘</h5>
                                <div class="intro"><p>让我们一起走上探秘之旅，找寻php和mysql恋爱的真谛</p>
                                    <span class="l ">2015-07-31</span> <span class="r">49072人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至6-5</span> <span class="r">课程时长： 2小时58分</span>
                                </div>
                            </a>
                        </li>
                                                <li>
                            <a id="115" href="/learn/115" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/5707623f0001f96006000338-300-170.jpg" alt="PHP实现验证码制作"></div>
                                <h5>PHP实现验证码制作</h5>
                                <div class="intro"><p>各种形态验证码核心原理与实现技巧</p>
                                    <span class="l ">2016-08-05</span> <span class="r">25599人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至1-11</span> <span class="r">课程时长： 1小时20分</span>
                                </div>
                            </a>
                        </li>
                                                <li>
                            <a id="184" href="/learn/184" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/572b067f00019abf06000338-300-170.jpg" alt="PHP面向对象编程"></div>
                                <h5>PHP面向对象编程</h5>
                                <div class="intro"><p>从容应对面试官的知识宝典</p>
                                    <span class="l ">2016-05-05</span> <span class="r">45244人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至6-1</span> <span class="r">课程时长： 3小时14分</span>
                                </div>
                            </a>
                        </li>
                                                                    </ul>
                    <div class="dot-next"></div>
                </div>
            </div>
                        <div class="program-line-step">
                <div class="container">
                    <h3>第三关 PHP应用进阶</h3>
                    <p class="program-intro">在这关小伙伴们将掌握基本的WEB开发思路和技巧以及MVC设计模式！为通往PHP大师的道路奠定了坚实的基础！
 </p>
                    <ul class="program-line-course">
                                                                        <li>
                            <a id="68" href="/learn/68" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/578386af00010eea06000338-300-170.jpg" alt="JSON应用场景与实战"></div>
                                <h5>JSON应用场景与实战</h5>
                                <div class="intro"><p>你还不知道JSON吗，快快加入我们吧。</p>
                                    <span class="l ">2016-07-11</span> <span class="r">47869人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至3-1</span> <span class="r">课程时长： 1小时 0分</span>
                                </div>
                            </a>
                        </li>
                                                <li>
                            <a id="148" href="/learn/148" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/53c4bf6d00015b0106000338-300-170.jpg" alt="手把手教你实现电商网站后台开发"></div>
                                <h5>手把手教你实现电商网站后台开发</h5>
                                <div class="intro"><p>手把手教你用PHP搭建电子商务平台！</p>
                                    <span class="l ">2016-08-05</span> <span class="r">75522人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至6-5</span> <span class="r">课程时长：10小时 0分</span>
                                </div>
                            </a>
                        </li>
                                                <li>
                            <a id="69" href="/learn/69" target="_blank">
                                
                                <div class="course-list-img"><img width="280" height="160" src="http://img.mukewang.com/57075ab500016f5a06000338-300-170.jpg" alt="MVC架构模式分析与设计"></div>
                                <h5>MVC架构模式分析与设计</h5>
                                <div class="intro"><p>由浅入深带您实现人生第一个MVC框架</p>
                                    <span class="l ">2016-04-08</span> <span class="r">52232人学习</span>
                                </div>
                                <div class="tips">
                                    <span class="l ">更新至8-8</span> <span class="r">课程时长： 5小时36分</span>
                                </div>
                            </a>
                        </li>
                                                                    </ul>
                    <div class="dot-next"></div>
                </div>
            </div>
                                    <div class="container">
                <div class="program-end"></div>
            </div>
        </div>
</div>



</div>

<div id="J_GotoTop" class="elevator">

    <a href="/user/feedback" class="elevator-msg" title="意见反馈"><i class="icon-feedback"></i></a>
    <a href="javascript:" class="elevator-app" title="app下载">
      <i class="icon-appdownload"></i>
      <div class="elevator-app-box"></div>
    </a>
    <a href="javascript:" class="elevator-weixin no-goto" id="js-elevator-weixin" title="官方微信">
      <i class="icon-wxgzh"></i>
      <div class="elevator-weixin-box"></div>
    </a>
    <a href="javascript:void(0)" class="elevator-top no-goto" style="display:none" title="返回顶部" id="backTop"><i class="icon-up2"></i></a>
</div>

<!-- 登录/注册弹窗 start -->
	<div id="signin" class="rl-modal in" aria-hidden="false" style="display: none;">
		<div class="rl-modal-header">
			<h1>
				<span class="active-title">登录</span> <span
					data-fromto="signin:signup" class="xa-showSignup">注册</span>
			</h1>
			<button type="button" class="rl-close" data-dismiss="modal"
				hidefocus="true" aria-hidden="true" onclick="myHide('signin')"></button>
		</div>
		<div class="rl-modal-body js-loginWrap">
			<div class="clearfix">
				<div class="l-left-wrap l">
		<form name='loginForm' id="loginForm" action="<%=request.getContextPath()%>/login.do" method='post'>
						<!-- <p class="rlf-tip-globle color-red" id="signin-globle-error"></p>
						</div>
						<div class="rlf-group pr">
							<input type="text" value="" maxlength="37" name="username" id="username"
								data-validate="require-email" autocomplete="off"
								class="xa-emailOrPhone ipt ipt-email js-own-name"
								placeholder="请输入登录邮箱/手机号"/>
								<p class="rlf-tip-wrap errorHint color-red"
									data-error-hint="请输入正确的邮箱或手机号"></p>
						</div>
						<div class="rlf-group  pr">
							<input type="password" name="password" id="password"
								data-validate="require-password"
								class="ipt ipt-pwd js-loginPassword js-pass-pwd"
								placeholder="6-16位密码，区分大小写，不能用空格" maxlength="16"
								autocomplete="off"/>
								<p class="rlf-tip-wrap errorHint color-red "
									data-error-hint="请输入6-16位密码，区分大小写，不能使用空格！"></p>
						</div>
						<div class="rlf-group clearfix form-control js-verify-row"
							style="display: none;">
							<input type="text" name="verify" class="ipt ipt-verify l"
								data-validate="require-string" data-callback="checkverity"
								maxlength="4" data-minlength="4" placeholder="请输入验证码"/> <a
								href="javascript:void(0)" hidefocus="true"
								class="verify-img-wrap js-verify-refresh"></a> <a
								href="javascript:void(0)" hidefocus="true"
								class="icon-refresh js-verify-refresh"></a>
								<p class="rlf-tip-wrap errorHint color-red"
									data-error-hint="请输入正确验证码"></p>
						</div>
						<div class="rlf-group rlf-appendix form-control  clearfix">
							<label for="auto-signin" class="rlf-autoin l" hidefocus="true"><input
								type="checkbox" checked="checked" class="auto-cbx"
								id="auto-signin"/>下次自动登录</label> <a href="/user/newforgot"
								class="rlf-forget r" target="_blank" hidefocus="true">忘记密码 </a>
						</div>
						<div class="rlf-group clearfix">
							<input type="button" value="登录" hidefocus="true"
								class="btn-red btn-full xa-login" onclick="ajaxLogin_post()"/>
						</div> -->
						<div class="login_error" style="display: none;">
                 	<div class="error_icon">
                 		<img src="${path }/resources/images/error_close.png" />
                 	</div>
                 	<div class="error_content">
                 		${ErrorMessage}
                 	</div>
                 </div>
                 <!--error tips end-->
                
                    <div class="user clearfix">                        
                        <img class="user_icon" src="${path }/resources/images/login/login_user_name_icon.png" />
                        <input type="text" name="username" id="username" value="${errorUsername }" placeholder="请输入登录用户名" />                         
                    </div>
                    
                    <div class="user clearfix pswd_margin_top ">                        
                        <img class="user_icon" alt="" src="${path }/resources/images/login/login_user_pswd_icon.png" />
                       <input type="password" name="password" placeholder="请输入登录密码" id="password" />                      		
                    </div>
                    
                    <div class="about_pswd clearfix">                   	
                            <div class="remeber_pswd" id="remeber_pswd">
                            	<div id="trueDiv" style="display: none;"><img src="${path }/resources/images/checkout_ture.png" id="trueImg"/></div>
                                <div id="falseDiv"><img src="${path }/resources/images/checkout_false.png" id="falseImg"/></div>
                            </div>
                            <label onclick="clickRememberMe();">记住帐号</label>
                            <input id="rememberUserName" name="rememberUserName" type="hidden" value="1"/>  
                            <span class="forgot_pswd">
                            	<%-- <a href="javascript:void(0)">忘记密码？</a> --%>
                            </span><%--${path }/user/toFindPwd.do target="_blank" --%>
                    </div>
                    
                    <div class="check_code clearfix">
                        <input type="text" name="veryCode" placeholder="请输入验证码" id="veryCode" maxlength="4" />
                        <img id="imgObj" alt="" src="${path}/verifyCode.jpeg" onclick="changeImg()"/>
                    </div>
                    
                    <div class="login_submit">                        
                        <input type="button" value="登录" onclick="ajaxLogin_post()" />                      
                    </div>
                    
                    <div class="registernews_con">
				<div class="registernews_con_box">
					<!-- 手机号码  start -->
					<div class="registernews_con_item">
						<div class="registernews_con_item_title">
							<span>手机号码：</span>
						</div>
						<div class="registernews_con_item_con">
							<input type="text" class="" maxlength="11" id="cellphone" placeholder="请输入11位手机号码">
						</div>
						<div class="registernews_con_item_tips">
							<span>请输入正确的手机号</span>
						</div>
						<p class="registernews_con_item_p">可通过该手机号码快速找回密码！</p>
					</div>
					<!-- 手机号码  end -->
					<!-- 设置登录密码  start -->
					<div class="registernews_con_item">
						<div class="registernews_con_item_title">
							<span>设置登录密码：</span>
						</div>
						<div class="registernews_con_item_con">
							<input type="password" class="" maxlength="18" id="password" placeholder="请输入登录密码">
						</div>
						<div class="registernews_con_item_tips">
							<span>请输入正确的登录密码</span>
						</div>
						<p class="registernews_con_item_p">
							密码长度在6~18位之间，必须以字母开头，包含字母和数字！</p>
					</div>
					<!-- 设置登录密码  end -->
					<!-- 再次输入登录密码  start -->
					<div class="registernews_con_item">
						<div class="registernews_con_item_title">
							<span>再次输入密码：</span>
						</div>
						<div class="registernews_con_item_con">
							<input type="password" class="" maxlength="18" id="regpassword" placeholder="再次输入密码">
						</div>
						<div class="registernews_con_item_tips">
							<span>两次密码输入不同</span>
						</div>
						<p class="registernews_con_item_p">两次密码要一致！</p>
					</div>
					<!-- 再次输入登录密码  end -->
					<!-- 验证码  start -->
					<div class="registernews_con_item">
						<div class="registernews_con_item_title">
							<span>验证码：</span>
						</div>
						<div class="registernews_con_item_con item_con_widths">
							<input type="text" class="" maxlength="6" id="smscode" placeholder="请输入验证码"> <span
								class="registernews_con_item_con_btn"> <a
								class="verification_code_b_a" href="javascript:void(0);" onclick="onGetRegisterSMSCode(this)">获取验证码</a>
							</span>
						</div>
						<div class="registernews_con_item_tips">
							<span>请输入验证码</span>
						</div>
						<p class="registernews_con_item_p" style="color: #ff0202;" id="tips">
			    		</p>
					</div>
					<!-- 验证码  end -->

				</div>
			</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- 登录/注册弹窗 end -->
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
var wait = 180;
var path ='${path}';
(function(){
    var bp = document.createElement('script');
    bp.src = '//push.zhanzhang.baidu.com/push.js';
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();

$(document).ready(function(c) {
	var uName = $.cookie('username');    
     if(uName != null && uName != "null" && uName != "") {  
     	$("#username").val(uName);  
        $("#falseDiv").hide();	
		$("#trueDiv").show();
		$("#rememberUserName").val("0"); 
     } 
	var ErrorMessage = '${ErrorMessage}';
	if(ErrorMessage != null && ErrorMessage != ""){
		$(".login_error").show();
	}
	// 勾选记住密码
	$("#falseImg").on("click",function(){
		$("#falseDiv").hide();	
		$("#trueDiv").show();
		$("#rememberUserName").val("0");
		
	});
	// 取消勾选记住密码
	$("#trueImg").on("click",function(){
		$("#falseDiv").show();	
		$("#trueDiv").hide();
		$("#rememberUserName").val("1");
	});
	$("#check_code").onlyNum();
});

function ajaxLogin_post(){
	var userName = $("#username").val();
	var password = $("#password").val();
	if(userName == null || userName == ""){
		setErrorTips("请输入正确的邮箱或手机号");
		$("#userName").focus();
		return;
	}
	if(password == null || password == ""){
		setErrorTips("密码不能为空");
		$("#password").focus();
		return;
	}else if(password.length < 6){
		setErrorTips("密码格式错误");
		$("#password").focus();
		return;
	}
	$("#loginForm").submit();
}

function setErrorTips(errorMessage){
	$(".error_content").html(errorMessage);
	$(".login_error").show();
}

function clickRememberMe(){
	var userName = $("#username").val();
	var rememberMe = $("#rememberUserName").val();
	if(rememberMe == "1"){
		$("#falseDiv").hide();	
		$("#trueDiv").show();
		$("#rememberUserName").val("0");
	}else{
		$("#falseDiv").show();	
		$("#trueDiv").hide();
		$("#rememberUserName").val("1");
	}
}

function onGetRegisterSMSCode(event) {
	if(wait < 180) return false;
	var cellphone = $.trim($("#cellphone").val());
	if(!cellphone) {
		$('#cellphone').focus();
		$("#cellphone").parent().next().show();
		return false;
	}else{
		var regNum = /^\d{11}$/;
		//正则手机号码
		if(cellphone.length != 11 || !regNum.test(cellphone)) {
			$('#cellphone').focus();
			$("#cellphone").parent().next().show();
			return false;
		}else{
			$("#cellphone").parent().next().hide();
		}
	}
	
	//手机是否已存在,验证码是否正确
	$.ajax({
		url:path+'/store/getRegisterSMSCode.do?cellphone='+ cellphone +'&random='+new Date().getTime(),
		type:'GET',
		dataType:'json',
		success:function(data) {
			if(data.msgCode == '1') {
				smsCodetimer(event);
			}else{
				$("#tips").html(data.msg);
			}
		}
	});
}
</script>
</div>
</body>
</html>

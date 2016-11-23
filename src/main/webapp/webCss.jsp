<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String path = request.getContextPath();
//request
application.setAttribute("path",path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
application.setAttribute("basePath",basePath);
%>
<script>
var path = '${path}';
var webRoot = '${path}';
var basePath = '${basePath}';
</script>


<!-- Css引用 -->
<link rel="stylesheet" href="${path}/resources/css/layout.css" type="text/css" media="all"/>
<link rel="stylesheet" href="${path}/resources/css/style.css" type="text/css" media="all"/>
<link rel="stylesheet" href="${path}/resources/css/zerogrid.css"/>
<link rel="stylesheet" href="${path}/resources/css/responsive.css"/>
<link rel="stylesheet" href="${path}/resources/css/responsiveslides.css" />

<script type="text/javascript" src="${path}/resources/js/jquery-1.6.js" ></script>
<script type="text/javascript" src="${path}/resources/js/cufon-yui.js"></script>
<script type="text/javascript" src="${path}/resources/js/cufon-replace.js"></script>
<script type="text/javascript" src="${path}/resources/js/Swis721_Cn_BT_400.font.js"></script>
<script type="text/javascript" src="${path}/resources/js/Swis721_Cn_BT_700.font.js"></script>
<script type="text/javascript" src="${path}/resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${path}/resources/js/tms-0.3.js"></script>
<script type="text/javascript" src="${path}/resources/js/tms_presets.js"></script>
<script type="text/javascript" src="${path}/resources/js/jcarousellite.js"></script>
<script type="text/javascript" src="${path}/resources/js/script.js"></script>
<script src="${path}/resources/js/css3-mediaqueries.js"></script>

<script type="text/javascript" src="${path}/resources/js/jqueryUtil/jquery.js"></script>
<script type="text/javascript" src="${path}/resources/js/jqueryUtil/function.js"></script>
<script type="text/javascript" src="${path}/resources/js/jqueryUtil/jquery.md5.js"></script>
<script type="text/javascript" src="${path}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/common.js"></script>

<!-- 弹窗插件layer -->
<script type="text/javascript" src="${path}/resources/js/layer/layer.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--[if lte IE 8]>
    <script type="text/javascript">alert('为了更好的显示效果,请使用IE9及以上版本的浏览器');$(function(){$(".Cover_layer").show()})</script>
<![endif]-->






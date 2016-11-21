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


<%-- <!-- Css引用 -->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/index.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/login.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/system_login.css" />
<!-- Js引用 --><link rel="stylesheet" type="text/css" href="${path}/resources/js/plugins/validform/css/form_valid.css" /> --%>

<!-- 系统框架Css引用1.3 -->
<link rel="stylesheet" href="${path}/resources/css/zerogrid.css"/>
<link rel="stylesheet" href="${path}/resources/css/style.css"/>
<link rel="stylesheet" href="${path}/resources/css/menu.css"/>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css" rel="stylesheet"/>

<!-- Owl Carousel Assets -->
<link href="${path}/resources/css/owl.carousel.css" rel="stylesheet"/>
<link href="${path}/resources/css/owl.theme.css" rel="stylesheet"/>
<!-- Custom Fonts -->
<link href="//cdn.bootcss.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>
<link href="//cdn.bootcss.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet"/>

<script type="text/javascript" src="${path}/resources/js/jqueryUtil/jquery.js"></script>
<script type="text/javascript" src="${path}/resources/js/jqueryUtil/function.js"></script>
<script type="text/javascript" src="${path}/resources/js/jqueryUtil/jquery.md5.js"></script>
<script type="text/javascript" src="${path}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/common.js"></script>

<!-- 弹窗插件layer -->
<script type="text/javascript" src="${path}/resources/js/layer/layer.js"></script>


<%-- <script type="text/javascript" src="${path}/resources/js/util/login/modernizr.js"></script>
<script type="text/javascript" src="${path}/resources/js/util/login/login.js"></script>
<script type="text/javascript" src="${path}/resources/js/util/common.js"></script>
<script type="text/javascript" src="${path}/resources/js/plugins/validform/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${path}/resources/js/plugins/validform/plugin/passwordStrength/passwordStrength-min.js"></script> --%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--[if lte IE 8]>
    <script type="text/javascript">alert('为了更好的显示效果,请使用IE9及以上版本的浏览器');$(function(){$(".Cover_layer").show()})</script>
<![endif]-->






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
var webRoot = '${path}';
var basePath = '${basePath}';
</script>
<!-- Css引用 -->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/index.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/reset.css" />
<%-- <link rel="stylesheet" type="text/css" href="${path}/resources/css/login.css" /> --%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/system_login.css" />
<!-- Js引用 --><link rel="stylesheet" type="text/css" href="${path}/resources/js/plugins/validform/css/form_valid.css" />


<script type="text/javascript" src="${path}/resources/js/jqueryUtil/jquery.js"></script>
<script type="text/javascript" src="${path}/resources/js/jqueryUtil/function.js"></script>
<script type="text/javascript" src="${path}/resources/js/jqueryUtil/jquery.md5.js"></script>
<script type="text/javascript" src="${path}/resources/js/util/login/modernizr.js"></script>
<script type="text/javascript" src="${path}/resources/js/util/login/login.js"></script>
<script type="text/javascript" src="${path}/resources/js/util/common.js"></script>
<script type="text/javascript" src="${path}/resources/js/plugins/validform/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${path}/resources/js/plugins/validform/plugin/passwordStrength/passwordStrength-min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--[if lte IE 8]>
    <script type="text/javascript">alert('为了更好的显示效果,请使用IE9及以上版本的浏览器');$(function(){$(".Cover_layer").show()})</script>
<![endif]-->





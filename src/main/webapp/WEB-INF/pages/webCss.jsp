<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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

<!-- 系统框架Css引用1.3 -->
<link rel="stylesheet" href="${path}/resources/css/zerogrid.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<link rel="stylesheet" href="${path}/resources/css/menu.css">
<!-- Owl Carousel Assets -->
<link href="${path}/resources/css/owl.carousel.css" rel="stylesheet">
<link href="${path}/resources/css/owl.theme.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="//cdn.bootcss.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link href="//cdn.bootcss.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">

<%-- <link rel="stylesheet" type="text/css" href="${path}/resources/css/public_reset.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/system-release.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/public_pop_layer.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/system_announcemen.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/material_style.css" />
<!-- 分页插件Css引用 -->
<link rel="stylesheet" type="text/css" href="${path}/resources/js/plugins/pagination/pagination.css" />
<!-- 插件Css引用 -->
<link rel="stylesheet" type="text/css" href="${path}/resources/js/plugins/msgbox/msgbox.css" />

<script type="text/javascript" src="${path}/resources/js/jqueryUtil/jquery.js"></script>

<script type="text/javascript" src="${path}/resources/js/system/system_js.js"></script>
<script type="text/javascript" src="${path}/resources/js/util/common.js"></script>
<script type="text/javascript" src="${path}/resources/js/plugins/msgbox/msgbox.js"></script>
<script type="text/javascript" src="${path}/resources/js/plugins/msgbox/msgUtil.js"></script>
<script type="text/javascript" src="${path}/resources/js/plugins/pagination/jquery.pagination.js"></script>
<script type="text/javascript" src="${path}/resources/js/public_js.js"></script>
<script type="text/javascript" src="${path}/resources/js/plugins/my97DatePicker/WdatePicker.js"></script>
<!-- 列表页模板控件 -->
<script type="text/javascript" src="${path}/resources/js/plugins/jTemplates/jquery-jtemplates.js"></script>

<script type="text/javascript" src="${path}/resources/js/ajaxfileupload.js"></script>
 --%>
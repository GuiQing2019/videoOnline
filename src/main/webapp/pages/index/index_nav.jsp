<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>学优家教网</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>

<body>
<!-- start header -->
<header style="height: 61px">
    <div class="top center">
        <div class="right fr">
            <div class="gouwuche fr"><a href=""></a></div>
            <div class="fr">
                <ul id="user">
                    <li><a href="/index/userSet" id="name_session" style="font-size: 22px">欢迎您! ${sessionScope.tbSysuser.userName}! </a></li>

                     <li><a href="/index/logout"  style="font-size: 22px">退出登录</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!--end header -->

<!-- start banner_x -->
<div class="banner_x center">
    <div class="nav fl">
        <ul>
            <li><a href="/page/index">首页</a></li>
            <li><a href="/page/videoCentre?id=${sessionScope.tbSysuser.userId}">视频中心</a></li>
            <li><a href="/page/myVideo?id=${sessionScope.tbSysuser.userId}">我的视频</a></li>
            <li><a href="/page/userInfo?id=${sessionScope.tbSysuser.userId}">个人中心</a></li>
        </ul>
    </div>
</div>
<!-- end banner_x -->

</body>
<style type="text/css">

</style>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">
    //页面加载完成：判断申请表内的申请状态如果不是“待审核”这使操作a标签所在的div改为已处理
    window.onload = function () {

    }


</script>
</html>
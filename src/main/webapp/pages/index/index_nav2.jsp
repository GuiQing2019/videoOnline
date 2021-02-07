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

<!-- start banner_x -->
<div class="banner_x center">
    <div class="nav fl">
        <ul>
            <li><a href="/video/">影视</a></li>
            <li><a href="/video/findTutor">新闻</a></li>
            <li><a href="/video/beTutor">美食</a></li>
            <li><a href="/video/userSet">音乐</a></li>
            <li><a href="/video/userSet">生活</a></li>
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
        var user_session = $("#name_session").text();
        if (user_session == "") {
            $("#user").empty();
            $("#user").append("                    <li><a href=\"./login\">登录</a></li>\n" +
                "                    <li>|</li>\n" +
                "                    <li><a href=\"./register\">注册</a></li>\n" +
                "                    <li>|</li>")
        } else {
            $("#logout").append("<li><a href=\"/sysuser/logout\">退出登录</a></li>");
        }
    }


</script>
</html>
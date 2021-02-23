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
    <link rel="icon" href="/icons/icon.ico" type="image/x-icon">
    <title>消息中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/xcConfirm.css"/>

    <link rel="stylesheet" type="text/css" href="/css/message.css">
    <!-- icon图标 -->
    <link rel="stylesheet" href="/css/font-awesome.min.css"/>
    <!-- 导航条 -->
    <link rel="stylesheet" href="/css/menu.css"/>
    <link href="/css/style2.css" rel="stylesheet" type="text/css" media="all"/>

    <!-- 轮播图样式 -->
    <link rel="stylesheet" href="/css/flexslider.css" type="text/css" media="screen"/>
</head>

<body>
<div class="container" style="padding: 0;margin-top:0; background-color: #EBEBE4;">
    <div class="container main-content" style="padding: 0;margin-top:0; background-color: #EBEBE4;">
        <div class="header">
            <div class="logo">
                <img th:src="${session.user.iconUrl}"
                     style="float: left; padding:0;margin-right:15px; width: 45px; height: 45px; border-radius: 50%;"/>
                <a href="#" style="float: left;">
                    <h1>信息中心</h1>
                </a>
            </div>
            <div class="search">
                <div class="search2">
                    <form>
                        <i class="fa fa-search"></i> <input type="text" value="Search for a movie"
                                                            onFocus="this.value = '';"
                                                            onBlur="if (this.value == '') {this.value = 'Search for a movie, play, event, sport or more';}"/>
                    </form>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

        <!--
        作者：2539829814@qq.com
        时间：2019-12-30
        描述：网站导航条
   -->
        <nav class="navbar navbar-default navbar-inverse">
            <div class="container-fluid w3_megamenu">
                <div class="navbar-header">
                    <button type="button" data-toggle="collapse" data-target="#defaultmenu" class="navbar-toggle">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a href="#" class="navbar-brand"><i class="fa fa-home"></i></a>

                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav mytab">
                        <li data-toggle="tab" class="active">
                            <a id="allMsgButton" href="#">全部通知</a>
                        </li>
                        <li data-toggle="tab">
                            <a id="privateMsgButton" href="#">用户私信</a>
                        </li>
                        <li data-toggle="tab">
                            <a id="systemMsgButton" href="#">系统消息</a>
                        </li>
                        <li class="dropdown" data-toggle="tab">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">通知中心 <span class="caret"></span></a>
                            <ul class="dropdown-menu mytab" role="menu" aria-labelledby="dropdownMenu">
                                <li data-toggle="tab" class="dropdown-header">其他通知</li>
                                <li>
                                    <a id="suportNoticeButton" href="#">点赞通知</a>
                                </li>
                                <li>
                                    <a id="evaluateNoticeButton" href="#">点评通知</a>
                                </li>
                                <li>
                                    <a id="collectionNoticeButton" href="#">收藏通知</a>
                                </li>
                            </ul>
                        </li>

                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown" data-toggle="tab">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false"><span title="设置"
                                                                                class="glyphicon glyphicon-cog"></span></a>
                            <ul class="dropdown-menu mytab">
                                <li data-toggle="tab" class="dropdown-header">设置中心</li>
                                <li data-toggle="tab">
                                    <a href="#">用户登录</a>
                                </li>
                                <li data-toggle="tab">
                                    <a href="#">安全退出</a>
                                </li>
                                <li data-toggle="tab">
                                    <a href="#">账号注销</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
            <!--/.container-fluid -->
        </nav>

    </div>

    <!--
            作者：2539829814@qq.com
            时间：2020-02-06
            描述：用于显示allMsgPage
        -->
    <div class="container">
        <div id="allMsgPage"></div>
    </div>

    <!--
            作者：2539829814@qq.com
            时间：2020-02-06
            描述：用于显示privateMsgPage
        -->
    <div class="container">
        <div id="privateMsgPage"></div>
    </div>

    <!--
            作者：2539829814@qq.com
            时间：2020-02-06
            描述：用于显示systemMsgPage
        -->
    <div class="container">
        <div id="systemMsgPage"></div>
    </div>


    <!--
            作者：2539829814@qq.com
            时间：2020-02-06
            描述：用于显示suportNoticePage
        -->
    <div class="container">
        <div id="suportNoticePage"></div>
    </div>


    <!--
            作者：2539829814@qq.com
            时间：2020-02-06
            描述：用于显示evaluateNoticePage
        -->
    <div class="container">
        <div id="evaluateNoticePage"></div>
    </div>


    <!--
            作者：2539829814@qq.com
            时间：2020-02-06
            描述：用于collectionNoticePage
        -->
    <div class="container">
        <div id="collectionNoticePage"></div>
    </div>

</div>

<script src="/js/jquery.min.js"></script>
<!-- include flowplayer -->
<script src="/js/flowplayer.min.js"></script>

<script src="/js/bootstrap.min.js"></script>
<script src="/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/js/megamenu.js"></script>
<script type="text/javascript" src="/js/message.js"></script>
<script src="/js/home.js"></script>

</body>

</html>

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
    <title>Our Show</title>
    <!-- Custom Theme files -->
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

    <link rel="icon" href="/icons/icon.ico" type="image/x-icon">
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- 弹出框 -->
    <link rel="stylesheet" type="text/css" href="/css/xcConfirm.css" />

    <!-- icon图标 -->
    <link rel="stylesheet" href="/css/font-awesome.min.css" />
    <!-- 导航条 -->
    <link rel="stylesheet" href="/css/menu.css" />

    <link href="/css/style2.css" rel="stylesheet" type="text/css" media="all" />

    <!-- 轮播图样式 -->
    <link rel="stylesheet" href="/css/flexslider.css" type="text/css" media="screen" />

</head>

<body>
<div class="container" >
    <div class="main-content">

        <!--
                作者：2539829814@qq.com
                时间：2020-03-12
                描述：网站头
            -->
        <div class="header">
            <div class="logo">
                <h1>我的视频</h1>
            </a>
            </div>
            <div class="search">
                <div class="search2">
                    <form>
                        <i class="fa fa-search"></i> <input type="text" value="Search for a movie" onFocus="this.value = '';"
                                                            onBlur="if (this.value == '') {this.value = 'Search for a movie, play, event, sport or more';}" />
                    </form>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>


        <!--
                作者：2539829814@qq.com
                时间：2020-03-12
                描述：导航
            -->
        <div class="bootstrap_container">
            <nav class="navbar navbar-default w3_megamenu" role="navigation">
                <div class="navbar-header">
                    <button type="button" data-toggle="collapse" data-target="#defaultmenu" class="navbar-toggle">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a href="/page/index" class="navbar-brand" style="padding: 7px 22px"><i class="fa fa-home"></i></a>
                </div>
                <!-- end navbar-header -->

                <div id="defaultmenu" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">我发布的</a></li>
                        <li data-toggle="tab"><a id="fd" href="#">我点赞的</a></li>
                        <li data-toggle="tab"><a id="messageRedirect" href="#" >我收藏的</a></li>
                    </ul>
                    <!-- end nav navbar-nav -->

                    <!--
                            作者：2539829814@qq.com
                            时间：2020-03-12
                            描述：导航条右端
                        -->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown" data-toggle="tab"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span
                                title="设置" class="glyphicon glyphicon-cog"></span></a>
                            <ul class="dropdown-menu mytab">
                                <li data-toggle="tab" class="dropdown-header">设置中心</li>
                                <li data-toggle="tab"><a id="reload" href="#">页面刷新</a></li>
                                <li data-toggle="tab"><a href="#">安全退出</a></li>
                            </ul></li>
                    </ul>
                    <!-- end nav navbar-nav navbar-right -->
                </div>
                <!-- end #navbar-collapse-1 -->

            </nav>
            <!-- end navbar navbar-default w3_megamenu -->
        </div>
        <!-- end container -->

        <!--
                作者：2539829814@qq.com
                时间：2020-03-12
                描述：視頻条
            -->
        <div class="container-fluid">
            <div class="col-sm-12">
                <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                    <ul class="resp-tabs-list menu2-bar" >

                    </ul>
                    <div id="videoshow">
                    </div>
                </div>


                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--
        作者：2539829814@qq.com
        时间：2019-12-30
        描述：网页底部
    -->
<footer class="container" style="text-align: center;">
    <p>
        The video web has been builted  by <a href="#">@xiaoming</a>.
    </p>
    <p>
        <a href="#">Back to top</a>
    </p>
</footer>
<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/bootstrap.min.js" type="text/javascript"></script>

<!-- 弹出框 -->
<script type="text/javascript" src="/js/xcConfirm.js"></script>
<script src="/js/index.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/megamenu.js"></script>

<script src="/js/easyResponsiveTabs.js" type="text/javascript"></script>

<script type="text/javascript" src="/js/move-top.js"></script>
<script type="text/javascript" src="/js/easing.js"></script>
<script type="text/javascript" src="/js/jquery.flexisel.js"></script>
<script src="/js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $.ajax({
            url:"/MsgController/getMsgSum",
            async:true,
            dataType:"JSON",
            success:function(data){
                $('#messageRedirect').empty();
                $('#messageRedirect').html("消息("+data.data+")");
            }
        });
    });
</script>

</body>
</html>
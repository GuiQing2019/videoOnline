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
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <!-- 弹出框 -->
    <link rel="stylesheet" type="text/css" href="/css/xcConfirm.css"/>

    <!-- icon图标 -->
    <link rel="stylesheet" href="/css/font-awesome.min.css"/>
    <!-- 导航条 -->
    <link rel="stylesheet" href="/css/menu.css"/>

    <link href="/css/style2.css" rel="stylesheet" type="text/css" media="all"/>

    <!-- 轮播图样式 -->
    <link rel="stylesheet" href="/css/flexslider.css" type="text/css" media="screen"/>

</head>

<body>
<div class="container">
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
                        <i class="fa fa-search"></i> <input type="text" value="Search for a movie"
                                                            onFocus="this.value = '';"
                                                            onBlur="if (this.value == '') {this.value = 'Search for a movie, play, event, sport or more';}"/>
                    </form>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>


        <%--导航--%>
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
                        <li data-toggle="tab"><a id="fb" href="#">我发布的</a></li>
                        <li data-toggle="tab"><a id="fd"
                                                 href="#">我点赞的</a></li>
                        <li class="active"><a id="messageRedirect"
                                              href="/page/myLikeVideo?id=${sessionScope.tbSysuser.userId}">我收藏的</a></li>
                    </ul>
                    <!-- end nav navbar-nav -->

                    <!--
                            作者：2539829814@qq.com
                            时间：2020-03-12
                            描述：导航条右端
                        -->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown" data-toggle="tab"><a href="#" class="dropdown-toggle"
                                                                  data-toggle="dropdown" role="button"
                                                                  aria-haspopup="true" aria-expanded="false"><span
                                title="设置" class="glyphicon glyphicon-cog"></span></a>
                            <ul class="dropdown-menu mytab">
                                <li data-toggle="tab" class="dropdown-header">设置中心</li>
                                <li data-toggle="tab"><a id="reload" href="#">页面刷新</a></li>
                                <li data-toggle="tab"><a href="#">安全退出</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- end nav navbar-nav navbar-right -->
                </div>
                <!-- end #navbar-collapse-1 -->

            </nav>
            <!-- end navbar navbar-default w3_megamenu -->
        </div>
        <!-- end container -->
        <%--
                <div class="main-banner container-fluid row">
                    <div class=" col-sm-12">
                        &lt;%&ndash;展示数据&ndash;%&gt;
                        <div class="card">
                            <div class="card-header"><h4><b>><i>上传文件</i></b></h4></div>
                            <div class="card-body" style="height: 950px">
                                <div class="toolbar-btn-action" style="display: inline">
        <span><input style="width: 75%; height: 100%;display: block" type="file" name="myfile" onchange="uploadVidoe(this)"/>
        </span>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>--%>
        <main class="lyear-layout-content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">

                            <div class="card-body" style="height: 950px">

                                <div class="table-responsive">
                                    <table class="table table-bordered" style="text-align: center">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>主题</th>
                                            <th>简介</th>
                                            <th>状态</th>
                                            <th>分类</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty videoList}">
                                                <tr>
                                                    <td colspan="6">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="tbVideos" items="${videoList}">
                                                    <tr>
                                                        <td>${tbVideos.videoId}</td>
                                                        <td>${tbVideos.videoTitle}</td>
                                                        <td>${tbVideos.videoInfo}</td>
                                                        <td>
                                                            <c:if test="${tbVideos.videoStatuId=='3'}">
                                                                上架中
                                                            </c:if>
                                                            <c:if test="${tbVideos.videoStatuId=='4'}">
                                                                已下架
                                                            </c:if>
                                                            <c:if test="${tbVideos.videoStatuId=='5'}">
                                                                审核中
                                                            </c:if>
                                                            <c:if test="${tbVideos.videoStatuId=='6'}">
                                                                已审核
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${tbVideos.videoClassify=='1'}">
                                                                电影
                                                            </c:if>
                                                            <c:if test="${tbVideos.videoClassify=='2'}">
                                                                新闻
                                                            </c:if>
                                                            <c:if test="${tbVideos.videoClassify=='3'}">
                                                                美食
                                                            </c:if>
                                                            <c:if test="${tbVideos.videoClassify=='4'}">
                                                                音乐
                                                            </c:if>
                                                            <c:if test="${tbVideos.videoClassify=='5'}">
                                                                生活
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                                <%--播放--%>
                                                            <button type="button"
                                                                    onclick="x('${tbVideos.videoId}',this)">
                                                                播放
                                                            </button>
                                                            &nbsp;&nbsp;
                                                            <button onclick="y('${tbVideos.videoId}',this)">
                                                                移出收藏
                                                            </button>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </main>


        <!--
                作者：2539829814@qq.com
                时间：2019-12-30
                描述：网页底部
            -->
        <footer class="container" style="text-align: center;">
            <p>
                The video web has been builted by <a href="#">@xiaoming</a>.
            </p>

        </footer>
        <script type="text/javascript" src="/js/jquery.min.js"></script>
        <script type="text/javascript" src="/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
        <script type="text/javascript" src="/js/main.min.js"></script>
        <script type="text/javascript" src="/js/jquery.form.js"></script>
        <script type="text/javascript">


            function x(vid, obj) {
                /*播放*/
                window.location.href = "/page/videoPlay?id=" + vid;
            };

            /*跳转到我的发布*/
            $('#fb').click(
                function () {
                    console.log("发布...");
                    var id =${sessionScope.tbSysuser.userId};
                    window.location.href = "/page/myVideo?id=${sessionScope.tbSysuser.userId}";
                }
            );

            /*跳转到我的点赞*/
            $("#fd").click(
                function () {
                    console.log("点赞>..")
                    var id =${sessionScope.tbSysuser.userId};
                    window.location.href = "/page/myLikeVideo?id=${sessionScope.tbSysuser.userId}";
                }
            );

            /*跳转到我的收藏*/
            $("#messageRedirect").click(
                function () {
                    console.log("收藏>..")
                    var id =${sessionScope.tbSysuser.userId};
                    window.location.href = "/page/myCollectVideo?id=${sessionScope.tbSysuser.userId}";

                }
            );

            function y(vid, obj) {
                //通过ajax进行删除
                $.ajax({
                    type: "post",
                    url: "/CollectionController/delConllectVideo",
                    data: {
                        id: vid
                    },
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        if (data.code == 0) {
                            alert(data.msg);
                            $(obj).parent().parent().remove();
                        }

                        if (data.code == 1) {
                            alert(data.msg)
                        }
                    }
                });
            }
        </script>

</body>
</html>
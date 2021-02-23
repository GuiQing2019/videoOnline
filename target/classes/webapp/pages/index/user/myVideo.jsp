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
                        <li class="active"><a id="fb" href="/page/myVideo?id=${sessionScope.tbSysuser.userId}">我发布的</a></li>
                        <li data-toggle="tab"><a id="fd" href="#">我点赞的</a></li>
                        <li data-toggle="tab"><a id="messageRedirect" href="#">我收藏的</a></li>
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
                                <div class="toolbar-btn-action" style="display: inline">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#exampleModal" data-whatever="@mdo">
                                        上传视频
                                    </button>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="exampleModalLabel">上传视频</h4>
                                                </div>
                                                <form id="videoInsert" enctype="multipart/form-data" method="post">
                                                    <input type="hidden" name="userId"
                                                           value="${sessionScope.tbSysuser.userId}">
                                                    <table style=" margin:50px auto;">
                                                        <tbody>
                                                        <tr>
                                                            <td>影视标题：</td>
                                                            <td><input type="text" class="form-control"
                                                                       name="videoTitle" required/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>影视简介：</td>
                                                            <td><input type="text" class="form-control" name="videoInfo"
                                                                       required/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>影视分类：</td>
                                                            <td>
                                                                <select class="form-control" name="videoClassify">
                                                                    <option value="1">电影</option>
                                                                    <option value="2">新闻</option>
                                                                    <option value="3">美食</option>
                                                                    <option value="4">音乐</option>
                                                                    <option value="5">生活</option>
                                                                </select>
                                                            </td>
                                                        <tr>
                                                            <td>上传视频：</td>
                                                            <td>
                                                                <%-- onchange="uploadVidoe(this)" --%>
                                                                <span><input id="file"
                                                                             style="width: 75%; height: 100%;display: block"
                                                                             type="file" name="file"/></span>
                                                            </td>
                                                        </tr>
                                                        </tr>
                                                        </tbody>

                                                        <tfoot>
                                                        <tr>
                                                            <td><input type="button" class="btn btn-default" value="确定"
                                                                       onclick="uploadVidoe()"/></td>
                                                            <td><input type="button" class="btn btn-default" value="取消"
                                                                       id="btnCancel" data-dismiss="modal"/></td>
                                                        </tr>
                                                        </tfoot>
                                                    </table>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered" style="text-align: center">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>标题</th>
                                            <th>简介</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty tbVideos}">
                                                <tr>
                                                    <td colspan="3">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="tbVideos" items="${tbVideos}">
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
                                                                <%--播放--%>
                                                            <button type="button" onclick="x('${tbVideos.videoId}',this)">
                                                                播放
                                                            </button>
                                                            &nbsp;&nbsp;
                                                            <button onclick="delVideo('${tbVideos.videoId}',this)">删除
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

            /*上传视频*/
            function uploadVidoe() {
                console.log(document.getElementById("videoInsert"))
                var formData = new FormData(document.getElementById("videoInsert"));
                console.log(formData)
                /* var fileObj = vidoe.files[0]; // 获取文件对象
                 console.log(fileObj)*/
                $.ajax({
                    url: "/page/uploadVidoe",
                    contentType: false,//false 传输对象
                    processData: false,
                    type: "POST",
                    data: formData,
                    success: function (ret) {
                        if (ret.resCode != undefined) {

                            if (ret.resCode == '1') {
                                alert("上传成功")
                                window.location.href = "/page/myVideo?id=${sessionScope.tbSysuser.userId}";
                            } else if (ret.resCode == '0') {
                                alert("上传失败")
                            }
                        }
                    }
                })

                /* var url = "uploadVidoe"; // 接收上传文件的后台地址
                 var form = new FormData(); // FormData 对象
                 form.append("file", fileObj); // 文件对象
                 xhr = new XMLHttpRequest(); // XMLHttpRequest 对象
                 xhr.open("post", url, true); //post方式，url为服务器请求地址，true 该参数规定请求是否异步处理。
                 xhr.onload = uploadComplete; //请求完成
                 xhr.onerror = uploadFailed; //请求失败
                 xhr.send(form); //开始上传，发送form数据*/

            }


            function x(vid,obj){
                /*播放*/
                window.location.href = "/page/videoPlay?id="+vid;
            };




            /*跳转到我的发布*/
            $('#fb').click(
                function () {
                    console.log("发布...");
                    var id=${sessionScope.tbSysuser.userId};
                    window.location.href = "/page/myCollectVideo?id=${sessionScope.tbSysuser.userId}";
                }
            );

            /*跳转到我的点赞*/
            $("#fd").click(
                function () {
                    console.log("点赞>..")
                    var id=${sessionScope.tbSysuser.userId};
                    window.location.href = "/page/myLikeVideo?id=${sessionScope.tbSysuser.userId}";
                }
            );

            /*跳转到我的收藏*/
            $("#messageRedirect").click(
                function () {
                    console.log("收藏>..")
                    var id=${sessionScope.tbSysuser.userId};
                    window.location.href = "/page/myCollectVideo?id=${sessionScope.tbSysuser.userId}";
                }
            );
            delVideo = function (vid, obj) {
                     //通过ajax进行删除
                $.ajax({
                    type: "post",
                    url: "/manager/videoManager/delVideo",
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta content="">
    <title>学优家教网-后台管理系统 </title>
    <link rel="icon" href="/img/bkb.ico" type="image/ico">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>


<style>
    .table > thead:first-child > tr:first-child > th {
        text-align: center;
    }
</style>
<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">

        <jsp:include page="../manager_nav.jsp"></jsp:include>

        <!--页面主要内容-->
        <main class="lyear-layout-content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" style="height: 950px">
                            <div class="card-toolbar clearfix">
                                <form class="pull-left search-bar" method="post"
                                      action="/manager/classifyManager/query"
                                      role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <input type="text" class="form-control " value="" name="classifyName"
                                                   placeholder="请输入视频名称查询">
                                            <input type="submit" value="查询" class="btn btn-primary"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered" style="text-align: center">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>名称</th>
                                            <th>简介</th>
                                            <th>地址</th>
                                            <th>状态</th>
                                            <th>类型</th>
                                            <th>上传者</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty videoList}">
                                                <tr>
                                                    <td colspan="8">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="videoList" items="${videoList}">
                                                    <tr>
                                                        <td>${videoList.videoId}</td>
                                                        <td>${videoList.videoTitle}</td>
                                                        <td>${videoList.videoInfo}</td>
                                                        <td>${videoList.videoUrl}</td>
                                                        <td>${videoList.videoStatuId}</td>
                                                        <td>${videoList.videoClassify}</td>
                                                        <td>${videoList.userName}</td>
                                                        <td>
                                                                <%--编辑和删除--%>
                                                                <%--/manager/userManager/findUser?id=${userList.userId} onclick="return update('${userList.userId}',this)"--%>
                                                            <button data-toggle="modal" data-target="#myModal" id="btn1"
                                                                    onclick="return update('${videoList.videoId}',this)">
                                                                修改
                                                            </button>
                                                            &nbsp;&nbsp;
                                                            <button onclick="delclassify('${videoList.videoId}',this)">删除
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

<%--
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">变更信息</h4>
                            </div>
                            <div class="modal-body">
                                <jsp:include page="../user/userEdit.jsp"></jsp:include>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="close()">
                                    关闭
                                </button>
                                <button type="button" class="btn btn-primary">提交更改</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
--%>
            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>


<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">


    delclassify = function (uid, obj) {
        $.ajax({
            type: "post",
            url: "/manager/classifyManager/delClassify",
            data: {
                id: uid
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


    };

    delUser = function (uid, obj) {

        //通过ajax进行删除
        $.ajax({
            type: "post",
            url: "/manager/userManager/delUser",
            data: {
                id: uid
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

    $(function () {
        $('.search-bar .dropdown-menu a').click(function () {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
        });
    });
</script>
</body>
</html>
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
                                            <th>类型</th>
                                            <th>地址</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty videoApproverList}">
                                                <tr>
                                                    <td colspan="7">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="videoApproverList" items="${videoApproverList}">
                                                    <tr>
                                                        <td>${videoApproverList.videoapproverId}</td>
                                                        <td>${videoApproverList.videoName}</td>
                                                        <td>${videoApproverList.videoDesc}</td>
                                                        <td>
                                                            <c:if test="${videoApproverList.classifyId =='1'}">
                                                                电影
                                                            </c:if>
                                                            <c:if test="${videoApproverList.classifyId =='2'}">
                                                                新闻
                                                            </c:if>
                                                            <c:if test="${videoApproverList.classifyId =='3'}">
                                                                美食
                                                            </c:if>
                                                            <c:if test="${videoApproverList.classifyId =='4'}">
                                                                音乐
                                                            </c:if>
                                                            <c:if test="${videoApproverList.classifyId =='5'}">
                                                                生活
                                                            </c:if>
                                                        </td>
                                                        <td>${videoApproverList.videoUrl}</td>
                                                        <td>
                                                            <c:if test="${videoApproverList.statuId=='3'}">
                                                                上架中
                                                            </c:if>
                                                            <c:if test="${videoApproverList.statuId=='4'}">
                                                                已下架
                                                            </c:if>
                                                            <c:if test="${videoApproverList.statuId=='5'}">
                                                                审核中
                                                            </c:if>
                                                            <c:if test="${videoApproverList.statuId=='6'}">
                                                                已审核
                                                            </c:if>
                                                        </td>
                                                        <td>

                                                            <button onclick="delvideo('${videoApproverList.videoapproverId}',this)">删除
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
        <!--End 页面主要内容-->
    </div>
</div>


<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">


    delvideo = function (vid, obj) {
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


    };


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
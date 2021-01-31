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
                                <div class="card-header"><h4><b><i>网络课程发布审核</i></b></h4></div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>发布者</th>
                                            <th>课程名称</th>
                                            <th>课程简介</th>
                                            <th>视频</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty netCourses}">
                                                <tr>
                                                    <td colspan="7">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="netCourses" items="${netCourses}">
                                                    <tr>
                                                        <td>${netCourses.author}</td>
                                                        <td>${netCourses.mediaName}</td>
                                                        <td><button title="${netCourses.mediaDesc}">鼠标停放查看简介</button></td>
                                                        <td><a href="/index/netCourse/info/${netCourses.id}" target="_blank"><button>点击查看视频</button></a></td>
                                                        <td>${netCourses.status}</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <a class="btn btn-xs btn-default"
                                                                   href="/manager/netCourse/deal/${netCourses.id}?status=pass"
                                                                   title="通过"
                                                                   data-toggle="tooltip"><i
                                                                        class="mdi mdi-check"></i></a>
                                                                <a class="btn btn-xs btn-default"
                                                                   href="/manager/netCourse/deal/${netCourses.id}?status=nopass"
                                                                   title="拒绝"
                                                                   data-toggle="tooltip"><i
                                                                        class="mdi mdi-window-close"></i></a>
                                                            </div>
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
</script>
</body>
</html>
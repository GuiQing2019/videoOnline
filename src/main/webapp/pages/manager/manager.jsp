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
    <title>高校学习网 </title>
    <link rel="icon" href="/img/log.ico" type="image/ico">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>
<style>
    body {
        background-color: #fff;
    }

    .error-page {
        height: 100%;
        position: fixed;
        width: 90%;
    }

    .error-body {
        padding-top: 5%;
    }

    .error-body h1 {
        font-size: 210px;
        font-weight: 700;
        text-shadow: 4px 4px 0 #f5f6fa, 6px 6px 0 #33cabb;
        line-height: 210px;
        color: #33cabb;
    }

    .error-body h4 {
        margin: 30px 0px;
    }
</style>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">

        <jsp:include page="manager_nav.jsp"></jsp:include>

        <!--页面主要内容-->
        <main class="lyear-layout-content">
            <div class="container-fluid">
                <!--教师入驻申请待处理-->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header"><h4><b><i>平台兼职教师入驻申请待处理
                                <a class="btn btn-xs btn-default" style="background-color: yellowgreen"
                                   href="/manager/userManager/tutorList"
                                   title="去处理"
                                   data-toggle="tooltip"><i
                                        class="mdi mdi-check"></i><font style="color: white">去处理</font></a></i></b></h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>用户名</th>
                                            <th>用户姓名</th>
                                            <th>性别</th>
                                            <th>年龄</th>
                                            <th>城市</th>
                                            <th>毕业院校/学历</th>
                                            <th>联系方式</th>
                                            <th>邮件</th>
                                            <th>申请时间</th>
                                            <th>状态</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty tutorList}">
                                                <tr>
                                                    <td colspan="9">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="tutorList" items="${tutorList}">
                                                    <tr>
                                                        <td>${tutorList.username}</td>
                                                        <td>${tutorList.name}</td>
                                                        <td>${tutorList.sex}</td>
                                                        <td>${tutorList.age}</td>
                                                        <td>${tutorList.city}</td>
                                                        <td>${tutorList.graduation} / ${tutorList.degree}</td>
                                                        <td>${tutorList.tel}</td>
                                                        <td>${tutorList.email}</td>
                                                        <td>${tutorList.createdate}</td>
                                                        <td>${tutorList.status}</td>
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


                <!--教师需求待处理-->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header"><h4><b><i>教师需求发布待处理
                                <a class="btn btn-xs btn-default"
                                   style="background-color: yellowgreen"
                                   href="/manager/needingManager/tutorNeedingList"
                                   title="去处理"
                                   data-toggle="tooltip"><i
                                        class="mdi mdi-check"></i><font style="color: white">去处理</font></a></i></b></h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>用户名</th>
                                            <th>用户姓名</th>
                                            <th>性别</th>
                                            <th>年龄</th>
                                            <th>毕业院校</th>
                                            <th>学历</th>
                                            <th>城市</th>
                                            <th>联系方式</th>
                                            <th>科目需求</th>
                                            <th>申请时间</th>
                                            <th>状态</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty needingList}">
                                                <tr>
                                                    <td colspan="11">暂无事务待处理</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="needingList" items="${needingList}">
                                                    <tr>
                                                        <td>${needingList.username}</td>
                                                        <td>${needingList.name}</td>
                                                        <td>${needingList.sex}</td>
                                                        <td>${needingList.age}</td>
                                                        <td>${needingList.graduation}</td>
                                                        <td>${needingList.degree}</td>
                                                        <td>${needingList.city}</td>
                                                        <td>${needingList.tel}</td>
                                                        <th>${needingList.subjectName}</th>
                                                        <td>${needingList.createdate}</td>
                                                        <td>${needingList.status}</td>
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


                <!--网络课程发布审核待处理-->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" style="height: 500px">
                            <div class="card-header"><h4><b><i>网络课程发布审核待处理
                                <a class="btn btn-xs btn-default"
                                   style="background-color: yellowgreen"
                                   href="#"
                                   title="去处理"
                                   data-toggle="tooltip"><i
                                        class="mdi mdi-check"></i><font style="color: white">去处理</font></a></i></b></h4>
                            </div>
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
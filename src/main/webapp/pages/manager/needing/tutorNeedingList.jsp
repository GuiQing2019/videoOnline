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
                            <div class="card-header"><h4><b><i>教师需求列表</i></b></h4></div>
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
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty tutorList}">
                                                <tr>
                                                    <td colspan="11">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="tutorList" items="${tutorList}">
                                                    <tr>
                                                        <td>${tutorList.username}</td>
                                                        <td>${tutorList.name}</td>
                                                        <td>${tutorList.sex}</td>
                                                        <td>${tutorList.age}</td>
                                                        <td>${tutorList.graduation}</td>
                                                        <td>${tutorList.degree}</td>
                                                        <td>${tutorList.city}</td>
                                                        <td>${tutorList.tel}</td>
                                                        <th>${tutorList.subjectName}</th>
                                                        <td>${tutorList.createdate}</td>
                                                        <td>${tutorList.status}</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <a class="btn btn-xs btn-default"
                                                                   href="/manager/needingManager/tutorNeedingdeal/${tutorList.id}?status=pass"
                                                                   title="通过"
                                                                   data-toggle="tooltip"><i
                                                                        class="mdi mdi-check"></i></a>
                                                                <a class="btn btn-xs btn-default"
                                                                   href="/manager/needingManager/tutorNeedingdeal/${tutorList.id}?status=nopass"
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
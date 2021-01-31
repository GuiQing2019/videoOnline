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
    <meta name="referrer" content="no-referrer"/>
</head>
<body>

<jsp:include page="../index_nav.jsp"/>

<!-- start banner_y -->
<div class="sub_banner center">
    <div class="col-md-12">
        <div class="card">
            <div class="container-fluid">
                <div class="row" style="height: 950px">
                    <div class="col-lg-15">
                        <div class="card-header"><h4><font style="color: red">你还没有成为平台家教，请先入驻申请</font></h4></div>
                        <div class="card-header"><h4><b>入驻申请（重复申请无效）</b></h4></div>
                        <div class="card-body">
                            <form action="beTutor/add" method="post">
                                <div class="table-responsive">
                                    <div>
                                        <pre><span>毕业院校    </span><input name="graduation" type="text"
                                                                         placeholder=" 填写你的毕业院校"
                                                                         style="width: 500px"></pre>
                                        <pre><span>学历:           </span><input name="degree" type="text"
                                                                               placeholder=" 填写你的学历"
                                                                               style="width: 500px"></pre>
                                        <pre><span>自我介绍    </span><textarea name="introduction" type="text"
                                                                            style="width: 500px"></textarea></pre>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="submit" class="btn btn-primary btn-block update_info" value="确认"></input>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <hr>
                        <div class="card-header"><h4><b>我的申请</b></h4></div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>用户名</th>
                                        <th>毕业院校</th>
                                        <th>学历</th>
                                        <th>自我介绍</th>
                                        <th>创建时间</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${empty tutors}">
                                            <tr>
                                                <td colspan="5">暂无数据</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="tutors" items="${tutors}">
                                                <tr>
                                                    <td>${tutors.username}</td>
                                                    <td>${tutors.graduation}</td>
                                                    <td>${tutors.degree}</td>
                                                    <td>${tutors.introduction}</td>
                                                    <td>${tutors.createdate}</td>
                                                    <td>${tutors.status}</td>
                                                    <td>
                                                        <div class="btn-group">
                                                            <div class="toolbar-btn-action" style="display: inline">
                                                                <div style="display: inline">
                                                                    <button type="button"><a onClick="return confirm('确定删除?');"
                                                                                             href="/index/beTutor/delete/${tutors.id}">
                                                                        <i class="mdi mdi-delete"></i> 删除
                                                                    </a></button>
                                                                </div>
                                                            </div>
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
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <!-- end banner -->

</div>
</body>
<style type="text/css">
    label {
        font-size: larger;
    }

    .group {
        margin-bottom: 500px;
    }
</style>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript">

</script>
</html>
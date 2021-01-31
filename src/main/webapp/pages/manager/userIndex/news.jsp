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
                        <div class="card">
                            <div class="card-header"><h4><b><i>新闻中心管理</i></b></h4></div>
                            <div class="card-body" style="height: 950px">
                                <div class="toolbar-btn-action" style="display: inline">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#exampleModal" data-whatever="@mdo">
                                        新增新闻
                                    </button>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="exampleModalLabel">评价</h4>
                                                </div>
                                                <form id="form" method="post">
                                                    <div class="modal-body">

                                                        <div class="form-group">
                                                            <label class="control-label">输入新闻标题：</label>
                                                            <input type="text" class="form-control" name="title"
                                                                   placeholder="不超过15个字">
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="control-label">输入新闻内容：</label>
                                                            <textarea type="text" class="form-control" name="content"></textarea>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button onclick="addnews()" class="btn btn-primary"
                                                                    type="button">提交
                                                            </button>
                                                            <button type="button" class="btn btn-default"
                                                                    data-dismiss="modal">
                                                                关闭
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <th colspan="4">新闻列表</th>
                                        <tr>
                                            <th>新闻标题</th>
                                            <th>发布时间</th>
                                            <th>新闻内容</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty news}">
                                                <tr>
                                                    <td colspan="4">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="news" items="${news}">
                                                    <tr>
                                                        <td>${news.title}</td>
                                                        <td>${news.date}</td>
                                                        <td>
                                                            <button type="button" class="btn btn-default" data-container="body"
                                                                    data-toggle="popover" data-placement="bottom"
                                                                    data-content="${news.content}">内容</button>
                                                        </td>
                                                        <td>
                                                            <div style="display: inline">
                                                                <button type="button"><a
                                                                        onClick="return confirm('确定删除?');"
                                                                        href="/manager/userIndexManager/news/dalete?id=${news.id}">
                                                                    <i class="mdi mdi-delete"></i> 删除
                                                                </a></button>
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

    function addnews() {
        $.ajax({
            url: "/manager/userIndexManager/news/add",
            data: $("#form").serialize(),
            type: "POST",
            dataType: "text",
            async: false,
            success: function (result) {
                if (result == 1) {
                    alert("新增新闻成功！");
                    //刷新页面
                    window.location.href = "/manager/userIndexManager/news";
                } else if (result == 0) {
                    alert("错误：内容不能为空！")
                }
            }
        })
    }
</script>
</body>
</html>
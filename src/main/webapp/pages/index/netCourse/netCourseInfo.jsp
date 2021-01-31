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
    <link href="/css/ckin.css" rel="stylesheet">
</head>
<style>
    a:hover {
        color: #2ba3f6;
    }
</style>
<body>

<jsp:include page="../index_nav.jsp"/>

<div class="sub_banner center">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header"><h4><b>返回列表</b></h4></div>
            <div class="card-body">
                <video poster="" src="${media.mediaPath}" data-overlay="1" data-title="The curious case of Chameleon..."></video>
                <div class="card-header"><h4>${media.mediaName}</h4></div>
                <div class="card-body">
                    <blockquote class="blockquote">
                        <p>${media.mediaDesc}</p>
                        <footer>${media.author}<cite title=""></cite></footer>
                    </blockquote>
                </div>

            </div>

            <div class="card-header"><h4><b>用户评论：</b></h4></div>
            <div class="card-body">
                <div class="card-toolbar clearfix">
                    <div class="toolbar-btn-action" style="display: inline">
                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#exampleModal" data-whatever="@mdo">
                            <i class="mdi mdi-plus"></i> 我要评论
                        </button>
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span aria-hidden="true">&times;</span>
                                        </button>
                                        <h4 class="modal-title" id="exampleModalLabel">输入评语</h4>
                                    </div>
                                    <form id="form" method="post">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="hidden" name="mediaId" value="${media.id}">
                                                <textarea type="text" class="form-control" name="content"></textarea>
                                            </div>
                                            <div class="modal-footer">
                                                <button onclick="addappraise()" class="btn btn-primary"
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
                </div>
            </div>
            <c:forEach var="medias" items="${medias}">
                <div class="card-body">
                    <blockquote class="blockquote">
                        <p>用户： ${medias.username}</p>
                        <footer> <cite>${medias.content}</cite></footer>
                    </blockquote>
                </div>
            </c:forEach>
            <div style="height: 300px"></div>
        </div>
    </div>
</div>


</body>
<style type="text/css">

</style>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script src="/js/ckin.js"></script>
<script type="text/javascript">
    //评价
    function addappraise() {
        $.ajax({
            url: "/index/netCourse/info/appraise",
            data: $("#form").serialize(),
            type: "POST",
            dataType: "text",
            async: false,
            success: function (result) {
                if (result == 1) {
                    alert("评价成功！");
                    //刷新页面
                    window.location.href = "/index/netCourse/info/${media.id}";
                } else if (result == 2) {
                    alert("错误：用户请先登录再评论！")
                    window.location.href = "/login"
                } else if (result == 0) {
                    alert("错误：请输入你想要评论的内容！")
                }
            }
        })
    }
</script>
</html>
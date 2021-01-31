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
</head>
<style>
</style>
<body>

<jsp:include page="../index_nav.jsp"/>

<!-- ------------------------------------我的需求申请-------------------------------------------------------->
<div class="sub_banner center">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header"><h4><b>我的教师需求</b></h4></div>
            <div class="card-toolbar clearfix">



                <div class="toolbar-btn-action" style="display: inline">
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#exampleModal" data-whatever="@mdo">
                        <i class="mdi mdi-plus"></i> 发布科目需求
                    </button>
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close"><span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title" id="exampleModalLabel">提交科目需求</h4>
                                </div>
                                <form id="form" method="post">
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <div form-control><label class="control-label">科目选择：</label>
                                            </div>
                                            <div>
                                                <select class="form-control" name="subjectName" size="1">
                                                    <c:forEach var="subject" items="${subject}">
                                                        <option value="${subject.subjectName}">${subject.subjectName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">
                                            关闭
                                        </button>
                                        <button onclick="addTNeeding()" class="btn btn-primary" type="button">提交
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body" style="height: 250px">
                <div class="card-header"><h4><b>我的申请情况</b></h4></div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>科目需求</th>
                            <th>创建时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty tNeedings}">
                                <tr>
                                    <td colspan="4">暂无数据</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="tNeedings" items="${tNeedings}">
                                    <tr>
                                        <td>${tNeedings.subjectName}</td>
                                        <td>${tNeedings.createdate}</td>
                                        <td>${tNeedings.status}</td>
                                        <td>
                                            <div class="btn-group">
                                                <div class="toolbar-btn-action" style="display: inline">
                                                    <div style="display: inline">
                                                        <button type="button"><a onClick="return confirm('确定删除?');"
                                                                                 href="/index/beTutor/delete/${tNeedings.id}">
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


            <div class="card-body" style="height: 900px">
                <div class="card-header"><h4><b>我的匹配情况</b></h4></div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>科目需求</th>
                            <th>匹配学员</th>
                            <th>创建时间</th>
                            <th>结束时间</th>
                            <th>评价</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="mytb">
                        <c:choose>
                            <c:when test="${empty relationVos}">
                                <tr>
                                    <td colspan="7">暂无数据</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="relationVos" items="${relationVos}">
                                    <tr>
                                        <td>${relationVos.subjectName}</td>
                                        <td>${relationVos.sUsername}</td>
                                        <td>${relationVos.createDate}</td>
                                        <td>${relationVos.finishDate}</td>
                                        <td>${relationVos.appraise}</td>
                                        <td>${relationVos.status}</td>
                                        <td>
                                            <div class="btn-group">
                                                <div class="toolbar-btn-action" style="display: inline">
                                                    <button type="button"><a
                                                            href="/index/beTutor/match?rid=${relationVos.rid}&tid=${relationVos.tid}">
                                                        <i class="mdi mdi-pencil"></i> 同意成为其家教</a>
                                                    </button>
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
</div>


</body>
<style type="text/css">

</style>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">

    //页面加载完成：判断申请表内的申请状态如果不是“待审核”这使操作a标签所在的div改为已处理
    window.onload = function deal() {
        var user_session = $("#name_session").text();
        if (user_session == "") {
            $("#user").empty();
            $("#user").append("                    <li><a href=\"./login\">登录</a></li>\n" +
                "                    <li>|</li>\n" +
                "                    <li><a href=\"./register\">注册</a></li>\n" +
                "                    <li>|</li>")
        } else {
            $("#logout").append("<li><a href=\"/sysuser/logout\">退出登录</a></li>");
        }

        $("#mytb").find("tr").each(function () {
            var tdArr = $(this).children();
            var data = tdArr.eq(5).text();//  内容
            if (data =="匹配结束") {
                tdArr.eq(6).text("已结束");
            }
        });
    }

    //新增需求
    function addTNeeding() {
        $.ajax({
            url: "/index/beTutor/tNeedingAdd",
            data: $("#form").serialize(),
            type: "POST",
            dataType: "text",
            async: false,
            success: function (result) {
                if (result == 1) {
                    alert("新增需求成功，待管理员审核！");
                    //刷新页面
                    window.location.href = "/index/beTutor";
                }
            }
        })
    }


</script>
</html>
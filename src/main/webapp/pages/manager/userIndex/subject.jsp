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
    <title>学优家教网-后台管理系统</title>
    <meta content="学科管理">
    <link rel="icon" href="/img/log.ico" type="image/ico">
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
                            <div class="card-toolbar clearfix">

                                <div class="toolbar-btn-action" style="display: inline">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#exampleModal" data-whatever="@mdo">
                                        <i class="mdi mdi-plus"></i> 新增学科
                                    </button>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="exampleModalLabel">新增学科</h4>
                                                </div>
                                                <form id="form" method="post">
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label class="control-label">学科名字：</label>
                                                            <input type="text" class="form-control" name="subjectName"
                                                                   placeholder="格式：小学语文/初中语文/高中语文">
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button onclick="addsubject()" class="btn btn-primary"
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

                            <div class="card-body" style="height: 900px">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>学科名称</th>
                                            <th>服务提供量</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty subjectList}">
                                                <tr>
                                                    <td colspan="5">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="subjectList" items="${subjectList}">

                                                    <tr>
                                                        <td>${subjectList.subjectName}</td>
                                                        <td>${subjectList.provideNum}</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <div class="toolbar-btn-action" style="display: inline">
                                                                    <div style="display: inline">
                                                                        <button type="button"><a
                                                                                onClick="return confirm('确定删除?');"
                                                                                href="/manager/userIndexManager/deleteSubject/${subjectList.id}">
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
                </div>
            </div>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>
</body>


<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">
    //页面加载完成：判断申请表内的申请状态如果不是“待审核”这使操作a标签所在的div改为已处理
    $(document).ready(function () {

    });



    function addsubject() {
        $.ajax({
            url: "/manager/userIndexManager/addSubject",
            data: $("#form").serialize(),
            type: "POST",
            dataType: "text",
            async: false,
            success: function (result) {
                if (result == 1) {
                    alert("新增学科成功！");
                    //刷新页面
                    window.location.href = "/manager/userIndexManager/subject";
                } else if (result == 0) {
                    alert("错误：学科名称不能为空！")
                } else if (result == 2) {
                    alert("错误：学科名称已存在，无需重复！")
                }
            }
        })
    }


</script>
</html>
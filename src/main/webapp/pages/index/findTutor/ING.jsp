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
            <div class="card-header"><h4><b>正在匹配中</b></h4></div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>科目需求</th>
                            <th>匹配教师</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty relationVos}">
                                <tr>
                                    <td colspan="4">暂无数据</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="relationVos" items="${relationVos}">
                                    <tr>
                                        <td>${relationVos.subjectName}</td>
                                        <td>${relationVos.tUsername}</td>
                                        <td>${relationVos.status}</td>
                                        <td>
                                            <div class="btn-group">
                                                <div class="toolbar-btn-action" style="display: inline">
                                                    <div style="display: inline">
                                                        <button type="button"><a onClick="return confirm('匹配中不可取消');"
                                                                                 href="#">
                                                            <i class="mdi mdi-delete"></i> 取消匹配
                                                        </a></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <div class="toolbar-btn-action" style="display: inline">
                                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                                    data-target="#exampleModal" data-whatever="@mdo">
                                                结束匹配
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
                                                                    <label class="control-label">请您评价本次家教历程：</label>
                                                                    <textarea type="text" class="form-control" name="appraise"></textarea>
                                                                    <input type="hidden" name="rid" value="${relationVos.rid}">
                                                                    <input type="hidden" name="tid" value="${relationVos.tid}">
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button onclick="sumbitAppraise()" class="btn btn-primary"
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
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                    <div class="card-toolbar clearfix">
                    </div>
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
    //评价
    function sumbitAppraise() {
        $.ajax({
            url: "/index/findTutor/appraise",
            data: $("#form").serialize(),
            type: "POST",
            dataType: "text",
            async: false,
            success: function (result) {
                if (result == 1) {
                    alert("评价成功！");
                    //刷新页面
                    window.location.href = "/index/findTutor";
                } else if (result == 0) {
                    alert("错误：原因不明！")
                }
            }
        })
    }
</script>
</html>
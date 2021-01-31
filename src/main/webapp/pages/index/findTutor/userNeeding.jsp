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
            <div class="card-header"><h4><b>我要找家教</b></h4></div>
            <div class="card-toolbar clearfix">
                <div class="toolbar-btn-action">
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#exampleModal" data-whatever="@mdo">
                        <i class="mdi mdi-plus"></i> 新增类别
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

                                            <div class="form-group">
                                                <label class="control-label">地点：</label>
                                                <input type="text" class="form-control" name="city" value="${sessionScope.user.city}" readonly>
                                            </div>

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
                                        <button onclick="addUNeeding()" class="btn btn-primary" type="button">提交
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card-body">
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
                            <c:when test="${empty relation}">
                                <tr>
                                    <td colspan="4">暂无数据</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="relation" items="${relation}">
                                    <tr>
                                        <td>${relation.subjectName}</td>
                                        <td>${relation.createDate}</td>
                                        <td>${relation.status}</td>
                                        <td>
                                            <div class="btn-group">
                                                <div class="toolbar-btn-action" style="display: inline">
                                                    <div style="display: inline">
                                                        <button type="button"><a onClick="return confirm('确定删除?');"
                                                                                 href="/index/findTutor/delete/${relation.id}">
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

            <!--需求列表-->
            <div class="card-header"><h4><b>根据你的需求<font color="green">【${needing}】</font>为你查询到以下家教信息</b></h4></div>
            <div class="card-body" style="height: 900px">
                <div class="card">
                    <div class="card-toolbar clearfix">
                        <form class="pull-left search-bar" method="get" action="#"
                              role="form">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <input type="text" class="form-control " value="" name="str"
                                           placeholder="请输入用户名或姓名查询">
                                    <input type="submit" value="查询" class="btn btn-primary"/>
                                </div>
                            </div>
                        </form>
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
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${empty tNeedingVos}">
                                        <tr>
                                            <td colspan="11">暂无数据</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="tNeedingVos" items="${tNeedingVos}">
                                            <tr>
                                                <td>${tNeedingVos.username}</td>
                                                <td>${tNeedingVos.name}</td>
                                                <td>${tNeedingVos.sex}</td>
                                                <td>${tNeedingVos.age}</td>
                                                <td>${tNeedingVos.graduation}</td>
                                                <td>${tNeedingVos.degree}</td>
                                                <td>${tNeedingVos.city}</td>
                                                <td>${tNeedingVos.tel}</td>
                                                <th>${tNeedingVos.subjectName}</th>
                                                <td>${tNeedingVos.createdate}</td>
                                                <td>${tNeedingVos.status}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <a class="btn btn-xs btn-default"
                                                           href="/index/findTutor/matching?tUsername=${tNeedingVos.username}"
                                                           title="选择他成为我的家教"
                                                           data-toggle="tooltip"><i
                                                                class="mdi mdi-check"></i>选择他成为我的家教</a>
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
</div>


</body>
<style type="text/css">

</style>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">
    //新增类别
    function addUNeeding() {
        $.ajax({
            url: "/index/findTutor/add",
            data: $("#form").serialize(),
            type: "POST",
            dataType: "text",
            async: false,
            success: function (result) {
                if (result == 1) {
                    alert("新增需求成功");
                    //刷新页面
                    window.location.href = "/index/findTutor";
                }else if(result == 0){
                    alert("你已经提交过需求了，一人只能有一次需求");
                    window.location.href = "/index/findTutor";
                }
            }
        })
    }
</script>
</html>
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


<style>
    .table > thead:first-child > tr:first-child > th {
        text-align: center;
    }
</style>
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
                            <div class="card-toolbar clearfix">
                                <form class="pull-left search-bar" method="post"
                                      action="/manager/roleManager/query"
                                      role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <input type="text" class="form-control " value="" name="roleName"
                                                   placeholder="请输入角色名查询">
                                            <input type="submit" value="查询" class="btn btn-primary"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered" style="text-align: center">
                                        <thead>
                                        <tr>
                                            <th>角色编号</th>
                                            <th>角色名称</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty roleList}">
                                                <tr>
                                                    <td colspan="5">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="roleList" items="${roleList}">
                                                    <tr>
                                                        <td>${roleList.roleId}</td>
                                                        <td>${roleList.roleName}</td>
                                                        <td>
                                                                <%--编辑和删除--%>
                                                            <button data-toggle="modal"
                                                                    data-target="#${roleList.roleId}exampleModal"
                                                                    data-whatever="@mdo">
                                                                修改
                                                            </button>
                                                            &nbsp;&nbsp;
                                                            <button onclick="delRole('${roleList.roleId}',this)">删除
                                                            </button>

                                                            <div class="modal fade" id="${roleList.roleId}exampleModal"
                                                                 tabindex="-1"
                                                                 role="dialog"
                                                                 aria-labelledby="exampleModalLabel">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close"
                                                                                    data-dismiss="modal"
                                                                                    aria-label="Close"><span
                                                                                    aria-hidden="true">&times;</span>
                                                                            </button>
                                                                            <h4 class="modal-title"
                                                                                id="exampleModalLabel">新增</h4>
                                                                        </div>
                                                                        <form id="roleUpdate"
                                                                              action="/manager/roleManager/roleUpdate"
                                                                              method="post">
                                                                            <table style=" margin:50px auto;">
                                                                                <tbody>
                                                                                <tr>
                                                                                    <td>角色编号：</td>
                                                                                    <td><input type="number"
                                                                                               class="form-control"
                                                                                               name="roleId"
                                                                                               value="${roleList.roleId}"
                                                                                               readonly/></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>角色名称：</td>
                                                                                    <td><input type="text"
                                                                                               class="form-control"
                                                                                               name="roleName"
                                                                                               value="${roleList.roleName}"
                                                                                               required/></td>
                                                                                </tr>
                                                                                </tbody>

                                                                                <tfoot>
                                                                                <tr>
                                                                                    <td><input type="submit"
                                                                                               class="btn btn-default"
                                                                                               value="确定"
                                                                                               id="btnSure"/></td>
                                                                                    <td><input type="button"
                                                                                               class="btn btn-default"
                                                                                               value="取消"
                                                                                               id="btnCancel"
                                                                                               data-dismiss="modal"/>
                                                                                    </td>
                                                                                </tr>
                                                                                </tfoot>
                                                                            </table>
                                                                        </form>
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


<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">


   /* $("#roleUpdate").ajaxForm({
        beforeSubmit: function () {
        },
        data: $("#roleUpdate").serialize(),
        dataType: "json",
        success: function (data) {
            console.log(data)
            if (data.code == 0) {
                //添加成功成功

                alert(data.msg);
                window.location.href = "/manager/roleManager/roleList";
            } else {
                //添加失败
                alert(data.msg)
            }
        }
    });*/

    delRole = function (rid, obj) {

        //通过ajax进行删除
        $.ajax({
            type: "post",
            url: "/manager/roleManager/delRole",
            data: {
                id: rid
            },
            async: false,
            dataType: "json",
            success: function (data) {
                if (data.code == 0) {
                    alert(data.msg);
                    $(obj).parent().parent().remove();
                }

                if (data.code == 1) {
                    alert(data.msg)
                }
            }
        });
    }

</script>
</body>
</html>
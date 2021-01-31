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
                                      action="/manager/userManager/query"
                                      role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <input type="text" class="form-control " value="" name="userName"
                                                   placeholder="请输入用户姓名查询">
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
                                            <th>用户名</th>
                                            <th>用户姓名</th>
                                            <th>性别</th>
                                            <th>年龄</th>
                                            <th>邮箱</th>
                                            <th>联系方式</th>
                                            <th>个人介绍</th>
                                            <th>状态</th>
                                            <th>角色</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty userList}">
                                                <tr>
                                                    <td colspan="5">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="userList" items="${userList}">
                                                    <tr>
                                                        <td>${userList.userNick}</td>
                                                        <td>${userList.userName}</td>
                                                        <td>${userList.userGender}</td>
                                                        <td>${userList.userAge}</td>
                                                        <td>${userList.userEmail}</td>
                                                        <td>${userList.userPhone}</td>
                                                        <td>${userList.userSelfIntroduction}</td>
                                                        <c:if test="${userList.statuId=='1'}">
                                                            <td>正常</td>
                                                        </c:if>
                                                        <c:if test="${userList.statuId=='2'}">
                                                            <td>封号</td>
                                                        </c:if>
                                                        <c:if test="${userList.roleId=='2'}">
                                                            <td>用户</td>
                                                        </c:if>
                                                        <c:if test="${userList.roleId=='1'}">
                                                            <td>管理员</td>
                                                        </c:if>
                                                        <td>
                                                            <button data-toggle="modal"
                                                                    data-target="#${userList.userId}exampleModal"
                                                                    data-whatever="@mdo">
                                                                修改
                                                            </button>

                                                            <button onclick="delUser('${userList.userId}',this)">删除
                                                            </button>

                                                                <%--弹框表格--%>
                                                            <div class="modal fade" id="${userList.userId}exampleModal"
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
                                                                        <form id="userUpdate"
                                                                              action="/manager/userManager/userUpdate"
                                                                              method="post">
                                                                            <table style=" margin:50px auto;">
                                                                                <tbody>
                                                                                <tr>
                                                                                    <td>用户编号：</td>
                                                                                    <td><input type="number"
                                                                                               class="form-control"
                                                                                               name="userId"
                                                                                               value="${userList.userId}"
                                                                                               readonly/></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>用户昵称：</td>
                                                                                    <td><input type="text"
                                                                                               class="form-control"
                                                                                               name="userNick"
                                                                                               value="${userList.userNick}"
                                                                                               required/></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>真实姓名：</td>
                                                                                    <td><input type="text"
                                                                                               class="form-control"
                                                                                               name="userName"
                                                                                               value="${userList.userName}"
                                                                                               required/></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>用户密码：</td>
                                                                                    <td><input type="text"
                                                                                               class="form-control"
                                                                                               name="userPassword"
                                                                                               value="${userList.userPassword}"
                                                                                               required/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>用户年龄：</td>
                                                                                    <td><input type="text"
                                                                                               class="form-control"
                                                                                               name="userAge"
                                                                                               value="${userList.userAge}"/>
                                                                                    </td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td>电子邮箱：</td>
                                                                                    <td><input type="text"
                                                                                               class="form-control"
                                                                                               name="userEmail"
                                                                                               value="${userList.userEmail}"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>联系方式：</td>
                                                                                    <td><input type="text"
                                                                                               class="form-control"
                                                                                               name="userPhone"
                                                                                               value="${userList.userPhone}"
                                                                                               pattern="^1[1-9]\d{9}$"
                                                                                               title="手机号码有误"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>个人介绍：</td>
                                                                                    <td><input type="text"
                                                                                               class="form-control"
                                                                                               name="userSelfIntroduction"
                                                                                               value="${userList.userSelfIntroduction}"/>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>用户性别：</td>
                                                                                    <td><select name="userGender"
                                                                                                class="form-control">
                                                                                        <option value="${userList.userGender}"
                                                                                                readonly>${userList.userGender}</option>
                                                                                    </select>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>角色名称：</td>
                                                                                    <td>
                                                                                        <select name="roleId"
                                                                                                class="form-control">
                                                                                            <c:if test="${userList.roleId=='2'}">
                                                                                                <option value="2">用户
                                                                                                </option>
                                                                                                <option value="1">管理员
                                                                                                </option>
                                                                                            </c:if>
                                                                                            <c:if test="${userList.roleId=='1'}">
                                                                                                <option value="1">管理员
                                                                                                </option>
                                                                                                <option value="2">用户
                                                                                                </option>
                                                                                            </c:if>
                                                                                        </select>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>状态</td>
                                                                                    <td>
                                                                                        <select name="statuId"
                                                                                                class="form-control">
                                                                                            <c:if test="${userList.statuId=='1'}">
                                                                                                <option value="1">正常
                                                                                                </option>
                                                                                                <option value="2">封号
                                                                                                </option>
                                                                                            </c:if>
                                                                                            <c:if test="${userList.statuId=='2'}">
                                                                                                <option value="2">封号
                                                                                                </option>
                                                                                                <option value="1">正常
                                                                                                </option>
                                                                                            </c:if>
                                                                                        </select>
                                                                                    </td>
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
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script type="text/javascript">

    /*
        $("#userUpdate").ajaxForm({
            beforeSubmit: function () {
                alert("1");
            },
            url:"/manager/userManager/userUpdate",
            method:"post",
            data: $("#userUpdate").serialize(),
            dataType: "json",
            success: function (data) {
                console.log(data)
                if (data.code == 0) {
                    //添加成功成功
                    alert(data.msg);
                    window.location.href = "/manager/userManager/userList";
                } else {
                    //添加失败
                    alert(data.msg)
                }
            }
        });*/


    delUser = function (uid, obj) {

        //通过ajax进行删除
        $.ajax({
            type: "post",
            url: "/manager/userManager/delUser",
            data: {
                id: uid
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
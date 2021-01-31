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
                        <div class="card">
                            <div class="card-header"><h4><b><i>新增角色</i></b></h4></div>
                            <div class="card-body" style="height: 950px">
                                <div class="toolbar-btn-action" style="display: inline">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#exampleModal" data-whatever="@mdo">
                                        新增角色
                                    </button>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="exampleModalLabel">新增</h4>
                                                </div>
                                                <form id="roleInsert" action="/manager/roleManager/roleInsert"
                                                      method="post">
                                                    <table style=" margin:50px auto;">
                                                        <tbody>
                                                        <tr>
                                                            <td>角色编号：</td>
                                                            <td><input type="text" class="form-control" name="roleId"
                                                                       value="${roleIList.roleId}" required/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>角色名称：</td>
                                                            <td><input type="text" class="form-control" name="roleName"
                                                                       value="${roleIList.roleName}" required/></td>
                                                        </tr>
                                                        </tbody>

                                                        <tfoot>
                                                        <tr>
                                                            <td><input type="submit" class="btn btn-default" value="确定"
                                                                       id="btnSure"/></td>
                                                            <td><input type="button" class="btn btn-default" value="取消"
                                                                       id="btnCancel" data-dismiss="modal"/></td>
                                                        </tr>
                                                        </tfoot>
                                                    </table>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered" style="text-align: center">
                                        <thead>
                                        <tr>
                                            <th>角色编号</th>
                                            <th>角色名称</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty roleList}">
                                                <tr>
                                                    <td colspan="3">暂无数据</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="roleList" items="${roleList}">
                                                    <tr>
                                                        <td>${roleList.roleId}</td>
                                                        <td>${roleList.roleName}</td>
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

    //通过ajax对接服务器
    $("#roleInsert").ajaxForm({
        beforeSubmit: function () {
        },
        data: $("#roleInsert").serialize(),
        dataType: "json",
        success: function (data) {
            console.log(data)
            if (data.code == 0) {
                $('#userInsert').modal('hide');
                //添加成功成功
                alert(data.msg);
                window.location.href = "/manager/roleNew";
            } else {
                //添加失败
                alert(data.msg)
            }
        }
    });

    //获取Select节点id
    function findRole() {
        $.ajax({
            type: "get",  //获取请求参数
            url: "/user", //请求地址
            data: {
                method: "queryAll"
            },
            async: false,    //是否异步
            dataType: "json",//服务器返回的数据类型
            success: function (data) { //请求成功执行的方法
                for (var i = 0; i < data.length; i++) {
                    //创建option
                    var optNode = document.createElement("option");
                    optNode.value = data[i].role_id;
                    optNode.text = data[i].role_name;
                    //将option加进sel
                    rNode.add(optNode);
                }
            }
        });
    }

    /* function addnews() {
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
     }*/
</script>
</body>
</html>
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
    <title>学优家教网</title>
    <link rel="icon" href="/img/bkb.ico" type="image/ico">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
    <!--对话框-->
    <link rel="stylesheet" href="/js/jconfirm/jquery-confirm.min.css">
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">

        <jsp:include page="index_nav.jsp"></jsp:include>

        <div class="sub_banner center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card" style="height: 400px">
                            <div class="card-header">
                                <div class="toolbar-btn-action">
                                    <%--                                    <a class="btn btn-primary m-r-5" href="#!">我的家教记录</a>--%>
                                    <%--                                    <a class="btn btn-success m-r-5" href="#!">我的学员记录</a>--%>
                                    <div class="toolbar-btn-action" style="display: inline">
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#exampleModal0" data-whatever="@mdo">
                                            <i class="mdi mdi-plus"></i> 发布网课视频
                                        </button>
                                        <div class="modal fade" id="exampleModal0" tabindex="-1" role="dialog"
                                             aria-labelledby="exampleModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close"><span
                                                                aria-hidden="true">&times;</span>
                                                        </button>
                                                        <h4 class="modal-title" id="exampleModalLabel0">发布网课视频</h4>
                                                    </div>
                                                    <form id="form0" method="post">
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <div form-control><label
                                                                        class="control-label">上传视频</label>
                                                                </div>
                                                                <div>
                                                                    <input type="file" id="File" onchange="upload()">
                                                                    <input type="hidden" id="filepath" name="mediaPath"
                                                                           value="">
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="control-label">输入视频标题：</label>
                                                                <input type="text" class="form-control" name="mediaName"
                                                                       placeholder="不超过15个字">
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="control-label">输入视频简介：</label>
                                                                <textarea type="text" class="form-control"
                                                                          name="mediaDesc"></textarea>
                                                            </div>


                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default"
                                                                    data-dismiss="modal">
                                                                关闭
                                                            </button>
                                                            <button onclick="addnetCourse()" class="btn btn-primary"
                                                                    type="button">提交
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="card-header"><h4>个人基本信息</h4></div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped">
                                        <div><img src=""></div>
                                        <tr>
                                            <td><small>用户名 : </small>${sessionScope.user.username}</td>
                                            <td><small>姓名 ：</small>${sessionScope.user.name}</td>
                                            <td><small>年龄 ：</small>${sessionScope.user.age}</td>
                                        </tr>

                                        <tr>
                                            <td><small>性别 ：</small>${sessionScope.user.sex}</td>
                                            <td><small>城市 ：</small>${sessionScope.user.city} cm</td>
                                            <td><small>注册时间：</small>${sessionScope.user.createDate}</td>
                                        </tr>
                                        <tr>
                                            <td><small>联系方式 ：</small>${sessionScope.user.tel}</td>
                                            <td><small>邮箱 ：</small>${sessionScope.user.email}</td>
                                        </tr>
                                    </table>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <button class="btn btn-primary btn-block update_info">修改基本信息</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header"><h4>修改密码</h4></div>
                            <div class="card-body">
                                <form id="form_password">
                                    <div class="table-responsive">
                                        <div>
                                            <pre><span>旧密码    </span><input id="old_password" name="old_password" type="text" > </pre>
                                            <pre><span>新密码    </span><input id="password" name="new_password" type="password" ><label id="password_trip"></label></pre>
                                            <pre><span>确认密码  </span><input id="rePassword" type="password" required > <label id="surePassword_trip"></label></pre>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input type="button" onblur="checkForm()"  onclick="return submitT()" class="btn btn-primary btn-block update_info" value="确认"></input>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End 页面主要内容-->

</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<!--对话框-->
<script src="/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">
    $('.update_info').on('click', function () {
        $.confirm({
            title: '修改个人基本信息',
            content: '' +
                '<form id="form" action="" class="formName">' +
                '<div class="form-group">' +
                '<label>用户名</label>' +
                '<input type="text" value="${sessionScope.sysUser.username}" name="username" class="name form-control" required readonly="readonly"/>' +
                '<label>姓名</label>' +
                '<input type="text" value="${sessionScope.sysUser.name}" name="name" class="name form-control" required />' +
                '<label>年龄</label>' +
                '<input type="text" value="${sessionScope.sysUser.age}" name="age" class="name form-control" required />' +
                '<label>性别</label>' +
                '<input type="text" value="${sessionScope.sysUser.sex}" name="sex" class="name form-control" required />' +
                '<label>城市</label>' +
                '<input type="text" value="${sessionScope.sysUser.city}" name="city" class="name form-control" required />' +
                '<label>邮箱</label>' +
                '<input type="text" value="${sessionScope.sysUser.email}" name="email" class="name form-control" required />' +
                '<label>联系方式</label>' +
                '<input type="text" value="${sessionScope.sysUser.tel}" name="tel" class="name form-control" required />' +
                '</div>' +
                '</form>',
            buttons: {
                formSubmit: {
                    text: '提交',
                    btnClass: 'btn-blue',
                    action: function () {
                        $.ajax({
                            url: "/sysuser/updateInfo",//url
                            //几个参数需要注意一下
                            data: $('#form').serialize(),
                            type: "POST",//方法类型
                            dataType: "text",//预期服务器返回的数据类型
                            async: false,
                            success: function (result) {
                                if ("1" == result) {
                                    alert("修改成功！");
                                    window.location.href = "/index/userSet"
                                }
                            },
                            error: function () {
                                alert("异常！联系管理员！");
                            }
                        });
                    }
                },
                cancel: {
                    text: '取消'
                },
            },
            onContentReady: function () {
                var jc = this;
                this.$content.find('form').on('submit', function (e) {
                    e.preventDefault();
                    jc.$$formSubmit.trigger('click');
                });
            }
        });
    });


    function checkForm() {
        //密码长度大于6 和确认必须一致
        var password = document.getElementById("password");
        var userPass = password.value;
        if (userPass.length < 5 || userPass.length > 18) {
            errTrip("password_trip", "* 密码长度不符");
            return false;
        } else {
            rightTrip("password_trip", "✔ 通过");
        }

        //获取确认密码框的值 var
        var rePassword = document.getElementById("rePassword");
        var surePass = rePassword.value;
        if (userPass != surePass) {
            errTrip("surePassword_trip", "* 两次密码不一致");
            return false;
        }

        return true;
    }

    function submitT() {
        if (checkForm()) {
            $.ajax({
                url: "/sysuser/updatePassword",//url
                //几个参数需要注意一下
                data: $('#form_password').serialize(),
                type: "POST",//方法类型
                dataType: "text",//预期服务器返回的数据类型
                async: false,
                success: function (result) {
                    if (0==result){
                        alert("输入的旧密码错误")
                    }else if(1==result){
                        alert("修改成功！")
                        window.location.href="/index/userSet"
                    }else{
                        alert("修改失败，原因不明，请联系管理员修复bug")
                    }
                },
                error: function () {
                    alert("异常！原因不明，请联系管理员修复bug");
                }
            });
        } else {
            return false;
        }
    }

</script>
</body>
</html>
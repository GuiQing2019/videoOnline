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
    <title>登陆</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        font-family: 幼圆;
    }

    html {
        height: 100%;
        width: 100% !important;
        overflow: hidden;
        margin: 0;
        padding: 0;
        /*background: url(/img/bg.png) no-repeat 100% 100% !important;*/
        background: palevioletred no-repeat 100% 100% !important;
        background-repeat: no-repeat;
        background-size: 100% 100%;
        -moz-background-size: 100% 100%;
    }

    body {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100%;
        width: 100% !important;
        background-color: transparent !important;
        color: transparent !important;
    }

    .lyear-layout-sidebar {
        position: fixed;
        top: 0;
        bottom: 0;
        z-index: 0;
        display: none !important;
        width: 0px !important;
        font-weight: 500;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
        -webkit-transition: 0.3s transform;
        transition: 0.3s transform;
        transform: translateX(0);
        -webkit-box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.08);
        -moz-box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.08);
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.08);
    }

    #loginDiv {
        width: 37%;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 300px;
        background-color: rgba(75, 81, 95, 0.3);
        box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
        border-radius: 5px;
    }

    #name_trip {
        margin-left: 50px;
        color: red;
    }

    #password_trip {
        margin-left: 50px;
        color: red;
    }

    p {
        margin-top: 30px;
        margin-left: 20px;
        color: azure;
    }

    a {
        text-decoration-line: none;
        color: white;
    }

    input {
        margin-left: 15px;
        border-radius: 5px;
        border-style: hidden;
        height: 30px;
        width: 240px;
        background-color: rgba(216, 191, 216, 0.5);
        outline: none;
        color: #f0edf3;
        padding-left: 10px;
    }

    .button {
        border-color: cornsilk;
        background-color: rgba(100, 149, 237, .7);
        color: aliceblue;
        border-style: hidden;
        border-radius: 5px;
        width: 100px;
        height: 31px;
        font-size: 16px;
    }

    .lyear-wrapper {
        position: relative;
    }

    .lyear-login {
        display: flex !important;
        min-height: 100vh;
        align-items: center !important;
        justify-content: center !important;
    }

    .login-center {
        background: #fff;
        min-width: 38.25rem;
        padding: 2.14286em 3.57143em;
        border-radius: 5px;
        margin: 2.85714em 0;
    }

    .login-header {
        margin-bottom: 1.5rem !important;
    }

    .login-center .has-feedback.feedback-left .form-control {
        padding-left: 38px;
        padding-right: 12px;
    }

    .login-center .has-feedback.feedback-left .form-control-feedback {
        left: 0;
        right: auto;
        width: 38px;
        height: 38px;
        line-height: 38px;
        z-index: 4;
        color: #dcdcdc;
    }

    .login-center .has-feedback.feedback-left.row .form-control-feedback {
        left: 15px;
    }

</style>
<body>
<div id="loginDiv">
    <form id="loginId" action="/sysuser/login" method="post">
        <h1 style="text-align: center;color: aliceblue;">欢迎登录视频学习网站</h1>
        <p><b>用户名:</b><input id="usernameId" name="userName" type="text"><label id="name_trip"></label></p>

        <p><b>密 码:</b> <input id="passwordId" name="userPassword" type="password"><label id="password_trip"></label></p>

        <div style="text-align: center;margin-top: 30px;">
            <input type="submit" class="button">确定</input>
            <a href="/register">
                <button type="button" class="button">注册</button>
            </a>
        </div>
    </form>
</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<!--消息提示-->
<script type="text/javascript" src="/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="/js/lightyear.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script type="text/javascript">

    $("#loginId").ajaxForm({
        beforeSubmit: function () {
            var name=$("#usernameId").val();
            var pwd=$("#passwordId").val();

            //定义标记
            var uFlag = true;
            var pFlag = true;
            //判断输入不能为空
            if (name.length == 0) {
                lightyear.loading('show');
                // 假设ajax提交操作
                setTimeout(function () {
                    lightyear.loading('hide');
                    lightyear.notify('用户名不能为空!', 'danger', 100);
                }, 1e3)
                uFlag = false;
            }
            if (pwd.length == 0) {
                lightyear.loading('show');
                // 假设ajax提交操作
                setTimeout(function () {
                    lightyear.loading('hide');
                    lightyear.notify('密码不能为空!', 'danger', 100);
                }, 1e3)

                pFlag = false;
            }
            return uFlag && pFlag;
        },data: $('#loginId').serialize()
        ,dataType: "json" //预期服务器返回的数据类型
        ,success: function (data) {
            //请求成功的方法
            console.log(data);
            if (data.code == 0) {
                lightyear.loading('show');
                // 假设ajax提交操作
                setTimeout(function () {
                    lightyear.loading('hide');
                    lightyear.notify('管理员登录成功，欢迎来到后台管理...', 'success', 100);
                }, 1000)
                setTimeout(window.location.href = "/manager/index", 3000)
            }
            if (data.code == 1) {
                lightyear.loading('show');
                // 假设ajax提交操作
                setTimeout(function () {
                    lightyear.loading('hide');
                    lightyear.notify('不存在当前账号请注册', 'success', 100);
                }, 1000)
                setTimeout(window.location.href = "register", 3000)
            }
        }
    });

    /*function login() {
        $.ajax({
            url: "/sysuser/login",//url
            //几个参数需要注意一下
            data: $('#userForm').serialize(),
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            async: true,
            success: function (data) {
                console.log(data)
                if (0 == result) {
                    lightyear.loading('show');
                    // 假设ajax提交操作
                    setTimeout(function () {
                        lightyear.loading('hide');
                        lightyear.notify('登录失败，请检查用户名或密码...', 'danger', 100);
                    }, 1e3)
                } else if (1 == result) {
                    lightyear.loading('show');
                    // 假设ajax提交操作
                    setTimeout(function () {
                        lightyear.loading('hide');
                        lightyear.notify('管理员登录成功，欢迎来到后台管理...', 'success', 100);
                    }, 1e3)
                    setTimeout(window.location.href = "manager", 3000)
                } else {
                    lightyear.loading('show');
                    // 假设ajax提交操作
                    setTimeout(function () {
                        lightyear.loading('hide');
                        lightyear.notify('服务器错误，请稍后再试~', 'danger', 100);
                    }, 1e3)
                }
            }
            ,
            error: function () {
                alert("异常！联系管理员重启服务器！");
            }
        });
    }
    */

</script>
</body>
</html>
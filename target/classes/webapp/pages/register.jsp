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
        height: auto;
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

    .form-control {

        margin-left: 26px;
        border-radius: 5px;
        border-style: hidden;
        height: 30px !important;
        width: 240px;
        background-color: rgba(216, 191, 216, 0.5);
        outline: none;
        color: #f0edf3;
        margin-top: 25px;
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

    .loginy {
        letter-spacing: 1px;
    }

    .tanxing {
        display: flex;
        height: 60px;
    }
</style>
<body>
<div id="loginDiv">
    <form id="registerForm" action="/sysuser/register" method="post">

        <h1 style="text-align: center;color: aliceblue;">用户注册</h1>
        <p><label for="username">用户名 :</label><input id="username" name="userName" type="text"><label
                id="name_trip"></label></p>
        <p><b class="loginy">密 码 :</b> <input id="password" name="userPassword" type="password"><label
                id="password_trip"></label></p>

        <p><b>年 龄 :</b> <input id="userage" name="userAge" type="text"><label id="age_trip"></label></p>


        <p><b>昵 称 :</b> <input id="usernick" name="userNick" type="text"><label id="nick_trip"></label></p>

        <div class="tanxing"><p><b>性 别 :</b></p>  <select class="form-control" name="userGender" size="1">
            <option value="男">男</option>
            <option value="女">女</option>
        </select></div>


        <p><b>电子邮箱:</b> <input id="useremail" name="userEmail" type="text"><label id="email_trip"></label></p>

        <p><b>手机号码:</b> <input id="userphone" name="userPhone" type="text"><label id="phone_trip"></label></p>

        <p><b>自我介绍:</b> <input id="userself" name="userSelfIntroduction" type="text"><label id="self_trip"></label></p>

        <div style="text-align: center;margin-bottom: 30px;">
            <button type="submit" class="button" >确定</button>
            <a href="/">
                <button type="button" class="button">返回</button>
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
    $("#registerForm").ajaxForm({
        beforeSubmit: function () {
            var name=$("#username").val();
            var pwd=$("#password").val();

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
                    lightyear.notify('注册成功!...', 'success', 100);
                }, 1000)
                setTimeout(window.location.href = "/login", 3000)
            }
            if (data.code == 1) {
                lightyear.loading('show');
                // 假设ajax提交操作
                setTimeout(function () {
                    lightyear.loading('hide');
                    lightyear.notify('不存在当前账号请注册', 'success', 100);
                }, 1000)
                setTimeout(window.location.href = "/register", 3000)
            }
        }
    });

</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="zh">
<html>
<head>
    <meta charset="UTF-8">
    <title>用户信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="/icons/icon.ico" type="image/x-icon">
    <link rel="stylesheet" ype="text/css" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/xcConfirm.css"/>
    <!--消息提示-->
    <script type="text/javascript" src="/js/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="/js/lightyear.js"></script>
    <script type="text/javascript" src="/js/main.min.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <!-- icon图标 -->
    <link rel="stylesheet" href="/css/font-awesome.css"/>
    <!-- 导航条 -->
    <link rel="stylesheet" href="/css/menu.css"/>
    <link href="/css/style2.css" rel="stylesheet" type="text/css" media="all"/>

</head>
<body>


<div class="container" style="padding: 0; background-color: white;">

    <div class="container-fluid main-content" style="padding: 0;">
        <div class="header">
            <a href="#" style="float: left;">
                <h1>个人中心</h1>
            </a>
        </div>

    </div>

    <%--网站导航条--%>
    <div class="bootstrap_container">
        <nav class="navbar navbar-default w3_megamenu" role="navigation">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target="#defaultmenu" class="navbar-toggle">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand" style="padding: 7px 22px"><i class="fa fa-home"></i></a>

            </div>
            <!-- end navbar-header -->

            <div id="defaultmenu" class="navbar-collapse collapse">
                <ul class="nav navbar-nav" style="margin-bottom: 4px">
                    <li data-toggle="tab" class="active">
                        <a id="userInfoButton" href="#">个人信息</a>
                    </li>
                    <li data-toggle="tab">
                        <a id="accountInfoButton" href="#">账户信息</a>
                    </li>
                    <li data-toggle="tab">
                        <a id="userInfoUpdateButton" href="#">修改信息</a>
                    </li>

                    <li class="dropdown" data-toggle="tab">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">密码管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu mytab">
                            <li data-toggle="tab" class="dropdown-header">密码中心</li>
                            <li data-toggle="tab">
                                <a id="passwordUpdateButton" href="#">修改密码</a>
                            </li>
                            <li data-toggle="tab">
                                <a id="forgetPasswordButton" href="#">找回密码</a>
                            </li>
                        </ul>
                    </li>

                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown" data-toggle="tab">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false"><span title="设置"
                                                                            class="glyphicon glyphicon-cog"></span></a>
                        <ul class="dropdown-menu mytab">
                            <li data-toggle="tab" class="dropdown-header">设置中心</li>
                            <li data-toggle="tab">
                                <a id="reload" href="#">页面刷新</a>
                            </li>
                            <li data-toggle="tab">
                                <a href="#">安全退出</a>
                            </li>
                            <li data-toggle="tab">
                                <a href="#">账号注销</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.container-fluid -->
        </nav>
    </div>

    <%--用户信息--%>
    <form id="userInfo" class="form-horizontal" role="form" style="border:1px solid rgba(0,0,0,.125);margin:0;">
        <div class="form-group">
            <label class="col-sm-1 control-label">用户昵称</label>
            <div class="col-sm-11">
                <p class="form-control-static"
                   th:text="${sessionScope.tbSysuser.userNick}">${sessionScope.tbSysuser.userNick}</p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label">用户年龄</label>
            <div class="col-sm-11">
                <p class="form-control-static"
                   th:text="${sessionScope.tbSysuser.userAge}">${sessionScope.tbSysuser.userAge}</p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">用户性别</label>
            <div class="col-sm-11">
                <p class="form-control-static"
                   th:text="${sessionScope.tbSysuser.userGender}">${sessionScope.tbSysuser.userGender}</p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">QQ邮箱</label>
            <div class="col-sm-11">
                <p class="form-control-static"
                   th:text="${sessionScope.tbSysuser.userEmail}">${sessionScope.tbSysuser.userEmail}</p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">手机号码</label>
            <div class="col-sm-11">
                <p class="form-control-static"
                   th:text="${sessionScope.tbSysuser.userPhone}">${sessionScope.tbSysuser.userPhone}</p>
            </div>
        </div>


        <%--头像 暂未开发--%>
        <%-- <div class="form-group">
             <label class="col-sm-1 control-label">头像</label>
             <div class="col-sm-11">
                 <p class="form-control-static">
                     <img th:src="${session.user.iconUrl}" style="width:200px;height:200px;"/>
                 </p>
             </div>
         </div>--%>

    </form>

    <%--账户信息--%>
    <form id="accountInfo" class="form-horizontal" role="form" style="border:1px solid rgba(0,0,0,.125);margin:0;">
        <div class="form-group">
            <label class="col-sm-1 control-label">账户ID</label>
            <div class="col-sm-11">
                <p class="form-control-static"
                   th:text="${sessionScope.tbSysuser.userId}">${sessionScope.tbSysuser.userId}</p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">真实姓名</label>
            <div class="col-sm-11">
                <p class="form-control-static"
                   th:text="${sessionScope.tbSysuser.userName}">${sessionScope.tbSysuser.userName}</p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">账户角色</label>
            <div class="col-sm-11">
                <c:if test="${sessionScope.tbSysuser.roleId=='1'}">
                    <p class="form-control-static">管理员</p>
                </c:if>
                <c:if test="${sessionScope.tbSysuser.roleId=='2'}">
                    <p class="form-control-static">用户</p>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">个人签名</label>
            <div class="col-sm-11">
                <c:if test="${empty sessionScope.tbSysuser.userSelfIntroduction}">
                    <p class="form-control-static">这个人太懒了,什么也没留下</p>
                </c:if>
                <c:if test="${not empty sessionScope.tbSysuser.userSelfIntroduction}">
                    <p class="form-control-static">${sessionScope.tbSysuser.userSelfIntroduction}</p>
                </c:if>
            </div>
        </div>

    </form>


    <%--修改信息--%>
    <form id="userInfoUpdate" method="post" action="/index/user/userInfoUpdate" class="form-horizontal"
          role="form" enctype="multipart/form-data" style="border:1px solid rgba(0,0,0,.125);margin:0;">
        <input type="hidden" name="userId" value="${sessionScope.tbSysuser.userId}">

        <div class="form-group">
            <label class="col-sm-1 control-label">真实姓名</label>
            <div class="col-sm-11">
                <input type="text" name="userName" autocomplete="off" value="${sessionScope.tbSysuser.userName}"
                       class="form-control" readonly>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">用户昵称</label>
            <div class="col-sm-11">
                <input type="text" name="userNick" autocomplete="off"
                       class="form-control" value="${sessionScope.tbSysuser.userNick}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">用户年龄</label>
            <div class="col-sm-11">
                <input type="text" name="userAge" autocomplete="off"
                       class="form-control" value="${sessionScope.tbSysuser.userAge}">
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-1 control-label">用户性别</label>
            <div class="col-sm-11">
                <select class="form-control" name="userGender">

							<span th:if="${not empty sessionScope.tbSysuser.userGender}>
								<option value="${sessionScope.tbSysuser.userGender}">${sessionScope.tbSysuser.userGender}</option>
                    <span th:if="${sessionScope.tbSysuser.userGender}=='男'">
									<option value="女">女</option>
								</span>
                    <span th:if="${sessionScope.tbSysuser.userGender}=='女'">
									<option value="男">男</option>
								</span>
                    </span>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">QQ邮箱</label>
            <div class="col-sm-11">
                <input type="email" autocomplete="off" name="userEmail"
                       class="form-control" value="${sessionScope.tbSysuser.userEmail}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">手机号码</label>
            <div class="col-sm-11">
                <input type="text" autocomplete="off" name="userPhone"
                       class="form-control" value="${sessionScope.tbSysuser.userPhone}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label">自我介绍</label>
            <div class="col-sm-11">
                <input type="text" name="userSelfIntroduction" autocomplete="off"
                       class="form-control" value="${sessionScope.tbSysuser.userSelfIntroduction}">
            </div>
        </div>
        <%--待开发功能--%>
        <%-- <div class="form-group">
             <label class="col-sm-1 control-label">头像URL</label>
             <div class="col-sm-11">
                 <input id="file-selector" type="file" accept="image/gif,image/jpeg,image/x-png"
                        style="display:none;" name="iconFile" class="form-control" placeholder="请选择文件">
                 <img id="imgshow" src="/img/add.png" style="width:200px;height:200px;"/>
             </div>
         </div>


         <div class="form-group">
             <div class="col-sm-offset-1 col-sm-10">
                 <div class="checkbox">
                     <label>
                         <input type="checkbox"> 本人确认已仔细阅读并充分理解<a href="https://www.vcg.com/help/privacy-policy">
                         个人信息保护政策</a>与<a href="https://www.vcg.com/help/website-terms"> 网站使用条框</a>
                         的全部内容，同意接受上述协议的全部内容
                     </label>
                 </div>
             </div>
         </div>--%>
        <div class="form-group">
            <div class="col-lg-offset-1 col-lg-1">
                <button type="submit" class="btn btn-default">修改</button>
            </div>
            <div class="col-lg-1">
                <button type="reset" class="btn btn-default">取消</button>
            </div>
        </div>
    </form>

    <%--修改密码--%>
    <form id="passwordUpdate" action="#" method="post" class="form-horizontal" role="form"
          style="border:1px solid rgba(0,0,0,.125);margin:0;">
        <input type="hidden" name="userId" value="${sessionScope.tbSysuser.userId}">
        <div class="form-group">
            <label class="col-sm-1 control-label">旧密码</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" disabled;
                       placeholder="${sessionScope.tbSysuser.userPassword}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label">新密码</label>
            <div class="col-sm-11">
                <input type="password" name="userPassword" class="form-control">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> 本人确认已仔细阅读并充分理解<a href="https://www.vcg.com/help/privacy-policy">
                        个人信息保护政策</a>与<a href="https://www.vcg.com/help/website-terms"> 网站使用条框</a>
                        的全部内容，同意接受上述协议的全部内容
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-offset-1 col-lg-1">
                <button type="button" id="pswdupload" class="btn btn-default">更改密码</button>
            </div>
            <div class="col-lg-1">
                <button type="reset" class="btn btn-default">取消</button>
            </div>
        </div>
    </form>



</div>

</div>


<script src="/js/jquery.min.js"></script>
<!-- include flowplayer -->
<script src="/js/flowplayer.min.js"></script>

<script src="/js/bootstrap.min.js"></script>
<script src="/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/home.js"></script>
<script language="JavaScript">

    $('#reload').click(
        function () {
            window.location.reload();
        }
    );

    $(document).ready(
        function () {
            $("#userInfo").show();
            $("#accountInfo").hide();
            $("#userInfoUpdate").hide();
            $("#passwordUpdate").hide();
            $("#forgetPassword").hide();
        }
    );

    $("#userInfoButton").click(
        function () {
            $("#userInfo").show();
            $("#accountInfo").hide();
            $("#userInfoUpdate").hide();
            $("#passwordUpdate").hide();
            $("#forgetPassword").hide();
        }
    );

    $("#accountInfoButton").click(
        function () {
            $("#accountInfo").show();
            $("#userInfo").hide();
            $("#userInfoUpdate").hide();
            $("#passwordUpdate").hide();
            $("#forgetPassword").hide();
        }
    );

    $("#userInfoUpdateButton").click(
        function () {
            $("#userInfoUpdate").show();
            $("#userInfo").hide();
            $("#accountInfo").hide();
            $("#passwordUpdate").hide();
            $("#forgetPassword").hide();
        }
    );
    $("#passwordUpdateButton").click(
        function () {
            $("#passwordUpdate").show();
            $("#userInfo").hide();
            $("#accountInfo").hide();
            $("#userInfoUpdate").hide();
            $("#forgetPassword").hide();
        }
    );


    $('#file-selector').change(function () {
        // 先获取用户上传的文件对象
        let fileObj = this.files[0];
        // 生成一个文件读取的内置对象
        let fileReader = new FileReader();
        // 将文件对象传递给内置对象
        fileReader.readAsDataURL(fileObj); //这是一个异步执行的过程，所以需要onload回调函数执行读取数据后的操作
        // 将读取出文件对象替换到img标签
        fileReader.onload = function () {  // 等待文件阅读器读取完毕再渲染图片
            $('#imgshow').attr('src', fileReader.result)
        }
    });

    $("#imgshow").click(
        function () {
            $("#file-selector").trigger("click");
        }
    );


    $("#forgetPasswordButton").click(
        function () {
            $("#forgetPassword").show();
            $("#passwordUpdate").hide();
            $("#userInfo").hide();
            $("#accountInfo").hide();
            $("#userInfoUpdate").hide();


            setTimeout(
                function () {
                    $.ajax({
                        type: "post",
                        url: "/index/user/forget",
                        async: true,
                        dataType: "JSON",
                        error: function (data) {
                            window.wxc.xcConfirm("密码发送失败", window.wxc.xcConfirm.typeEnum.error);
                        },
                        success: function (data) {
                            window.wxc.xcConfirm("密码已发送到邮箱", window.wxc.xcConfirm.typeEnum.success);
                        }//success:function
                    });//ajax
                },
                100
            );

        }
    );

    $("#pswdupload").click(
        function () {
            $.ajax({
                type: "post",
                url: "/index/user/passwordUpdate",
                async: true,
                data: $('#passwordUpdate').serialize(),
                dataType: "JSON",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function (result) {
                    if (result.code == 0) {
                        console.log("1");
                        lightyear.loading('show');
                        // 走用户后台
                        setTimeout(function () {
                            lightyear.loading('hide');
                            lightyear.notify('新密码已通过邮件发送,请注意查收!', 'success', 2000);
                        }, 1000)
                    } else {
                        lightyear.loading('show');
                        // 走用户后台
                        setTimeout(function () {
                            lightyear.loading('hide');
                            lightyear.notify('修改失败!请检查用户密码!', 'danger', 2000);
                        }, 1000)
                    }
                }//success:function
            });//ajax
        }
    );
</script>
</body>
</html>

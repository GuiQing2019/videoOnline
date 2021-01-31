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
    <title>学优家教网 </title>
    <link rel="icon" href="/img/bkb.ico" type="image/ico">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>
<style type="text/css">
    .my_nav {
        font-size: 16px;
        font-weight: bold;
    }

    .my_nav2 {
        background-color: #f5f5f5;
    }

    .my_nav2 li a:hover {
        color: #0FB25F;
    }

    .main-nav{
        font-size: larger;
        font-weight: bolder;
    }

    .sec-nav{
        font-size: 1px;
    }
</style>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">


        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="../index/index.jsp"><img src="/img/logo-sidebar.png" title="logo" alt=""/></a>
            </div>
            <div class="lyear-layout-sidebar-scroll">
                <!--菜单-->
                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active"><a href="/manager" class=" my_nav"><i class="mdi mdi-home"></i>
                            <p class="main-nav">首页</p>
                            <p class="sec-nav">主要事务处理</p>
                        </a>
                        </li>

                        <li class="nav-item-has-subnav">
                            <a href="javascript:void(0)" class=" my_nav"><i class="mdi mdi-account"></i>
                                <div class="clear">
                                    <p class="main-nav">用户管理</p>
                                    <p class="sec-nav">用户列表</p>
                                    <p class="sec-nav">新增管理员/用户</p>
                                </div>
                            </a>
                            <ul class="nav nav-subnav my_nav2">
                                <li><a href="/manager/userManager/userList">用户列表</a></li>
                                <li><a href="/manager/userNew">新增管理员/用户</a></li>
                            </ul>
                        </li>

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)" class=" my_nav"><i class="mdi mdi-account"></i>
                                <div>
                                    <p class="main-nav">分类管理</p>
                                    <p class="sec-nav">分类列表</p>
                                    <p class="sec-nav">新增分类</p>
                                </div>
                            </a>
                            <ul class="nav nav-subnav my_nav2">
                                <li><a href="/manager/classifyManager/classifyList">分类列表</a></li>
<%--                                <li><a href="#">名师推荐</a></li>--%>
                                <li><a href="/manager/classifyNew">新增分类</a></li>
                            </ul>
                        </li>

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)" class=" my_nav"><i class="mdi mdi-account"></i>
                                <div>
                                    <p class="main-nav">视频管理</p>
                                    <p class="sec-nav">审核管理</p>
                                    <p class="sec-nav">视频列表</p>
                                </div>
                            </a>
                            <ul class="nav nav-subnav my_nav2">
                                <li><a href="/manager/videoManager/tutorNeedingList">审核管理</a></li>
                                <li><a href="/manager/videoManager/videoList">视频列表</a></li>
                            </ul>
                        </li>

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)" class=" my_nav"><i class="mdi mdi-account"></i>
                                <div>
                                    <p class="main-nav">角色管理</p>
                                    <p class="sec-nav">角色列表</p>
                                    <p class="sec-nav">角色新增</p>
                                </div>
                            </a>
                            <ul class="nav nav-subnav my_nav2">
                                <li><a href="/manager/roleManager/roleList">角色列表</a></li>
                                <li><a href="/manager/roleNew">角色新增</a></li>
                            </ul>
                        </li>


                    </ul>
                </nav>

            </div>

        </aside>
        <!--End 左侧导航-->


        <!--头部信息-->
        <header class="lyear-layout-header">

            <nav class="navbar navbar-default">
                <div class="topbar">

                    <div class="topbar-left">
                        <div class="lyear-aside-toggler">
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                        </div>
                        <span class="navbar-page-title">+/-</span>
                    </div>

                    <ul class="topbar-right">
                        <li class="dropdown dropdown-profile">
                            <a href="javascript:void(0)" data-toggle="dropdown">
                                <img class="img-avatar img-avatar-48 m-r-10" src="" alt=""/>
                                <span>${sessionScope.user.name}<span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="/manager/managerSet"><i class="mdi mdi-lock-outline"></i> 管理员设置</a></li>
                                <li class="divider"></li>
                                <li><a href="/sysuser/logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a>
                                </li>
                            </ul>
                        </li>

                        <!--切换主题配色-->
                        <li class="dropdown dropdown-skin">
                            <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
                            <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                                <li class="drop-title"><p>主题</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                    <label for="site_theme_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                    <label for="site_theme_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                    <label for="site_theme_3"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>LOGO</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
                    <label for="logo_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                    <label for="logo_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                    <label for="logo_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                    <label for="logo_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                    <label for="logo_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                    <label for="logo_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                    <label for="logo_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
                    <label for="logo_bg_8"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>头部</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                    <label for="header_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                    <label for="header_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                    <label for="header_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                    <label for="header_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                    <label for="header_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                    <label for="header_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                    <label for="header_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                    <label for="header_bg_8"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>侧边栏</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                    <label for="sidebar_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                    <label for="sidebar_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                    <label for="sidebar_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                    <label for="sidebar_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                    <label for="sidebar_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                    <label for="sidebar_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                    <label for="sidebar_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
                    <label for="sidebar_bg_8"></label>
                  </span>
                                </li>
                            </ul>
                        </li>
                        <!--切换主题配色-->
                    </ul>

                </div>
            </nav>

        </header>
        <!--End 头部信息-->


    </div>
</div>
</body>
</html>

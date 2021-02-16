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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>视频中心</title>
    <link href='https://fonts.googleapis.com/css?family=Quicksand:400,700|Quattrocento+Sans:400,700|Palanquin:400,600|Raleway|Josefin+Sans'
          rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <link rel="stylesheet" href="/css/owl.theme.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>


<header style="height: 69px;background: #1D6FA3">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="logo">
                    <h2><a href="/page/index">视频中心</a></h2>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 43px">
            <div class="col-md-12">
                <ul>
                    <%--横屏展示--%>
                    <li><a href="/manager/videoManager/queryVideoByClassify?id=1"> 影视 </a></li>
                    <li><a href="/manager/videoManager/queryVideoByClassify?id=2"> 新闻 </a></li>
                    <li><a href="/manager/videoManager/queryVideoByClassify?id=3"> 美食 </a></li>
                    <li><a href="/manager/videoManager/queryVideoByClassify?id=4"> 音乐 </a></li>
                    <li><a href="/manager/videoManager/queryVideoByClassify?id=5"> 生活 </a></li>

                </ul>

            </div>
        </div>
    </div>
</header>

<div class="blog-firstsection">
    <div class="container">
        <div class="row items2 ">
            <c:choose>
                <c:when test="${empty tbUserAndVideos}">
                    <tr>
                        <td colspan="5">暂无数据</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="videoList" items="${tbUserAndVideos}">
                        <tr>
                            <td>
                                <div class="col-md-4 grid-item ">
                                    <div class="picture">
                                        <img src="/images/suoluetu.jpg" alt="">
                                    </div>
                                    <div class="pic-inner">
                                        <p>
                                        <h3>片名:
                                        <a href="/page/videoPlay?id=${videoList.videoId}">${videoList.videoTitle}</a>

                                        <p><label>简介:<span>${videoList.videoInfo}</span></label></p>
                                        <label>作者:<span>${videoList.userName}</span></label>

                                    </div>
                                </div>
                            </td>
                        </tr>

                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
</div>
<footer>
    <div class="main-footer">
        <p> Copyright © 2016 By Crafted Theme</p>
        <p>Made with Love from Us.</p>
        <div class="icons">
            <ul>
                <li><a target="_BLANK" href="http://facebook.com/"><i class="fa fa-facebook"></i> </a></li>
                <li><a target="_BLANK" href="http://instagram.com/"><i class="fa fa-instagram"></i> </a></li>
                <li><a target="_BLANK" href="http://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                <li><a target="_BLANK" href="http://behance.net/"><i class="fa fa-behance"></i></a></li>
            </ul>
        </div>
    </div>
</footer>
<script src="/js/jquery-2.1.4.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.slicknav.js"></script>
<script src="/js/isotope.pkgd.min.js"></script>
<script src="/js/owl.carousel.js"></script>
<script src="/js/main.js"></script>
</body>
</html>

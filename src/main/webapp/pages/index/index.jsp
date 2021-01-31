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
    <title>学优家教网 - Everything is for child</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>
<style>
</style>
<body>

<jsp:include page="index_nav.jsp"/>

<!-- start banner_y -->
<div class="sub_banner center">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <%--            <div class="card-header"><h4>轮播图</h4></div>--%>
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="1" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" id="slideshow" style="height: 600px">
                        <div class="item active" align="center"><img src="/file-service/1.jpg" alt=""></div>
                        <div class="item" align="center"><img src="/file-service/2.jpg" alt=""></div>
                        <div class="item" align="center"><img src="/file-service/3.jpg" alt=""></div>
                    </div>
                    <a class="left carousel-control" href="#carouselExampleIndicators" role="button"
                       data-slide="prev"><span class="icon-left-open-big icon-prev" aria-hidden="true"></span><span
                            class="sr-only">Previous</span></a>
                    <a class="right carousel-control" href="#carouselExampleIndicators" role="button" data-slide="next"><span
                            class="icon-right-open-big icon-next" aria-hidden="true"></span><span
                            class="sr-only">Next</span></a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-------------------------------------------------新闻中心------------------------------------>
<div class="clear"></div>
<div class="sub_banner center">
    <h3 style="text-align: center"><b>新闻中心</b></h3>
    <div class="col-md-12">
        <div class="card">
            <div class="card-body"style="width: 1200px;height: 300px">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tbody>
                        <c:choose>
                            <c:when test="${empty newsList}">
                                <tr>
                                    <td colspan="4">暂无新闻</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="newsList" items="${newsList}">
                                    <tr>
                                        <td>
                                            <a class="newsList" href="/index/news/info/${newsList.id}">
                                                <small>${newsList.date}</small>
                                                <h4><i><p> * ${newsList.title}</p></i></h4>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                    <div class="card-toolbar clearfix">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-----------------------------------------网课中心-------------------------------------------->
<div class="clear"></div>
<div class="sub_banner center">
    <h3 style="text-align: center"><b>网络课程</b></h3>
    <div class="col-md-12">
        <div class="card">
            <div class="card-body"style="width: 500px;height: 300px">
                <c:choose>
                    <c:when test="${empty mediaList}">
                        <tr>
                            <td colspan="4">暂无资源</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="mediaList" items="${mediaList}">
                            <tr>
                                <td>
                                    <a class="newsList" href="/index/netCourse/info/${mediaList.id}">
                                        <small>作者： ${mediaList.author}</small>
                                        <h4><i><p> * ${mediaList.mediaName}</p><small>简介：${mediaList.mediaDesc}</small></i></h4>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<!------------------------------------------尾部------------------------------------------------>
<div class="clear"></div>
<div class="sub_banner center">
    <h7 style="text-align: center"><b></b></h7>
    <div style="width: 500px;height: 100px">

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

</script>
</html>
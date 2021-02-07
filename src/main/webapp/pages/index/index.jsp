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
    <title>视频网站</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Quicksand:400,700|Quattrocento+Sans:400,700|Palanquin:400,600|Raleway|Josefin+Sans'
          rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <link rel="stylesheet" href="/css/owl.theme.css">
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
                        <div class="item active" align="center"><img src="/images/backgroud1.jpg" alt=""></div>
                        <div class="item" align="center"><img src="/images/backgroud2.png" alt=""></div>
                        <div class="item" align="center"><img src="/images/backgroud3.jpg" alt=""></div>
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


<!-------------------------------------------------视频分类------------------------------------>
<div class="clear"></div>
<div class="sub_banner center">
    <h3 style="text-align: center"><b>视频分类</b></h3>
    <jsp:include page="index_nav2.jsp"/>

    <div class="col-md-12">
        <div class="card">
            <div class="card-body" style="width: 1200px;height: 300px">
                <div class="table-responsive">
                    <table class="table table-bordered" style="text-align: center">
                        <thead>
                                        <tr>
                                            <th>视频链接</th>
                                        </tr>
                                        <tr>
                                            <th>视频</th>
                                        </tr>
                                        <tr>
                                            <th>视频名称</th>
                                        </tr>
                                        <tr>
                                            <th>播放</th>
                                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty videoList}">
                                <tr>
                                    <td colspan="5">暂无数据</td>
                                </tr>
                            </c:when>
                            <%--<c:otherwise>
                                <c:forEach var="roleList" items="${roleList}">
                                    <tr>
                                        <td>${roleList.roleId}</td>
                                        <td>${roleList.roleName}</td>
                                        <td>
                                                &lt;%&ndash;编辑和删除&ndash;%&gt;
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
                            </c:otherwise>--%>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
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
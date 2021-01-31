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
    <title>学优家教网</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>
<style>
    a:hover {
        color: #2ba3f6;
    }
</style>
<body>

<jsp:include page="../index_nav.jsp"/>

<!-- ------------------------------------我的需求申请-------------------------------------------------------->
<div class="sub_banner center">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header"><h4><b>新闻中心</b></h4></div>
            <div class="card-body">
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


</body>
<style type="text/css">

</style>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript">
    //评价
    function sumbitAppraise() {
        $.ajax({
            url: "/index/findTutor/appraise",
            data: $("#form").serialize(),
            type: "POST",
            dataType: "text",
            async: false,
            success: function (result) {
                if (result == 1) {
                    alert("评价成功！");
                    //刷新页面
                    window.location.href = "/index/findTutor";
                } else if (result == 0) {
                    alert("错误：原因不明！")
                }
            }
        })
    }
</script>
</html>
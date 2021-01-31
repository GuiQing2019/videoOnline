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
<style type="text/css">
    .ad_img{
        height: 300px;
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

                        <div class="card" style="height: 1500px">
                            <div class="card-header"><h4><b><i>上传广告图</i></b></h4></div>
                            <br>
                            <div class="card-body">
                                <form>
                                    <%--发布作品地址--%>
                                    <div class="form-group">
                                        <label class="col-xs-12">上传图片1</label>
                                        <div class="col-xs-12">
                                            <input type="file" id="photoFile1" onchange="upload1()">
                                            <img src="/file-service/1.jpg" id="preview_photo1"class="ad_img">
                                            <input type="hidden" id="works_path1" name="worksPath" value="">
                                        </div>
                                    </div>
                                        <p>    &nbsp;</p>
                                    <div class="form-group">
                                        <label class="col-xs-12">上传图片2</label>
                                        <div class="col-xs-12">
                                            <input type="file" id="photoFile2" onchange="upload2()">
                                            <img src="/file-service/2.jpg" id="preview_photo2"class="ad_img">
                                            <input type="hidden" id="works_path2" name="worksPath" value="">
                                        </div>
                                    </div>
                                        <p>    &nbsp;</p>
                                    <div class="form-group">
                                        <label class="col-xs-12">上传图片3</label>
                                        <div class="col-xs-12">
                                            <input type="file" id="photoFile3" onchange="upload3()">
                                            <img src="/file-service/3.jpg" id="preview_photo3"class="ad_img">
                                            <input type="hidden" id="works_path3" name="worksPath" value="">
                                        </div>
                                    </div>
                                        <p>    &nbsp;</p>
                                </form>
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
<script type="text/javascript">
    /**
     * 上传图片1
     */
    function upload1() {
        if ($("#photoFile1").val() == '') {
            return;
        }
        var formData = new FormData();
        alert("上传图片中...")
        formData.append('photo', document.getElementById('photoFile1').files[0]);
        $.ajax({
            url: "/manager/userIndexManager/fileUpload/1",
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.type == "success") {
                    alert("上传成功")
                    $("#preview_photo1").attr("src", data.filename);
                    $("#works_path1").attr("value", data.filename);
                } else {
                    alert("上传失败")
                }
            },
            error: function (data) {
                alert("出错：原因不明！")
            }
        });
    }

    /**
     * 上传图片1
     */
    function upload2() {
        if ($("#photoFile2").val() == '') {
            return;
        }
        var formData = new FormData();
        alert("上传图片中...")
        formData.append('photo', document.getElementById('photoFile2').files[0]);
        $.ajax({
            url: "/manager/userIndexManager/fileUpload/2",
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.type == "success") {
                    alert("上传成功")
                    $("#preview_photo2").attr("src", data.filename);
                    $("#works_path2").attr("value", data.filename);
                } else {
                    alert("上传失败")
                }
            },
            error: function (data) {
                alert("出错：原因不明！")
            }
        });
    }

    /**
     * 上传图片1
     */
    function upload3() {
        if ($("#photoFile3").val() == '') {
            return;
        }
        var formData = new FormData();
        alert("上传图片中...")
        formData.append('photo', document.getElementById('photoFile3').files[0]);
        $.ajax({
            url: "/manager/userIndexManager/fileUpload/3",
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.type == "success") {
                    alert("上传成功")
                    $("#preview_photo3").attr("src", data.filename);
                    $("#works_path3").attr("value", data.filename);
                } else {
                    alert("上传失败")
                }
            },
            error: function (data) {
                alert("出错：原因不明！")
            }
        });
    }
</script>
</body>
</html>
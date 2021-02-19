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
    <title>视频播放</title>
    <link rel="icon" href="/icons/icon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/index.css"/>
    <link rel="stylesheet" href="/css/skin.css">
    <link href="/css/cover.css" rel="stylesheet">
    <link href="/css/style2.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css" href="/css/xcConfirm.css"/>

    <style type="text/css">


        .websitecolor {
            background-color: #fff;
        }

        img {
            cursor: pointer;
        }


        .barrage {
            width: 100%;
            height: 500px;
            position: absolute;
        }

        .barrage .show div {
            color: white;
            position: absolute;
            right: 0;
        }

        .barrage-txt {
            min-width: 75%;
            height: 100%;
            margin-top: 4px;
            background-color: white;
        }

        .barrage-send {
            height: 100%;

            cursor: pointer;
        }

        .mybtn:hover {
            background-color: #c2d8ef;
        }

    </style>
    <!--修改模态框 出现的位置-->
    <style type="text/css">
        .modal.fade.in {
            top: 200px;
            margin: 0 auto;
        }
    </style>
</head>

<body>

<div class="container websitecolor" style="border: 1px solid black;">

    <div class="container row">
        <div class="col-sm-3" style="display: flex;flex-direction:row;margin-top: 10px;float: left;">
            <span>${tbUserAndVideo.userName}</span>
            <div style="display: flex;flex-direction:column;margin-top: 4px;padding-left: 10px;">
                <div style="font-size: 18px;" th:text="${session.curVideo.user.userName}"></div>

                <!-- 用于标记当前用户观看视频上传者的ID -->
                <input type="hidden" id="focusedid" th:value="${tbUserAndVideo.userId}">

                <!-- 访问用户的id -->
                <div style="display: flex;flex-direction:row;width:auto;">
                    <div style="margin-top: 8px;" th:text="${session.curVideo.user.fanNum}"></div>
                    <div style="width:100px; margin-left: 8px;margin-top: 8px;">粉丝数
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-3 row col-sm-offset-6 container"
             style="text-align: center;height: 30px;margin: 20px auto auto 0;padding:0; float: right;">
            <button type="button" id="focuson" class="col-sm-4 btn btn-default btn-sm mybtn" title="关注">
                <span class="focusClass glyphicon glyphicon-plus"></span> <span class="focusvalue">关注</span>
            </button>
            <button type="button" class="col-sm-4 btn btn-default btn-sm mybtn" title="私信" data-toggle="modal"
                    data-target="#privatemsg">
                <span class="glyphicon glyphicon-comment"></span> 私信
            </button>


        </div>
    </div>

    <div class="container-fluid row" style="margin: 10px 0;padding: 0;height: auto;">

        <!--
            作者：2539829814@qq.com
            时间：2020-02-02
            描述：播放视频窗口
        -->
        <div class="col-lg-9" style="margin-bottom: 30px;">
            <div class="flowplayer videodiv" data-swf="flowplayer.swf" data-ratio="0.4167"
                 style="width: 100%; display: block;">
                <input type="hidden" id="videoId" th:value="${tbUserAndVideo.videoId}">
                <video autoplay="autoplay" class="fp-play" style="height: 100%">
                    <source type="video/mp4" src="${tbUserAndVideo.videoUrl}" style="height: 100%">
                </source>
                </video>
                <div class="barrage ">
                    <div class="show">

                    </div>
                </div>
            </div>

            <div class="col-lg-12 barrage row" style="height: 30px ;width: 100%;">
                <input type="text" class="col-lg-10 barrage-txt" placeholder="请输入弹幕内容" style="text-indent:10px;">
                <button type="button" class="col-lg-1 btn btn-default btn-sm barrage-send mybtn"
                        style="margin-left: 10px;margin-top:4px;" title="弹幕">发布弹幕
                </button>
            </div>
        </div>
        <!--
            作者：2539829814@qq.com
            时间：2020-02-02
            描述：视频信息
        -->
        <div class="col-lg-3">
            <table class="table table-condensed table-hover with-check"
                   style="word-break:break-all; word-wrap:break-spaces;">
                <caption style="font-size: 18px; font-weight: bold;">视频信息</caption>
                <tbody class="row">
                <tr>
                    <td class="col-lg-4">名称</td>
                    <td class="col-lg-8" th:text="${tbUserAndVideo.videoTitle}">${tbUserAndVideo.videoTitle}</td>
                </tr>
                <tr>
                    <td class="col-lg-4">描述</td>
                    <td class="col-lg-8" th:text="${tbUserAndVideo.videoInfo}">${tbUserAndVideo.videoInfo}</td>
                </tr>
                <tr>
                    <td class="col-lg-4">上传用户</td>
                    <td class="col-lg-8" th:text="${tbUserAndVideo.userName}">${tbUserAndVideo.userName}</td>
                </tr>
                <tr>
                    <td class="col-lg-4">视频类型</td>
                    <td class="col-lg-8">
                        <c:if test="${tbUserAndVideo.videoClassify =='1'}">
                            电影
                        </c:if>
                        <c:if test="${tbUserAndVideo.videoClassify =='2'}">
                            新闻
                        </c:if>
                        <c:if test="${tbUserAndVideo.videoClassify =='3'}">
                            美食
                        </c:if>
                        <c:if test="${tbUserAndVideo.videoClassify =='4'}">
                            音乐
                        </c:if>
                        <c:if test="${tbUserAndVideo.videoClassify =='5'}">
                            生活
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="col-lg-4">视频状态</td>
                    <td class="col-lg-8">
                        <c:if test="${tbUserAndVideo.videoStatuId=='3'}">
                            上架中
                        </c:if>
                        <c:if test="${tbUserAndVideo.videoStatuId=='4'}">
                            已下架
                        </c:if>
                        <c:if test="${tbUserAndVideo.videoStatuId=='5'}">
                            审核中
                        </c:if>
                        <c:if test="${tbUserAndVideo.videoStatuId=='6'}">
                            已审核
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="col-lg-4">即时评分</td>
                    <td class="col-lg-8" id="starNum" th:text="${session.curVideo.ppNum}">0</td>
                </tr>
                <tr>
                    <td class="col-lg-4">点赞</td>
                    <td class="col-lg-8" id="ppNum" th:text="${session.curVideo.ppNum}">0</td>
                </tr>
                <tr>
                    <td class="col-lg-4">观看</td>
                    <td class="col-lg-8">${tbViewcount.num}</td>
                </tr>
                </tbody>
            </table>
            <div class="container">
                <div class="row">
                    <button type="button" class="btn btn-default btn-sm dianzan" title="点赞">
                        <span class="dianzan glyphicon glyphicon-thumbs-up"></span><span class="dianzanvalue">点赞</span>
                    </button>
                    <button data-html="true" type="button" class="btn btn-default btn-sm pop" title="点评"
                            data-placement="bottom" data-content='
									<form id="commentedstarForm" action="#" method="post" >
										<div class="form-group">
										    <select class="form-control" name="starNum">
										      <option  selected="selected">==请选择评星==</option>
										      <option value="1">★</option>
										      <option value="2">★★</option>
										      <option value="3">★★★</option>
										      <option value="4">★★★★</option>
										      <option value="5">★★★★★</option>
										    </select>
										  </div>
										<div class="form-group">
											<input type="hidden" name="userId"  id="userIdTwo" />

										<div class="form-group">
										</div>
											<input type="hidden" name="videoId" id="videoIdTwo"/>
										</div>
										<button id="submitButton" type="button" class="btn btn-default">提交</button>
										<button class="out" type="reset" class="btn btn-default">取消</button>
									</form>
									<script type="text/javascript">

										$(document).ready(
											function(){
												var videoId = $("#videoId").val();
												var userId = $("#userId").val();
												$("#userIdTwo").attr("value",userId);
												$("#videoIdTwo").attr("value",videoId);
											}
										);

										$(".out").click(function(){
											$(".pop").popover("hide");
										});

										$("#submitButton").click(
											function(){

												var formData = new FormData($("#commentedstarForm")[0]);
												$.ajax({
													type:"post",
													url:"/VideoController/commented",
													async:true,
													data: formData,
													dataType:"JSON",
													processData:false,
													contentType:false,
												  	success:function(result){
												  		if(result.message=="点评成功"){
												  			window.wxc.xcConfirm(result.message, window.wxc.xcConfirm.typeEnum.success);
												  		}else{
												  			window.wxc.xcConfirm(result.message, window.wxc.xcConfirm.typeEnum.warning);
												  		}
													}//success:function
												});//ajax
											}
										);
									</script>
							'>
                        <span class="glyphicon glyphicon-comment"></span>点评
                    </button>
                    <button id="c_button" type="button" class="btn btn-default btn-sm" title="收藏">
                        <span class="c_class glyphicon glyphicon-star-empty"></span><span class="c_value">收藏</span>
                    </button>
                    <button type="button" id="barrage_on_off" class="btn btn-default btn-sm" title="下载">
                        <span class="barrage_class glyphicon glyphicon-eye-open">弹幕开</span>
                    </button>
                </div>
            </div>
        </div>
    </div>


    <div class="container-fluid">

        <div style="font-size: 20px; font-weight: bold; margin-top: 35px;">视频推荐</div>

        <div class="container-fluid row" style="margin: 0;padding: 0;">
            <%--视频推荐--%>
            <div id="videoList"></div>
        </div>
    </div>
</div>

<!--
    作者：2539829814@qq.com
    时间：2019-12-30
    描述：网页底部
-->
<footer class="container footer">
    <p>Web template built for
        <a href="#">Website</a> by
        <a href="#">@xiaoming</a>.</p>
    <p>
        <a href="#">Back to top</a>
    </p>
</footer>
<div class="modal fade" id="privatemsg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%; height: auto;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">用户私信</h4>
            </div>
            <div class="modal-body">
                <form id="msgForm" action="#" class="form-horizontal" role="form">

                    <input type="hidden" name="receiveUserId" th:value="${session.curVideo.user.userId}">
                    <input type="hidden" name="msgTypeId" value="1">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">主 题</label>
                        <div class="col-sm-10">
                            <input type="text" name="msgTitle" class="form-control" placeholder="输入主题">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">内 容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="msgContext" style="resize:none;" rows="5"
                                      placeholder="输入内容"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="sendMsg">提交更改</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<script src="/js/jquery.min.js"></script>
<!-- include flowplayer -->
<script src="/js/flowplayer.min.js"></script>

<script src="/js/bootstrap.min.js"></script>

<script src="/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>

<script>
    $(function () {
        var a = $(".videodiv").width();
        $('.videodiv').css('height', a * 0.57);
    });
    $(window).resize(function () {          //当浏览器大小变化时
        var a = $(".videodiv").width();
        $('.videodiv').css('height', a * 0.57);
    });

    $(function () {
        $("#barrage_on_off").click(function () {
            $(".barrage").toggle();
            return false;
        });

    });

    //发送与接受弹幕
    $(document).ready(function () {
        console.log("111");
        var videoId = ${tbUserAndVideo.videoId};
        console.log(videoId);
        if (typeof (WebSocket) == "undefined") {
            console.log("您的浏览器不支持WebSocket");
        } else {
            index = new WebSocket("ws://localhost:8088/BarrageWebSocket?videoId=" + videoId);
            //打开事件
            index.onopen = function () {
                console.log("Socket 已打开");
                //index.send("这是来自客户端的消息" + location.href + new Date());
            };
            //获得消息事件
            index.onmessage = function (msg) {
                //console.log("data == "+msg.data);
                var text = msg.data
                var div = "<div>" + text + "</div>";

                var width = $(".barrage").width();
                var height = Math.floor(Math.random() * $(".barrage").height());
                $(".show").append(div);
                var length = $('.show div').length;
                $('.show div').eq(length - 1).css({
                    'top': height,
                    'width': $('.show div').eq(length - 1).width() + 3
                });
                $('.show div').eq(length - 1).animate({
                    right: width + 1
                }, 20000);
                //var result2 = $.parseJSON(msg.data); // 一个Object对象
            };
            //关闭事件
            index.onclose = function () {
                console.log("Socket已关闭");
            };
            //发生了错误事件
            index.onerror = function () {
                //  alert("Socket发生了错误");
            };
            $(".barrage-send").click(function () {
                var text = $(".barrage-txt").val();
                console.log("发送弹幕,txt="+text);
                $.ajax({
                    url: "/BarrageController/sendGroupMessage/" + videoId,
                    async: false,
                    type: "post",
                    data: {"message": text},
                    dataType: "JSON",
                    success: function (data) {
                    }
                });
            })
        }
    });


    //点评的切换事件
    $(".pop").click(function () {
        $(".pop").popover("show");
    });

    //视频推荐，待改进
    $(document).ready(function () {
        $.ajax({
            url: "/VideoController/getRecommendVideo",
            async: true,
            type: "get",
            dataType: "JSON",
            error: function () {
                window.wxc.xcConfirm("失败", window.wxc.xcConfirm.typeEnum.error);
            },
            success: function (data1) {
                $.each(data1, function (i, val) {
                    var div121 = $('<div class="col-sm-4"/>');
                    var div1211 = $('<div class="view view-first" style="width: 100%; height: auto;"/>');
                    div1211.appendTo(div121);

                    var div1211_a = $('<a class="videodiv2" style="width: 100%; display: block;"/>');
                    div1211_a.appendTo(div1211);

                    var div1211_a_img = $('<img class="img-responsive" alt="" style="width: 100%; height: 100%;"/>');
                    div1211_a_img.attr("src", this.thumbnailUrl);
                    div1211_a_img.appendTo(div1211_a);

                    var div121_div = $('<div class="tab_desc"/>');
                    div121_div.appendTo(div121);

                    var div121_div_a = $('<a href="#">Look Now</a>');
                    div121_div_a.appendTo(div121_div);

                    div121.appendTo($("#videoList"));


                    div121_div_a.click(function () {
                        window.open("/VideoController/videoPlay?videoId=" + val.videoId);
                    });


                });
            }
        });
        //$(".footer").html(htmlobj.responseText);
    });

    var view = function () {

    }

    //视频点赞
    $('.dianzan').click(
        function () {
            console.log("点赞");
            var videoId = ${tbUserAndVideo.videoId};
            $.ajax({
                url: "/VideoController/DianZanByAjax",
                async: false,
                data: {"videoId": videoId},
                dataType: "JSON",
                error: function (data) {
                    window.wxc.xcConfirm(data.message, window.wxc.xcConfirm.typeEnum.error);
                },
                success: function (data) {
                    if (data.message != "点赞成功") {
                        window.wxc.xcConfirm(data.message, window.wxc.xcConfirm.typeEnum.warning);
                    } else {
                        var ppNum = $('#ppNum').html();
                        var ppNum2 = parseInt(ppNum) + 1;
                        $('#ppNum').html(ppNum2);
                        $('.dianzanvalue').html("已点赞");
                    }
                    $('.dianzan').unbind('click');
                }
            })
        }
    );

    //判断用户是否已关注
    $(document).ready(
        function () {
            var focusedId = $('#focusedid').val();
            $.ajax({
                url: "/FocusController/FocusVerifyByAjax",
                async: false,
                type: "post",
                data: {"focusedId": focusedId},
                dataType: "JSON",
                error: function (data) {
                    window.wxc.xcConfirm(data.message, window.wxc.xcConfirm.typeEnum.error);
                },
                success: function (data) {
                    if (data.message == "已关注") {
                        $('.focusClass').removeClass("glyphicon-plus");
                        $('.focusClass').addClass('glyphicon-ok-circle');
                        $('.focusvalue').html("已关注");
                    } else if (data.message == "未关注") {
                        $('#focuson').click(
                            function () {
                                //var focusedId = $('#focusedid').val();
                                $.ajax({
                                    url: "/FocusController/FocusOnByAjax",
                                    async: false,
                                    type: "post",
                                    data: {"focusedId": focusedId},
                                    dataType: "JSON",
                                    error: function (data) {
                                        window.wxc.xcConfirm(data.message, window.wxc.xcConfirm.typeEnum.error);
                                    },
                                    success: function (data) {

                                        if (data.message == "关注成功") {
                                            $('.focusClass').removeClass("glyphicon-plus");
                                            $('.focusClass').addClass('glyphicon-ok-circle');
                                            $('.focusvalue').html("已关注");
                                        } else {
                                            window.wxc.xcConfirm(data.message, window.wxc.xcConfirm.typeEnum.warning);
                                        }
                                    }
                                })
                            }
                        );
                    }
                }
            })
        }
    );

    //判断视频是否已经收藏
    $(document).ready(
        function () {
            var videoId = $('#videoId').val();
            $.ajax({
                url: "/CollectionController/vertifyIfCollectionByAjax",
                async: false,
                type: "post",
                data: {"videoId": videoId},
                dataType: "JSON",
                error: function (data) {
                    window.wxc.xcConfirm(data.message, window.wxc.xcConfirm.typeEnum.error);
                },
                success: function (data) {
                    if (data.message == "已收藏") {
                        $('.c_class').removeClass("glyphicon-star-empty");
                        $('.c_class').addClass('glyphicon-star');
                        $('.c_value').html("已收藏");
                    } else if (data.message == "未收藏") {
                        //未收藏就添加收藏事件
                        $('#c_button').click(
                            function () {
                                //var videoId = $('#videoId').val();
                                $.ajax({
                                    url: "/CollectionController/addCollectionByAjax",
                                    async: false,
                                    type: "post",
                                    data: {"videoId": videoId},
                                    dataType: "JSON",
                                    error: function (data) {
                                        window.wxc.xcConfirm(data.message, window.wxc.xcConfirm.typeEnum.error);
                                    },
                                    success: function (data) {
                                        if (data.message == "收藏成功") {
                                            $('.c_class').removeClass("glyphicon-star-empty");
                                            $('.c_class').addClass('glyphicon-star');
                                            $('.c_value').html("已收藏");
                                            //alert("收藏成功");
                                        } else {
                                            window.wxc.xcConfirm(data.message, window.wxc.xcConfirm.typeEnum.warning);
                                        }
                                    }
                                })
                            }
                        );
                    }
                }
            })
        }
    );

    //弹幕的切换
    $(".barrage_class").click(
        function () {
            var state = $('.barrage_class').html();
            if (state == "弹幕开") {
                $('.barrage_class').html("弹幕关");
                $('.barrage_class').removeClass("glyphicon-eye-open");
                $('.barrage_class').addClass('glyphicon-eye-close');
            } else {
                $('.barrage_class').html("弹幕开");
                $('.barrage_class').removeClass("glyphicon-eye-close");
                $('.barrage_class').addClass('glyphicon-eye-open');
            }
        }
    );

    $("#sendMsg").click(function () {
        $.ajax({
            type: "post",
            url: "/MsgController/addLetter",
            async: true,
            data: $('#msgForm').serialize(),
            dataType: "JSON",
            error: function (data) {
                window.wxc.xcConfirm("发送失败", window.wxc.xcConfirm.typeEnum.error);
            },
            success: function (result) {
                window.wxc.xcConfirm(result.message, window.wxc.xcConfirm.typeEnum.success);
            }//success:function
        });//ajax
    });

    $(function () {
        var a = $(".videodiv2").width();
        $('.videodiv2').css('height', a * 0.57);
    });
    $(window).resize(function () { // 当浏览器大小变化时
        a = $(".videodiv2").width();
        $('.videodiv2').css('height', a * 0.57);
    });

</script>
</body>

</html>

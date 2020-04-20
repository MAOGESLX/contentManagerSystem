<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/css/workplace.css">
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md12 layui-col-sm12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="header-detail">
                        <div class="header-detail-row">
                            <div class="header-detail-row-title">工作台</div>
                        </div>
                        <div class="header-detail-row">
                            <div class="header-content">
                                <span>
                                    <img class="header-content-img" src="${ctx}/static/img/face.jpg">
                                </span>
                                <div class="header-tip">
                                    <p class="header-tip-title">欢迎您，${LOGIN_ACCOUNT.userName}，开始您一天的工作吧！</p>
                                    <p class="header-tip-desc">
                                        <i class="layui-icon layui-icon-water"></i>今日阴转小雨，22℃ - 32℃，出门记得带伞哦。
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-col-md8 layui-col-sm12">

        </div>
        <div class="layui-col-md4 layui-col-sm12">
            <div class="layui-card">
                <div class="layui-card-header">
                    <span class="card-header-span-small kuaijie-icon">
                        <i class="layui-icon layui-icon-heart-fill card-header-span-i"></i>
                    </span>
                    <span class="card-header-padding">快捷操作</span>
                    <div class="card-header-extra"> <i class="layui-icon layui-icon-set-fill"></i></div>
                </div>
                <div class="layui-card-body " style="min-height: 280px;">

                </div>
            </div>
        </div>
        <div class="layui-col-md8 layui-col-sm12">

        </div>
        <div class="layui-col-md4 layui-col-sm12">
            <div class="layui-card">
                <div class="layui-card-header">
                    <span class="card-header-span-small chanping-icon">
                        <i class="layui-icon layui-icon-website card-header-span-i"></i>
                    </span>
                    <span class="card-header-padding">产品中心</span>
                </div>
                <div class="layui-card-body card-production">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">


    var $;
    layui.use(['jquery'], function () {
        $ = layui.$;


    });


</script>
</body>
</html>
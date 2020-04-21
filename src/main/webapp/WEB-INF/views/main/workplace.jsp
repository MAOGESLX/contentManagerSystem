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
        <!-- 欢迎-->
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

        <!--待办事项 -->
        <div class="layui-col-md8 layui-col-sm12">
            <div class="layui-card">
                <div class="layui-card-header">
                    <span class="card-header-span-small daiban-icon">
                        <i class="layui-icon layui-icon-find-fill card-header-span-i"></i>
                    </span>
                    <span class="card-header-padding">待办事项</span>
                </div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <ul class="layui-row layui-col-space15 daiban-main">
                        <li class="layui-col-xs4">
                            <a class="daiban-body daiban-bg1" href="javascript:;">
                                <h3 class="daiban-color1">未读公告</h3>
                                <p class="daiban-color1"><cite>66</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a class="daiban-body daiban-bg2" href="javascript:;">
                                <h3 class="daiban-color2">未读公告</h3>
                                <p class="daiban-color2"><cite>66</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a class="daiban-body daiban-bg3" href="javascript:;">
                                <h3 class="daiban-color3">未读公告</h3>
                                <p class="daiban-color3"><cite>66</cite></p>
                            </a>
                        </li>

                        <li class="layui-col-xs4">
                            <a class="daiban-body daiban-bg4" href="javascript:;">
                                <h3 class="daiban-color4">未读公告</h3>
                                <p class="daiban-color4"><cite>66</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a class="daiban-body daiban-bg5" href="javascript:;">
                                <h3 class="daiban-color5">未读公告</h3>
                                <p class="daiban-color5"><cite>66</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a class="daiban-body daiban-bg6" href="javascript:;">
                                <h3 class="daiban-color6">未读公告</h3>
                                <p class="daiban-color6"><cite>66</cite></p>
                            </a>
                        </li>

                        <li class="layui-col-xs4">
                            <a class="daiban-body daiban-bg3" href="javascript:;">
                                <h3 class="daiban-color3">未读公告</h3>
                                <p class="daiban-color3"><cite>66</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a class="daiban-body daiban-bg2" href="javascript:;">
                                <h3 class="daiban-color2">未读公告</h3>
                                <p class="daiban-color2"><cite>66</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a class="daiban-body daiban-bg1" href="javascript:;">
                                <h3 class="daiban-color1">未读公告</h3>
                                <p class="daiban-color1"><cite>66</cite></p>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <!-- 快捷操作-->
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
                    <ul class="layui-row layui-col-space10 kuaijie-item-main">
                        <li class="layui-col-xs4">
                            <a lay-href="component/layer/list.html">
                                <i class="layui-icon  layui-icon-app kuaijie-item-i-1"></i>
                                <cite class="cite-change">数据分析</cite>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a lay-href="component/layer/list.html">
                                <i class="layui-icon layui-icon-user kuaijie-item-i-2"></i>
                                <cite>用户管理</cite>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a lay-href="component/layer/list.html">
                                <i class="layui-icon layui-icon-group kuaijie-item-i-3"></i>
                                <cite>角色管理</cite>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a lay-href="component/layer/list.html">
                                <i class="layui-icon layui-icon-slider kuaijie-item-i-4"></i>
                                <cite>菜单管理</cite>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a lay-href="component/layer/list.html">
                                <i class="layui-icon layui-icon-list kuaijie-item-i-5"></i>
                                <cite>字典管理</cite>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a lay-href="component/layer/list.html">
                                <i class="layui-icon layui-icon-website kuaijie-item-i-6"></i>
                                <cite>单位管理</cite>
                            </a>
                        </li>
                        <li class="layui-col-xs4">
                            <a lay-href="component/layer/list.html">
                                <i class="layui-icon layui-icon-template-1 kuaijie-item-i-7"></i>
                                <cite>资源管理</cite>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--更新日志 -->
        <div class="layui-col-md8 layui-col-sm12">
            <div class="layui-card">
                <div class="layui-card-header">
                    <span class="card-header-span-small dongtai-icon">
                        <i class="layui-icon layui-icon-fire card-header-span-i"></i>
                    </span>
                    <span class="card-header-padding">更新日志</span>
                </div>
                <div class="layui-card-body">

                </div>
            </div>

        </div>
        <!-- 产品中心-->
        <div class="layui-col-md4 layui-col-sm12">
            <div class="layui-card">
                <div class="layui-card-header">
                    <span class="card-header-span-small chanping-icon">
                        <i class="layui-icon layui-icon-website card-header-span-i"></i>
                    </span>
                    <span class="card-header-padding">产品中心</span>
                </div>
                <div class="layui-card-body card-production">
                    <a style="background-color: #1E9FFF;" target="_blank" href="http://www.layui.com/">layui经典模块化前端框架</a>
                    <a style="background-color: #4CAF50;" target="_blank" href="http://www.layui.com/admin/?from=fly">layuiAdmin - layui 官方后台管理模板</a>
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
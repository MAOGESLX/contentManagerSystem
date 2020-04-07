<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理系统</title>
    <link rel="shortcut icon" href="${ctx}/static/img/f_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="${ctx}/static/css/index.css">

<body class="layui-layout-body" >
<div id="future_side">
    <!-- 外层DIV-->
    <div class="layui-layout">
        <!--头部 -->
        <div class="layui-header">
            <div class="layui-logo">
                <span>后台管理系统</span>
            </div>

            <ul class="layui-nav layui-layout-right" >
                <li class="layui-nav-item">

                    <a href="javascript:;">
                        <img class="layui-nav-img" src="${ctx}/static/img/face.jpg">
                        <cite>超级管理员${LOGIN_ACCOUNT.userName}</cite><span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a id="userPersonal" lay-href>个人信息</a></dd>
                        <dd><a id="changePassword" lay-href>修改密码</a></dd>
                        <dd ><a id="logout" lay-href>退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 左侧DIV-->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree layui-left-nav" lay-shrink="all">

                    <li class="layui-nav-item">
                        <a href="javascript:;" data-url="${ctx}/main/workplace.action">
                            <img class="img-nav" src="${ctx}/static/img/workplace.png">
                            <cite>工作台</cite>
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-url="">
                            <img class="img-nav" src="${ctx}/static/img/system.png">
                            <cite>系统管理</cite>
                        </a>

                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="/system/user/user_page.action">
                                    <div class="layui-first-menu"></div>
                                    <cite>用户管理</cite>
                                </a>
                            </dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="/system/user/user_page.action">
                                    <div class="layui-first-menu"></div>
                                    <cite>角色管理</cite>
                                </a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 内容主体区域 -->
        <div class="layui-body-item layui-show" id="main-content">
            <div id="menuLeft" class="menu-display">
                <img src="${ctx}/static/img/menu_left.png" id="flexible">
            </div>
            <iframe src=""  id="ifr" name="ifr"></iframe>

        </div>
    </div>
</div>

<script type="text/javascript">
    layui.config({
        base: "${ctx}/static/js/"
    }).use(['element','jquery','layer','layOpenWin'], function() {

        var element = layui.element,
            layer = layui.layer,
            $ = layui.jquery,
            layOpenWin = layui.layOpenWin;

        //登录首页默认展示第一个菜单项
        var dataUrl = $(".layui-left-nav .layui-nav-item a:first").attr("data-url");
        if(dataUrl && dataUrl != '${ctx}'){
            $(".layui-left-nav .layui-nav-item:first").addClass("layui-this");
            $("#ifr").attr("src",dataUrl);
        }else{
            $("#ifr").attr("src","${ctx}/main/workplace.action");
        }

        NProgress.start();
        // 添加新窗口
        $("body").on("click",".layui-left-nav .layui-nav-item a",function(){

            if($(this).attr("data-url")){
                //如果不存在子级
                if($(this).siblings().length == 0){
                    NProgress.start();
                    $("#ifr").attr("src",$(this).attr("data-url"));
                }
            }
            $(this).parent("li").siblings().removeClass("layui-nav-itemed");
        });

        /**个人信息*/
        $('#userPersonal').click(function () {
            var url = "${ctx}/system/user/user_personal_page.action";
            $("#ifr").attr("src",url);


        });

        /**修改密码*/
        $("#changePassword").click(function(){
            var url = "${ctx}/system/user/change_password_page.action";
            layOpenWin.layOpen('修改密码',url,'550px','430px');
        });


        /**退出*/
        $('#logout').click(function () {
            var url = '${ctx}/logout.action';
            layOpenWin.logOut('退出登录提示', '你确定要退出系统吗？', url)
        });


        /**打开或隐藏选项卡*/
        $("#flexible").click(function () {
            $("#future_side").toggleClass("future-side-shrink");

            if($("#future_side").hasClass("future-side-shrink")){
                $(this).attr("src", "${ctx}/static/img/menu_right.png");
            }else{
                $(this).attr("src", "${ctx}/static/img/menu_left.png");

            }
        });

        var iframe = document.getElementById("ifr");
        if (iframe.attachEvent){
            iframe.attachEvent("onload", function(){
                NProgress.done();
            });
        } else {
            iframe.onload = function(){
                NProgress.done();
            };
        }


    });

</script>


</body>
</html>
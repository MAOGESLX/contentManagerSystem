<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理系统</title>
    <link rel="shortcut icon" href="${ctx}/static/img/f_icon.png" type="image/x-icon">

    <link rel="stylesheet" href="${ctx}/static/css/login.css">
</head>
<body>
<div class="login-bg">

    <div class="login-content">
        <div class="login-card">
            <div class="login-card-head">
                <p><span>欢迎登录</span></p>
            </div>
            <div class="login-card-body">
                <div class="login-form-content">
                    <form class="layui-form login-form " method="post">
                        <div class="layui-form-item">
                            <label class="login-label"><i class="layui-icon layui-icon-username"></i></label>
                            <input type="text" id="loginName" name="userAccount" lay-verify="required" lay-reqText="请输入您的用户名" lay-verType="tips" placeholder="请输入您的用户名" autocomplete="off" value="" class="layui-input">
                        </div>
                        <div class="layui-form-item">
                            <label class="login-label"><i class="layui-icon layui-icon-password"></i></label>
                            <input type="password" id="loginPwd" name="password" lay-verify="required" lay-reqText="请输入您的密码" lay-verType="tips" placeholder="请输入您的密码" autocomplete="off" value="" class="layui-input">
                        </div>
                        <div class="layui-form-item login-code">
                            <label class="login-label"><i class="layui-icon layui-icon-vercode"></i></label>
                            <input class="layui-input" id="code" name="code" placeholder="请输入验证码" lay-verify="required" lay-reqText="请输入验证码" lay-verType="tips" type="text" autocomplete="off">
                            <div class="code"><div class="code-img"><img src="${ctx}/captcha.action" alt="" id="captchaImg"></div></div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn login_btn" lay-submit="" lay-filter="login">登录</button>
                        </div>
                    </form>
                    <p class="login-tip">输入任意用户名和密码即可</p>
                </div>

            </div>

        </div>

        <%--<h1>UMS-CLI</h1>--%>
        <%--<form class="layui-form" action="" method="post">--%>
            <%--<div class="layui-form-item">--%>
                <%--<input type="text" id="loginName" name="userAccount" lay-verify="required" lay-reqText="请输入账号" lay-verType="tips" placeholder="请输入账号" autocomplete="off" value="" class="layui-input">--%>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>
                <%--<input type="password" id="loginPwd" name="password" lay-verify="required" lay-reqText="请输入密码" lay-verType="tips" placeholder="请输入密码" autocomplete="off" value="" class="layui-input">--%>
            <%--</div>--%>
            <%--<div class="layui-form-item form_code">--%>
                <%--<input class="layui-input" id="code" name="code" placeholder="验证码" lay-verify="required" lay-reqText="请输入验证码" lay-verType="tips" type="text" autocomplete="off" style="width: 183px;">--%>
                <%--<div class="code"><img src="${ctx}/captcha.action" width="78" height="30"></div>--%>
            <%--</div>--%>
            <%--<div class="login_btn-content">--%>
                <%--<button class="layui-btn login_btn" lay-submit="" lay-filter="login">登录</button>--%>
            <%--</div>--%>
        <%--</form>--%>

    </div>


</div>
<script type="text/javascript">
    var $, layOpenWin;
    layui.config({
        base: "${ctx}/static/js/"
    }).use(['form', 'layer', 'jquery', 'layOpenWin'], function () {
        $ = layui.jquery,
            layOpenWin = layui.layOpenWin;
        var form = layui.form;

        /**点击验证码重新生成*/
        $('.code img').on('click', function () {
            reqCaptcha();
        });

        /**监听登录提交*/
        form.on('submit(login)', function (data) {
            //弹出loading
            var loginLoading = top.layer.msg('登录中，请稍候', {icon: 16, time: false, shade: 0.8});
            //记录ajax请求返回值
            var ajaxReturnData;
            //登陆验证
            $.ajax({
                url: '${ctx}/loginCheck.action',
                type: 'post',
                async: false,
                data: {
                    userAccount: $("#loginName").val(),
                    password: $("#loginPwd").val(),
                    code: $("#code").val()
                },
                success: function (data) {
                    ajaxReturnData = data;
                }
            });
            //登陆成功
            if (ajaxReturnData.returnCode == 200) {
                top.layer.close(loginLoading);
                layOpenWin.laySucMsg("登录成功");
                window.location.href = "${ctx}/main/index.action";
                return false;
            } else {
                top.layer.close(loginLoading);
                layOpenWin.layErrorMsg(ajaxReturnData.returnMessage);
                reqCaptcha();
                return false;
            }
        });

    });
    /**重新生成验证码*/
    function reqCaptcha() {
        var url = "${ctx}/captcha.action?nocache=" + new Date().getTime()
        $('.code img').attr("src", url)
    }


</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <style>

        .layui-form-label{
            width: 132px !important;
            flex-direction: column;
            justify-content: center;
            display: flex;
        }
        .layui-input-block {
            margin-left: 132px !important;
        }
        .layui-form-select dl {
            max-height: 118px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-fluid" >
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form layui-form-pane" method="post" lay-filter="userFormFilter">
                <!-- 隐藏表单域-->
                <input type="hidden" id="pageFlag" value="${pageFlag}">
                <input type="hidden" id="userId" name="userId" value="${user.userId}" >

                <div class="layui-row layui-col-space8">
                    <div class="layui-form-item layui-col-xs12">
                        <div class="layui-row layui-col-space12">
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">用户账号：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="userAccount" name="userAccount" value="${user.userAccount}" lay-verify="required" lay-verType="tips" placeholder="请输入帐号" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">用户姓名：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="userName" name="userName" value="${user.userName}"  lay-verify="required" lay-verType="tips" placeholder="请输入姓名" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">用户类型：</label>
                                <div class="layui-input-block">
                                    <select id="userType" name="userType" lay-verify="required" lay-filter="userTypeFilter" lay-verType="tips" lay-search>
                                        <option value="1">系统管理员</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs12" style="text-align: center;margin-top: 35px;">
                        <button class="layui-btn layui-btn-radius layui-btn-save" lay-submit="" lay-filter="saveUser">保存</button>
                        <a class="layui-btn layui-btn-radius layui-btn-cancel cancle">取消</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<script type="text/javascript">

    var $,layOpenWin,form,layer;
    layui.config({
        base: "${ctx}/static/js/"
    }).use(['form', 'jquery', 'layer', 'layOpenWin'], function () {
            form = layui.form,
            layer = layui.layer,
            $ = layui.jquery,
            layOpenWin = layui.layOpenWin;

        var pageFlag = $("#pageFlag").val();
        if (pageFlag == 'updatePage') {
            /**默认赋值*/
            form.val("userFormFilter", {
                "userType": '${user.userType}',
            });
        }
        //保存
        form.on("submit(saveUser)", function (data) {
            var roleSaveLoading = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            $.ajax({
                url: '${ctx}/system/manager/ajax_save_manager.action',
                type: 'post',
                async: false,
                data: data.field,
                success: function (data) {
                    if (data.returnCode == 200) {
                        top.layer.close(roleSaveLoading);
                        window.parent.frames["ifr"].getSearchUser();// 刷新表格
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                        layOpenWin.laySucMsg("保存成功");

                    } else {
                        top.layer.close(roleSaveLoading);
                        layOpenWin.layErrorMsg(data.returnMessage);
                    }
                }
            });
            return false;
        });

        /**取消*/
        $(".cancle").click(function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        });

    });
</script>
</body>
</html>
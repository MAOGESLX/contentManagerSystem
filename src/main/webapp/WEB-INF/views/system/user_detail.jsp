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
            margin-left: 163px !important;
        }
        .layui-input {

            border-bottom: 1px dashed #eeeeee !important;
            border-top: none !important;
            border-left: none !important;
            border-right: none !important;
            border-radius: 0 !important;
        }
        .layui-input:hover {

            border-bottom: 1px dashed #eeeeee !important;
            border-top: none !important;
            border-left: none !important;
            border-right: none !important;
            border-radius: 0 !important;
        }

    </style>
</head>
<body class="layui-layout-body">
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-row">
                <div class="layui-col-xs12">
                    <div class="layui-row layui-col-space10 layui-form-item">
                        <div class="layui-col-xs12">
                            <label class="layui-form-label">账号：</label>
                            <div class="layui-input-block">
                                <input type="text" value="${user.userAccount}" class="layui-input user-personal" readonly >
                            </div>
                        </div>
                        <div class="layui-col-xs12">
                            <label class="layui-form-label">姓名：</label>
                            <div class="layui-input-block">
                                <input type="text" value="${user.userName}" class="layui-input user-personal" readonly>
                            </div>
                        </div>


                        <div class="layui-col-xs12">
                            <label class="layui-form-label">角色：</label>
                            <div class="layui-input-block">
                                <input type="text" value="${user.userTypeLable}" class="layui-input user-personal" readonly>
                            </div>
                        </div>
                        <div class="layui-col-xs12">
                            <label class="layui-form-label">创建人：</label>
                            <div class="layui-input-block">
                                <input type="text" value="${user.createrName}" class="layui-input user-personal" readonly>
                            </div>
                        </div>
                        <div class="layui-col-xs12">
                            <label class="layui-form-label">创建时间：</label>
                            <div class="layui-input-block">
                                <input type="text" value="${user.createTimeLable}" class="layui-input user-personal" readonly>
                            </div>
                        </div>
                        <div class="layui-col-xs12">
                            <label class="layui-form-label">修改人：</label>
                            <div class="layui-input-block">
                                <input type="text" value="${user.updateName}" class="layui-input user-personal" readonly>
                            </div>
                        </div>
                        <div class="layui-col-xs12">
                            <label class="layui-form-label">修改时间：</label>
                            <div class="layui-input-block">
                                <input type="text" value="${user.updateTimeLable}" class="layui-input user-personal" readonly>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="layui-col-xs12" style="text-align: center">
                        <button id="cancle" class="layui-btn layui-btn-radius layui-btn-cancel" style="margin-top: 15px;">关闭</button>
                </div>

            </div>
        </div>
    </div>

</div>
<script type="text/javascript">

    var $,layOpenWin;
    layui.config({
        base: "${ctx}/static/js/"
    }).use(['form', 'jquery', 'layer', 'layOpenWin','upload'], function () {
        var form = layui.form,
            layer = layui.layer;
            $ = layui.jquery,
            layOpenWin = layui.layOpenWin,
            upload = layui.upload;
        //取消
        $("#cancle").click(function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        });





    });

</script>
</body>
</html>
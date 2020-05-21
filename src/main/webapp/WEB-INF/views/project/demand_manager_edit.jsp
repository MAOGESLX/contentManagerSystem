<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/css/edit.css">
    <script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
    <style>
        .layui-form-select dl {
            max-height: 258px;
        }
    </style>

</head>
<body class="layui-layout-body">
<div class="layui-fluid" >
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form layui-form-pane" method="post" lay-filter="demandFormFilter">
                <!-- 隐藏表单域-->
                <input type="hidden" id="pageFlag" value="${pageFlag}">
                <input type="hidden" id="demandId" name="demandId" value="${demand.demandId}" >

                <div class="layui-row layui-col-space8">
                    <div class="layui-form-item layui-col-xs12">
                        <div class="layui-row layui-col-space12">
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">需求标题：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="demandName" name="demandName" value="${demand.demandName}" lay-verify="required" lay-verType="tips"
                                           placeholder="请输入" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">需求类型：</label>
                                <div class="layui-input-block">
                                    <select id="demandType" name="demandType" lay-verify="required"  lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                        <option value="1">新增</option>
                                        <option value="2">修改</option>
                                        <option value="3">优化</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">优先级：</label>
                                <div class="layui-input-block">
                                    <select id="priority" name="priority" lay-verify="required"  lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                        <option value="1">紧急</option>
                                        <option value="2">高</option>
                                        <option value="3">中</option>
                                        <option value="3">低</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">所属项目：</label>
                                <div class="layui-input-block">
                                    <select id="projectId" name="projectId"  lay-verify="required"  lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                        <c:forEach items="${projects}" var="project">
                                            <option value="${project.projectId}">${project.projectName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">发起人：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="sponsor" name="sponsor" value="${demand.sponsor}" lay-verify="required" lay-verType="tips"
                                           placeholder="请输入" class="layui-input">
                                </div>
                            </div>

                            <div class="layui-col-xs6">
                                <label class="layui-form-label">发起时间：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="sponsorTime" name="sponsorTime" value="${demand.sponsorTime}"
                                           placeholder="请输入" class="Wdate layui-input" lay-verify="required" lay-verType="tips" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'%y-%M-%d'})" style="cursor: pointer;" readonly>
                                </div>
                            </div>

                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">描述</label>
                                <div class="layui-input-block">
                                    <textarea name="demandDesc" placeholder="简介" class="layui-textarea" maxlength="100" style="resize:none;min-height:118px;">${demand.demandDesc}</textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-col-xs12" style="text-align: center;">
                        <button class="layui-btn layui-btn-radius layui-btn-save" lay-submit="" lay-filter="saveDemand">保存</button>
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
            form.val("demandFormFilter", {
                "demandType":'${demand.demandType}',
                "priority": '${demand.priority}',
                "projectId": '${demand.projectId}',
            });
        }

        //保存
        form.on("submit(saveDemand)", function (data) {
            var roleSaveLoading = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            $.ajax({
                url: '${ctx}/project/ajax_save_demand.action',
                type: 'post',
                async: false,
                data: data.field,
                success: function (data) {
                    if (data.returnCode == 200) {
                        top.layer.close(roleSaveLoading);
                        window.parent.frames["ifr"].getSearchDemand();// 刷新表格
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
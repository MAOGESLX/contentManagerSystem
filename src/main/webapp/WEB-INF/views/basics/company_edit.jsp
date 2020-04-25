<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/css/edit.css">
    <script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-fluid" >
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form layui-form-pane" method="post" lay-filter="companyFormFilter">
                <!-- 隐藏表单域-->
                <input type="hidden" id="pageFlag" value="${pageFlag}">
                <input type="hidden" id="companyId" name="companyId" value="${company.companyId}" >

                <div class="layui-row layui-col-space8">
                    <div class="layui-form-item layui-col-xs12">
                        <div class="layui-row layui-col-space12">
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">单位名称：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="companyName" name="companyName" value="${company.companyName}" lay-verify="required" lay-verType="tips"
                                           placeholder="请输入单位名称" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">英文名称：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="companyEnglish" name="companyEnglish" value="${company.companyEnglish}" placeholder="请输入单位英文名称" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">官网：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="companyUrl" name="companyUrl" value="${company.companyUrl}" placeholder="请输入官网" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">性质：</label>
                                <div class="layui-input-block">
                                    <select id="companyNature" name="companyNature" lay-verify="required"  lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                        <option value="1">国有企业</option>
                                        <option value="2">集体企业</option>
                                        <option value="3">联营企业</option>
                                        <option value="4">股份合作制企业</option>
                                        <option value="5">私营企业</option>
                                        <option value="6">个体户</option>
                                        <option value="7">合伙企业</option>
                                        <option value="8">有限责任公司</option>
                                        <option value="9">股份有限公司</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">负责人：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="companyPrincipal" name="companyPrincipal" value="${company.companyPrincipal}"  lay-verify="required" lay-verType="tips"
                                           placeholder="请输入负责人" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">联系电话：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="companyTel" name="companyTel" value="${company.companyTel}"  lay-verify="required|number" lay-verType="tips"
                                           placeholder="请输入联系电话" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">单位邮箱：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="companyMail" name="companyMail" value="${company.companyMail}"  lay-verify="required|email" lay-verType="tips"
                                           placeholder="请输入单位邮箱" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">成立时间：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="establishedTime" name="establishedTime" value="${company.establishedTime}"  lay-verify="required" lay-verType="tips"
                                           placeholder="请选择成立时间" class="Wdate layui-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'%y-%M-%d'})" style="cursor: pointer;" readonly>
                                </div>
                            </div>
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">单位地址：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="companyAddress" name="companyAddress" value="${company.companyAddress}"  lay-verify="required" lay-verType="tips"
                                           placeholder="请输入单位地址" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">备注</label>
                                <div class="layui-input-block">
                                    <textarea name="companyRemark" placeholder="备注" class="layui-textarea" maxlength="100" style="resize:none;min-height:70px;">${company.companyRemark}</textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-col-xs12" style="text-align: center;">
                        <button class="layui-btn layui-btn-radius layui-btn-save" lay-submit="" lay-filter="saveCompany">保存</button>
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
            form.val("companyFormFilter", {
                "companyNature": '${company.companyNature}'
            });
        }
        //保存
        form.on("submit(saveCompany)", function (data) {
            var roleSaveLoading = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            $.ajax({
                url: '${ctx}/company/ajax_save_company.action',
                type: 'post',
                async: false,
                data: data.field,
                success: function (data) {
                    if (data.returnCode == 200) {
                        top.layer.close(roleSaveLoading);
                        window.parent.frames["ifr"].getSearchCompany();// 刷新表格
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
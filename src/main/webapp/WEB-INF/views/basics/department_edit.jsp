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
            max-height: 128px;
        }
    </style>

</head>
<body class="layui-layout-body">
<div class="layui-fluid" >
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form layui-form-pane" method="post" lay-filter="departmentFormFilter">
                <!-- 隐藏表单域-->
                <input type="hidden" id="pageFlag" value="${pageFlag}">
                <input type="hidden" id="departmentId" name="departmentId" value="${department.departmentId}" >

                <div class="layui-row layui-col-space8">
                    <div class="layui-form-item layui-col-xs12">
                        <div class="layui-row layui-col-space12">
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">部门名称：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="departmentName" name="departmentName" value="${department.departmentName}" lay-verify="required" lay-verType="tips"
                                           placeholder="请输入部门名称" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">所属公司：</label>
                                <div class="layui-input-block">
                                    <c:if test="${pageFlag == 'addPage'}">
                                        <select id="companyId" name="companyId" lay-verify="required"  lay-verType="tips" lay-search>
                                            <option value="">请选择</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${pageFlag == 'updatePage'}">
                                        <select id="companyId" name="companyId" lay-verify="required"  lay-verType="tips" lay-search>
                                            <option value="">请选择</option>
                                            <c:forEach items="${companyList}" var="company">
                                                <option value="${company.companyId}">${company.companyName}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">负责人：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="departmentPrincipal" name="departmentPrincipal" value="${department.departmentPrincipal}"  lay-verify="required" lay-verType="tips"
                                           placeholder="请输入负责人" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">联系电话：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="departmentPrincipalTel" name="departmentPrincipalTel" value="${department.departmentPrincipalTel}"  lay-verify="required|number" lay-verType="tips"
                                           placeholder="请输入联系电话" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">成立时间：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="establishedTime" name="establishedTime" value="${department.establishedTime}"  lay-verify="required" lay-verType="tips"
                                           placeholder="请选择成立时间" class="Wdate layui-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'%y-%M-%d'})" style="cursor: pointer;" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs12" style="text-align: center;margin-top: 35px;">
                        <button class="layui-btn layui-btn-radius layui-btn-save" lay-submit="" lay-filter="saveDepartment">保存</button>
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

        if (pageFlag == 'addPage') {
            getCompanyList();
        }
        if (pageFlag == 'updatePage') {
            /**默认赋值*/
            form.val("departmentFormFilter", {
                "companyId": '${department.companyId}'
            });
        }
        //保存
        form.on("submit(saveDepartment)", function (data) {
            var roleSaveLoading = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            $.ajax({
                url: '${ctx}/department/ajax_save_department.action',
                type: 'post',
                async: false,
                data: data.field,
                success: function (data) {
                    if (data.returnCode == 200) {
                        top.layer.close(roleSaveLoading);
                        window.parent.frames["ifr"].getSearchDepartment();// 刷新表格
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


    //查询单位信息
    function getCompanyList(){
        $.ajax({
            url: '${ctx}/company/ajax_query_company_list.action',
            type: 'post',
            success: function (data) {
                if (data.returnCode == 200) {
                    $('#companyId option').not(":first").remove();
                    $(data.returnData).each(function (index, item) {
                        $("#companyId").append(
                            '<option value="' + item.companyId + '">' + item.companyName + '</option>'
                        );
                    });
                    form.render("select");
                }
            }
        });
    }



</script>
</body>
</html>
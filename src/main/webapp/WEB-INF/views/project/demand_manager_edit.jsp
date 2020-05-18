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
            <form class="layui-form layui-form-pane" method="post" lay-filter="projectFormFilter">
                <!-- 隐藏表单域-->
                <input type="hidden" id="pageFlag" value="${pageFlag}">
                <input type="hidden" id="projectId" name="projectId" value="${project.projectId}" >

                <div class="layui-row layui-col-space8">
                    <div class="layui-form-item layui-col-xs12">
                        <div class="layui-row layui-col-space12">
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">项目名称：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="projectName" name="projectName" value="${project.projectName}" lay-verify="required" lay-verType="tips"
                                           placeholder="请输入" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">项目类型：</label>
                                <div class="layui-input-block">
                                    <select id="projectType" name="projectType" lay-verify="required"  lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                        <option value="1">运营类</option>
                                        <option value="2">项目类</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">所属公司：</label>
                                <div class="layui-input-block">
                                    <c:if test="${pageFlag == 'addPage'}">
                                        <select id="companyId" name="companyId" lay-filter="companyFilter" lay-verify="required"  lay-verType="tips" lay-search>
                                            <option value="">请选择</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${pageFlag == 'updatePage'}">
                                        <select id="companyId" name="companyId" lay-filter="companyFilter" lay-verify="required"  lay-verType="tips" lay-search>
                                            <option value="">请选择</option>
                                            <c:forEach items="${companyList}" var="employee">
                                                <option value="${employee.companyId}">${employee.companyName}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">所属部门：</label>
                                <div class="layui-input-block">
                                    <c:if test="${pageFlag == 'addPage'}">
                                        <select id="departmentId" name="departmentId" lay-verify="required"  lay-verType="tips" lay-search>
                                            <option value="">请选择</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${pageFlag == 'updatePage'}">
                                        <select id="departmentId" name="departmentId" lay-verify="required"  lay-verType="tips" lay-search>
                                            <option value="">请选择</option>
                                            <c:forEach items="${departmentList}" var="department">
                                                <option value="${department.departmentId}">${department.departmentName}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                </div>
                            </div>



                            <div class="layui-col-xs6">
                                <label class="layui-form-label">立项时间：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="approvaTime" name="approvaTime" value="${project.approvaTime}"
                                           placeholder="请输入" class="Wdate layui-input" lay-verify="required" lay-verType="tips" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'%y-%M-%d'})" style="cursor: pointer;" readonly>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">上线时间：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="upTime" name="upTime" value="${project.upTime}"
                                           placeholder="请输入" class="Wdate layui-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'%y-%M-%d'})" style="cursor: pointer;" readonly>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">下线时间：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="downTime" name="downTime" value="${project.downTime}"
                                           placeholder="请输入" class="Wdate layui-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'%y-%M-%d'})" style="cursor: pointer;" readonly>
                                </div>
                            </div>

                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">简介</label>
                                <div class="layui-input-block">
                                    <textarea name="projectIntro" placeholder="简介" class="layui-textarea" maxlength="100" style="resize:none;min-height:70px;">${project.projectIntro}</textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-col-xs12" style="text-align: center;">
                        <button class="layui-btn layui-btn-radius layui-btn-save" lay-submit="" lay-filter="saveProject">保存</button>
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
            form.val("projectFormFilter", {
                "projectType":'${project.projectType}',
                "companyId": '${project.companyId}',
                "departmentId": '${project.departmentId}',
            });
        }

        getCompanyFilter();
        //保存
        form.on("submit(saveProject)", function (data) {
            var roleSaveLoading = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            $.ajax({
                url: '${ctx}/project/ajax_save_project.action',
                type: 'post',
                async: false,
                data: data.field,
                success: function (data) {
                    if (data.returnCode == 200) {
                        top.layer.close(roleSaveLoading);
                        window.parent.frames["ifr"].getSearchProject();// 刷新表格
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


    /**查询单位信息**/
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

    /**监听单位选择*/
    function getCompanyFilter() {

        form.on('select(companyFilter)', function (data) {
            if(data.value != ""){
                $.ajax({
                    url: '${ctx}/department/ajax_query_department_list.action',
                    type: 'post',
                    data: {

                        companyId: data.value
                    },
                    success: function (data) {

                        if (data.returnCode == 200) {
                            $('#departmentId option').not(":first").remove();
                            $(data.returnData).each(function (index, item) {
                                $("#departmentId").append(
                                    '<option value="' + item.departmentId + '">' + item.departmentName + '</option>'
                                );
                            });
                            form.render("select");
                        }
                    }
                });

            }else{
                $('#departmentId option').not(":first").remove();
                form.render("select");
            }
        });

    }
</script>
</body>
</html>
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
            max-height: 105px;
        }
    </style>

</head>
<body class="layui-layout-body">
<div class="layui-fluid" >
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form layui-form-pane" method="post" lay-filter="memberFormFilter">
                <!-- 隐藏表单域-->
                <input type="hidden" id="pageFlag" value="${pageFlag}">
                <input type="hidden" id="memberId" name="memberId" value="${member.memberId}" >

                <div class="layui-row layui-col-space8">
                    <div class="layui-form-item layui-col-xs12">
                        <div class="layui-row layui-col-space12">
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">所属项目：</label>
                                <div class="layui-input-block">
                                    <select id="projectId" name="projectId" lay-verify="required" lay-filter="projectFilter"  lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                        <c:forEach items="${projects}" var="project">
                                            <option value="${project.projectId}">${project.projectName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">项目成员：</label>
                                <div class="layui-input-block">
                                    <c:if test="${pageFlag == 'addPage'}">
                                        <select id="employeeId" name="employeeId" lay-verify="required"  lay-verType="tips" lay-search>
                                            <option value="">请选择</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${pageFlag == 'updatePage'}">
                                        <select id="employeeId" name="employeeId" lay-verify="required"  lay-verType="tips" lay-search>
                                            <option value="">请选择</option>
                                            <c:forEach items="${employeeList}" var="employee">
                                                <option value="${employee.employeeId}">${employee.employeeName}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                </div>
                            </div>
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">成员角色：</label>
                                <div class="layui-input-block">
                                    <select id="memberRole" name="memberRole" lay-verify="required"  lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                        <option value="1">产品/项目经理</option>
                                        <option value="2">技术负责人</option>
                                        <option value="3">web端开发</option>
                                        <option value="4">pc端开发</option>
                                        <option value="5">app端开发</option>
                                        <option value="6">小程序开发</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">加入时间：</label>
                                <div class="layui-input-block">
                                    <input type="text" id="addTime" name="addTime" value="${member.addTime}"
                                           placeholder="请输入" class="Wdate layui-input" lay-verify="required" lay-verType="tips" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'%y-%M-%d'})" style="cursor: pointer;" readonly>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-col-xs12" style="text-align: center;margin-top: 34px;">
                        <button class="layui-btn layui-btn-radius layui-btn-save" lay-submit="" lay-filter="saveMember">保存</button>
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
            getProjectFilter();
        }
        if (pageFlag == 'updatePage') {

            /**默认赋值*/
            form.val("memberFormFilter", {
                "employeeId":'${member.employeeId}',
                "memberRole": '${member.memberRole}',
                "projectId": '${member.projectId}',
            });

            getProjectFilter();
        }


        //保存
        form.on("submit(saveMember)", function (data) {
            var roleSaveLoading = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            $.ajax({
                url: '${ctx}/project/ajax_save_member.action',
                type: 'post',
                async: false,
                data: data.field,
                success: function (data) {
                    if (data.returnCode == 200) {
                        top.layer.close(roleSaveLoading);
                        window.parent.frames["ifr"].getSearchMember();// 刷新表格
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

    /**监听项目选择*/
    function getProjectFilter() {

        var memberId = $("#memberId").val();
        form.on('select(projectFilter)', function (data) {
            if(data.value != ""){
                $.ajax({
                    url: '${ctx}/employee/ajax_query_employee_list.action',
                    type: 'post',
                    data: {
                        projectId: data.value,
                        memberId:memberId
                    },
                    success: function (data) {

                        if (data.returnCode == 200) {
                            $('#employeeId option').not(":first").remove();
                            $(data.returnData).each(function (index, item) {
                                $("#employeeId").append(
                                    '<option value="' + item.employeeId + '">' + item.employeeName + '</option>'
                                );
                            });
                            form.render("select");
                        }
                    }
                });

            }else{
                $('#employeeId option').not(":first").remove();
                form.render("select");
            }
        });

    }
</script>
</body>
</html>
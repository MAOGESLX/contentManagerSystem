<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/css/edit.css">
    <style type="text/css">
        .layui-form-item{
            text-align: center;
        }
        .layui-form-select dl{
            max-height: 120px;
        }
    </style>

<body class="layui-layout-body">
<div class="layui-fluid layui-fluid-padding">
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form layui-form-pane" lay-filter="roleFormFilter">
                <input id="roleId" name="roleId" type="hidden" value="${role.roleId}">
                <input id="pageFlag"  type="hidden" value="${pageFlag}">
                <div class="layui-form-item">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="roleName" lay-verify="required|roleName" lay-verType="tips" maxlength="50" value="${role.roleName}" placeholder="请输入角色名称">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">角色类型</label>
                    <div class="layui-input-block">
                        <select id="roleType" name="roleType"  lay-verify="required" lay-verType="tips" lay-search>
                            <option value="">请选择</option>
                            <option value="1">系统管理员</option>
                            <option value="2">资源管理员</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">描述</label>
                    <div class="layui-input-block">
                        <textarea name="roleDesc" placeholder="请输入角色描述内容" class="layui-textarea" maxlength="100" style="resize:none;min-height:70px;">${role.roleDesc}</textarea>
                    </div>
                </div>
                <div class="layui-form-item" style="text-align: center;">
                    <button class="layui-btn layui-btn-radius layui-btn-save" lay-submit="" lay-filter="saveRole">保存</button>
                    <button id="cancle" class="layui-btn layui-btn-radius layui-btn-cancel">取消</button>

                </div>
            </form>

        </div>
    </div>
</div>

<script type="text/javascript">
    layui.config({
        base: "${ctx}/static/js/"
    }).use(['form','jquery','layer','layOpenWin'], function() {


        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery,
            layOpenWin = layui.layOpenWin;

        var pageFlag = $("#pageFlag").val();

        if(pageFlag == "updatePage"){
            /**默认赋值*/
            form.val("roleFormFilter", {
                "roleType": '${role.roleType}',
            });
        }

        //保存
        form.on("submit(saveRole)",function(data){
            var roleSaveLoading = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            $.ajax({
                url : '${ctx}/system/role/ajax_save_role.action',
                type : 'post',
                data : data.field,
                success : function(data) {
                    if(data.returnCode == 200){
                        top.layer.close(roleSaveLoading);
                        window.parent.frames["ifr"].getSearchRole();// 刷新表格

                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭                        //刷新父页面

                        layOpenWin.laySucMsg("角色信息保存成功！");

                    }else{
                        top.layer.close(roleSaveLoading);
                        layOpenWin.layErrorMsg(data.returnMessage);
                    }
                },error:function(data){
                    console.error("错误码:"+data.status)
                    top.layer.close(roleSaveLoading);

                }
            });
            return false;
        });

        //取消
        $("#cancle").click(function(){
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        });
    });
</script>

</body>
</html>
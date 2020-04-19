<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/extend/dtree_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${ctx}/static/extend/dtree_ext/dtree/font/dtreefont.css">
    <link rel="stylesheet" href="${ctx}/static/css/edit.css">
</head>
<body class="layui-layout-body">
<fieldset class="layui-elem-field" style="overflow-y: auto;">
    <legend  style="font-size: 12px;">请选择菜单信息</legend>
    <div class="layui-field-box">
        <ul id="roleGrantTreeId" class="dtree" data-id="0"></ul>
    </div>
</fieldset>

<input id="roleId" type="hidden"  value="${roleId}" >
<input id="menuInfoIds" type="hidden" value="${menuInfoIds}">

<div class="layui-form-item" style="text-align: center;">
    <button class="layui-btn layui-btn-save" style="padding: 0 18px;" id="saveRoleGrant">保存</button>
    <button id="cancle" class="layui-btn layui-btn-cancel" style="padding: 0 18px;">取消</button>
</div>



<script type="text/javascript">
    var  $,layer,element,layOpenWin,dtree;
    layui.config({
        base: "${ctx}/static/js/"
    }).use(['jquery','layer','element','layOpenWin','dtree'], function () {
        $ =  layui.$,
            layer = layui.layer,
            layOpenWin = layui.layOpenWin,
            element = layui.element,
            dtree = layui.dtree;


        // 初始化树
        var DTreeNode = dtree.render({
            elem: "#roleGrantTreeId",
            method: "post",
            dataFormat: "list",
            width:"98%",
            height:"375",
            checkbar: true,
            checkbarType: "all",
            line:true,
            ficon: ["1","-1"],  // 设定一级图标样式。0表示方形加减图标，7表示文件图标
            icon: "-1", // 不设定二级图标样式。
            url: "${ctx}/system/role/ajax_menu_tree_list.action",
            dataStyle: "layuiStyle",  //使用layui风格的数据格式
            response:{message:"msg",statusCode:200},  //修改response中返回数据的定义
            done: function() {
                var menuInfoIds = $("#menuInfoIds").val();
                dtree.chooseDataInit("roleGrantTreeId", menuInfoIds); // 初始化选中
            }
        });
        // 绑定节点点击事件
        dtree.on("node(roleGrantTreeId)", function(obj){
            var nodeId = obj.param.nodeId;
            DTreeNode.clickNodeCheckbar(nodeId);// 点击节点选中复选框
        });

        /**角色菜单信息保存*/
        $("#saveRoleGrant").click(function(){
            //角色Id
            var roleId = $("#roleId").val();
            var params = dtree.getCheckbarNodesParam("roleGrantTreeId");
            //菜单Id
            var menuIds = [];
            if (params && params.length > 0) {
                for ( var i = 0; i < params.length; i++) {
                    menuIds.push(params[i].nodeId);
                }
            }

            var roleGranLoading = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});

            $.ajax({
                url : '${ctx}/system/role/ajax_save_role_menu.action',
                type : 'post',
                data : {
                    roleId:roleId,
                    menuIds:menuIds
                },
                success : function(data) {
                    if(data.returnCode == 200){
                        top.layer.close(roleGranLoading);
                        window.parent.frames["ifr"].getSearchRole();// 刷新表格
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭                        //刷新父页面
                        layOpenWin.laySucMsg("角色授权信息保存成功")


                    }else{
                        top.layer.close(roleGranLoading);
                        layOpenWin.layErrorMsg(data.returnMessage);
                    }
                },error:function(data){
                    top.layer.close(roleGranLoading);
                }
            });


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
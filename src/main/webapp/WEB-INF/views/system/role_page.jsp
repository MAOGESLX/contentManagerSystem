<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<body>
<div class="layui-fluid">
    <div class="layui-row ">
        <div class="layui-col-md12">
            <blockquote class="layui-elem-quote">
                <div class="layui-inline">
                    角色管理
                </div>

                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm layui-btn-add" onclick="getSearchRole();"><i class="layui-icon layui-icon-search"></i>查找</button>

                </div>
                <div class="layui-inline layui-inline-right">
                    <input type="text" id="roleName"  placeholder="请输入角色名称查询" class="layui-input input-serach"  style="width: 300px;">
                </div>

                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm  layui-btn-add  roleAdd_btn"><i class="layui-icon layui-icon-add-circle"></i>新增</button>
                </div>
            </blockquote>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <table id="tableList" lay-filter="tableId"></table>
                </div>
            </div>

        </div>
    </div>


</div>

<script type="text/javascript">

    var  $,layer,table,layOpenWin;
    layui.config({
        base: "${ctx}/static/js/"
    }).use(['jquery','layer','table','layOpenWin'], function () {
        $ =  layui.$,
            layer = layui.layer,
            layOpenWin = layui.layOpenWin,
            table = layui.table;

        intTablePageList();

        /**角色新增*/
        $(".roleAdd_btn").click(function(){
            var url = "${ctx}/system/role/role_add.action";
            layOpenWin.layOpen('新增角色',url,'550px','411px');
        });
        /**监听工具条*/
        table.on('tool(tableId)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值
            //修改
            if(layEvent === 'edit') {
                var url =  "${ctx}/system/role/role_update.action?roleId="+data.roleId;
                layOpenWin.layOpen('编辑角色',url,'550px','411px');
            }
            //分配菜单
            if(layEvent === 'grant') {
                var url =  "${ctx}/system/role/role_grant.action?roleId="+data.roleId;
                layOpenWin.layOpen('分配菜单',url,'255px','520px');
            }
        });

    });

    /**加载表格**/
    function intTablePageList(){

        table.render({
            elem: '#tableList',
            url: '${ctx}/system/role/ajax_role_list.action',
            response: {
                statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
            },
            id:'tableId',
            method: 'post',
            even:'true',
            size: 'sm',
            height:'full-135',
            page: {
                layout:['prev', 'page', 'next','skip','refresh','count'],
                groups:8,
            },
            cols: [[
                {type:"numbers"},
                {field:'roleName', title: '角色名称',minWidth:40},
                {field:'roleType', title: '角色类型',minWidth:40,templet: function(item){
                        var roleType='';
                        if(item.roleType==1){
                            roleType='系统管理员';
                        }else if(item.roleType==2){
                            roleType='资源管理员';
                        }else{
                            roleType = item.roleType
                        }

                        return roleType
                    }},
                {field:'roleStatus', title: '角色状态',minWidth:40,templet: function(item){
                        var statusName='';
                        if(item.roleStatus==0){
                            statusName='<span style="color: #fd6553">无效</span>';
                        }else{
                            statusName='<span style="color: #5FB878">有效</span>';
                        }

                        return statusName
                    }},
                {field:'menuNames', title: '分配菜单',minWidth:240},
                {field:'roleDesc', title: '角色描述',minWidth:140},
                {title: '操作',minWidth:140,toolbar: '#tableBar'}
            ]],

            done: function (res, curr, count) {
            }
        });
    }

    /**角色查找*/
    function getSearchRole() {

        var roleName = $("#roleName").val();
        //执行重载
        table.reload('tableId', {
            where:{
                roleName:roleName
            },
            page: {
                curr: 1 //重新从第 1 页开始
            }

        });
    }
</script>
<!--工具条 -->
<script type="text/html" id="tableBar">
    <button class="layui-btn layui-btn-xs layui-btn-default layui-btn-radius" lay-event="edit">编辑</button>
    <button class="layui-btn layui-btn-xs layui-btn-default layui-btn-radius" lay-event="grant">分配菜单</button>
</script>

</body>
</html>
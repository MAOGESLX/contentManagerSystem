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
                    菜单管理
                </div>
                <div class="layui-inline layui-inline-right" >
                    <button class="layui-btn layui-btn-sm layui-btn-add"  onclick="getSearchMenuInfo();"><i class="layui-icon layui-icon-search"></i>查找</button>
                </div>

                <div class="layui-inline layui-inline-right" >
                    <input type="text" id="menuName"  placeholder="请输入菜单名称查询" class="layui-input input-serach"  style="width: 300px;">
                </div>
                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm layui-btn-add  menuAdd_btn"><i class="layui-icon layui-icon-add-circle"></i>新增</button>
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

        /**菜单新增*/
        $(".menuAdd_btn").click(function(){
            var url = "${ctx}/system/menu/menu_edit.action";
            layOpenWin.layOpen('新增菜单',url,'750px','337px');
        });
        /**监听工具条*/
        table.on('tool(tableId)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值
            //修改用户
            if(layEvent === 'edit') {
                var url = "${ctx}/system/menu/menu_update.action?menuInfoId="+data.menuInfoId;
                layOpenWin.layOpen('编辑菜单',url,'750px','337px');
            }
        });
    });

    /**加载表格**/
    function intTablePageList(){
        table.render({
            elem: '#tableList',
            url: '${ctx}/system/menu/ajax_menu_list.action',
            response: {
                statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
            },
            id:'tableId',
            method: 'post',
            even:'true',
            size: 'sm',
            height:'full-125',
            page: {
                layout:['prev', 'page', 'next','skip','refresh','count'],
                groups:8
            },
            cols: [[
                {type:"numbers"},
                {field:'menuName', title: '菜单名称',minWidth:40},
                {field:'menuCode', title: '菜单编码',minWidth:40},
                {field:'menuType', title: '菜单类型',minWidth:40,templet: function(item){
                        var menuTypeName='';
                        if(item.menuType==0){
                            menuTypeName='菜单';
                        }else if(item.menuType==1){
                            menuTypeName='按钮';
                        }else{
                            menuTypeName = item.menuType
                        }

                        return menuTypeName
                    }},
                {field:'menuLevel', title: '菜单级别',minWidth:40,templet: function(item){
                        var menuLevelName='';
                        if(item.menuLevel==1){
                            menuLevelName='一级菜单';
                        }else if(item.menuLevel==2){
                            menuLevelName='二级菜单';
                        }else{
                            menuLevelName='';
                        }

                        return menuLevelName
                    }},
                {field:'menuStatus', title: '菜单状态',minWidth:40,templet: function(item){
                        var statusName='';
                        if(item.menuStatus==0){
                            statusName='<span style="color: #fd6553">无效</span>';
                        }else{
                            statusName='<span style="color: #5FB878">有效</span>';
                        }

                        return statusName
                    }},
                {field:'menuLinkAddress', title: '菜单路径',minWidth:240},
                {field:'parentName', title: '上级菜单',minWidth:40},
                {field:'menuOrderNo', title: '排序',minWidth:40},
                {title: '操作',minWidth:140,toolbar: '#tableBar'}
            ]],
            done: function (res, curr, count) {
            }
        });
    }

    /**查找*/
    function getSearchMenuInfo() {
        var menuName = $("#menuName").val();
        //执行重载
        table.reload('tableId', {
            where:{
                menuName:menuName
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
</script>

</body>
</html>
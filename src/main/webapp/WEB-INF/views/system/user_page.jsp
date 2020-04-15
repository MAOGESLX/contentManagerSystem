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
                    用户管理
                </div>
                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm layui-btn-add" onclick="getSearchUser();"><i class="layui-icon layui-icon-search"></i>查找</button>
                </div>
                <div class="layui-inline layui-inline-right">
                    <form  id="userSearchForm" method="post">
                        <input type="text" id="userAccount" name="userAccount"  placeholder="请输入名称、账号信息查询" class="layui-input input-serach"  style="width: 200px;">
                    </form>
                </div>
            </blockquote>
        </div>
        <div class="layui-col-md12" >
            <div class="layui-card">
                <div class="layui-card-body" >
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


        /**加载表格*/
        intTablePageList();


        /**监听工具条*/
        table.on('tool(tableId)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值

            //详情
            if(layEvent === 'userDetail') {
                var url = "${ctx}/system/user/user_detail_page.action?userId=" + data.userId;
                layOpenWin.layOpen('用户详情',url, '720px', '628px');
            }
            //重置密码
            if(layEvent === 'resetUserPwd') {
                var url = "${ctx}/system/user/ajax_reset_user_pwd.action";
                var param = {userId:data.userId};
                ajaxConfirm('消息提示', '确定要重置当前密码吗?',url,param);

            }
        });
    });


    /**加载表格**/
    function intTablePageList(){
        table.render({
            elem: '#tableList',
            url: '${ctx}/system/user/ajax_user_list.action',
            response: {
                statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
            },
            id:'tableId',
            method: 'post',
            even:'true',
            size: 'sm',
            height:'full-125',
            page: {
                layout:['prev', 'page', 'next','skip','refresh','count','limit'],
                groups:8,
            },
            cols: [[
                {type:"numbers"},
                {field:'userAccount', title: '登录账号',minWidth:40},
                {field:'userName', title: '姓名',minWidth:40},
                {field:'userStatus', title: '状态',minWidth:40,templet: function(item){
                    var statusName='';
                    if(item.userStatus==0){
                        statusName='<span style="color: #fd6553">无效</span>';
                    }else{
                        statusName='<span style="color: #5FB878">有效</span>';
                    }
                    return statusName
                }},
                {field:'userTypeLable', title: '角色',minWidth:40},
                {title: '操作',minWidth:300,toolbar: '#tableBar'}
            ]],

            done: function (res, curr, count) {
            }
        });
    }
    /**用户查询*/
    function getSearchUser() {

        var userAccount = $("#userAccount").val();
        //执行重载
        table.reload('tableId', {
            where:{
                userAccount:userAccount
            },
            page: {
                curr: 1 //重新从第 1 页开始
            }

        });
    }

    /**弹框确认*/
    function ajaxConfirm (title, text, url,param) {

        top.layer.confirm(text, {
            title: title,
            resize: false,
            skin: 'bbt-open-class',
            btn: ['确定', '取消'],
            btnAlign: 'c',
            icon: 0,
        }, function () {
            var roleSaveLoading = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});

            $.ajax({
                async: false,
                type : 'post',
                url : url,
                data : param,
                success : function(data) {
                    if(data.returnCode == 200){
                        getSearchUser();
                        layOpenWin.laySucMsg(data.returnMessage);

                    }else{
                        layOpenWin.layErrorMsg(data.returnMessage);
                    }
                    top.layer.close(roleSaveLoading);
                },error:function(data){
                    top.layer.close(roleSaveLoading);
                }
            });
        }, function () {
        })
    }

</script>
<!--工具条 -->
<script type="text/html" id="tableBar">
    <button class="layui-btn layui-btn-xs layui-btn-default layui-btn-radius" lay-event="userDetail">详情</button>
    <button class="layui-btn layui-btn-xs layui-btn-default layui-btn-radius" lay-event="resetUserPwd">重置密码</button>

</script>

</body>
</html>
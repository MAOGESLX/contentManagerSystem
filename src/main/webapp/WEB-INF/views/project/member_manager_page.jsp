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
                    成员管理
                </div>
                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm layui-btn-add" onclick="getSearchMember();"><i class="layui-icon layui-icon-search"></i>查找</button>
                </div>
                <div class="layui-inline layui-inline-right">
                    <form  id="userSearchForm" method="post">
                        <input type="text" id="employeeName" name="employeeName"  placeholder="请输入成员或项目名称查询" class="layui-input input-serach"  style="width: 200px;">
                    </form>
                </div>
                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm layui-btn-add memberAdd_btn"><i class="layui-icon layui-icon-add-circle"></i>新增</button>
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

        /**新增*/
        $(".memberAdd_btn").click(function(){
            var url = "${ctx}/project/member_add.action";
            layOpenWin.layOpen('成员新增',url, '380px', '368px');
        });

        /**加载表格*/
        intTablePageList();


        /**监听工具条*/
        table.on('tool(tableId)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值

            //修改
            if(layEvent === 'edit') {
                var url = "${ctx}/project/member_update.action?memberId="+data.memberId;
                layOpenWin.layOpen('成员编辑',url, '380px', '368px');
            }

        });
    });


    /**加载表格**/
    function intTablePageList(){
        table.render({
            elem: '#tableList',
            url: '${ctx}/project/ajax_member_list.action',
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
                groups:8,
            },
            cols: [[
                {type:"numbers"},
                {field:'employeeName', title: '成员姓名',minWidth:100},
                {field:'memberRole', title: '成员角色',minWidth:50,templet: function(item){
                        var memberRoleName='';
                        if(item.memberRole==1){
                            memberRoleName='产品/项目经理';
                        }else if(item.memberRole==2) {
                            memberRoleName='技术负责人';
                        }else if(item.memberRole==3) {
                            memberRoleName='web端开发';
                        }else if(item.memberRole==4) {
                            memberRoleName='pc端开发';
                        }else if(item.memberRole==5) {
                            memberRoleName='app端开发';
                        }else if(item.memberRole==6) {
                            memberRoleName='小程序开发';
                        }
                        return memberRoleName
                    }},
                {field:'memberStatus', title: '成员状态',minWidth:50,templet: function(item){
                        var memberStatusName='';
                        if(item.memberStatus==1){
                            memberStatusName='有效';
                        }else if(item.memberStatus==2) {
                            memberStatusName='释放';
                        }else if(item.memberStatus==0) {
                            memberStatusName='删除';
                        }
                        return memberStatusName
                    }},
                {field:'addTime', title: '加入时间',minWidth:50},
                {field:'releaseTime', title: '释放时间',minWidth:50},
                {field:'projectName', title: '所属项目',minWidth:100},
                {title: '操作',minWidth:50,toolbar: '#tableBar'}
            ]],
            done: function (res, curr, count) {
            }
        });
    }
    /**成员查询*/
    function getSearchMember() {

        var employeeName = $("#employeeName").val();
        //执行重载
        table.reload('tableId', {
            where:{
                employeeName:employeeName
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
                        getSearchMember();
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
    <button class="layui-btn layui-btn-xs layui-btn-default layui-btn-radius" lay-event="edit">编辑</button>
</script>

</body>
</html>
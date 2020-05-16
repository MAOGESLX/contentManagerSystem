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
                    需求管理
                </div>
                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm layui-btn-add" onclick="getSearchDemand();"><i class="layui-icon layui-icon-search"></i>查找</button>
                </div>
                <div class="layui-inline layui-inline-right">
                    <form  id="userSearchForm" method="post">
                        <input type="text" id="demandName" name="demandName"  placeholder="请输入需求名称、描述查询" class="layui-input input-serach"  style="width: 200px;">
                    </form>
                </div>
                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm layui-btn-add demandAdd_btn"><i class="layui-icon layui-icon-add-circle"></i>新增</button>
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
        $(".demandAdd_btn").click(function(){
            var url = "${ctx}/project/project_list_add.action";
            layOpenWin.layOpen('需求新增',url, '720px', '458px');
        });

        /**加载表格*/
        intTablePageList();


        /**监听工具条*/
        table.on('tool(tableId)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值

            //修改
            if(layEvent === 'edit') {
                var url = "${ctx}/project/project_update.action?projectId="+data.projectId;
                layOpenWin.layOpen('项目编辑',url, '720px', '458px');
            }

        });
    });


    /**加载表格**/
    function intTablePageList(){
        table.render({
            elem: '#tableList',
            url: '${ctx}/project/ajax_demand_list.action',
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
                {field:'demandName', title: '需求名称',minWidth:100},

                {field:'demandType', title: '需求类型',minWidth:50,templet: function(item){
                        var demandTypeName='';
                        if(item.demandType==1){
                            demandTypeName='新增';
                        }else if(item.demandType==2){
                            demandTypeName='修改';
                        }else if(item.demandType == 3){
                            demandTypeName='优化';
                        }else {
                            demandTypeName=item.demandType;
                        }
                        return demandTypeName
                    }},

                {field:'priority', title: '优先级',minWidth:50,templet: function(item){
                        var priorityName='';
                        if(item.priority==1){
                            priorityName='<span style="color: #2d8cf0">紧急</span>';
                        }else if(item.priority == 2) {
                            priorityName='<span style="color: #2b85e4">高</span>';
                        }else if(item.priority == 3) {
                            priorityName='<span style="color: #2b85e4">中</span>';
                        }else if(item.priority == 4) {
                            priorityName='<span style="color: #2b85e4">低</span>';
                        }else {
                            priorityName=item.priority;
                        }
                        return priorityName
                    }},

                {field:'demandStatus', title: '状态',minWidth:50,templet: function(item){
                        var demandStatusName='';
                        if(item.demandStatus==1){
                            demandStatusName='<span style="color: #ff9900">计划中</span>';
                        }else if(item.demandStatus==2) {
                            demandStatusName='<span style="color: #3091f2">已下发</span>';
                        }else if(item.demandStatus==3) {
                            demandStatusName='<span style="color: #3399ff">进行中</span>';
                        }else if(item.demandStatus==4) {
                            demandStatusName='<span style="color: #3399ff">已完成</span>';
                        }else if(item.demandStatus==5) {
                            demandStatusName='<span style="color: #00cc66">暂缓</span>';
                        }else if(item.demandStatus==6) {
                            demandStatusName='<span style="color: #ff6600">终止/移除</span>';
                        }else if(item.demandStatus==7) {
                            demandStatusName='<span style="color: #ff6600">已发布</span>';
                        }else if(item.demandStatus==8) {
                            demandStatusName='<span style="color: #ff6600">已逾期</span>';
                        }else{
                            demandStatusName = item.demandStatus
                        }
                        return demandStatusName
                    }},
                {field:'startTime', title: '开始时间',minWidth:100},
                {field:'planFinishTime', title: '计划完成时间',minWidth:100},
                {field:'finishTime', title: '实际完成时间',minWidth:100},
                {field:'remainingDays', title: '剩余天数',minWidth:50},
                {field:'finishRate', title: '完成率',minWidth:150},
                {title: '操作',minWidth:50,toolbar: '#tableBar'}
            ]],
            done: function (res, curr, count) {
            }
        });
    }
    /**需求查询*/
    function getSearchDemand() {

        var demandName = $("#demandName").val();
        //执行重载
        table.reload('tableId', {
            where:{
                demandName:demandName
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
                        getSearchDemand();
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
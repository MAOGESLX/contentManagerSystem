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
                    单位管理
                </div>
                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm layui-btn-add" onclick="getSearchCompany();"><i class="layui-icon layui-icon-search"></i>查找</button>
                </div>
                <div class="layui-inline layui-inline-right">
                    <form  id="userSearchForm" method="post">
                        <input type="text" id="companyName" name="companyName"  placeholder="请输入公司名称、负责人信息查询" class="layui-input input-serach"  style="width: 200px;">
                    </form>
                </div>
                <div class="layui-inline layui-inline-right">
                    <button class="layui-btn layui-btn-sm layui-btn-add companyAdd_btn"><i class="layui-icon layui-icon-add-circle"></i>新增</button>
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
        $(".companyAdd_btn").click(function(){
            var url = "${ctx}/company/company_add.action";
            layOpenWin.layOpen('单位新增',url, '720px', '505px');
        });

        /**加载表格*/
        intTablePageList();


        /**监听工具条*/
        table.on('tool(tableId)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值

            //修改
            if(layEvent === 'edit') {
                var url = "${ctx}/company/company_update.action?companyId="+data.companyId;
                layOpenWin.layOpen('单位编辑',url, '720px', '505px');
            }

        });
    });


    /**加载表格**/
    function intTablePageList(){
        table.render({
            elem: '#tableList',
            url: '${ctx}/company/ajax_company_list.action',
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
                {field:'companyName', title: '单位名称',minWidth:100},
                {field:'companyEnglish', title: '英文名称',minWidth:50},
                {field:'companyUrl', title: '官网',minWidth:160},
                {field:'companyNatureLable', title: '单位性质',minWidth:40},
                {field:'companyPrincipal', title: '负责人',minWidth:50},
                {field:'companyTel', title: '联系电话',minWidth:50},
                {field:'companyMail', title: '邮箱',minWidth:40},
                {field:'establishedTime', title: '成立时间',minWidth:50},
                {field:'companyAddress', title: '地址',minWidth:40},
                {title: '操作',minWidth:50,toolbar: '#tableBar'}
            ]],

            done: function (res, curr, count) {
            }
        });
    }
    /**公司查询*/
    function getSearchCompany() {

        var companyName = $("#companyName").val();
        //执行重载
        table.reload('tableId', {
            where:{
                companyName:companyName
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
                        getSearchCompany();
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
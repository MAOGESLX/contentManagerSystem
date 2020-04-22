<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/css/edit.css">
    <style type="text/css">
        .layui-form-select dl{
            max-height: 180px;
        }

    </style>
<body class="layui-layout-body" >
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form">
                <input id="menuInfoId" name="menuInfoId" type="hidden" value="${menu.menuInfoId}">

                <input id="pageFlag"  type="hidden" value="${pageFlag}">
                <input id="menuParentCount"  type="hidden" value="${menuParentCount}">


                <div class="layui-row layui-col-space8">
                    <div class="layui-form-item layui-col-xs12">
                        <div class="layui-row layui-col-space12">
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">菜单名称</label>
                                <div class="layui-input-block">
                                    <input type="text" id="menuName" name="menuName" class="layui-input" maxlength="20" value="${menu.menuName}" lay-verify="required|menuName" lay-verType="tips" placeholder="请输入菜单名称">
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">菜单类型</label>
                                <div class="layui-input-block">
                                    <select id="menuType" name="menuType" lay-filter="menuTypeFilter" lay-verify="required" lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                        <option value="0">菜单</option>
                                        <option value="1">按钮</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">菜单级别</label>
                                <div class="layui-input-block">
                                    <select id="menuLevel" name="menuLevel" lay-filter="menuLevelFilter" lay-verify="required" lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                        <option value="1">一级菜单</option>
                                        <option value="2">二级菜单</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">父级菜单</label>
                                <div class="layui-input-block">
                                    <select id="menuParentId" name="menuParentId" lay-verify="menuParentId" lay-verType="tips" lay-search>
                                        <option value="">请选择</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">菜单图标</label>
                                <div class="layui-input-block">

                                    <c:if test="${pageFlag == 'addPage'}">
                                        <input type="text" class="layui-input" id="menuImage" name="menuImage"  value="/static/img/system.png">
                                    </c:if>
                                    <c:if test="${pageFlag == 'updatePage'}">
                                        <input type="text" class="layui-input" id="menuImage" name="menuImage"  value="${menu.menuImage}">

                                    </c:if>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <label class="layui-form-label">排序</label>
                                <div class="layui-input-block">
                                    <c:if test="${pageFlag == 'addPage'}">
                                        <input type="text" id="menuOrderNo" name="menuOrderNo" class="layui-input" lay-verify="menuOrderNo" lay-verType="tips" maxlength="10" value="${maxOrderNo}">
                                    </c:if>
                                    <c:if test="${pageFlag == 'updatePage'}">
                                        <input type="text" id="menuOrderNo" name="menuOrderNo" class="layui-input" lay-verify="menuOrderNo" lay-verType="tips" maxlength="10" value="${menu.menuOrderNo}">

                                    </c:if>
                                </div>
                            </div>
                            <div class="layui-col-xs12">
                                <label class="layui-form-label">菜单路径</label>
                                <div class="layui-input-block">
                                    <input type="text" id="menuLinkAddress" name="menuLinkAddress" lay-verify="menuLinkAddress" lay-verType="tips" class="layui-input" maxlength="50"  value="${menu.menuLinkAddress}">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="layui-col-xs12" style="text-align: center;">
                        <button class="layui-btn layui-btn-radius layui-btn-save" lay-submit="" lay-filter="saveMenu">保存</button>
                        <button class="layui-btn layui-btn-radius layui-btn-cancel" id="cancle" >取消</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


</div>

<script type="text/javascript">
    var  $,form,layer,layOpenWin;
    layui.config({
        base: "${ctx}/static/js/"
    }).use(['form','jquery','layer','layOpenWin'], function() {

         form = layui.form,
            layer = layui.layer,
            $ = layui.jquery,
            layOpenWin = layui.layOpenWin;

        /**菜单新增初始化*/
        menuInit();

        /**监听菜单类型选择*/
        form.on('select(menuTypeFilter)', function(data){
            //如果菜单类型为按钮, 菜单级别选中二级菜单,并禁用选择
            if(data.value == 1){
                $("#menuLevel option[value='2']").prop("selected","selected");
                $("#menuLevel").attr("disabled","disabled");
            }else{
                $('#menuParentId option').not(":first").remove();
                $("#menuLevel").removeAttr("disabled");
                $("#menuLevel option:first").prop("selected", 'selected');
                $("#menuLinkAddress").removeAttr("disabled","disabled");

            }
            form.render('select');

            //加载父级菜单
            loadParentMenu();
        });

        /**监听菜单级别选择*/
        form.on('select(menuLevelFilter)', function(data){
            if(data.value == 1){
                $("#menuLinkAddress").val('');
                $("#menuLinkAddress").attr("disabled","disabled");
            }else{
                $("#menuLinkAddress").removeAttr("disabled","disabled");

            }
            //加载父级菜单
            loadParentMenu();

        });

        /**表单验证*/
        form.verify({
            menuName: function(value, item){
                //验证菜单名称
                if(!new RegExp("^[0-9a-zA-Z\u4e00-\u9fa5]+$").test(value)){
                    return '菜单名称只能为中文数字或者字母';
                }

            },
            menuParentId:function(value,item){
                //验证父级菜单
                var  menuLevel = $("#menuLevel").val();
                if(menuLevel == 2&& value == ''){
                    return '父级菜单不能为空';
                }
            },
            menuLinkAddress: function(value, item){
                //验证菜单路径
                var  menuLevel = $("#menuLevel").val();
                var menuParentCount = $("#menuParentCount").val();
                var menuType =  $("#menuType option:selected").val();
                if(menuType == 0 && menuLevel == 2 && value == '' && (menuParentCount == '' || menuParentCount <0)){
                    return '菜单路径不能为空';
                }
            },
            menuOrderNo: function(value, item){
                //验证排序
                if(value != '' && !new RegExp("^[0-9]*$").test(value)){
                    return '排序只能为数字';
                }

            }
        });

        /**保存*/
        form.on("submit(saveMenu)",function(data){
            var userSaveLoading = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            $.ajax({
                url : '${ctx}/system/menu/ajax_save_menu.action',
                type : 'post',
                data : data.field,
                success : function(data) {
                    if(data.returnCode == 200){
                        top.layer.close(userSaveLoading);
                        window.parent.frames["ifr"].getSearchMenuInfo();// 刷新表格
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭                        //刷新父页面

                        layOpenWin.laySucMsg("保存成功");

                    }else{
                        top.layer.close(userSaveLoading);
                        layOpenWin.layErrorMsg(data.returnMessage);
                    }
                },error:function(data){
                    top.layer.close(index);

                }
            });
            return false;
        });

        /**取消*/
        $("#cancle").click(function(){
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        });

    });


    /***菜单新增初始化**/
    function menuInit(){
        var pageFlag = $("#pageFlag").val();
        if(pageFlag == "addPage"){
            //默认菜单级别不可点击
            $("#menuLevel").attr("disabled","disabled");
        }
        //更新标识
        if(pageFlag == "updatePage"){
            menuTypeVal = ${menu.menuType}
                menuLevelVal = ${menu.menuLevel}
                    menuParentIdVal = '${menu.menuParentId}'
            menuParentCount = ${menuParentCount}

                //菜单类型选中，不能点击
                $("#menuType option[value='"+menuTypeVal+"']").prop("selected","selected");
            $("#menuType").attr("disabled","disabled");

            //菜单级别选中
            $("#menuLevel option[value='"+menuLevelVal+"']").prop("selected","selected");
            if(menuTypeVal == 1 || (menuTypeVal == 0 && menuParentCount > 0)){
                $("#menuLevel").attr("disabled","disabled");

            }
            // if(menuLevelVal == 1){
            //     $("#menuLinkAddress").val('');
            //     $("#menuLinkAddress").attr("disabled","disabled");
            // }


            //加载父级菜单
            loadParentMenu();

            $("#menuParentId option[value='"+menuParentIdVal+"']").prop("selected","selected");



        }

        form.render('select');
    }

    /**加载父级菜单*/
    function loadParentMenu(){
        var menuType =  $("#menuType option:selected").val();
        var menuLevel =  $("#menuLevel option:selected").val();
        var menuInfoId = $("#menuInfoId").val();

        if(menuType != "" && menuLevel != "" ){
            //1级菜单、父级菜单为空
            if(menuLevel == 1){
                $('#menuParentId option').not(":first").remove();
                form.render('select');
                return;
            }
            //加载父级菜单
            $.ajax({
                url : '${ctx}/system/menu/ajax_menu_parent_menu.action',
                type : 'post',
                async: false,
                data : {
                    menuType:menuType,
                    menuLevel:menuLevel,
                    menuInfoId:menuInfoId
                },
                success : function(data) {
                    if(data != "" ){
                        $('#menuParentId option').not(":first").remove();
                        $(data).each(function(index,item){
                            $("#menuParentId").append(
                                '<option value="'+item.menuInfoId+'">'+item.menuName+'</option>'
                            );


                        });

                    }
                }
            });
            form.render('select');


        }

    }

</script>

</body>
</html>
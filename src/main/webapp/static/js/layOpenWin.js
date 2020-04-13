/**自定义模块*/
layui.define(['layer'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer;
    var layOpenWin = {

        layMsg:function (text){
            top.layer.msg(text);
        },
        /**错误msg提示 */
        layErrorMsg:function (text) {
            top.layer.msg(text,{icon: 2});
        },
        /**成功 msg提示 */
        laySucMsg:function (text) {
            top.layer.msg(text,{icon: 1});
        },

        /**ajax Confirm 对话框*/
        ajaxConfirm: function (title, text, url,param) {

            top.layer.confirm(text, {
                title: title,
                resize: false,
                skin: 'cms-open-class',
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
                            location.reload();
                            top.layer.msg(data.returnMessage);

                        }else{
                            top.layer.msg(data.returnMessage);
                        }
                        top.layer.close(roleSaveLoading);
                    },error:function(data){
                        top.layer.close(roleSaveLoading);
                    }
                });



            }, function () {

            })

        },
        /**弹出层*/
        layOpen:function (title,url,width,height) {

            var index = top.layui.layer.open({
                title : title,
                type :2,
                content : url,
                area: [width, height],
                resize:false,
                skin: 'cms-open-class',
                success : function(layero, index){
                }
            });

        },

        layOpen2:function (title,url,width,height) {

            var index = top.layui.layer.open({
                title : title,
                type :2,
                closeBtn:0,
                content : url,
                area: [width, height],
                resize:false,
                skin: 'cms-open-class',
                success : function(layero, index){
                }
            });

        },
        layOpen3:function (title,url,width,height) {

            var index = layui.layer.open({
                title : title,
                type :2,
                content : url,
                area: [width, height],
                resize:false,
                skin: 'cms-open-class',
                success : function(layero, index){
                }
            });

        },
        layOpen4:function (title,url,width,height) {

            var index = top.layui.layer.open({
                title : title,
                type :2,
                closeBtn:0,
                content : url,
                area: [width, height],
                resize:false,
                skin: 'cms-open-class',
                success : function(layero, index){

                }
            });

        },
        /**弹出层*/
        layOpenType1:function (title,content,width,height) {

            var index = top.layui.layer.open({
                title : title,
                type :1,
                content : content,
                area: [width, height],
                resize:false,
                skin: 'cms-open-class',
                success : function(layero, index){
                }
            });

        },

        /**退出*/
        logOut: function (title, text, url, type, dataType, data, callback) {
            parent.layer.confirm(text, {
                title: title,
                skin: 'cms-open-class',
                resize: false,
                btn: ['确定', '取消'],
                btnAlign: 'c',
                icon: 0,
            }, function () {
                location.href = url
            }, function () {
               
            })
        },
        /*信息提示*/
        logTipInfo: function (title, text) {
            parent.layer.confirm(text, {
                title: title,
                skin: 'cms-open-class',
                resize: false,
                btn: ['关闭'],
                btnAlign: 'c',
            })
        }
    };
    exports('layOpenWin', layOpenWin)
})




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/css/data_analysis.css">
    <script src="${ctx}/static/js/jquery.countTo.js"></script>
    <script src="${ctx}/static/js/echarts.min.js"></script>

    <script src="${ctx}/static/js/get_echart.js"></script>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space10">

        <div class="layui-col-md12 layui-col-sm12">
            <div class="layui-card">
                <div class="layui-card-header">数据分析</div>
                <div class="layui-card-body">
                    <div id="1" style="height: 280px; margin: 0 auto;width: 100%;"></div>
                </div>
            </div>
        </div>

    </div>
</div>
</div>
<script type="text/javascript">
    var $;
    layui.use(['jquery'], function () {
        $ = layui.$;



    });

</script>
</body>
</html>
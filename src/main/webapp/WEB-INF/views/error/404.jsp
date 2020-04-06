<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/css/error.css">

</head>
<body>
<div class="layui-fluid">
    <div class="error-page">
        <div class="error-code">4<span>0</span>4</div>
        <div class="error-desc">你所访问的页面正在建设中</div>
        <div class="error-handle">
            <button class="layui-btn  layui-btn-add" onclick="home();">返回首页</button>
            <button class="layui-btn  layui-btn-add error-btn" onclick="goBack();">返回上一页</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    function goBack() {
        window.history.go(-1)
    }
    function home() {
        window.top.location.href = "${ctx}/";

    }
</script>
</body>
</html>
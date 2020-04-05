<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>



<link rel="stylesheet" href="${ctx}/static/css/nprogress.css">
<link rel="stylesheet" href="${ctx}/static/font_extend/iconfont.css">

<link rel="stylesheet" href="${ctx}/static/layui_v2/css/layui.css">
<link rel="stylesheet" href="${ctx}/static/css/main.css">
<link rel="shortcut icon" href="${ctx}/static/img/f_icon.png" type="image/x-icon">


<script type="text/javascript" src="${ctx}/static/js/jquery-3.3.1.min.js"></script>
<script src="${ctx}/static/layui_v2/layui.js"></script>
<script src="${ctx}/static/js/nprogress.js"></script>
<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
<script type="text/javascript"  >

    var  $;
    layui.use(['jquery'], function () {
        $ =  layui.$;
        $.ajaxSetup({
            error: function(data) {
                if(data.status == '401'){
                    window.top.location.href= "${ctx}/login.action";
                }
            }
        });

    });


</script>
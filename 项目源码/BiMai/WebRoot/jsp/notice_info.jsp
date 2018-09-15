<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <title>必买</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/base.css">
</head>
<body>
<!-- 包含头部 -->
<%@include file="/jsp/index_head.jsp" %>

<!--公告详情-->
<div class="container" style="margin-top: 80px; padding-left: 0; padding-right: 0">
    <ol class="breadcrumb" style="background-color: #101010;">
        <li class="col"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li class="active">公告详情</li>
    </ol>
    <div class="panel panel-primary" style="border-color: #d43f3a;">
        <div class="panel-heading" style="background-color: #d9534f;border-color: #d43f3a;">
            <h2 class="text-center">${notice.ntitle }</h2>
            <h5 class="text-center">发布者：${notice.admin.admin_name }</h5>
            <h5 class="text-center">发布时间：${notice.localDate }</h5>
        </div>
        <div class="panel-body" >
            <h3>${notice.ndesc }</h3>
        </div>
    </div>

</div>

<!--底部-->
<footer id="footer">
    <div class="container">
        <p><a href="index.html">首页</a> | <a href="information.html">资讯</a> | <a href="index.html">分类</a> | <a href="about.html">关于</a></p>
        <p>网址备案号：蒙ICP备16006119号 网站基于Bootstrap制作     站长统计</p>
    </div>
</footer>

<script type="text/javascript">
$(function () {
	//清空购物车
	$("#btn-clearCart").click(function () {
		if (confirm("您确认要清空购物车吗？")) {
			location.href = "${pageContext.request.contextPath }/cart?method=clearCart";
		} 
	});
	//提交订单
	$("#btn-order-submit").click(function () {
		location.href = "${pageContext.request.contextPath }/order?method=add";
	});
});
//从购物车中删除购物车项
function removeFromCart(pid) {
	if (confirm("您确认狠心丢弃我吗？")) {
		location.href = "${pageContext.request.contextPath }/cart?method=removeFromCart&pid="+pid;
	} 
}
</script>
</body>
</html>
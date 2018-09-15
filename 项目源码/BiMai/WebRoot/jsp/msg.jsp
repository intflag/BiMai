<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>必买</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/style.css">
</head>
<body>
<!-- 包含头部 -->
<jsp:include page="/jsp/index_head.jsp"></jsp:include>
<!-- 显示错误信息 -->
<div class="container" style="margin-top: 80px; padding-left: 0; padding-right: 0">
	<div class="container-fluid"><h1>${msg }</h1></div>
</div>
<!--底部-->
<footer id="footer">
    <div class="container">
        <p><a href="index.html">首页</a> | <a href="information.html">资讯</a> | <a href="index.html">分类</a> | <a href="about.html">关于</a></p>
        <p>网址备案号：蒙ICP备16006119号 网站基于Bootstrap制作     站长统计</p>
    </div>
</footer>

</body>
</html>
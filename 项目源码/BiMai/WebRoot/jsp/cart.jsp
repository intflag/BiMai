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

<!--购物车-->
<div class="container" style="margin-top: 80px; padding-left: 0; padding-right: 0">
    <ol class="breadcrumb" style="background-color: #101010;">
        <li class="col"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li class="active">购物车</li>
    </ol>
    <div class="table-responsive">
        <table class="table table-hover">
            <caption><h1 class="text-center"><span class="glyphicon glyphicon-shopping-cart"></span> 购物车</h1></caption>
            <thead>
            <tr>
                <th><h3>图片</h3></th>
                <th><h3>商品</h3></th>
                <th><h3>价格</h3></th>
                <th><h3>数量</h3></th>
                <th><h3>小计</h3></th>
                <th><h3>操作</h3></th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${cart.items }" var="item">
	                <tr>
	                    <td>
	                        <a href="${pageContext.request.contextPath }/product?method=findProductById&id=${item.product.pid}" class="img-rounded">
	                            <img width="100" class="img-rounded" src="${pageContext.request.contextPath}/${item.product.pimage}" alt="Responsive image">
	                        </a>
	                    </td>
	                    <td>${item.product.pname}</td>
	                    <td>￥${item.product.shop_price}</td>
	                    <td>${item.count}</td>
	                    <td>￥${item.subtotal}</td>
	                    <td><button onclick="removeFromCart('${item.product.pid}')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 删除</button></td>
	                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="container">
        <div class="pull-right">
            <h3>订单金额：<strong style="color:#d9534f;">￥${cart.total }元</strong></h3>
        </div>
        <div class="clearfix"></div>
        <div class="pull-right" style="margin-bottom: 15px;">
            <button id="btn-clearCart" type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-exclamation-sign"></span> 清空购物车</button>
            <button id="btn-order-submit" type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-list-alt"></span> 提交订单</button>
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
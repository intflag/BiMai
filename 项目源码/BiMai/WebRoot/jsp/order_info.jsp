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

<!--订单详情-->
<div class="container" style="margin-top: 80px; padding-left: 0; padding-right: 0">
    <ol class="breadcrumb" style="background-color: #101010;">
        <li class="col"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li class="active">订单详情</li>
    </ol>
    <div class="row" style="padding: 15px;">
        <form id="form-pay" class="form-horizontal" action="${pageContext.request.contextPath }/order?method=pay" method="post">
            <div class="col-md-6">
                <h2 class="text-center"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>收货信息</h2>
                <!--错误提示-->
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <p class="text-danger" class="help-block">请您填写正确的收货信息，方便我们尽快为您送货！</p>
                </div>
                <input type="hidden" name="oid" value="${order.oid }">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">收货人</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" placeholder="请输入收货人姓名">
                    </div>
                    
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">收货地址</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="address" placeholder="请输入收货地址">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">收货电话</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="telephone" placeholder="请输入收货电话">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <h2 class="text-center"><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>支付方式</h2>
                <div class="form-group">
                    <div class="col-md-6 col-sm-6 col-xs-6" style="margin-bottom: 10px;">
                        <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />工商银行 <img src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle" />
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="margin-bottom: 10px;">
                        <input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle" />
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="margin-bottom: 10px;">
                        <input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle" />
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="margin-bottom: 10px;">
                        <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 <img src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle" />
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="margin-bottom: 10px;">
                        <input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行 <img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle" />
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="margin-bottom: 10px;">
                        <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行 <img src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle" />
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="margin-bottom: 10px;">
                        <input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle" />
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" style="margin-bottom: 10px;">
                        <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行 <img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle" />
                    </div>
                    <!-- <br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  <br /> <br /> &nbsp;&nbsp;&nbsp;&nbsp; -->
                </div>
            </div>
        </form>
    </div>
    <div class="table-responsive">
        <table class="table table-hover">
            <caption><h1 class="text-center"><span class="glyphicon glyphicon-shopping-cart"></span> 订单详情</h1></caption>
            <thead>
	            <tr>
	                <th colspan="5"><h3>订单编号：${order.oid }</h3></th>
	            </tr>
            </thead>
            <tbody>
	            <tr>
	                <th><h3>图片</h3></th>
	                <th><h3>商品</h3></th>
	                <th><h3>价格</h3></th>
	                <th><h3>数量</h3></th>
	                <th><h3>小计</h3></th>
	            </tr>
                <c:forEach items="${order.items }" var="item">
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
	                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="container">
        <div class="pull-right">
            <h3>订单金额：<strong style="color:#d9534f;">￥${order.total }元</strong></h3>
        </div>
        <div class="clearfix"></div>
        <div class="pull-right" style="margin-bottom: 15px;">
            <button id="btn-order-confirm" type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-ok-sign"></span> 确认订单</button>
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
	//确认订单
	$("#btn-order-confirm").click(function () {
		$("#form-pay").submit();
	});
});
</script>
</body>
</html>
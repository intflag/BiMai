<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>必买</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/base.css">
    <style type="text/css">
	    .boxshadow {
			box-shadow: 1px 1px 5px 2px #666;
		}
    </style>
</head>
<body>
<!-- 包含头部 -->
<%@include file="/jsp/index_head.jsp" %>
<!--商品详情-->
<div class="container" style="margin-top: 80px; padding-left: 0; padding-right: 0">
    <ol class="breadcrumb" style="background-color: #101010;">
        <li class="col"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li class="active">商品详情</li>
    </ol>
    <div class="row">
        <div class="col-md-5">
            <a href="#" class="thumbnail boxshadow">
                <img src="${pageContext.request.contextPath}/${product.pimage}" alt="">
            </a>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-6">
            <div style="padding-left: 15px;">
                <form id="formCart" class="form-inline" id="formCart" action="${pageContext.request.contextPath }/cart?method=add"
                      method="post">
                    <input type="hidden" value="${product.pid }" name="pid">
                    <h2>${product.pname }<span class="label label-danger">促销</span></h2>
                    <h4>编号：${product.pid }</h4>
                    <h3>商城价：<strong style="color:#d9534f;">￥${product.shop_price }元/份</strong></h3>
                    <h3>市场价：<del>￥${product.market_price }元/份</del></h3>
                    <div class="form-group"><h3>购买数量：</h3></div>
                    <div class="form-group">
                        <div style="padding-top: 10px;">
                        	<button id="min" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span></button>
	                        <input id="text_box" type="text" size="8" value="1" name="count">
	                        <button id="add" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-plus"></span></button>
                        </div>
                    </div>
                    <div class="form-group"><h3>库存：<span id="maxCount">100</span></h3></div>
                    <div style="margin-top: 15px"><button id="btn-addCart" type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-shopping-cart"></span> 加入购物车</button></div>
                </form>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading"><h4>商品介绍</h4></div>
        <div class="panel-body">
            ${product.pdesc }
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
  	//获得文本框对象
	var t = $("#text_box");
	//获得库存
	var max = $("#maxCount").text();
	//初始化数量为1,并失效减
	$("#min").attr('disabled', true);
	//不可大于库存
	$(t).change(function() {
		if (parseInt(t.val()) >= parseInt(max)) {
			t.val(max);
			$('#add').attr('disabled', true);
			$('#min').attr('disabled', false);
		}
		if (parseInt(t.val()) <= 0) {
			t.val(1);
			$('#add').attr('disabled', false);
			$('#min').attr('disabled', true);
		}
		if (isNaN(t.val())) {
			t.val(1);
		}

	});
	//数量增加操作
	$("#add").click(function() {
		t.val(parseInt(t.val()) + 1)
		if (parseInt(t.val()) >= parseInt(max)) {
			$('#add').attr('disabled', true);
		}
		if (parseInt(t.val()) != 1) {
			$('#min').attr('disabled', false);
		}

	});
	//数量减少操作
	$("#min").click(function() {
		t.val(parseInt(t.val()) - 1);
		if (parseInt(t.val()) <= 1) {
			$('#min').attr('disabled', true);
			$('#add').attr('disabled', false);
		}

	});
	//加入购物车事件
	$(function () {
		$("#btn-addCart").click(function () {
			$("#formCart").submit();
		});
	});
});
</script>
</body>
</html>
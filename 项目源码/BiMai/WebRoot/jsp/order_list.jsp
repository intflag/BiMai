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

<!--我的订单-->
<div class="container" style="margin-top: 80px; padding-left: 0; padding-right: 0">
    <ol class="breadcrumb" style="background-color: #101010;">
        <li class="col"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li class="active">我的订单</li>
    </ol>
    <div class="table-responsive">
        <h1 class="text-center"><span class="glyphicon glyphicon-edit"></span> 我的订单</h1>
        <c:forEach items="${OrderPageBean.list }" var="o">
	        <table class="table table-hover">
	            <thead>
	            <tr>
	                <th colspan="5">
	                	<h3>订单编号：${o.oid }&nbsp;&nbsp;订单金额：${o.total }&nbsp;&nbsp;
	                		<c:if test="${o.state == 0 }">
	                			<a href="${pageContext.request.contextPath}/order?method=findOrderById&oid=${o.oid}">付款</a>
	                		</c:if>
	                		<c:if test="${o.state == 1 }">
	                			<a href="#">已发货</a>
	                		</c:if>
	                		<c:if test="${o.state == 2 }">
	                			<a href="#">确认收货</a>
	                		</c:if>
	                		<c:if test="${o.state == 3 }">
	                			<a href="#">交易完成</a>
	                		</c:if>
	                	</h3>
	                </th>
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
	            <c:forEach items="${o.items }" var="oi">
	                <tr>
	                    <td>
	                        <a href="${pageContext.request.contextPath }/product?method=findProductById&id=${oi.product.pid}" class="img-rounded">
	                            <img width="100" class="img-rounded" src="${pageContext.request.contextPath}/${oi.product.pimage}" alt="Responsive image">
	                        </a>
	                    </td>
	                    <td>${oi.product.pname}</td>
	                    <td>￥${oi.product.shop_price}</td>
	                    <td>${oi.count}</td>
	                    <td>￥${oi.subtotal}</td>
	                </tr>
	            </c:forEach>
	            </tbody>
	        </table>
        </c:forEach>
    </div>
    <div class="container">
		<!--分页-->
	    <div id="paging">
	        <nav aria-label="Page navigation" style="text-align: center">
	            <ul class="pagination">
	            	<!-- 判断是否是首页 -->
	            	<c:if test="${OrderPageBean.currPage == 1 }">
		            	<li class="disabled">
		                    <a href="javascript:void(0)" aria-label="Previous">
		                        <span aria-hidden="true">&laquo;</span>
		                    </a>
		                </li>	
	            	</c:if>
	            	<c:if test="${OrderPageBean.currPage != 1 }">
		            	<li>
		                    <a href="${pageContext.request.contextPath }/order?method=findAllByPage&currPage=${OrderPageBean.currPage - 1}" aria-label="Previous">
		                        <span aria-hidden="true">&laquo;</span>
		                    </a>
		                </li>	
	            	</c:if>
	                
	                <!-- 展示所有页码 -->
	                <c:forEach begin="${OrderPageBean.currPage-5>0?OrderPageBean.currPage-5:1 }" end="${OrderPageBean.currPage+4>OrderPageBean.totalPage?OrderPageBean.totalPage:pageBean.currPage+4 }" var="n">
	                	<!-- 判断是否是当前页 -->
	                	<c:if test="${OrderPageBean.currPage == n }">
	                		<li class="active"><a href="javascript:void(0)">${n }</a></li>
	                	</c:if>
	                	<c:if test="${OrderPageBean.currPage != n }">
	                		<li><a href="${pageContext.request.contextPath }/order?method=findAllByPage&currPage=${n}">${n }</a></li>
	                	</c:if>
	                </c:forEach>
	                <!-- 判断是否是最后一页 -->
	                <c:if test="${OrderPageBean.currPage == OrderPageBean.totalPage }">
			            <li class="disabled">
		                    <a href="#" aria-label="Next">
		                        <span aria-hidden="true">&raquo;</span>
		                    </a>
		                </li>
	            	</c:if>
	                <c:if test="${OrderPageBean.currPage != OrderPageBean.totalPage }">
				        <li>
		                    <a href="${pageContext.request.contextPath }/order?method=findAllByPage&currPage=${OrderPageBean.currPage + 1}" aria-label="Next">
		                        <span aria-hidden="true">&raquo;</span>
		                    </a>
		                </li>
	            	</c:if>
	            </ul>
	        </nav>
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
		//location.href = "${pageContext.request.contextPath }/order?method=add";
	});
});
</script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <title>必买</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/base.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js" ></script>
	<script src="${pageContext.request.contextPath}/layer/layer.js" ></script>
</head>
<body>

<!--所有订单-->
<div class="container">
    <div class="table-responsive">
        <h1 class="text-center"><span class="glyphicon glyphicon-edit"></span> 所有订单</h1>
	        <table class="table table-hover">
	            <thead>
	             	<tr>
		                <th><h4>订单编号</h4></th>
		                <th><h4>订单金额</h4></th>
		                <th><h4>收货人姓名</h4></th>
		                <th><h4>收货人电话</h4></th>
		                <th><h4>收货地址</h4></th>
		                <th><h4>订单状态</h4></th>
		                <th><h4>订单详情</h4></th>
	            	</tr>  
	            </thead>
	            <tbody>
	        		<c:forEach items="${orderList }" var="o">
		            	<tr>
		                    <td>${fn:substring(o.oid ,0,10) }...</td>
		                    <td>${o.total }</td>
		                    <td>${o.name }</td>
		                    <td>${o.telephone }</td>
		                    <td>${o.address }</td>
		                    <td>
			                    <c:if test="${o.state == 0 }">
		                			<span>未付款</span>
		                		</c:if>
		                		<c:if test="${o.state == 1 }">
		                			<span>已发货</span>
		                		</c:if>
		                		<c:if test="${o.state == 2 }">
		                			<span>确认收货</span>
		                		</c:if>
		                		<c:if test="${o.state == 3 }">
		                			<span>交易完成</span>
		                		</c:if>
							</td>
		                    <td>
		                    	<button onclick="showDetail('${o.oid}')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 订单详情</button>
							</td>
		                </tr>
	        		</c:forEach>
	            </tbody>
	        </table>
    </div>
  

</div>
</body>
<script type="text/javascript">
function showDetail(oid){
	$.post(
		"${pageContext.request.contextPath}/adminOrder",
		{"method":"getDetailByOid","oid":oid},
		function(data) {
			var s = '<table class="table table-bordered"><tr class="warning"><th>图片</th><th>商品</th><th>价格</th><th>数量</th><th>小计</th></tr>';
			$(data).each(function(){
				s += '<tr class="active">';
				s += '<td width="60" width="40%"><input type="hidden" name="id" value="22"><img src="${pageContext.request.contextPath}/'+this.product.pimage+'" width="70" height="60"></td>';
				s += '<td width="30%"><a target="_blank">'+this.product.pname+'</a></td>';
				s += '<td width="20%">'+this.product.shop_price+'</td>';
				s += '<td width="10%">'+this.count+'</td>';
				s += '<td width="15%"><span class="subtotal">'+this.subtotal+'</span></td></tr>';
			});
			s+='</table>';
			layer.open({
				type: 1,//0:信息框; 1:页面; 2:iframe层;	3:加载层;	4:tip层
		        title:"订单详情",//标题
		        area: ['700px', '400px'],//大小
		        offset: 't',
		        shadeClose: false, //点击弹层外区域 遮罩关闭
		        content: s//内容
			});
		},
		"json"
	);
}
</script>
</html>
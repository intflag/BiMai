<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>编辑商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/base.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js" ></script>
	<script src="${pageContext.request.contextPath}/layer/layer.js" ></script>

  </head>
  
  <body>
	<div class="container">
	    <form class="form-horizontal" id="form-editProduct" name="Form1" action="${pageContext.request.contextPath}/editProduct" method="post" enctype="multipart/form-data">
	        <h2 class="text-center"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span>编辑商品</h2>
	        <div class="col-md-6">
	            <div class="form-group">
	            	<input type="hidden" value="${product.pid }" name="pid">
	                <label for="inputEmail3" class="col-sm-2 control-label">商品名称</label>
	                <div class="col-sm-10">
	                    <input type="text" name="pname" class="form-control" placeholder="请输入商品名称" value="${product.pname }">
	                </div>
	            </div>
	            <div class="form-group">
	                <label for="inputEmail3" class="col-sm-2 control-label">所属分类</label>
	                <div class="col-sm-10">
	                    <select class="form-control" name="cid">
	                    	<c:forEach items="${cList }" var="c">
	                    		<c:if test="${product.category.cid == c.cid }">
		                        	<option value="${c.cid }" selected = "selected">${c.cname }</option>
	                    		</c:if>
	                    		<c:if test="${product.category.cid != c.cid }">
		                        	<option value="${c.cid }">${c.cname }</option>
	                    		</c:if>
	                    	</c:forEach>
	                    </select>
	                </div>
	            </div>
	            <div class="form-group">
	                <label for="inputEmail3" class="col-sm-2 control-label">商品图片</label>
	                <div class="col-sm-10" style="padding-top: 6px;">
	                	<div class="col-sm-6">
		                	<img width="100" src="${pageContext.request.contextPath}/${product.pimage}" alt="...">
	                    </div>
	                	<div class="col-sm-6">
	                		<h4>重新上传：</h4>
		                    <input type="file" name="pimage" id="exampleInputFile">
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-md-6">
	            <div class="form-group">
	                <label for="inputEmail3" class="col-sm-2 control-label">市场价格</label>
	                <div class="col-sm-10">
	                    <input type="text" name="market_price" class="form-control" placeholder="请输入商品市场价格" value="${product.market_price }">
	                </div>
	            </div>
	            <div class="form-group">
	                <label for="inputEmail3" class="col-sm-2 control-label">商城价格</label>
	                <div class="col-sm-10">
	                    <input type="text" name="shop_price" class="form-control" placeholder="请输入商品商城价格" value="${product.shop_price }">
	                </div>
	            </div>
	            <div class="form-group">
	                <label for="inputEmail3" class="col-sm-2 control-label">是否热门</label>
	                <div class="col-sm-10">
	                	<c:if test="${product.is_hot == 1 }">
		                    <label class="radio-inline">
			                       <input type="radio" name="is_hot" value="1" checked="checked"> 是
		                    </label>
		                    <label class="radio-inline">
		                    	<input type="radio" name="is_hot" value="0"> 否
		                    </label>
	                    </c:if>
	                	<c:if test="${product.is_hot != 1 }">
		                    <label class="radio-inline">
			                       <input type="radio" name="is_hot" value="1"> 是
		                    </label>
		                    <label class="radio-inline">
		                    	<input type="radio" name="is_hot" checked="checked" value="0"> 否
		                    </label>
	                    </c:if>
                	</div>
	            </div>
	        </div>
	        <div class="col-md-12">
	            <div class="form-group">
	                <label for="inputEmail3" class="col-sm-1 control-label">商品描述</label>
	                <div class="col-sm-11">
	                    <textarea id = "problem" class="form-control" rows="10" placeholder="请对商品进行描述" name="pdesc">${product.pdesc }</textarea>
	                </div>
	            </div>
	        </div>
	        <div class="col-md-4"></div>
	        <div class="col-md-4">
	            <input type="button" id="btn-editProduct" class="btn btn-danger btn-lg center-block" value="完成编辑" />
	        </div>
	        <div class="col-md-4"></div>
	    </form>
	</div>
  </body>
<script type="text/javascript">

$(function () {
	$("#btn-editProduct").click(function(){
		$("#form-editProduct").submit();
	});
});
</script>
</html>

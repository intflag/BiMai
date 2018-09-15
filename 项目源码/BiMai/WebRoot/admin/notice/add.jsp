<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>发布公告</title>
    
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
	    <form class="form-horizontal" id="form-addNotice" name="Form1" action="${pageContext.request.contextPath}/adminNotice?method=addNotices" method="post">
	        <h2 class="text-center"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span>发布公告</h2>
	        <div class="col-md-12">
	        	<div class="form-group">
	                <label for="inputEmail3" class="col-sm-1 control-label">公告标题</label>
	                <div class="col-sm-11">
	                    <input type="text" name="ntitle" class="form-control" placeholder="请输入公告标题">
	                </div>
	            </div>
	            <div class="form-group">
	                <label for="inputEmail3" class="col-sm-1 control-label">公告内容</label>
	                <div class="col-sm-11">
	                    <textarea id = "problem" class="form-control" rows="10" placeholder="请填写公告内容" name="ndesc"></textarea>
	                </div>
	            </div>
	        </div>
	        <div class="col-md-4"></div>
	        <div class="col-md-4">
	            <input type="button" id="btn-addNotice" class="btn btn-danger btn-lg center-block" value="发布公告" />
	        </div>
	        <div class="col-md-4"></div>
	    </form>
	</div>
  </body>
<script type="text/javascript">

$(function () {
	$("#btn-addNotice").click(function(){
		//alert();
		$("#form-addNotice").submit();
	});
});
</script>
</html>

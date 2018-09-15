<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>title</title>
    
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
  
  <body onload="addCategory()">
<script type="text/javascript">

/* 添加分类 */
function addCategory() {
	layer.prompt({
	  formType:2,
	  title:'请分类名称',
	  maxlength:10
	},function(value,index,elem){
       	layer.close(index);
       	$.post(
			"${pageContext.request.contextPath}/adminCategory",
			{"method":"addCategory","cname":value},
			function(data) {
				if (data != "OK") {
					layer.alert("该分类已经存在，请不要重复添加！",function() {
						window.location.href="${pageContext.request.contextPath}/adminCategory?method=findAll";
					});
				} else {
					layer.alert("添加成功！",function() {
						window.location.href="${pageContext.request.contextPath}/adminCategory?method=findAll";
					});
				}
			},
			"text"
		);
    });
}
</script>
  </body>
</html>

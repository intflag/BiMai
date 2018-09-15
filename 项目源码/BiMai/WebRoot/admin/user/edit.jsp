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
  
  <body onload="editAdminPwd()">
<script type="text/javascript">

/* 修改管理员密码 */
function editAdminPwd() {
	layer.prompt({
	  formType:1,
	  title:'请您输入修改后的密码',
	  maxlength:10
	},function(value,index,elem){
       	layer.close(index);
       	$.post(
			"${pageContext.request.contextPath}/adminUser",
			{"method":"editAdminPwd","password":value},
			function(data) {
				layer.msg('修改成功', {icon: 1},function() {
					window.top.location.href="${pageContext.request.contextPath}/admin/login.jsp";
				});
			},
			"text"
		);
    });
}
</script>
  </body>
</html>

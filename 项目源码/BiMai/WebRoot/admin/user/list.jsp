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

<!--用户管理-->
<div class="container">
    <div class="table-responsive">
        <h1 class="text-center"><span class="glyphicon glyphicon-edit"></span> 所有公告</h1>
	        <table class="table table-hover">
	            <thead>
	             	<tr>
		                <th><h4>用户ID</h4></th>
		                <th><h4>用户名</h4></th>
		                <th><h4>密码</h4></th>
		                <th><h4>邮箱</h4></th>
		                <th><h4>电话</h4></th>
		                <th><h4>操作</h4></th>
	            	</tr>  
	            </thead>
	            <tbody>
	        		<c:forEach items="${uList }" var="u">
		            	<tr>
		                    <td>${u.uid }</td>
		                    <td>${u.username }</td>
		                    <td>${u.password }</td>
		                    <td>${u.email }</td>
		                    <td>${u.telephone }</td>
		                    <td>
		                    	<button onclick="removeUser('${u.uid }')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 删除</button>
		                    </td>
		                </tr>
	        		</c:forEach>
	            </tbody>
	        </table>
    </div>
  

</div>
<script type="text/javascript">

/* 删除用户 */
function removeUser(uid) {
	layer.confirm('是否删除？', {
	  btn: ['是','否'], //按钮
	  offset: 't'
	}, function(){
	  	$.post(
			"${pageContext.request.contextPath}/adminUser",
			{"method":"removeUser","uid":uid},
			function(data) {
				window.location.href="${pageContext.request.contextPath}/adminUser?method=findAllUsers";
			},
			"text"
		);
	});
}
</script>
</body>
</html>
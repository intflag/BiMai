<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!--分类管理-->
<div class="container">
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th><h3>分类ID</h3></th>
                <th><h3>分类名称</h3></th>
                <th><h3>操作</h3></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cList }" var="c">
                <tr>
                    <td>${c.cid }</td>
                    <td>${c.cname }</td>
                    <td>
                    	<button onclick="editCategory('${c.cid }')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 编辑</button>
                    	<button onclick="removeCategory('${c.cid }')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<script type="text/javascript">
/* 修改分类 */
function editCategory(cid) {
	layer.prompt({
	  formType:2,
	  title:'请分类名称',
	  maxlength:10
	},function(value,index,elem){
       	layer.close(index);
       	$.post(
			"${pageContext.request.contextPath}/adminCategory",
			{"method":"editCategory","cid":cid,"cname":value},
			function(data) {
				if (data != "OK") {
					layer.alert("该分类已经存在，修改失败！",function() {
						window.location.href="${pageContext.request.contextPath}/adminCategory?method=findAll";
					});
				} else {
					layer.alert("修改成功！",function() {
						window.location.href="${pageContext.request.contextPath}/adminCategory?method=findAll";
					});
				}
			},
			"text"
		);
    });
}
/* 删除分类 */
function removeCategory(cid) {
	layer.confirm('是否删除？', {
	  btn: ['是','否'], //按钮
	  offset: 't'
	}, function(){
	  	$.post(
			"${pageContext.request.contextPath}/adminCategory",
			{"method":"removeCategory","cid":cid},
			function(data) {
				window.location.href="${pageContext.request.contextPath}/adminCategory?method=findAll";
				/*layer.msg('删除成功', {icon: 1},function() {
					window.location.href="${pageContext.request.contextPath}/adminCategory?method=findAll";
				}); */
			},
			"text"
		);
	});
}
</script>
</body>
</html>
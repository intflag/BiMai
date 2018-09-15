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

<!--所有公告-->
<div class="container">
    <div class="table-responsive">
        <h1 class="text-center"><span class="glyphicon glyphicon-edit"></span> 所有公告</h1>
	        <table class="table table-hover">
	            <thead>
	             	<tr>
		                <th><h4>公告ID</h4></th>
		                <th><h4>公告标题</h4></th>
		                <!-- <th><h4>公告内容</h4></th> -->
		                <th><h4>发布者</h4></th>
		                <th><h4>发布时间</h4></th>
		                <th><h4>操作</h4></th>
	            	</tr>  
	            </thead>
	            <tbody>
	        		<c:forEach items="${noticeList }" var="n">
		            	<tr>
		                    <td>${n.nid }</td>
		                    <td>${n.ntitle }</td>
		                    <%-- <td>${fn:substring(n.ndesc ,0,20) }...</td> --%>
		                    <td>${n.admin.admin_name }</td>
		                    <td>${n.localDate }</td>
		                    <td>
		                    	<button onclick="editNotice('${n.nid }')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 编辑</button>
		                    	<button onclick="removeNotice('${n.nid }','${param.currPage }')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 删除</button>
		                    </td>
		                </tr>
	        		</c:forEach>
	            </tbody>
	        </table>
    </div>
  

</div>
<script type="text/javascript">
/* 修改公告 */
function editNotice(nid) {
	window.location.href="${pageContext.request.contextPath}/adminNotice?method=addEditUI&nid="+nid;
}
/* 删除公告 */
function removeNotice(nid) {
	layer.confirm('是否删除？', {
	  btn: ['是','否'], //按钮
	  offset : "t"
	}, function(){
	  	$.post(
			"${pageContext.request.contextPath}/adminNotice",
			{"method":"removeNotice","nid":nid},
			function(data) {
				window.location.href="${pageContext.request.contextPath}/adminNotice?method=findNoticeAll";
			},
			"text"
		);
	});
}
</script>
</body>
</html>
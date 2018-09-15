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

<!--商品管理-->
<div class="container">
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th><h4>商品序号</h4></th>
                <th><h4>商品图片</h4></th>
                <th><h4>商品名称</h4></th>
                <th><h4>商品价格</h4></th>
                <th><h4>上架时间</h4></th>
                <th><h4>是否热门</h4></th>
                <th><h4>操作</h4></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageBean.list }" var="p" varStatus="index">
                <tr>
                    <td>${index.count }</td>
                    <td>
                        <a href="#" class="img-rounded">
                            <img width="50" class="img-rounded" src="${pageContext.request.contextPath}/${p.pimage }" alt="Responsive image">
                        </a>
                    </td>
                    <td>${p.pname }</td>
                    <td>${p.shop_price }</td>
                    <td>${p.pdate }</td>
                    <td>
                    	<c:if test="${p.is_hot == 1 }">是</c:if>
                    	<c:if test="${p.is_hot == 0 }">否</c:if>
					</td>
                    <td>
                    	<button onclick="editProduct('${p.pid }')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 编辑</button>
                    	<button onclick="removeProduct('${p.pid }','${param.currPage }')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<!--分页-->
<div id="paging">
    <nav aria-label="Page navigation" style="text-align: center">
        <ul class="pagination">
        	<!-- 判断是否是首页 -->
        	<c:if test="${pageBean.currPage == 1 }">
         	<li class="disabled">
                 <a href="javascript:void(0)" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span>
                 </a>
             </li>	
        	</c:if>
        	<c:if test="${pageBean.currPage != 1 }">
         	<li>
                 <a href="${pageContext.request.contextPath }/adminProduct?method=findByPage&currPage=${pageBean.currPage - 1}" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span>
                 </a>
             </li>	
        	</c:if>
            
            <!-- 展示所有页码 -->
            <c:forEach begin="${pageBean.currPage-5>0?pageBean.currPage-5:1 }" end="${pageBean.currPage+4>pageBean.totalPage?pageBean.totalPage:pageBean.currPage+4 }" var="n">
            	<!-- 判断是否是当前页 -->
            	<c:if test="${pageBean.currPage == n }">
            		<li class="active"><a href="javascript:void(0)">${n }</a></li>
            	</c:if>
            	<c:if test="${pageBean.currPage != n }">
            		<li><a href="${pageContext.request.contextPath }/adminProduct?method=findByPage&currPage=${n}">${n }</a></li>
            	</c:if>
            </c:forEach>
            <!-- 判断是否是最后一页 -->
            <c:if test="${pageBean.currPage == pageBean.totalPage }">
          <li class="disabled">
                 <a href="#" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
                 </a>
             </li>
        	</c:if>
            <c:if test="${pageBean.currPage != pageBean.totalPage }">
       <li>
                 <a href="${pageContext.request.contextPath }/adminProduct?method=findByPage&currPage=${pageBean.currPage + 1}" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
                 </a>
             </li>
        	</c:if>
        </ul>
    </nav>
</div>
<script type="text/javascript">
/* 修改商品 */
function editProduct(pid) {
	window.location.href="${pageContext.request.contextPath}/adminProduct?method=addEditUI&pid="+pid;
}
/* 删除商品 */
function removeProduct(pid,currPage) {
	layer.confirm('是否删除？', {
	  btn: ['是','否'], //按钮
	  offset: 't'
	}, function(){
	  	$.post(
			"${pageContext.request.contextPath}/adminProduct",
			{"method":"removeProduct","pid":pid,"currPage":currPage},
			function(data) {
				window.location.href="${pageContext.request.contextPath}/adminProduct?method=findByPage&currPage=1";
			},
			"text"
		);
	});
}
</script>
</body>
</html>
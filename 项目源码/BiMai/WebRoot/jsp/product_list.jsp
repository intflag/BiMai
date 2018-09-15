<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <title>必买</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/base.css">
    <style type="text/css">
	    .boxshadow {
			box-shadow: 2px 2px 10px 2px #666;
		}
    </style>
</head>
<body>
<!-- 包含头部 -->
<%@include file="/jsp/index_head.jsp" %>

<!--商品列表-->
<div class="container" style="margin-top: 80px; padding-left: 0; padding-right: 0">
    <ol id="breadcrumb_a" class="breadcrumb" style="background-color: #101010;">
        <li class="col"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li class="col"><a href="#">商品分类</a></li>
        <li class="active"><span id="categoryName"></span></li>
    </ol>

    <div class="row">
    	<c:forEach items="${pageBean.list }" var="p">
	    	<div class="col-xs-6 col-md-3">
	            <a href="${pageContext.request.contextPath }/product?method=findProductById&id=${p.pid}" class="thumbnail boxshadow">
	                <img src="${pageContext.request.contextPath}/${p.pimage}" alt="...">
	            </a>
	        </div>	
    	</c:forEach>
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
	                    <a href="${pageContext.request.contextPath }/product?method=findByPage&currPage=${pageBean.currPage - 1}&cid=${param.cid}" aria-label="Previous">
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
                		<li><a href="${pageContext.request.contextPath }/product?method=findByPage&currPage=${n}&cid=${param.cid}">${n }</a></li>
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
	                    <a href="${pageContext.request.contextPath }/product?method=findByPage&currPage=${pageBean.currPage + 1}&cid=${param.cid}" aria-label="Next">
	                        <span aria-hidden="true">&raquo;</span>
	                    </a>
	                </li>
            	</c:if>
            </ul>
        </nav>
    </div>

</div>

</body>
</html>
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
    <style type="text/css">
	    .boxshadow {
			box-shadow: 2px 2px 10px 2px #666;
		}
    </style>
</head>
<body>
<!-- 包含头部 -->
<%@include file="/jsp/index_head.jsp" %>
<!--轮播区域-->
<div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active" style="background:#000000">
            <img src="${pageContext.request.contextPath}/images/001.jpg" alt="第一张">
        </div>
        <div class="item" style="background:#000000;">
            <img src="${pageContext.request.contextPath}/images/002.jpg" alt="第二张">
        </div>
        <div class="item" style="background:#000000;">
            <img src="${pageContext.request.contextPath}/images/003.jpg" alt="第三张">
        </div>
    </div>
    <a href="#myCarousel" data-slide="prev" class="carousel-control left">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a href="#myCarousel" data-slide="next" class="carousel-control right">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
<!-- 最新商品 -->
<div class="container">
    <div class="row">
    <div class="col-md-7">
        <h2 class=""><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span>最新商品</h2>
        <div class="row">
        	<c:forEach items="${newProducts }" var="p">
        		<div class="col-xs-6 col-md-4">
	                <a href="${pageContext.request.contextPath }/product?method=findProductById&id=${p.pid}" class="thumbnail boxshadow">
	                    <img src="${pageContext.request.contextPath}/${p.pimage}" alt="...">
	                </a>
	            </div>	
        	</c:forEach>
        </div>
    </div>
    <div class="col-md-5">
        <h2 class=""><span class="glyphicon glyphicon-fire" aria-hidden="true"></span>最新公告</h2>
        <ul id="pcInfo" class="list-group boxshadow">
        	<c:forEach items="${newNotices }" var="n">
	            <%-- <li type="button" class="list-group-item"><span class="badge">${n.admin.admin_name }-${n.localDate }</span>${n.ndesc }</li> --%>
	            <a href="${pageContext.request.contextPath}/notice?method=findNoticeById&nid=${n.nid}" class="list-group-item"><span class="badge">${n.admin.admin_name }-${n.localDate }</span>${n.ntitle }</a>
        	</c:forEach>
        </ul>
    </div>
</div>
</div>

<!--推荐案例-->
<div id="example" class="example">
    <div class="container">
        <h3>吐血推荐</h3>
        <div class="row">
        	<c:forEach items="${hotProducts }" var="p">
	        	<div class="col-sm-6 col-md-4 col-lg-4">
	                <div class="thumbnail boxshadow">
	                    <img src="${pageContext.request.contextPath}/${p.pimage}" alt="${p.pname }">
	                    <div class="caption">
	                        <h3>${fn:substring(p.pname,0,20) }...</h3>
	                        <p>${fn:substring(p.pdesc,0,10) }...</p>
	                        <p><a href="${pageContext.request.contextPath }/product?method=findProductById&id=${p.pid}" class="btn btn-danger" role="button">了解</a></p>
	                    </div>
	                </div>
	            </div>	
        	</c:forEach>
        </div>

    </div>
</div>
<!--底部-->
<footer id="footer">
    <div class="container">
        <p><a href="index.html">首页</a> | <a href="information.html">资讯</a> | <a href="index.html">分类</a> | <a href="about.html">关于</a></p>
        <p>网址备案号：蒙ICP备16006119号 网站基于Bootstrap制作     站长统计</p>
    </div>
</footer>
</body>
</html>
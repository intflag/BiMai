<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
      <li>
          <h4 class="M1"><span></span>公告管理</h4>
          <div class="list-item none">
            <a href='${pageContext.request.contextPath}/admin/notice/add.jsp' target="main">发布公告</a>
            <a href='${pageContext.request.contextPath}/adminNotice?method=findNoticeAll' target="main">查看所有公告</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><span></span>订单管理</h4>
          <div class="list-item none">
            <a href='${pageContext.request.contextPath}/adminOrder?method=findOrderAll' target="main">所有订单</a>
            <a href='${pageContext.request.contextPath}/adminOrder?method=findOrderByState&state=0' target="main">未支付订单</a>
            <a href='${pageContext.request.contextPath}/adminOrder?method=findOrderByState&state=1' target="main">已发货订单</a>
            <a href='${pageContext.request.contextPath}/adminOrder?method=findOrderByState&state=2' target="main">已确认收货订单</a>
            <a href='${pageContext.request.contextPath}/adminOrder?method=findOrderByState&state=3' target="main">已完成订单</a>          
           </div>
        </li>
        <li>
          <h4 class="M3"><span></span>商品管理</h4>
          <div class="list-item none">
            <a href='${pageContext.request.contextPath}/adminProduct?method=findByPage&currPage=1' target="main">商品管理</a>
            <a href='${pageContext.request.contextPath}/adminProduct?method=addUI' target="main">添加商品</a>
          </div>
        </li>
				<li>
          <h4  class="M4"><span></span>分类管理</h4>
          <div class="list-item none">
            <a href='${pageContext.request.contextPath}/adminCategory?method=findAll' target="main">展示所有</a>
            <a href='${pageContext.request.contextPath}/admin/category/add.jsp' target="main">添加分类</a>
          </div>
        </li>
				<li>
          <h4   class="M5"><span></span>用户管理</h4>
          <div class="list-item none">
            <a href='${pageContext.request.contextPath}/adminUser?method=findAllUsers' target="main">查看所有</a>
          </div>
        </li>
				<li>
          <h4   class="M6"><span></span>系统管理</h4>
          <div class="list-item none">
            <a href='${pageContext.request.contextPath}/admin/user/edit.jsp' target="main">修改密码</a>
            <a href="${pageContext.request.contextPath}/adminAccount?method=logout" target="_top">退出</a>
          </div>
        </li>
  </ul>
		</div>
</div>
<div class="bottom"></div>
<script>navList(12);</script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
    <title>必买商城</title>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/base.css">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/myJs/myJs.js"></script>
	<style type="text/css">
		#search_down {
			position:absolute;
			top:42;
			width: 200px;
			background-color: #222;
			z-index: 9;
			cursor: pointer;
			color: #fff;
		}
		
		#search_down .searchDown {
			padding: 6px 12px;
		}
	</style>
	<script type="text/javascript">
		$(function () {
			/*
			 * 跳转到登录页面
			 */
		    $("#btn-login").click(function () {
		    	var path = getRootPath_web()+"/jsp/account.jsp";
		        window.location.href = path;
		    });
			/*
			 * 跳转到购物车页面
			 */
		    $("#btn-car").click(function () {
		    	var path = getRootPath_web()+"/jsp/cart.jsp";
		        window.location.href = path;
		    });
			/*
			 * 跳转到我的订单
			 */
		    $("#btn-myOrder").click(function () {
		    	var path = getRootPath_web()+"/order?method=findAllByPage&currPage=1";
		        window.location.href = path;
		    });
		    /*
		     * 用户退出
		     */
		    $("#btn-logout").click(function () {
		    	var path = getRootPath_web()+"/user?method=logout";
		        window.location.href = path;
		    });
			//异步加载分类
			$.ajax({
				url : "${pageContext.request.contextPath}/category?method=findAll",
				type : "GET",
				data : {},
				dataType : "json",
				success : function (data) {
					var $ul = $("#category_menu");
					$(data).each(function() {
						$ul.append($('<li><a href="${pageContext.request.contextPath}/product?method=findByPage&cid='+this.cid+'&currPage=1">'+this.cname+'</a>'));
					});
				}
			});
			//鼠标进入显示分类菜单，离开隐藏
			$("#menu").mouseover(function () {
				$(this).attr("class","dropdown open");
			});
			$("#menu").mouseout(function () {
				$(this).attr("class","dropdown");
			});
			/* 异步对商品进行模糊查询 */
			$('#searchDown').keyup(function(){
				search_down(this);
			});
			$('#searchDown').focus(function(){
				$('#search_down').show();
			});
		});
		function search_down(obj) {
			var inputVal = $(obj).val();
			var html = "";
			$.ajax({
				url:"${pageContext.request.contextPath}/product?method=searchAll",
				type:"GET",
				data:{"inputVal":inputVal},
				dataType:"json",
				success:function(data) {
					for (var i = 0; i < data.length; i++) {
						html += "<div class='searchDown' onclick='setInput(this)' onmouseout='changeDown2(this)' onmousemove='changeDown(this)'><div class='hidden'>"+data[i].pid+"-</div>"+data[i].pname.substring(0,15)+"...</div>";
					}
					$('#search_down').html(html);
				}
			});
		}
		/* 改变下拉背景色 */
		function changeDown(obj) {
			$(obj).css({"background-color":"#d9534f","color":"#222"});
		}
		function changeDown2(obj) {
			$(obj).css({"background-color":"#222","color":"#fff"});
		}
		/* 为输入框赋值 */
		function setInput(obj) {
			var str = $(obj).text();
			$('#searchDown').val(str.split("-")[1]);
			
			var am=$(obj).children().text();
			$('#subText').val(am.split("-")[0]);
			$('#search_down').hide();
		} 
		function getRootPath_web() {
		    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
		    var curWwwPath = window.document.location.href;
		    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		    var pathName = window.document.location.pathname;
		    var pos = curWwwPath.indexOf(pathName);
		    //获取主机地址，如： http://localhost:8083
		    var localhostPaht = curWwwPath.substring(0, pos);
		    //获取带"/"的项目名，如：/uimcardprj
		    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
		    return (localhostPaht + projectName);
		}
	</script>
</head>
<!--导航条-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand logo"><img src="${pageContext.request.contextPath}/images/logo.png" alt="必买商城"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	        <form class="navbar-form navbar-left" style="padding-left: 50px;" action="${pageContext.request.contextPath}/product?method=findProductById" method="post">
		        <div class="form-group">
		          <input id="subText" type="hidden" class="form-control" placeholder="商品ID" name="id">
		          <input id="searchDown" type="text" class="form-control" autocomplete="off" placeholder="输入商品名称搜索商品">
		          <div id="search_down"></div>
		        </div>
		        <button type="submit" class="btn btn-danger ">搜索</button>
	      	</form>
            <ul id="" class="nav navbar-nav navbar-right">
                <li class="active"><a href="${pageContext.request.contextPath}/index.jsp"><span class="glyphicon glyphicon-home"></span> 首页 </a></li>
                <li id="menu" class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><span class="glyphicon glyphicon-th-large"></span> 商品分类<span class="caret"></span></a>
                    <ul id="category_menu" class="dropdown-menu">
                        <!-- 分类信息 -->
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/jsp/about.jsp"><span class="glyphicon glyphicon-question-sign"></span> 关于我们</a></li>
                <c:if test="${not empty user }">
                	<!-- <li type="button" id="user_home" class="btn btn-danger myBtn-login" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> 个人中心</li> -->
                	<li id="btn-myOrder" class="btn btn-danger myBtn-login" type="button">
                    <span class="glyphicon glyphicon-list"></span> 我的订单</span>
                	</li>
                	<li id="btn-car" class="btn btn-danger myBtn-login" type="button">
                    <span class="glyphicon glyphicon-shopping-cart"></span> 购物车 <span class="badge">${fn:length(cart.items) }</span>
                	</li>
                	<li type="button" id="btn-logout" class="btn btn-danger myBtn-login" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> 退出</li>
                </c:if>
                <c:if test="${empty user }">
                	<li type="button" id="btn-login" class="btn btn-danger myBtn-login" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> 登录</li>
                	<li id="btn-car" class="btn btn-danger myBtn-login" type="button">
                    <span class="glyphicon glyphicon-shopping-cart"></span> 购物车 <span class="badge">${fn:length(cart.items) }</span>
                	</li>
                </c:if>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

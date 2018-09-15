<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>登录(Login)</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_login_style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container">
            <h1>后台管理员登录</h1>
            <form action="${pageContext.request.contextPath}/adminAccount?method=login" method="post">
                <input type="text" name="admin_name" class="admin_name" placeholder="请输入您的用户名！">
                <input type="password" name="admin_pwd" class="admin_password" placeholder="请输入您的用户密码！">
                <button type="submit" class="submit_button">登录</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>
                    <a class="logo" href=""></a>
                </p>
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js" ></script>
        <script src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js" ></script>
        <script src="${pageContext.request.contextPath}/js/supersized-init.js" ></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js" ></script>

    </body>
</html>

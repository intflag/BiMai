<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <title>必买</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/base.css">
</head>
<body>
<!-- 包含头部 -->
<%@include file="/jsp/index_head.jsp" %>

<!--登录注册-->
<div class="container base-margin-top">
    <div class="row">
        <div class="col-md-6">
            <h3>登录</h3>
            <form class="form-horizontal" action="${pageContext.request.contextPath}/user?method=login" method="post">
                <div class="form-group">
                    <!--错误提示-->
                    <div class="col-sm-10">
                        <p class="text-danger">${login_msg }</p>
                    </div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="username" placeholder="用户名">
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password" placeholder="密码">
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-sm-3 col-xs-3">
                        <button type="submit" class="btn btn-primary">登录</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-6">
            <h3>注册</h3>
            <form id="form-register" class="form-horizontal" action="${pageContext.request.contextPath}/user?method=register" method="post">
                <div class="form-group">
                    <!--错误提示-->
                    <div class="col-sm-10">
                        <p id="account_msg" class="text-danger">${register_msg }</p>
                    </div>
                    <div class="col-sm-10">
                        <input type="text" id="text-isUserExist" class="form-control" name="username" placeholder="用户名">
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password" placeholder="密码">
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="password" class="form-control" placeholder="确认密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="telephone" placeholder="联系方式">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="email" id="email" class="form-control" name="email" placeholder="电子邮箱">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-5  col-xs-6">
                        <input type="text" id="" class="form-control" name="code" placeholder="邮箱验证码">
                    </div>
                    <div class="col-sm-5  col-xs-4">
                        <input type="button" id="email_code" class="btn btn-primary" value="获取激活码"></input>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3 col-xs-3">
                        <input id="submit-register" type="button" class="btn btn-primary" value="注册"></input>
                    </div>
                    <div class="col-sm-9  col-xs-9">
                        <input type="reset" class="btn btn-primary" value="重置"></input>
                    </div>
                </div>
            </form>
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

<script type="text/javascript">
$(function() {
	//判断注册字段
	
	/*
     * 异步验证用户名是否存在
     */
    $("#text-isUserExist").blur(function () {
    	var name = $(this).val();
    	if (name.length == 0) {
    		$('#account_msg').text("用户名不能为空");
    	} else {
    		isUserExist(this);
    	}
    });
	
    /*
     * 发送激活邮件
     */
    $("#email_code").click(function () {
    	sendEmailActiveCode($("#email"));
    });
    /*
     * 注册
     */
    $("#submit-register").click(function () {
    	$("#form-register").submit();
    });
});
/* 异步验证用户是否存在 */
function isUserExist(obj) {
	var username = $(obj).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/user?method=isUserExist",
		type : "POST",
		data : {
			"username" : username
		},
		dataType : "text",
		success : function(data) {
			if (data != "yes") {
				$('#account_msg').text("该用户名可以使用");
			} else {
				$('#account_msg').text("用户已存在，请直接登录或更换用户名");
			}
		}
	});
}
/*异步发送激活邮件*/
function sendEmailActiveCode(obj) {
	var addressee = $(obj).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/user?method=sendEmailActiveCode",
		type : "POST",
		data : {"addressee" : addressee},
		dataType : "text",
		success : function (data) {
			if (data == "yes") {
				$("#email_code").attr("disabled", true); 
			}
		}
	});
}
</script>
</body>
</html>
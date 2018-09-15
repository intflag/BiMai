<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>关于我们</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width, initial-scale=1">
   	<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/touch/favicon.ico">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/touch/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/images/touch/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/images/touch/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${pageContext.request.contextPath}/images/touch/apple-touch-icon-144x144.png">
     --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/aboutStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mycss/style.css">
    <!--[if lt IE 9]>
    <script src="aboutJs/html5.aboutJs"></script>
    <script src="aboutJs/respond.aboutJs"></script>
    <![endif]-->

</head>
<body style="height: 100%">
	<!-- 将头部包含进来 -->  
	<jsp:include page="/jsp/index_head.jsp"></jsp:include>
	<div class="main">
        <header>
            <div class="wrap">
                <div class="header-wrapper">
                    <h1>关于 &amp; 必买商城 </h1>
                    <p>必买商城是一个专门面向高端用户的购物网站，在这里您可以买到国内外以及世界名牌。</p>
                    <p class="autor"><a href="#">Dan Rowinski</a></p>
                    <div class="buttons-wrapper">
                        <button id="weixinFollow" class="button">扫码关注</button>
                        <a href="http://www.intflag.com/" target="_blank" class="button button-stripe">进入博客</a>
                    </div>
                </div>
                <!-- /.header-wrapper -->
            </div>
            <!-- /.wrap -->
        </header>
        <div class="spanning">
            <div class="promo clearfix">
                <div class="wrap">
                    <div class="promo-wrapper clearfix">
                        <div class="promo-column">
                            <img src="${pageContext.request.contextPath}/aboutImg/pin.png" height="32" width="24" alt="">
                            <h5>Places</h5>
                            <p>包头市大学生创业园区xxx室</p>
                        </div>
                        <div class="promo-column">
                            <img src="${pageContext.request.contextPath}/aboutImg/settings.png" height="32" width="33" alt="">
                            <h5>Settings</h5>
                            <p>Collaboratively administrate turnkey channels whereas virtual e-tailers an other media. </p>
                        </div>
                        <div class="promo-column">
                            <img src="${pageContext.request.contextPath}/aboutImg/easy.png" height="32" width="34" alt="">
                            <h5>Easy</h5>
                            <p>Interactively procrastinate high-payoff content without backward-compatible data. </p>
                        </div>
                        <div class="promo-column">
                            <img src="${pageContext.request.contextPath}/aboutImg/saturn.png" height="32" width="32" alt="">
                            <h5>Global</h5>
                            <p>Credibly innovate granular internal or "organic" sources whereas high standards in web-readiness. </p>
                        </div>
                    </div>
                </div>
                <!-- /.wrap -->
            </div>

            <!-- /.simple clearfix -->
            <div class="newsletter clearfix">
                <div class="wrap">
                    <div class="newsletter-title">请在下方提出您宝贵的建议或意见</div>
                    <div class="newsletter-form clearfix">
                        <form action="">
                            <input type="text" placeholder="简述您的建议或意见" class="input-text">
                            <input type="button" class="button" value="反馈">
                        </form>
                    </div>
                    <p>我们的发展离不开您的意见，请您畅所欲言！</p>
                </div>
                <!-- /.wrap -->
            </div>
            <!-- /.newsletter clearfix -->
        </div>
        <!-- /.spanning-columns -->
    </div>
    <!-- /.main -->
    <footer>
        <div class="wrap">
            <p>网址备案号：蒙ICP备16006119号 网站基于Bootstrap制作 站长统计</p>
        </div>
        <!-- /.wrap -->
    </footer>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/aboutJs/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/aboutJs/library.js"></script>
    <script src="${pageContext.request.contextPath}/aboutJs/script.js"></script>
    <script src="${pageContext.request.contextPath}/aboutJs/retina.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script type="text/javascript">
    	$("#weixinFollow").click(function() {
    		layer.open({
                type: 1,//0:信息框; 1:页面; 2:iframe层;	3:加载层;	4:tip层
                skin: 'layui-layer-lan',
                closeBtn: 0,
                title:"微信扫一扫",//标题
                //area: ['500px', '120px'],//大小
                shadeClose: true, //点击弹层外区域 遮罩关闭
                content: '<div><img style="margin-left: 0;" src="${pageContext.request.contextPath}/images/qr_weixin.png" alt="扫码关注"><div>',//内容
            });
    	});
    </script>
</body>
</html>

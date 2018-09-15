<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>必买商城后台</title>
</head>
<FRAMESET border=0 frameSpacing=0 rows="120, *" frameBorder=0>
<FRAME name=header src="top.jsp" frameBorder=0 noResize scrolling=no>
<FRAMESET cols="300, *">
<FRAME name=menu src="left.jsp" frameBorder=0 noResize>
<FRAME name=main src="main.jsp" frameBorder=0 noResize scrolling=yes>
</FRAMESET>
</FRAMESET>
</html>
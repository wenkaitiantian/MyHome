<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>房屋个人主页</title>
	<link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
	<link rel="stylesheet" href="css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/Font-Awesome-3.2.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/personalpage.css">
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="js/personalpage.js"></script>
</head>
<body>
	<div class="header">
		<div>
			<div class="logo">
				<a href="<%=path%>/post_query.action?tab=<%="1"%>"><img src="img/logo.jpg" height="100%" width="100%"/></a>
			</div>
			<div>
				<ul>
					<li><a><b>个人中心</b></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="left-menu">
			<div>个人中心</div>
			<div>
				<ul>
					<li>我的发布</li>
					<li>我的收藏</li>
					<li>我的账户</li>
				</ul>
			</div>
			<div>
			</div>
		</div>
		<div class="right-menu">
			<div>
				我的发布
			</div>
			<iframe src="<%=path%>/user_getPersonal.action" frameborder="0"></iframe>
		</div>
	</div>
	</div>
		<div class="footer">
		Copyright © 2016, personalpage.com
	</div>
</body>
<script>
	$(function(){
		if(${sessionScope.user.username eq null}){
			window.location.href="login.jsp";
		}
	})
</script>
</html>
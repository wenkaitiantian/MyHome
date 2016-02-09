<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>房屋后台</title>
	<link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
	<link rel="stylesheet" href="css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/Font-Awesome-3.2.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/admin.css">
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
</head>
<body>
	<div class="left-menu">
		<div>Admin System</div>
		<div class="tab">
			<div>信息审核</div>
			<div>求助审核</div>
			<div>用户管理</div>
			<div>管理员管理</div>
		</div>
	</div>
	<div class="right-menu">
		<div>
			<div class="count">
				<div>${sessionScope.admin.name}</div>
				<div><a href="<%=path%>/admin_exit.action">退出</a></div>
			</div>
		</div>
		<div>
			<iframe src="welcome.jsp" frameborder="0"></iframe>
		</div>
	</div>
	<div class="footer">
		Copyright © 2016, admin.com
	</div>
</body>
<script>
	$(function(){
		if(${sessionScope.admin.name eq null}) {
			window.location.href = "adminlogin.jsp";
		}

		$(".tab div").click(function(){
			var content = $(this).html();
			if(content == "信息审核"){
				$("iframe").prop("src","admin_getAdminPost.action");
			}else if(content == "用户管理"){
				$("iframe").prop("src","admin_getAdminUser.action");
			}else if(content == "求助审核"){
				$("iframe").prop("src","admin_getAdminHelp.action");
			}else if(content == "管理员管理"){
				$("iframe").prop("src","admin_getAdmin.action");
			}
		})
	})
</script>
</html>
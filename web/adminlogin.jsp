<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>房屋管理员登录</title>
	<link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
	<link rel="stylesheet" href="css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/Font-Awesome-3.2.1/css/font-awesome.min.css">
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<style>
		body{
			margin: 0;
			background: url("img/adminlogin.jpg");
			background-size: 100% 100%;
			background-attachment: fixed;
		}
		.login{
			width: 300px;
			height: 300px;
			position: absolute;
			top: 50%;
			left: 50%;
			margin-left: -150px;
			margin-top: -150px;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="back"></div>
		<div class="login">
			<table class="table">
				<form action="<%=path%>/admin_login.action" method="post" id="admin">
					<caption><center><h5>房屋管理员登录</h5></center></caption>
					<tr>
						<td>用户名</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>密码</td>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<td colspan="2">
							<center>
								<input type="button" id="sub" class="btn btn-success" value="立即登录">
							</center>
						</td>
					</tr>
				</form>
			</table>
		</div>
	</div>
</body>
<script>
	$(function(){
		$("#sub").click(function(){
			var a=$("input[name='name']").val();
			var b=$("input[name='password']").val();
			$.post("<%=path%>/admin_checkLogin.action",{name:a,password:b},function(data,textStatus){
				if(data=="true"){
					$("#admin").submit();
				}else{
					alert("错误！");
					return;
				}
			});
		});
	})
</script>
</html>
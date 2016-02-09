<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<title>用户管理</title>
	<style>
		body{
			margin:0 ;
			font-family: "Microsoft YaHei";
		}
		a{
			color: #000;
		}
		a:hover{
			color: #000;
			text-decoration: none;
		}
		.content{
			width: 90%;
			margin:10px auto;
		}
		.page{
			width: 200px;
			height: 40px;
			margin:0 auto;
		}
		.page>div{
			height: 40px;
			line-height: 40px;
			text-align: center;
			font-size: 14px;
			float: left;
			padding-left: 10px;
		}
		.del:hover{
			color: #39ac6a;
			text-decoration: underline;
			cursor: pointer;
		}
	</style>
</head>
<body>
<div class="content">
	<table class="table">
		<caption><h4>
			<b style="display: inline-block;">用户管理</b>
			<center>
				<b style="display: inline-block;">
					<form action="<%=path%>/admin_getSelectUser.action" method="post">
						<input type="text" value="<s:property value="#request.message"/>" name="message"/>
						<input style="height: 30px" type="submit" value="搜索"/>
					</form>
				</b>
			</center>
		</h4></caption>
		<th>
			<tr>
				<td>用户名</td>
				<td>密码</td>
				<td>操作</td>
			</tr>
		</th>

		<s:iterator value="#request.users" id="user">
			<tr>
				<td><s:property value="#user.username"/></td>
				<td><s:property value="#user.password"/></td>
				<td>
					<a class="del" value="<s:property value="#user.id"/>">删除</a>
				</td>
			</tr>
		</s:iterator>
	</table>
</div>
<div class="page">
	<div><a href=""></a></div>
	<div><a href=""></a></div>
	<div><a href=""></a></div>
</div>
</body>
<script>
	$(function(){
		$(".del").click(function(){
			var a=$(this).attr("value");
			$(this).parents("tr").hide("normal");
			$.post("<%=path%>/admin_deleteUser.action",{delId:a},function(data,textStatus){
			})
		});
	})
</script>
</html>
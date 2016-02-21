<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>我的账户</title>
	<link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="js/ajaxfileupload.js"></script>
	<style>
		body{
			margin:0;
		}
		a{
			color: #000;
		}
		a:hover{
			text-decoration: none;
		}
		.selection{
			width:100%;
			height: 36px;
			border-bottom: 1px solid #ccc; 
		}
		.tab{
			width: 100px;
			height: 35px;
			line-height: 35px;
			margin-left: 5px;
			text-align: center;
			font-family: "Microsoft YaHei";
			font-size: 12px;
			border: 1px solid #ccc;
			border-bottom: none;
			border-top-left-radius: 4px;
			border-top-right-radius: 4px;
			float: left;
			cursor: pointer; 
		}
		.highlight{
			background-color: rgb(3,169,244);
			color: #fff;
		}
		.selection+div{
			width: 95%;
			height: 700px;
			margin:0 auto;
			border-bottom: 1px solid #666;
		}
		.selection+div>div:not(:first-child){
			display: none;
		}
		table{
			margin-top: 20px;
		}
		table tr td:first-child{
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="selection">
		<div class="tab highlight">修改个人信息</div>
	</div>
	<div>
		<div class="modify">
			<table class="table table-hover">
				<form id="account" action="<%=path%>/user_change.action" method="post" enctype="multipart/form-data">
					<caption><b>修改个人信息</b></caption>
					<tr>
						<td>用户名</td>
						<td>
							<input disabled="disabled" type="text" value="<s:property value="#session.user.username"/>" name="username"/>
						</td>
					</tr>
					<tr>
						<td>重置密码</td>
						<td>
							<input type="password" value="<s:property value="#session.user.password"/>" name="password" required/>
						</td>
					</tr>
					<tr>
						<td>确认新密码</td>
						<td>
							<input type="password" value="<s:property value="#session.user.password"/>" name="reusepassword" required/>
						</td>
					</tr>
					<tr>
						<td>手机号</td>
						<td>
							<input type="text" name="tel" value="<s:property value="#session.user.tel"/>">
						</td>
					</tr>
					<tr>
						<td>电子邮箱</td>
						<td>
							<input type="text" name="email" disabled="true" value="<s:property value="#session.user.email"/>">
						</td>
					</tr>
					<tr>
						<td id="cc"><img id="imgHead" src="<s:property value="#session.user.icon"/>" style="width:60px;height:60px;display:inline"></td>
						<td>
							<input type="file" id="icon" name="icon" onchange="changes();">
						</td>
					</tr>
					<tr>
						<td>真实姓名</td>
						<td>
							<input type="text" name="realname" value="<s:property value="#session.user.realname"/>">
						</td>
					</tr>
					<tr>
						<td>地区</td>
						<td>
							<input type="text" name="area" value="<s:property value="#session.user.area"/>">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<center>
								<input type="submit" id="sub" class="btn btn-success" value="完成" style="margin-left:-20%;">
							</center>
						</td>
					</tr>	
				</form>
			</table>
		</div>
	</div>
</body>
<script>
	function changes(){
		$.ajaxFileUpload(
				{
					url:"user_changeIcon.action",
					secureuri:false,
					fileElementId:"icon",
					dataType:"text",
					success: function(data){
						document.getElementById("imgHead").src=data;
					},error: function(){
					alert("头像上传失败！");
				}
				}
		)
	}
	$(function(){
	//	document.getElementById("imgHead").src="img/m1.jpg"
	//	alert(document.getElementById("imgHead").src);
		$("#sub").click(function(){
			var a=$("input[name='password']").val();
			var b=$("input[name='reusepassword']").val();
			if(a!=b){
				alert("两次密码输入不一致！");
				return false;
			}
		});

	})
</script>
</html>
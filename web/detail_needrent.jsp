<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>房屋详情页面</title>
	<link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
	<link rel="stylesheet" href="css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/Font-Awesome-3.2.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/detail.css">
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
	<div class="header">
		<div>
			<div class="city"></div>
			<div>
				<div class="login"><a id="log" href="login.jsp">登录</a></div>
				<div class="regist"><a id="reg" href="register.jsp">注册</a></div>
			</div>
		</div>
	</div>
	<div class="container">
		<div>
			<div class="logo">
				<a href="<%=path%>/post_getIndexQuery.action?tab=<%="1"%>"><img src="img/logo.jpg" hight="100%" width="100%"/></a>
			</div>
			<div class="inform">
				<div><a href="personalpage.jsp"><i class="icon-edit icon-2x"></i>发布信息</a></div>
			</div>
			<div>
				<img src="img/story.png" width="100%" hight="120%"/>
			</div>
		</div>
		<div class="content">
			<div class="left-content">
				<div>
					<div class="title">
						<s:property value="#request.detail.title"/>
					</div>
					<div>
					<div>
						<div class="time"><i class="icon-time"></i> <s:property value="#request.detail.posttime"/></div>
					</div>
					</div>
					<div>
						<div>
							<div>租金要求:</div>
							<div>
								<s:property value="#request.detail.money"/>
							</div>
						</div>
						<div>
							<div>求租地段：</div>
							<div>
								<s:property value="#request.detail.district"/>
							</div>
						</div>
						<div>
							<div>入住时间：</div>
							<div>
								<s:property value="#request.detail.latetime"/>
							</div>
						</div>

					</div>
				</div>

				<div>
					<div class="detail">更多介绍</div>
					<div style="margin-left: 33px;">
						${requestScope.detail.message}
						<%--<s:property value="#request.detail.message"/>--%>
					</div>
				</div>
			</div>
			<div class="right-content">
				<div>
					<div>
						<s:if test="#request.path!=null">
							<img width="100%" height="100%" src="<s:property value="#request.path"/>"/>
						</s:if>
						<s:else>
							<img width="100%" height="100%" src="img/default_icon.jpg">
						</s:else>
					</div>
					<div>
						${requestScope.detail.linkname}
					</div>
				</div>
				<div>
					<div>
						<font style="font-weight: bold"> 联系电话：</font>
						<a class="email">${requestScope.detail.tel}</a>
						<br/>
					</div>
					<div>
					</div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		Copyright © 2016, detail.com
	</div>
	<div id="back">
		<div>
			<a href="<%=path%>/post_query.action?tab=<%="1"%>">
				<img src="img/logo.jpg" width="100%" height="100%"/>
			</a>
		</div>
		<div></div>
		<div class="phone">
			<i class="icon-phone-sign icon-large"></i> 客服电话
		</div>
		<div class="backTop">
			<i class="icon-arrow-up icon-large"></i> 回到顶部
		</div>
	</div>
</body>
<script>
		$(function() {
			var province = '';
			$.getScript("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js", function () {
				province = remote_ip_info["province"];
				$(".city").html(province);
			});

			<s:if test="#session.user!=null">
			$("#log").text("<s:property value="#session.user.username"/>");
			$("#reg").text("注销");
			</s:if>

			$("#reg").click(function(){
				if($("#reg").text()=="注销"){
					$("#reg").attr("href","<%=path%>/user_logout.action");
				}
			});

			$("#log").click(function(){
				if($("#log").text()!="登录"){
					$("#log").attr("href","personalpage.jsp");
				}
			})
		})
</script>
</html>
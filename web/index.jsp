<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html>
<head>
	<meta charset="utf-8">
	<title>房屋出租首页</title>
	<link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
	<link rel="stylesheet" href="css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/Font-Awesome-3.2.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/index.css">
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
<div class="header">
	<div></div>
	<a href="<%=path%>/post_getIndexQuery.action?tab=<%="1"%>">
		<div class="logo">
			<img src="<%=path%>/img/logo.jpg" width="100%" height="100%"/>
		</div>
	</a>
	<div class="city"></div>
	<div class="service">
		<ul>
			<li><a href="<%=path%>/post_query.action?tab=<%="1"%>">租房</a></li>
			<li><a href="<%=path%>/post_query.action?tab=<%="2"%>">买房</a></li>
			<li><a href="<%=path%>/post_query.action?tab=<%="3"%>">求租</a></li>
			<li><a href="personalpage.jsp">个人中心</a></li>
		</ul>
	</div>
	<form action="<%=path%>/post_getCastQuery.action?tab=<%="1"%>" method="post" id="cast">
	<div class="search">
		<span><input type="text" name="cast" placeholder="搜索"></span>
		<div>
			<div style="cursor: pointer">
				<a id="sub_cast"><i class="icon-search icon-large"></i></a>
			</div>
		</div>
	</div>
	</form>
</div>
<div class="container">
	<div class="carousel">
		<div id="point">
			<div class="on"></div>
			<div></div>
			<div></div>
		</div>
		<div id="carousel-image">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<div class="advertisement">
		<div><img src="img/g1.jpg" height="100%" width="100%" alt=""></div>
		<div><img src="img/g1.jpg" height="100%" width="100%" alt=""></div>
	</div>
	<div class="houseInf">
		<s:iterator value="#request.indexBean.allList" id="post" status="st">
				<div>
					<a href="<%=path%>/post_detail.action?detail=<s:property value="#post.id"/>">
						<div class="image">
							<img src="<s:property value="#request.indexBean.path[#st.index]"/>" width="100%" height="100%"/>
						</div>
						<div class="title"><s:property value="#post.title"/></div>
						<div class="detail">地区：<s:property value="#post.plotname"/></div>
						<div class="time"><s:property value="#post.posttime"/></div>
						<div class="price">价格：<s:property value="#post.money"/></div>
					</a>
				</div>
		</s:iterator>
	</div>
	<div class="more">
		<span><a href="<%=path%>/post_query.action?tab=<%="1"%>">查看更多</a></span>
	</div>
</div>
<div class="foot">
	<div>
		<div>友情链接</div>
		<div></div>
		<div></div>
	</div>
	<div>
		<ul>
			<li><a>58同城</a></li>
			<li><a>链家网</a></li>
			<li><a>赶集网</a></li>
			<li><a>瓜子网</a></li>
			<li><a>优信网</a></li>
			<li><a>易信网</a></li>
			<li><a>百度</a></li>
		</ul>
	</div>
</div>
<div class="footer">
	Copyright © 2016, index.com
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
	$(function(){
		var province = '';
		$.getScript("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js",function(){
			province = remote_ip_info["province"];
			$(".city").html(province);
		});

		$("#sub_cast").click(function(){
			$("#cast").submit();
		});
	})
</script>
<script src="js/index.js"></script>
</html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>我的收藏</title>
	<link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<style>
		body{
			margin: 0;
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
		.collect>div,.collected>div,.recommend>div{
			margin-top: 20px;
		}
		.collect:first-child,.collected:first-child,.recommend:first-child{
			height: 230px;
		}
		.collect>div:last-child,.collected>div:last-child,.recommend>div:last-child{
			width: 200px;
			height: 30px;
			line-height: 30px;
			font-family: "Microsoft YaHei";
			font-size: 14px;
			margin: 0 auto;
		}
		.collect>div:last-child>div,.collected>div:last-child>div,.recommend>div:last-child>div{
			width:60px;
			text-align: center;
			float: left;
		}
		table tr td{
			text-align: center;
		}
		.titl:hover{
			color: #39ac6a;
			text-decoration: underline;
			cursor: pointer;
		}
		.cancel:hover{
			color: #39ac6a;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div class="selection">
		<div class="tab highlight">收藏的信息</div>
		<div class="tab">推荐信息</div>
	</div>
	<div>
		<div class="collect">
			<div>
				<table class="table table-hover">
					<form action="" method="post">
						<caption><b>收藏的信息</b></caption>
						<thead>
							<tr>
								<td>信息标题</td>
								<td>发布时间</td>
								<td>操作</td>
							</tr>
						</thead>

						<s:iterator value="#request.posts" id="post">
						<tr>
							<td>
								<a target="_parent" class="titl" href="<%=path%>/post_detail.action?detail=<s:property value="#post.id"/>">
									<s:property value="#post.title"/>
								</a>
							</td>
							<td><s:property value="#post.posttime"/></td>
							<td>
								<a value="<s:property value="#post.id"/>" class="cancel">取消收藏</a>
							</td>
						</tr>
						</s:iterator>

					</form>
				</table>
			</div>
			<div>
				<div><a></a></div>
				<div></div>
				<div><a></a></div>
			</div>
		</div>

		<div class="recommend">
			<div>
				<table class="table table-hover">
					<form action="" method="post">
						<caption><b style="color:#000;">暂无推荐信息</b></caption>
					</form>
				</table>
			</div>
			<div>
				<div><a href=""></a></div>
				<div></div>
				<div><a href=""></a></div>
			</div>
		</div>
	</div>
</body>
<script>
	$(function(){
		function change(attr){
			attr.nextAll().hide();
			attr.prevAll().hide();
			attr.show();
		}
		function tab(attr,name){
			attr.nextAll().removeClass(name);
			attr.prevAll().removeClass(name);
			attr.addClass(name);
		}
		$(".cancel").click(function(){
			var a=$(this).attr("value");
			$(this).parents("tr").hide("normal");
			$.post("<%=path%>/collect_cancel.action",{hid:a},function(data,textStatus){
			});
		});
		$(".tab").click(function(){
			if($(this).html() == "收藏的信息"){
				change($(".collect"));
				tab($(this),"highlight");
			}else if($(this).html() == "推荐信息"){
				change($(".recommend"));
				tab($(this),"highlight");
			}
		})
	})
</script>
</html>
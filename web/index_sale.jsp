<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>房屋出租明细</title>
    <link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome-4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/Font-Awesome-3.2.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/index2.css">
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/index2.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <style>
        .highlight {
            color: #fff;
            background-color: rgb(38, 107, 42);
        }

        .hlight {
            background-color: #BAC;
        }
    </style>
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
    <form action="<%=path%>/post_getCastQuery.action?tab=<%="1"%>" method="post" id="cast">
        <div class="top">
            <div class="logo"><a href="<%=path%>/post_getIndexQuery.action?tab=<%="2"%>"><img src="img/logo.jpg" width="100%" height="100%"></a></div>
            <div></div>
            <div>
                <div class="search">
                    <span>
                        <input type="text" placeholder="搜索" name="cast"/>
                    </span>
                    <div class="poi" id="sub_cast">
                        <div>
                            <a><i class="icon-search icon-large"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="inform">
                <div>
                    <div><a href="personalpage.jsp"><i class="icon-edit icon-2x"></i>发布信息</a></div>
                </div>
            </div>
            <div><img src="img/tit.png" width="100%" height="100%"/></div>
        </div>
    </form>
    <div class="select">
        <div class="selecttab">
            <div style="font-weight: bold;font-size: 17px">&nbsp;筛选</div>
        </div>
        <form action="<%=path%>/post_getSelectQuery.action" method="post" id="find">
            <input type="hidden" name="price" value="">
            <input type="hidden" name="area" value="">
            <input type="hidden" name="house" value="">
            <div class="selection">
                <dl>
                    <dd>
                        <span style="font-weight: bold">
                            区域&nbsp;
                        </span>
                        <span>
                            <input type="text" name="loc" placeholder="&nbsp;不限"
                                   style="margin-top: 2px ;height:25px;width: 100px"/>
                        </span>
                        <button id="sub">确认搜索</button>
                    </dd>
                </dl>
                <dl>
                    <dd>
                        <span style="font-weight: bold">
                            总价&nbsp;
                        </span>
                        <span class="price-sel" value="0,9999">
                            不限&nbsp;
                        </span>
                        <span class="price-sel" value="0,30">
                            30万以下&nbsp;
                        </span>
                        <span class="price-sel" value="30,50">
                            30-50万&nbsp;
                        </span>
                        <span class="price-sel" value="50,80">
                            50-80万&nbsp;
                        </span>
                        <span class="price-sel" value="80,100">
                            80-100万&nbsp;
                        </span>
                        <span class="price-sel" value="100,150">
                            100-150万&nbsp;
                        </span>
                        <a class="price-sel" value="150,200">
                            150-200万&nbsp;
                        </a>
                        <span class="price-sel" value="200,300">
                            200-300万&nbsp;
                        </span>
                        <span class="price-sel" value="300,400">
                            300-400万&nbsp;
                        </span>
                        <span class="price-sel" value="400,9999">
                            400万以上
                        </span>
                    </dd>
                </dl>
                <dl>
                    <dd>
                        <span style="font-weight: bold">
                            面积&nbsp;
                        </span>
                        <span class="area-sel" value="0,9999">
                            不限&nbsp;
                        </span>
                        <span class="area-sel" value="0,50">
                            50㎡以下&nbsp;
                        </span>
                        <span class="area-sel" value="50,70">
                            50-70㎡&nbsp;
                        </span>
                        <span class="area-sel" value="70,90">
                            70-90㎡&nbsp;
                        </span>
                        <span class="area-sel" value="60,110">
                            90-110㎡&nbsp;
                        </span>
                        <span class="area-sel" value="110,130">
                            110-130㎡&nbsp;
                        </span>
                        <a class="area-sel" value="130,150">
                            130-150㎡&nbsp;
                        </a>
                        <span class="area-sel" value="150,200">
                            150-200㎡&nbsp;
                        </span>
                        <span class="area-sel" value="200,300">
                            200-300㎡&nbsp;
                        </span>
                        <span class="area-sel" value="300,500">
                            300-500㎡&nbsp;
                        </span>
                        <span class="area-sel" value="500,9999">
                            500㎡以上
                        </span>
                    </dd>
                </dl>
                <dl>
                    <dd>
                        <span style="font-weight: bold">
                                厅室&nbsp;
                        </span>
                        <span class="house-sel" value="0,999">
                            不限&nbsp;
                        </span>
                        <span class="house-sel" value="1,1">
                            一室&nbsp;
                        </span>
                        <span class="house-sel" value="2,2">
                            二室&nbsp;
                        </span>
                        <span class="house-sel" value="3,3">
                            三室&nbsp;
                        </span>
                        <span class="house-sel" value="4,4">
                            四室&nbsp;
                        </span>
                        <span class="house-sel" value="5,999">
                            四室以上
                        </span>
                    </dd>
                </dl>
            </div>
        </form>
    </div>
    <div class="tab">
        <div>
            <a href="<%=path%>/post_query.action?tab=<%="1"%>"><div class="tabselect">房屋出租</div></a>
            <a href="<%=path%>/post_query.action?tab=<%="2"%>"><div class="tabselect highlight">房屋出售</div></a>
            <a href="<%=path%>/post_query.action?tab=<%="3"%>"><div class="tabselect">房屋求租</div></a>
        </div>
        <div>

        </div>
        <div>
            <div class="rentblock">

                <s:iterator value="#request.pageBean1.list" id="post">
                    <div class="rent">
                        <div class="picture">
                            <a href="<%=path%>/post_detail.action?detail=<s:property value="#post.id"/>">
                            <img src="img/m2.jpg" height="100%" width="100%"/>
                            </a>
                        </div>
                        <div>
                            <a style="text-decoration: none" href="<%=path%>/post_detail.action?detail=<s:property value="#post.id"/>">
                            <div><s:property value="#post.title"/></div>
                            </a>
                            <div>小区名称：<s:property value="#post.plotname"/></div>
                            <div>房屋户型：<s:property value="#post.housetype"/></div>
                            <div>联系人：<s:property value="#post.linkname"/></div>
                            <div>发布时间：<s:property value="#post.posttime"/></div>
                        </div>
                        <div class="price">价格：<s:property value="#post.money"/></div>
                    </div>
                </s:iterator>

                <div>
                    <s:if test="#request.pageBean1.currentPage == 1">
                        <div style="text-decoration: none;">首页</div>
                        <div style="text-decoration: none;">上一页</div>
                    </s:if>
                    <s:else>
                        <div>
                            <a href="<%=path%>/post_query.action?tab=<%="1"%>">首页</a>
                        </div>
                        <div style="text-decoration: underline;">
                            <a href="<%=path%>/post_query.action?tab=<%="1"%>&page=<s:property value="#request.pageBean1.currentPage - 1"/>">
                                上一页
                            </a>
                        </div>
                    </s:else>

                    <div style="text-decoration: none">
                        <s:property value="#request.pageBean1.currentPage"/>
                    </div>

                    <s:if test="#request.pageBean1.currentPage != #request.pageBean1.totalPage">
                        <div>
                            <a href="<%=path%>/post_query.action?tab=<%="1"%>&page=<s:property value="#request.pageBean1.currentPage + 1"/>">
                                下一页
                            </a>
                        </div>
                        <div>
                            <a href="<%=path%>/post_query.action?tab=<%="1"%>&page=<s:property value="#request.pageBean1.totalPage"/>">
                                尾页
                            </a>
                        </div>
                    </s:if>
                    <s:else>
                        <div style="text-decoration: none;">下一页</div>
                        <div style="text-decoration: none;">尾页</div>
                    </s:else>
                    <div style="text-decoration: none;">
                        (共<s:property value="#request.pageBean1.totalPage"/>页)
                    </div>
                </div>
            </div>


            <div class="saleblock" style="display:none;">

                <s:iterator value="#request.pageBean2.list" id="post">
                    <div class="sale">
                        <div class="picture">
                            <a href="<%=path%>/post_detail.action?detail=<s:property value="#post.id"/>">
                            <img src="img/m3.jpg" height="100%" width="100%"/>
                            </a>
                        </div>
                        <div>
                            <a style="text-decoration: none" href="<%=path%>/post_detail.action?detail=<s:property value="#post.id"/>">
                            <div style="font-family:微软雅黑;font-weight: bold;"><s:property value="#post.title"/></div>
                            </a>
                            <div>小区名称：<s:property value="#post.plotname"/></div>
                            <div>房屋户型：<s:property value="#post.housetype"/></div>
                            <div>联系人：<s:property value="#post.linkname"/></div>
                            <div>发布时间：<s:property value="#post.posttime"/></div>
                        </div>
                        <div class="price">价格：<s:property value="#post.money"/></div>
                    </div>
                </s:iterator>

                <div>
                    <s:if test="#request.pageBean2.currentPage == 1">
                        <div style="text-decoration: none;">首页</div>
                        <div style="text-decoration: none;">上一页</div>
                    </s:if>
                    <s:else>
                        <div>
                            <a href="<%=path%>/post_query.action?tab=<%="2"%>">首页</a>
                        </div>
                        <div style="text-decoration: underline;">
                            <a href="<%=path%>/post_query.action?tab=<%="2"%>&page=<s:property value="#request.pageBean2.currentPage - 1"/>">
                                上一页
                            </a>
                        </div>
                    </s:else>

                    <div style="text-decoration: none">
                        <s:property value="#request.pageBean2.currentPage"/>
                    </div>

                    <s:if test="#request.pageBean2.currentPage != #request.pageBean2.totalPage">
                        <div>
                            <a href="<%=path%>/post_query.action?tab=<%="2"%>&page=<s:property value="#request.pageBean2.currentPage + 1"/>">
                                下一页
                            </a>
                        </div>
                        <div>
                            <a href="<%=path%>/post_query.action?tab=<%="2"%>&page=<s:property value="#request.pageBean2.totalPage"/>">
                                尾页
                            </a>
                        </div>
                    </s:if>
                    <s:else>
                        <div style="text-decoration: none;">下一页</div>
                        <div style="text-decoration: none;">尾页</div>
                    </s:else>
                    <div style="text-decoration: none;">
                        (共<s:property value="#request.pageBean2.totalPage"/>页)
                    </div>
                </div>

            </div>


            <div class="rentneedblock" style="display:none;">

                <s:iterator value="#request.pageBean3.list" id="help">
                <div class="rentneed">
                    <div class="picture">
                        <a href="<%=path%>/help_detail.action?detail=<s:property value="#help.id"/>">
                        <img src="img/m4.jpg" height="100%" width="100%">
                        </a>
                    </div>
                    <div>
                        <a style="text-decoration: none" href="<%=path%>/post_detail.action?detail=<s:property value="#help.id"/>">
                        <div><s:property value="#help.title"/></div>
                        </a>
                        <div>求租地段：<s:property value="#help.district"/></div>
                        <div>入住时间：<s:property value="#help.lasttime"/></div>
                        <div>联系人：<s:property value="#help.linkname"/></div>
                        <div>发布时间：<s:property value="#help.posttime"/></div>
                    </div>
                    <div class="price">租金：<s:property value="#help.money"/></div>
                </div>
                </s:iterator>

                <div>
                    <s:if test="#request.pageBean3.currentPage == 1">
                        <div style="text-decoration: none;">首页</div>
                        <div style="text-decoration: none;">上一页</div>
                    </s:if>
                    <s:else>
                        <div>
                            <a href="<%=path%>/post_query.action?tab=<%="3"%>">首页</a>
                        </div>
                        <div style="text-decoration: underline;">
                            <a href="<%=path%>/post_query.action?tab=<%="3"%>&page=<s:property value="#request.pageBean3.currentPage - 1"/>">
                                上一页
                            </a>
                        </div>
                    </s:else>

                    <div style="text-decoration: none">
                        <s:property value="#request.pageBean3.currentPage"/>
                    </div>

                    <s:if test="#request.pageBean3.currentPage != #request.pageBean3.totalPage">
                        <div>
                            <a href="<%=path%>/post_query.action?tab=<%="3"%>&page=<s:property value="#request.pageBean3.currentPage + 1"/>">
                                下一页
                            </a>
                        </div>
                        <div>
                            <a href="<%=path%>/post_query.action?tab=<%="3"%>&page=<s:property value="#request.pageBean3.totalPage"/>">
                                尾页
                            </a>
                        </div>
                    </s:if>
                    <s:else>
                        <div style="text-decoration: none;">下一页</div>
                        <div style="text-decoration: none;">尾页</div>
                    </s:else>
                    <div style="text-decoration: none;">
                        (共<s:property value="#request.pageBean3.totalPage"/>页)
                    </div>
                </div>

            </div>

        </div>
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
    Copyright © 2016, index2.com
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
    $(function () {
        var province = '';
        $.getScript("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js", function () {
            province = remote_ip_info["province"];
            $(".city").html(province);
        });

        var loc;
        var price;
        var area;
        var house;

        $(".price-sel").click(function(){
            price=$(this).attr("value");
            $(this).addClass("addcss");
            $(this).nextAll().removeClass("addcss");
            $(this).prevAll().removeClass("addcss");
        });

        $(".area-sel").click(function(){
            area=$(this).attr("value");
            $(this).addClass("addcss");
            $(this).nextAll().removeClass("addcss");
            $(this).prevAll().removeClass("addcss");
        });

        $(".house-sel").click(function(){
            house=$(this).attr("value");
            $(this).addClass("addcss");
            $(this).nextAll().removeClass("addcss");
            $(this).prevAll().removeClass("addcss");
        });
        $("#sub").click(function(){
            $("input[name='price']").attr("value",price);
            $("input[name='area']").attr("value",area);
            $("input[name='house']").attr("value",house);
            $("#find").submit();
        });

        $(".price-sel").eq(0).trigger("click");
        $(".area-sel").eq(0).trigger("click");
        $(".house-sel").eq(0).trigger("click");

        $(".saleblock").show();
        $(".saleblock").prev().hide();
        $(".saleblock").nextAll().hide();

        $("#sub_cast").click(function(){
            $("#cast").submit();
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
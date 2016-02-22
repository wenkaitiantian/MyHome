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
            <div class="login"><a href="login.jsp" id="log">登录</a></div>
            <div class="regist"><a href="register.jsp" id="reg">注册</a></div>
        </div>
    </div>
</div>
<div class="container">
    <form action="<%=path%>/post_getCastQuery.action?tab=<%="1"%>" method="post" id="cast">
        <div class="top">
            <div class="logo"><a href="<%=path%>/post_getIndexQuery.action?tab=<%="1"%>"><img src="img/logo.jpg"
                                                                                              width="100%"
                                                                                              height="100%"></a></div>
            <div></div>
            <div>
                <div class="search">
                    <span>
                        <input type="text" value="<s:property value="#session.cast"/>" name="cast">
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
            <div><img src="img/tit.png" width="100%" height="100%" alt="#"></div>
        </div>
    </form>
    <div class="tab">
        <div>
            <a href="<%=path%>/post_getCastQuery.action?tab=<%="1"%>&cast=<s:property value="#session.cast"/>">
                <div class="tabselect">房屋出租</div>
            </a>
            <a href="<%=path%>/post_getCastQuery.action?tab=<%="2"%>&cast=<s:property value="#session.cast"/>">
                <div class="tabselect highlight">房屋出售</div>
            </a>
            <a href="<%=path%>/post_getCastQuery.action?tab=<%="3"%>&cast=<s:property value="#session.cast"/>">
                <div class="tabselect">房屋求租</div>
            </a>
        </div>
        <div>

        </div>
        <div>
            <div class="rentblock">

                <s:iterator value="#request.pageBean1.list" id="post">
                    <div class="rent">
                        <div class="picture">
                            <a href="<%=path%>/post_detail.action?detail=<s:property value="#post.id"/>">
                                <img src="img/m2.jpg" height="100%" width="100%">
                            </a>
                        </div>
                        <div>
                            <a style="text-decoration: none"
                               href="<%=path%>/post_detail.action?detail=<s:property value="#post.id"/>">
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
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="1"%>&cast=<s:property value="#session.cast"/>">首页</a>
                        </div>
                        <div style="text-decoration: underline;">
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="1"%>&page=<s:property value="#request.pageBean1.currentPage - 1"/>&cast=<s:property value="#session.cast"/>">
                                上一页
                            </a>
                        </div>
                    </s:else>

                    <div style="text-decoration: none">
                        <s:property value="#request.pageBean1.currentPage"/>
                    </div>

                    <s:if test="#request.pageBean1.currentPage != #request.pageBean1.totalPage">
                        <div>
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="1"%>&page=<s:property value="#request.pageBean1.currentPage + 1"/>&cast=<s:property value="#session.cast"/>>
                                下一页
                            </a>
                        </div>
                        <div>
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="1"%>&page=<s:property
                                value="#request.pageBean1.totalPage"/>&cast=<s:property value="#session.cast"/>">
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
                                <img src="img/m3.jpg" height="100%" width="100%">
                            </a>
                        </div>
                        <div>
                            <a style="text-decoration: none"
                               href="<%=path%>/post_detail.action?detail=<s:property value="#post.id"/>">
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
                    <s:if test="#request.pageBean2.currentPage == 1">
                        <div style="text-decoration: none;">首页</div>
                        <div style="text-decoration: none;">上一页</div>
                    </s:if>
                    <s:else>
                        <div>
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="2"%>&cast=<s:property value="#session.cast"/>">首页</a>
                        </div>
                        <div style="text-decoration: underline;">
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="2"%>&page=<s:property value="#request.pageBean2.currentPage - 1"/>&cast=<s:property value="#session.cast"/>">
                                上一页
                            </a>
                        </div>
                    </s:else>

                    <div style="text-decoration: none">
                        <s:property value="#request.pageBean2.currentPage"/>
                    </div>

                    <s:if test="#request.pageBean2.currentPage != #request.pageBean2.totalPage">
                        <div>
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="2"%>&page=<s:property value="#request.pageBean2.currentPage + 1"/>&cast=<s:property value="#session.cast"/>">
                                下一页
                            </a>
                        </div>
                        <div>
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="2"%>&page=<s:property value="#request.pageBean2.totalPage"/>&cast=<s:property value="#session.cast"/>">
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
                            <a style="text-decoration: none"
                               href="<%=path%>/help_detail.action?detail=<s:property value="#help.id"/>">
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
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="3"%>&cast=<s:property value="#session.cast"/>">首页</a>
                        </div>
                        <div style="text-decoration: underline;">
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="3"%>&page=<s:property value="#request.pageBean3.currentPage - 1"/>&cast=<s:property value="#session.cast"/>">
                                上一页
                            </a>
                        </div>
                    </s:else>

                    <div style="text-decoration: none">
                        <s:property value="#request.pageBean3.currentPage"/>
                    </div>

                    <s:if test="#request.pageBean3.currentPage != #request.pageBean3.totalPage">
                        <div>
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="3"%>&page=<s:property value="#request.pageBean3.currentPage + 1"/>&cast=<s:property value="#session.cast"/>">
                                下一页
                            </a>
                        </div>
                        <div>
                            <a href="<%=path%>/post_getCastQuery.action?tab=<%="3"%>&page=<s:property value="#request.pageBean3.totalPage"/>&cast=<s:property value="#session.cast"/>">
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
            <img src="img/logo.jpg" height="100%" width="100%"/>
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

        var province = '';
        $.getScript("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js", function () {
            province = remote_ip_info["province"];
            $(".city").html(province);
        });

        $(".saleblock").show();
        $(".saleblock").prev().hide();
        $(".saleblock").nextAll().hide();

        $("#sub_cast").click(function () {
            $("#cast").submit();
        });

    })
</script>
</html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的发布</title>
    <link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <style>
        body {
            margin: 0;
        }

        a {
            color: #000;
        }

        a:hover {
            text-decoration: none;
        }

        .selection {
            width: 100%;
            height: 36px;
            border-bottom: 1px solid #ccc;
        }

        .tab {
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

        .highlight {
            background-color: rgb(3, 169, 244);
            color: #fff;
        }

        .selection + div {
            width: 95%;
            height: 700px;
            margin: 0 auto;
        }

        .selection + div > div:not(:first-child) {
            display: none;
        }

        .release > div, .audit > div, .success > div {
            margin-top: 20px;
        }

        table tr td:first-child {
            text-align: center;
        }

        input[type="radio"] {
            width: 16px;
            height: 16px;
            cursor: pointer;
        }

        .huxing {
            width: 80px;
            border: 1px solid #ccc;
            display: inline-block;
        }

        .huxing:focus {
            border: none;
            outline: 1px solid rgb(12, 34, 64);
        }

        .huxing input {
            width: 50px;
            text-indent: 1em;
            border: none;
            outline: none;
            display: inline;
            font-family: "Microsoft YaHei";
            font-size: 14px;
        }

        .huxing input:focus {
            border: none;
        }

        .supply, .rent {
            display: none;
        }

        .audit:first-child, .success:first-child {
            height: 230px;
        }

        .audit > div:last-child, .success > div:last-child {
            width: 200px;
            height: 30px;
            line-height: 30px;
            font-family: "Microsoft YaHei";
            font-size: 14px;
            margin: 0 auto;
        }

        .audit > div:last-child > div, .success > div:last-child > div {
            width: 60px;
            text-align: center;
            float: left;
        }

        .audit table tr td, .success table tr td {
            text-align: center;
        }

        .del_post:hover,.del_help:hover,.titl:hover{
            color: #39ac6a;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="selection">
    <div class="tab highlight">发布信息</div>
    <div class="tab">查看已发布信息</div>
    <div class="tab">查看求助信息</div>
</div>
<div>
    <div class="release">
        <div>
            <table class="table">
                <form action="<%=path%>/post_post.action" target="_parent" method="post" id="post">
                    <caption><b>有*号的为必填项</b></caption>
                    <tr>
                        <td>*供求</td>
                        <td>
                            <input type="radio" checked="checked" name="types" value="rentneed" style="margin-left:25px;"> 求租
                            <input type="radio" name="types" value="rent" style="margin-left:25px;"> 出租
                            <input type="radio" name="types" value="sale" style="margin-left:25px;"> 出售
                        </td>
                    </tr>
                    <tr>
                        <td>*标题</td>
                        <td>
                            <input type="text" name="title"/>
                        </td>
                    </tr>
                    <tr class="demand">
                        <td>*期望地区</td>
                        <td>
                            <input type="text" name="district"/>
                        </td>
                    </tr>
                    <tr class="demand">
                        <td>*期望价格</td>
                        <td>
                            <input type="text" name="helpmoney"/>
                        </td>
                    </tr>
                    <tr class="demand">
                        <td>最晚入住时间</td>
                        <td>
                            <input type="text" name="latetime"/>
                        </td>
                    </tr>
                    <tr class="supply">
                        <td>*房屋地区</td>
                        <td>
                            <input type="text" name="location"/>
                        </td>
                    </tr>
                    <tr class="supply">
                        <td>*价格</td>
                        <td>
                            <input type="text" name="postmoney"/>
                        </td>
                    </tr>

                    <tr class="rent">
                        <td>*出租方式</td>
                        <td>
                            <input type="radio" name="way" checked="checked" value="all"/> 整套出租
                            <input type="radio" name="way" value="part" style="margin-left:25px;"/> 单间出租
                        </td>
                    </tr>
                    <tr class="supply">
                        <td>*小区名称</td>
                        <td>
                            <input type="text" name="plotname" placeholder="只填小区名称，例港城名邸"/>
                        </td>
                    </tr>
                    <tr class="supply">
                        <td>*楼层</td>
                        <td>
                            <input type="text" name="floor"/> 层
                        </td>
                    </tr>
                    <tr class="supply">
                        <td>*房屋户型</td>
                        <td>
                            <div class="huxing shi"><input type="text" name="shi"/><span>室</span></div>
                            <div class="huxing ting"><input type="text" name="ting"/><span>厅</span></div>
                            <div class="huxing wei"><input type="text" name="wei"/><span>卫</span></div>
                            <div class="huxing square"><span>共</span><input type="text" name="gong"/><span>㎡</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>*联系人</td>
                        <td>
                            <input type="text" name="linkname"/>
                        </td>
                    </tr>
                    <tr>
                        <td>QQ</td>
                        <td>
                            <input type="text" name="qq"/>
                        </td>
                    </tr>
                    <tr>
                        <td>*电话</td>
                        <td>
                            <input type="text" name="tel"/>
                        </td>
                    </tr>
                    <tr class="demand">
                        <td>补充说明</td>
                        <td>
                            <textarea style="resize:none;width: 390px;height: 150px;"></textarea>
                        </td>
                    </tr>
                    <tr class="supply">
                        <td>
                            详细信息
                            <input type="hidden" id="h1" name="housetype" value=""/>
                            <input type="hidden" id="h2" name="message" value=""/>
                            <input type="hidden" id="h3" name="sizes" value=""/>
                            <input type="hidden" id="h4" name="rooms" value=""/>
                        </td>
                        <td>
                            <div class="editor">
                                <script id="message" name="message" type="text/plain"
                                        style="width:100%;height:200px"></script>
                                <script type="text/javascript" charset="utf-8"
                                        src="<%=path%>/editor/ueditor.config.js"></script>
                                <script type="text/javascript" charset="utf-8"
                                        src="<%=path%>/editor/ueditor.all.min.js"></script>
                                <script type="text/javascript" charset="utf-8"
                                        src="<%=path%>/editor/lang/zh-cn/zh-cn.js"></script>
                                <script type="text/javascript">
                                    $(function () {
                                        var ue = UE.getEditor('message', {
                                            autoHeightEnabled: false,
                                            toolbars: [
                                                ['source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontfamily', 'fontsize', 'simpleupload',
                                                    'insertimage', 'emotion', 'spechars', 'forecolor', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify']
                                            ]
                                        });
                                        $("#sub").click(function () {
                                            if (($("input[name='shi']").val()) != "") {
                                                var a = ue.getContent();
                                                $("#h2").attr("value", a);
                                                var b=$("input[name='shi']")
                                                                .val()+"室"+$("input[name='ting']")
                                                                .val()+"厅"+$("input[name='wei']")
                                                                .val()+"卫,共"+$("input[name='gong']")
                                                                .val()+"㎡";
                                                $("#h1").attr("value",b);
                                                $("#h3").attr("value",$("input[name='gong']").val());
                                                $("#h4").attr("value",$("input[name='shi']").val());
                                            } else {
                                                var b = $("textarea").val();
                                                $("#h2").attr("value", b);
                                                $("#post").attr("action","<%=path%>/help_post.action");
                                            }
                                            $("#post").submit();
                                        });
                                    })
                                </script>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <center><input type="button" id="sub" class="btn btn-success" value="发布"></center>
                        </td>
                    </tr>
                </form>
            </table>
        </div>
    </div>

    <div class="success">
        <div>
            <table class="table table-hover">
                <form action="" method="post" id="posts">
                    <caption><b>查看已发布信息</b></caption>
                    <thead>
                    <tr>
                        <td>信息标题</td>
                        <td>更新时间</td>
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
                            <a class="del_post" target="_parent" value="<s:property value="#post.id"/>">删除</a>
                        </td>
                    </tr>
                    </s:iterator>

                </form>
            </table>
        </div>
        <div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <div class="audit">
        <div>
            <table class="table table-hover">
                <form action="" method="post" id="helps">
                    <caption><b>查看求助信息</b></caption>
                    <thead>
                    <tr>
                        <td>信息标题</td>
                        <td>更新时间</td>
                        <td>操作</td>
                    </tr>
                    </thead>

                    <s:iterator value="#request.helps" id="help">
                        <tr>
                            <td>
                                <a target="_parent" class="titl" href="<%=path%>/help_detail.action?detail=<s:property value="#help.id"/>">
                                    <s:property value="#help.title"/>
                                </a>
                            </td>
                            <td><s:property value="#help.posttime"/></td>
                            <td>
                                <a class="del_help" target="_parent" value="<s:property value="#help.id"/>">删除</a>
                            </td>
                        </tr>
                    </s:iterator>

                </form>
            </table>
        </div>
        <div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

</div>
</body>
<script>
    $(function () {
        <%--$.post("<%=path%>/user_getPersonal.action",{},function(data,textStatus){--%>
            <%--alert("");--%>
        <%--});--%>

        $("input[type='submit']").click(function () {
            alert(ue.getContent());
        });
        function change(attr) {
            attr.nextAll().hide();
            attr.prevAll().hide();
            attr.show();
        }

        function tab(attr, name) {
            attr.nextAll().removeClass(name);
            attr.prevAll().removeClass(name);
            attr.addClass(name);
        }

        $(".del_post").click(function(){
            var a=$(this).attr("value");
            $(this).parents("tr").hide("normal");
            $.post("<%=path%>/post_delete.action",{delId:a},function(data,textStatus){
            });
        });

        $(".del_help").click(function(){
            var a=$(this).attr("value");
            $(this).parents("tr").hide("normal");
            $.post("<%=path%>/help_delete.action",{delId:a},function(data,textStatus){
            });
        })

        $(".tab").click(function () {
            if ($(this).html() == "发布信息") {
                change($(".release"));
                tab($(this), "highlight");
            } else if ($(this).html() == "查看已发布信息") {
                change($(".success"));
                tab($(this), "highlight");
            } else if($(this).html() == "查看求助信息") {
                change($(".audit"));
                tab($(this), "highlight");
            }
        })

        $("input[name='types']").click(function () {
            var value = $(this).val();
            if (value == "demand" || value == "rentneed") {
                $(".demand").show();
                $(".supply").hide();
                $(".rent").hide();
            } else if (value == "sale") {
                $(".demand").hide();
                $(".supply").show();
                $(".rent").hide();
            } else if (value == "rent") {
                $(".demand").hide();
                $(".supply").show();
                $(".rent").show();
            }
        })

        $("input[type='submit']").click(function () {
            var choose = $("input[name='type']").val();
            var title = $("input[name='title']").val();
            if (choose == "demand" || choose == "rentneed") {
                if (title == "") {
                    alert("标题不能为空");
                    return false;
                }
            } else if (choose == "rent" || choose == "sale") {
                if (title == "") {
                    alert("标题不能为空");
                    return false;
                }
                if (isNaN($(".shi").val()) || isNaN($(".shi").val()) || isNaN($(".shi").val()) || isNaN($(".shi").val())) {
                    alert("请填写数字");
                    return false;
                }

            }
        })
    })
</script>
</html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>房屋登录</title>
    <link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome-4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/Font-Awesome-3.2.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
</head>
<body>
<div class="container">
    <div class="warn"></div>
    <div class="loginblock">
        <div>
            <img src="img/logo.jpg" width="100%" height="100%">
        </div>
        <div>
            <div></div>
            <div>
                <table class="table table-hover">
                    <form action="<%=path%>/user_login.action" method="post" id="login">
                        <caption>
                            <center><h5>房屋登录</h5></center>
                        </caption>
                        <tr>
                            <td>用户名</td>
                            <td><input type="text" name="username"></td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td><input type="password" name="password"></td>
                        </tr>
                        <tr>
                            <td>验证码 &nbsp;<input type="button" style="width: 60px" id="code"/></td>
                            <td><input type="text" id="input"/>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                    <input type="button" class="btn btn-success" id="sub" value="立即登录">
                                </center>
                            </td>
                        </tr>
                    </form>
                </table>
            </div>
            <div>
                <div><h6><a href="register.jsp">没有账号？立即注册</a></h6></div>
                <div><h6><a href="<%=path%>/post_getIndexQuery.action?tab=<%="1"%>">返回首页</a></h6></div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    Copyright © 2016, login.com
</div>

<script>
    var code; //在全局定义验证码
    //产生验证码
    window.onload = function createCode() {
        code = "";
        var codeLength = 4;//验证码的长度
        var checkCode = document.getElementById("code");
        var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数
        for (var i = 0; i < codeLength; i++) {
            var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35）
            code += random[index];//根据索引取得随机数加到code上
        }
        checkCode.value = code;//把code值赋给验证码
    }

    $(function () {
        $("#code").click(function () {
            code = "";
            var codeLength = 4;//验证码的长度
            var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数
            for (var i = 0; i < codeLength; i++) {//循环操作
                var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35）
                code += random[index];//根据索引取得随机数加到code上
            }
            this.value = code;//把code值赋给验证码
        })

        function warn(attr) {
            $(".warn").html(attr);
            $(".warn").slideDown(1000);
            $(".warn").fadeOut(3000);
        }

        $("#sub").click(function () {
            var a = $("input[name='username']").val();
            var b = $("input[name='password']").val();
            if (a == "") {
                warn("请填写用户名！");
                return;
            }
            else if (b == "") {
                warn("请填写密码！");
                return;
            }

            var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写
            if (inputCode.length <= 0) {
                warn("请输入验证码！");
                return;
            }
            else if (inputCode != code) { //若输入的验证码与产生的验证码不一致时
                warn("验证码输入错误！"); //则弹出验证码输入错误
                document.getElementById("input").value = "";//清空文本框
                return;
            }

            $.post("<%=path%>/user_checkLogin.action", {username: a, password: b}, function (data, textStatus) {
                if (data == "wrong") {
                    warn("用户不存在或密码错误！");
                } else {
                    $("#login").submit();
                }
            });
        });
    })
</script>
</body>
</html>
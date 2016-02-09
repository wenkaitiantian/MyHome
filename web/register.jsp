<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>房屋注册</title>
    <link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome-4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/Font-Awesome-3.2.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/register.css">
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/regist.js"></script>
</head>
<body>
<div class="container">
    <div class="warn"></div>
    <div class="registblock">
        <div>
            <img src="img/logo.jpg" width="100%" height="100%">
        </div>
        <div>
            <div>
                <table class="table table-hover">
                    <form action="user_register.action" method="post" id="register" enctype="multipart/form-data">
                        <caption>
                            <center><h5>房屋注册</h5></center>
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
                            <td>确认密码</td>
                            <td><input type="password" name="reusepassword"></td>
                        </tr>
                        <tr>
                            <td>手机号</td>
                            <td><input type="text" name="tel"></td>
                        <tr>
                            <td>电子邮箱</td>
                            <td>
                                <input type="text" name="email">
                                <input type="button" value="发送验证码" id="send">
                            </td>
                        </tr>
                        <tr>
                            <td>验证码</td>
                            <td><input type="text" name="code"></td>
                        </tr>

                        <tr>
                            <td>头像</td>
                            <td><input type="file" name="icon"></td>
                        </tr>
                        <tr>
                            <td>真实姓名</td>
                            <td><input type="text" name="realname"></td>
                        </tr>
                        <tr>
                            <td>地区</td>
                            <td><input type="text" name="area"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                    <input type="button" class="btn btn-success" value="立即注册" id="sub">
                                </center>
                            </td>
                        </tr>
                    </form>
                </table>
            </div>
            <div>
                <div><a href="login.jsp"><h6>已有账号？马上登录</h6></a></div>
                <div><a href="<%=path%>/post_getIndexQuery.action?tab=<%="1"%>"><h6>返回首页</h6></a></div>
            </div>
        </div>
    </div>
</div>
</div>
<div class="footer">
    Copyright ? 2016, regist.com
</div>
<script>
    $(function(){
        function warn (attr){
            $(".warn").html(attr);
            $(".warn").slideDown(1000);
            $(".warn").fadeOut(3000);
        }
        $("#send").click(function () {
            var d = $("input[name='email']").val();
            $.post("<%=path%>/user_checkEmail.action", {email: d}, function (data, textStatus) {
                if (data == "errorformat") {
                    alert("邮箱格式不正确");
                } else if (data == "already") {
                    alert("邮箱已被注册！");
                } else {
                    alert("已发送");
                }
            });
        });
        $("#sub").click(function () {
            var a = $("input[name='username']").val();
            var b = $("input[name='password']").val();
            var c = $("input[name='reusepassword']").val();
            var d = $("input[name='email']").val();
            var e = $("input[name='code']").val();
            $.post("<%=path%>/user_checkRegister.action", {
                username: a,
                password: b,
                reusepassword: c,
                code: e
            }, function (data, textStatus) {
                if (a == "" || b == "" || c == "" || d == "") {
                    warn("请填写必填项！");
                }
                else if (data == "emptycode") {
                    warn("未验证邮箱！");
                }
                else if (data == "sameuser") {
                    warn("用户名已存在！");
                } else if (data == "notsame") {
                    warn("两次密码输入不一致！");
                } else if (data == "wrongcode") {
                    warn("验证码错误！");
                } else {
                    $("#register").submit();
                }
            });
        });
    })
</script>
</body>
</html>
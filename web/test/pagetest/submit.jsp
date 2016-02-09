<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path=request.getContextPath();
%>
<html>
<head>
    <title></title>
</head>
<body>
    <form action="<%=path%>/admin_getAdmin.action" method="post">
      <input type="submit" value="提交"/>
    </form>
</body>
</html>

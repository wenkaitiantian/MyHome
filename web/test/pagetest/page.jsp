<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
%>
<html>
<head>
    <title></title>
</head>
<body>
    <h1>分页测试</h1>
    <table border="1" align="center" bordercolor="blue" width="50%">
        <s:iterator value="#request.pageBean.list" id="person">
            <tr>
                <td><s:property value="#person.id"/></td>
                <td><s:property value="#person.name"/></td>
                <td><s:property value="#person.age"/></td>
            </tr>
        </s:iterator>
    </table>

    <center>

        <font size="5">共<font color="red"><s:property value="#request.pageBean.totalPage"/></font>页 </font>&nbsp;&nbsp;
        <font size="5">共<font color="red"><s:property value="#request.pageBean.allRows"/></font>条记录</font><br><br>

        <s:if test="#request.pageBean.currentPage == 1">
            首页&nbsp;&nbsp;&nbsp;上一页
        </s:if>

        <s:else>
            <a href="<%=path%>/test_execute.action">首页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="<%=path%>/test_execute.action?page=<s:property value="#request.pageBean.currentPage - 1"/>">上一页</a>
        </s:else>

        <s:property value="#request.pageBean.currentPage"/>

        <s:if test="#request.pageBean.currentPage != #request.pageBean.totalPage">
            <a href="<%=path%>/test_execute.action?page=<s:property value="#request.pageBean.currentPage + 1"/>">下一页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="<%=path%>/test_execute.action?page=<s:property value="#request.pageBean.totalPage"/>">尾页</a>
        </s:if>

        <s:else>
            下一页&nbsp;&nbsp;&nbsp;尾页
        </s:else>

        (共<s:property value="#request.pageBean.totalPage"/>页)

    </center><br>


</body>
</html>

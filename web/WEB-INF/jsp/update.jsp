<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/4/11 0011
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <form action="${pageContext.request.contextPath}/user/update" method="post">
            <input type="hidden" name="id" value="${user.id}">
            用户名:<input type="text" name="username" value="${user.username}"><br>
            密码：<input type="password" name="password" value="${user.password}"><br>
            年龄：<input type="number" name="age" value="${user.age}"><br>
            金额:<input type="number" name="money" value="${user.money}"><br>

            <input type="submit" value="提交"><br>
        </form>
</body>
</html>

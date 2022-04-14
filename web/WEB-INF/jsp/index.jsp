
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>$Title$</title>
      <style>
          table{
              width: 800px;
          }
          a{
              text-decoration: none;
              color: black;
          }
      </style>

  </head>
  <body>
      <a href="${pageContext.request.contextPath}/user/toAdd">添加</a>
      <table border="1" cellspacing="0" align="center">
        <tr>
            <th>ID编号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>金额</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pg.list}" var="u">
          <tr>
              <td>${u.id}</td>
              <td>${u.username}</td>
              <td>${u.age}</td>
              <td>${u.money}</td>
              <td><a href="${pageContext.request.contextPath}/user/toUser?id=${u.id}">修改</a>|<a href="${pageContext.request.contextPath}/user/delete?id=${u.id}">删除</a></td>
          </tr>
        </c:forEach>
          <tr>
              <td colspan="5">
                  <c:if test="${pg.hasPreviousPage}">
                  <a href="${pageContext.request.contextPath}/user/getUsers?pageNum=1">首页</a>|<a href="${pageContext.request.contextPath}/user/getUsers?pageNum=${pg.prePage}">上一页</a>|
                  </c:if>

                  <c:forEach items="${pg.navigatepageNums}" var="num">
                      <c:if test="${pg.pageNum!=num}">
                          <a style="display: block;width: 20px;float:left;margin-left:5px;text-align:center;height: 20px;background-color: cornflowerblue" href="${pageContext.request.contextPath}/user/getUsers?pageNum=${num}">${num}</a>
                      </c:if>
                      <c:if test="${pg.pageNum==num}">
                          <a style="display: block;width: 20px;float:left;margin-left:5px;text-align:center;height: 20px;background-color: green" href="#">${num}</a>
                      </c:if>
                  </c:forEach>
                  <c:if test="${pg.hasNextPage}">
                  <a href="${pageContext.request.contextPath}/user/getUsers?pageNum=${pg.nextPage}">下一页</a>|
                  </c:if>
                  <a href="${pageContext.request.contextPath}/user/getUsers?pageNum=${pg.pages}">尾页</a>|总页数：${pg.pages}
              </td>
          </tr>
      </table>
  </body>
</html>

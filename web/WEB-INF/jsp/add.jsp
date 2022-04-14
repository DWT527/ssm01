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
    <script type="text/javascript" src="${pageContext.request.contextPath}/cities.js"></script>
    <script type="text/javascript">
        //动态事件注册，一定要先把这个整个文档加载完成的onload事件先注册 上
        window.onload = function() {
            // 通过id属性值，查找到省的下拉列表对象
            var provinceSelect = document.getElementById("province");
            // 遍历访问每一个省的数据，创建option标签对象
            for (var i = 0; i < china.provinces.length; i++) {
                // 通过document.createElement 方法 创建option标签对象
                var optionObj = document.createElement("option");
                // 通过innerHTML属性。设置option标签对象的文本内容
                optionObj.innerHTML = china.provinces[i].name;
                // 把创建好的option添加到省的下拉列表中
                provinceSelect.appendChild(optionObj);
            }

            // 给省份的下拉列表添加选中的改变事件
            provinceSelect.onchange = function(){
                //alert(provinceSelect.selectedIndex);
                // 通过id属性值，打开到这个城市 的下拉列表对象
                var citySelect = document.getElementById("city");

                // alert(citySelect.options.length);
                // 在添加新的城市数据之前，要把原来的城市 数据清掉
                for (var j = 1; j < citySelect.options.length; j++) {
                    citySelect.removeChild(citySelect.options[j]);
                    j--;
                }

                // 通过省下的下拉列表的选中的索引，获取到城市数据的选中的省的城市的长度
                var len = china.provinces[provinceSelect.selectedIndex-1].city.length;
                // 遍历城市 的数据，创建城市 的option标签对象
                for (var i = 0; i < len; i++) {
                    // 通过document.createElement 方法 创建option标签对象
                    var optionObj = document.createElement("option");

                    // 通过innerHTML属性。设置option标签对象的文本内容
                    optionObj.innerHTML = china.provinces[provinceSelect.selectedIndex-1].city[i];
                    // 把创建好的option添加到省的下拉列表中
                    citySelect.appendChild(optionObj);
                }
            }
        }
    </script>
</head>
<body>
        <form action="${pageContext.request.contextPath}/user/add" method="post">
            用户名:<input type="text" name="username"><br>
            密码：<input type="password" name="password"><br>
            年龄：<input type="number" name="age"><br>
            金额:<input type="number" name="money"><br>
            业余爱好:<input type="checkbox" name="hobby" value="swim">游泳
            <input type="checkbox" name="hobby" value="wzr">王者荣耀
            <input type="checkbox" name="hobby" value="run">跑步
            <br>  所在地区:
            <select id="province" name="province">
                <option value="none">--请选择省--</option>
             </select>

            <select id="city" name="city">
                <option value="none">--请选择市--</option>
            </select>
            <br>
            <input type="submit" value="提交"><br>
        </form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/2/2
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收支详情</title>
</head>

<script>
    function clickone() {
        debugger;
        var addi="<%=request.getAttribute("addi")%>";
        var addi1 = "${msg}";
        alert(addi);
    }
</script>
<body>
<input id="ceshi1" value="${expenditure.addi}" type="hidden">总支出</input>
<a href="#" onclick="clickone()">点我</a>
<input id="tableName" type="hidden"/>
<div>${addi}</div>
<input id="time1" name="time1" value="" type="hidden"/>
<input id="time2" name="time2" value="" type="hidden"/>
</body>
</html>

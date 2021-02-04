<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/2/2
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css" />

    // 因为bootstrap基于jquery,所以必须引入jquery
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>

    // 引入你想使用的语言包
    <script src="bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>
<h2><a href="http://localhost:8080/family">点击跳转详情页</a></h2>


<input size="16" type="text" value="" readonly class="form_datetime">

<script>
    $(".form_datetime").datetimepicker({
        language:'zh-CN', //语言
        minView: "month",  //最精确的时间选择视图。
        format: 'yyyy-mm-dd',  //日期格式
        todayHighlight:true, //高亮当前日期
        autoclose:true //当选择一个日期之后是否立即关闭此日期时间选择器。
    }).on('changeDate',function(ev){  //当日期被改变时被触发。
        console.log(ev.date.valueOf());
    });

</script>
</body>
</html>

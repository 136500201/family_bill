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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css"/>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>

    <script src="bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <title>收支详情</title>

    <style>
        .paddtop {
            padding-top: 10px;
        }

        .search-btn {
            float: left;
            border: 1px solid #ffc900;
            width: 90px;
            height: 35px;
            background-color: #ffc900;
            text-align: center;
            line-height: 35px;
            margin-top: 15px;
        }

        .search-input {
            float: left;
            border: 2px solid #ffc900;
            width: 400px;
            height: 35px;
            padding-left: 5px;
            margin-top: 15px;
        }

        .jx {
            border-bottom: 2px solid #ffc900;
            padding: 5px;
        }

        .company {
            height: 40px;
            background-color: #ffc900;
            text-align: center;
            line-height: 40px;
            font-size: 8px;
        }

        /*body {
            text-align: center
        }*/
    </style>
</head>

<body>
<form id="inputForm" modelAttribute="carDealInfo" action="${ctx}/cardeal/carDealInfo/save" method="post"
      class="form-horizontal">
    <hidden path="id"/>
    <div class="control-group">
        <div class="controls-row">
            <table id="contentTable" class="table table-bordered table-condensed">
                <tr class="tableHead">
                    <td colspan="20" style="text-align:center"><h4>收入规划系统</h4></td>
                </tr>
                <tr>
                    <th>现有资金(存款+基金)：</th>
                    <td>
                        <input id="nowMoney" htmlEscape="false" placeholder="请输入..." maxlength="50"
                               class="input-xlarge edit"/>
                    </td>
                    <th>本月15日预计收入：</th>
                    <td>
                        <input id="swMoney" htmlEscape="false" value="" maxlength="50"
                               class="input-xlarge edit"/>
                    </td>
                </tr>
                <tr>
                    <th>当前月份：</th>
                    <td>
                        <input id="month" size="16" type="text" placeholder="请选择..." value="" readonly
                               class="form_datetime">
                    </td>
                    <th>本月额外收入：</th>
                    <td>
                        <input id="addi" htmlEscape="false" maxlength="50" placeholder="请输入..."
                               class="input-xlarge edit"/>
                    </td>
                </tr>
                <tr>
                    <th>已投资额：</th>
                    <td>
                        <input id="inves" size="16" type="text" placeholder="请输入..." value="" readonly
                               class="form_datetime">
                    </td>
                    <th>投资总收益：</th>
                    <td>
                        <input id="totalPro" htmlEscape="false" maxlength="50" placeholder="请输入..."
                               class="input-xlarge edit"/>
                    </td>
                </tr>
                <tr>
                    <th>每月固定开支：</th>
                    <td>
                        <input id="fixed" htmlEscape="false" maxlength="50" placeholder="请输入..."
                               class="input-xlarge edit"/>
                    </td>
                    <th>本月额外开支总额：</th>
                    <td>
                        <input id="monAddi" htmlEscape="false" maxlength="50" placeholder="请输入..."
                               class="input-xlarge edit"/>
                    </td>
                </tr>
                <tr>
                    <th>当前总欠款：</th>
                    <td>
                        <input id="arrears" htmlEscape="false" id="money" onchange="Calcula()" maxlength="50"
                               placeholder="请输入..."
                               class="input-xlarge edit"/>
                    </td>
                    <th>各类欠款还款日：</th>
                    <td>
                        <textarea cols="" rows="" style="vertical-align:top;outline:none;width:300px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>月末应结余：</th>
                    <td>
                        <input id="balance" htmlEscape="false" maxlength="50" disabled="true" placeholder="自动计算"
                               class="input-xlarge edit"/>
                    </td>
                    <th>每月需还款金额：</th>
                    <td>
                        <input id="repay" htmlEscape="false" maxlength="50" disabled="true" placeholder="自动计算"
                               class="input-xlarge edit"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="form-actions" style="text-align: center;">
        <input id="btnCalcula" class="btn btn-primary" onclick="" type="submit" value="计 算"/>
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form>
<br/><br/>

每月固定开支计算：<textarea name="" id="mon" cols="" rows=""
                   style="vertical-align:top;outline:none;width:500px;height:60px;"></textarea><br/><br/>
本月额外开支详细：<textarea name="" id="pay" cols="" rows=""
                   style="vertical-align:top;outline:none;width:500px;height:60px;"></textarea>
</body>
<script>
    $(".form_datetime").datetimepicker({
        language: 'zh-CN', //语言
        minView: "month",  //最精确的时间选择视图。
        format: 'yyyy-mm-dd',  //日期格式
        todayHighlight: true, //高亮当前日期
        autoclose: true //当选择一个日期之后是否立即关闭此日期时间选择器。
    }).on('changeDate', function (ev) {  //当日期被改变时被触发。
        console.log(ev.date.valueOf());
    });

    function Calcula() {
        debugger;
        var money = document.getElementById("arrears").value;
        var balance = document.getElementById("arrears").value
        document.getElementById("balance").value = balance;
        //alert(money);
    }
</script>
</html>

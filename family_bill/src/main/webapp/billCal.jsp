<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/2/2
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
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

        body { /*afd9ee*/
            background-color: #afd9ee;
        }

        th {
            font-size: 20px;
            font-family: 仿宋;
        }
    </style>
</head>
<script>
    function save() {
        var addi1 = '${expenditure.addi}'
    }
</script>
<body>
<form>
    <div class="control-group">
        <div class="controls-row">
            <table id="contentTable" class="table table-bordered table-condensed">
                <tr class="tableHead">
                    <td colspan="20" style="text-align:center;background-color: #2aabd2"><h4
                            style="font-size: 30px;font-family: 楷体">收入规划系统</h4></td>
                </tr>
                <tr>
                    <th>现有资金(存款+基金)：</th>
                    <td>
                        <input id="nowMoney" htmlEscape="false" value="${expenditure.avaFun}" placeholder="请输入..."
                               maxlength="50"
                               class="form-control" style="width: 300px;"/>
                    </td>
                    <th>本月15日预计收入：</th>
                    <td>
                        <input id="swMoney" htmlEscape="false" onchange="Calcula()" placeholder="请输入..." value=""
                               maxlength="50"
                               class="form-control" style="width: 300px"/>
                    </td>
                </tr>
                <tr>
                    <th>当前月份：</th>
                    <td>
                        <input id="month" value="${expenditure.dateCur}" size="16" type="text" placeholder="请选择..."
                               value="" readonly
                               class="form_datetime form-control" style="width: 300px">
                    </td>
                    <th>本月额外收入：</th>
                    <td>
                        <input id="addi" htmlEscape="false" onchange="Calcula()" maxlength="50" placeholder="请输入..."
                               class="form-control" style="width: 300px"/>
                    </td>
                </tr>
                <tr>
                    <th>每月固定开支：</th>
                    <td>
                        <input id="fixed" value="${expenditure.fixed}" htmlEscape="false" onchange="Calcula()"
                               maxlength="50" placeholder="请输入..."
                               class="form-control" style="width: 300px"/>
                    </td>
                    <th>本月额外开支总额：</th>
                    <td>
                        <input id="monAddi" htmlEscape="false" onchange="Calcula()" maxlength="50" placeholder="请输入..."
                               class="form-control" style="width: 300px"/>
                    </td>
                </tr>
                <tr>
                    <th>已投资额：</th>
                    <td>
                        <input id="inves" value="${expenditure.inves}" htmlEscape="false" maxlength="50"
                               placeholder="请输入..."
                               class="form-control" style="width: 300px"/>
                    </td>

                    <th>投资总收益：</th>
                    <td>
                        <input id="totalPro" value="${expenditure.totalPro}" htmlEscape="false" maxlength="50"
                               placeholder="请输入..."
                               class="form-control" style="width: 300px"/>
                    </td>
                </tr>
                <tr>
                    <th>当前总欠款：</th>
                    <td>
                        <input id="arrears" value="${expenditure.totalArrears}" htmlEscape="false" onchange="Calcula()"
                               maxlength="50"
                               placeholder="请输入..."
                               class="form-control" style="width: 300px"/>
                    </td>
                    <th>还款月数：</th>
                    <td>
                        <input id="mon" htmlEscape="false" onchange="Calcula()" maxlength="50"
                               placeholder="请输入..."
                               class="form-control" style="width: 300px"/>
                    </td>
                </tr>
                <tr>
                    <th>月末应结余：</th>
                    <td>
                        <input id="balance" htmlEscape="false" maxlength="50" disabled="true" placeholder="自动计算"
                               class="form-control" style="width: 300px"/>
                    </td>
                    <th>每月需还款金额：</th>
                    <td>
                        <input id="repay" htmlEscape="false" maxlength="50" disabled="true" placeholder="自动计算"
                               class="form-control" style="width: 300px"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    &nbsp&nbsp&nbsp<span style="font-size: 15px;font-family: 仿宋;">月末应结余计算规则：本月15日收入+本月额外收入-每月固定开支-本月额外开支</span>
    </br>
    &nbsp&nbsp&nbsp<span style="font-size: 15px;font-family: 仿宋;">每月需还款金额：当前总欠款/还款月数</span>
    </br>
    <div class="form-actions" style="text-align: center;">
        <%--<input id="btnCalcula" class="btn btn-primary" onclick="" type="submit" value="计 算"/>--%>
        <input id="btnSubmit" onclick="save()" class="btn btn-primary" type="submit" value="保存"/>
        <input id="btnCancel" class="btn" type="button" value="返回" onclick="history.go(-1)"/>
    </div>
</form>

<%--房贷1472+车位998+家里停车80+公司停车220+油费700(上下班)+刘话费40+宝话费100+刘吃饭1000+宝吃饭1000+宝坐车150 = 5760--%>
&nbsp&nbsp&nbsp<span style="font-size: 18px;font-family: 仿宋;">每月固定开支计算：</span><textarea name="" id="mon1" cols=""
                                                                                        rows=""
                                                                                        style="vertical-align:top;outline:none;width:500px;height:60px;">${expenditure.fixedDeta}</textarea>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp<span style="font-size: 18px;font-family: 仿宋;">各类还款时间：</span><textarea name="" id="mon2" cols="" rows=""
                                                                                      style="vertical-align:top;outline:none;width:500px;height:60px;">${expenditure.repayDate}</textarea><br/><br/>
&nbsp&nbsp&nbsp<span style="font-size: 18px;font-family: 仿宋;">本月额外开支详细：</span><textarea name="" id="pay" cols="" rows=""
                                                                                        style="vertical-align:top;outline:none;width:500px;height:60px;">${expenditure.addiDeta}</textarea>
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
        //当前总欠款
        var arrears = parseInt(document.getElementById("arrears").value);
        //还款月数
        var mon = parseInt(document.getElementById("mon").value);
        //每月需还款额
        var money1 = parseInt(arrears / mon);
        if (arrears != null && mon != null) {
            document.getElementById("repay").value = money1;
        }
        //本月15日收入
        var swMoney = parseInt(document.getElementById("swMoney").value);
        //本月额外收入
        var addi = parseInt(document.getElementById("addi").value);
        //每月固定开支
        var fixed = parseInt(document.getElementById("fixed").value);
        //本月额外开支
        var monAddi = parseInt(document.getElementById("monAddi").value);
        if (swMoney != null && addi != null && fixed != null && monAddi != null) {
            document.getElementById("balance").value = swMoney + addi - fixed - monAddi - money1;
        }
    }


    /*function save() {
        debugger;
        window.location.href = 'http://localhost:8080/family';
        $.ajax({
            type: 'get',
            url: "http://localhost:8080/family",
            data: "6666",
            success: function (data) {
                alert('成功返回');
            },
            dataType: "json"
        });
    }*/
</script>
</html>

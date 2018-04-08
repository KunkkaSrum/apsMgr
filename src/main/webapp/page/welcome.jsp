<%--
  Created by IntelliJ IDEA.
  User: 黄益华
  Date: 2018/3/21
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title></title>
    <link rel="stylesheet" href="<%=basePath%>css/common.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap-table/bootstrap-table.min.css">

    <style type="text/css">
        .top-module {
            margin-top: 15px;
            display: flex;
            width: 100%;
            height: 160px;
        }

        .module-child {
            width: 22%;
            margin-left: 2.4%;
            height: 160px;
        }

        .module-child div {
            text-align: center;
        }

        .middle-module {
            width: 100%;
            margin: 15px auto;
            height: 300px;
            display: flex;
        }

        .module-left {
            margin-left: 2.4%;
            height: 300px;
            width: 70.8%;
        }

        .module-right {
            margin-left: 2.4%;
            height: 300px;
            width: 22%;
        }
    </style>
</head>
<body>
<div>
    <div class="top-module">
        <div class="module-child">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-signal" aria-hidden="true">&nbsp实际比计划产量</span>
                </div>
                <div class="panel-body" style="height: 117px; ">
                    <div style="height:47px;text-align: center;line-height:47px;color: #009170;font-size: 32px">
                        88%
                    </div>
                    <div style="height:40px;width: 100%">
                        <div>166/200</div>
                        <div style="background-color:#b2b2b2;text-align:left;width: 100%;height: 25px;margin-top: 5px;margin-left: 5px;border: 1px solid #b2b2b2">
                            <div style="height:24px;width: 88%;background-color: #009170;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="module-child">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-user" aria-hidden="true">&nbsp在职工人</span>
                </div>
                <div class="panel-body" style="height: 117px; ">
                    <span style="height:80px;text-align: center;line-height:80px;color: #009170;font-size: 44px">
                        128
                    </span>人
                </div>
            </div>
        </div>
        <div class="module-child">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-user" aria-hidden="true">&nbsp紧急订单</span>
                </div>
                <div class="panel-body" style="height: 117px; ">
                    <span style="height:80px;text-align: center;line-height:80px;color: #bb301b;font-size: 44px">
                        4
                    </span>个
                </div>
            </div>
        </div>
        <div class="module-child">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-signal" aria-hidden="true">&nbsp生产进度</span>
                </div>
                <div class="panel-body" style="height: 117px; ">
                    <div style="height:57px;text-align: center;line-height:57px;color: #0e153c;font-size: 32px">
                        61%
                    </div>
                    <div style="height:40px;width: 100%;margin-top: 20px">
                        相比昨日<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"
                                  style="font-size: 18px;">3%</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="middle-module">
            <div class="panel panel-default module-left">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-signal" aria-hidden="true">&nbsp每日产能热图</span>
                </div>
                <div  id="main" style="width: 100%;height: 300px">
                </div>
            </div>
            <div class="panel panel-default module-right">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-signal" aria-hidden="true">&nbsp订单完成量</span>
                </div>
                <div>
                    <div style="height:50px;padding: 5px;border-bottom: 1px solid #bfbac1">
                        <div style="float: left"><span>订单编号：193402983</span><br><span>客户名称：客户A</span></div>
                        <div style="float: right;line-height: 40px;"><span style="font-size: 20px">1230</span>件</div>
                    </div>
                    <div style="height:50px;padding: 5px;border-bottom: 1px solid #bfbac1">
                        <div style="float: left"><span>订单编号：193402213</span><br><span>客户名称：客户B</span></div>
                        <div style="float: right;line-height: 40px;"><span style="font-size: 20px">325</span>件</div>
                    </div>
                    <div style="height:50px;padding: 5px;border-bottom: 1px solid #bfbac1">
                        <div style="float: left"><span>订单编号：193323321</span><br><span>客户名称：客户C</span></div>
                        <div style="float: right;line-height: 40px;"><span style="font-size: 20px">768</span>件</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>control/echarts/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
    $("#custom").bootstrapTable({
        url: '<%=basePath%>attendance/selectAll',
        height: 200,
        clickToSelect: false,
        columns: [
            {field: "attendanceNo", title: "attendanceNo", visible: false}
            , {
                field: 'attendanceCode', title: '出勤模式代码'
            }, {
                field: '123', title: '出勤模式代码'
            }, {
                field: '3123', title: '出勤模式代码'
            }]
    });
</script>
<script>
    var myChart = echarts.init(document.getElementById('main'));

    function getVirtulData(year) {
        year = year || '2017';
        var date = +echarts.number.parseDate(year + '-01-01');
        var end = +echarts.number.parseDate((+year) + '-06-01');
        var dayTime = 3600 * 24 * 1000;
        var data = [];
        for (var time = date; time < end; time += dayTime) {
            data.push([
                echarts.format.formatTime('yyyy-MM-dd', time),
                Math.floor(Math.random() * 1000)
            ]);
        }
        return data;
    }


    option = {
        tooltip: {
            position: 'top'
        },
        visualMap: {
            min: 0,
            max: 1000,
            calculable: true,
            orient: 'horizontal',
            left: 'center',
            top: 'top'
        },

        calendar: [
            {
                range: ['2018-01-01', '2018-04-18'],
                cellSize: ['auto', 20]
            }],

        series: [{
            type: 'heatmap',
            coordinateSystem: 'calendar',
            calendarIndex: 0,
            data: getVirtulData(2018)
        }]

    };

    myChart.setOption(option);
</script>
</body>
</html>
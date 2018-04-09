<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/9
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>control/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <div style="height:40px"><a href="../welcome.jsp" class="layui-btn" style="float: right">返回</a></div>
        <div class="layui-col-md6">
            <table id="worker" class="layui-table" lay-filter="workerListen"></table>
        </div>
        <div class="layui-col-md6">
            <div id="main" style="width:90%;height:90%;margin: auto"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>control/echarts/echarts.min.js"></script>
<script>
    layui.use(["table", "form"], function () {
        var table = layui.table,
            form = layui.form,
            $ = layui.jquery;

        table.render({
            elem: '#worker'
            ,url: '<%=basePath%>json/worker.json'
            ,height: 'full-100'
            ,page: false
            ,cols:[[
                {field: 'workerNo', title: 'id'}
                ,{field: 'workerName', title: '姓名'}
                ,{field: 'telephone', title: '联系电话'}
                ,{field: 'position', title:'职位'}
                ,{field: 'attendanceStatus', title: '出勤状态'}
            ]]
        });


    });
</script>
<script>
    var myChart = echarts.init(document.getElementById('main'));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        legend: {
            data: ['出勤人数', '出勤率']
        },
        xAxis: [
            {
                type: 'category',
                data: ['4月7日', '4月8日', '4月9日', '4月10日', '4月11日', '4月12日', '4月13日', '4月14日', '4月15日', '4月16日', '4月17日', '4月18日'],
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '人数',
                min: 0,
                max: 200,
                interval: 20,
                axisLabel: {
                    formatter: '{value} 人'
                }
            },
            {
                type: 'value',
                name: '出勤率',
                min: 0,
                max: 100,
                interval: 10,
                axisLabel: {
                    formatter: '{value} %'
                }
            }
        ],
        series: [
            {
                name: '出勤人数',
                type: 'bar',
                data: [125, 120, 130, 118, 125, 128, 130, 130, 128, 128, 119, 128]
            },
            {
                name: '出勤率',
                type: 'line',
                yAxisIndex: 1,
                data: [12500/130, 12000/130, 100, 11800/130,12500/130, 12800/130, 100, 100, 12800/130, 12800/130, 11900/130, 12800/130]
            }
        ]
    };
    myChart.setOption(option);
</script>
</body>
</html>

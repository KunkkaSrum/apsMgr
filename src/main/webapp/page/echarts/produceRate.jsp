<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/9
  Time: 11:41
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
    <style type="text/css">
        .div-main {
            width: 100%;
            height: 90%;
            margin: auto;
        }
    </style>
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css">
</head>
<body>

<div class="panel panel-default div-main">
    <div class="panel-heading" style="background-color: white;text-align: center">
        <span class="glyphicon glyphicon-signal" aria-hidden="true"  style="">&nbsp产能图</span>
        <a href="<%=basePath%>page/welcome.jsp" class="btn btn-success" style="float: right;line-height: 10px;">返回</a>
    </div>
    <div id="main" style="width: 100%;height: 100%;"></div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/echarts/echarts.min.js"></script>
<script>
    var myChart = echarts.init(document.getElementById('main'));
    //    app.title = '折柱混合';

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
            data: ['实际产量', '计划产量', '实际计划产量比']
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
                name: '产量',
                min: 0,
                max: 500,
                interval: 50,
                axisLabel: {
                    formatter: '{value} 件'
                }
            },
            {
                type: 'value',
                name: '产出比',
                min: 0,
                max: 200,
                interval: 20,
                axisLabel: {
                    formatter: '{value} %'
                }
            }
        ],
        series: [
            {
                name: '实际产量',
                type: 'bar',
                data: [220, 230, 240, 256, 278, 301, 331, 380, 396, 300, 300, 166]
            },
            {
                name: '计划产量',
                type: 'bar',
                data: [200, 200, 250, 250, 300, 300, 350, 400, 400, 300, 300, 200]
            },
            {
                name: '实际计划产量比',
                type: 'line',
                yAxisIndex: 1,
                data: [110, 115, 96,102.4, 92.6, 100.3, 94.6, 95, 99, 100, 100, 88]
            }
        ]
    };

    myChart.setOption(option);
</script>
</body>
</html>

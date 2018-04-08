<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="<%=basePath%>control/jquery-gantt/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css"/>
    <link href="<%=basePath%>control/jquery-gantt/css/prettify.min.css" rel="stylesheet"/>
    <style type="text/css">
        body {
            font-family: Helvetica, Arial, sans-serif;
            font-size: 13px;
            padding: 0;
        }

    </style>
</head>
<body>
<div class="gantt_ot" style="width:100%;">
    <div class="gantt"></div>
</div>


</body>
</html>
<script src="<%=basePath%>control/jquery-gantt/js/jquery-2.1.4.min.js"></script>
<script src="<%=basePath%>control/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>control/jquery-gantt/js/jquery.fn.gantt.js"></script>
<script src="<%=basePath%>control/jquery-gantt/js/prettify.min.js"></script>
<script>

    $(function () {

        var color = [];
        var orderStatus = ["已完成", "正在生产", "逾期"];
        for (var i = 1; i <= 5; ++i) {
            color.push("ganttColor" + i);
        }
        var height = $(window).height() - 189;
        var itemEverPage = parseInt(height / 24);

        var orderTableDate = [];
        var ganttSource = [];
        $.ajax({
            url: "<%=basePath%>order/selectAll",
            type: "get",
            async: false,
            success: function (result) {
                orderTableDate = result;
            }
        });
        $.each(orderTableDate, function (key, value) {
            var t1 = value.startTime + ' 00:00:00',
                t2 = value.endTime + ' 00:00:00';
            var T1 = new Date(t1).getTime(),
                T2 = new Date(t2).getTime();
            ganttSource.push({
                name: value.orderCode, desc: value.remarks, values: [{
                    from: T1, to: T2,
                    label: "品目:"+value.items+"; 产品数量："+value.orderQuantity,
                    desc:"<div>品目："+value.items+"</div><div>产品数量："+value.orderQuantity+"</div><div>已完成："+value.actualQuantity+"</div>" +
                    "<div>订单状态："+orderStatus[value.orderStatus-1]+"</div><div>最迟交付时间："+value.latestTime+"</div>",
                    customClass: color[value.dispalyColor]
                }]
            })
        });
        console.log(ganttSource);
        //初始化gantt
        $(".gantt").gantt({
            source: ganttSource,
            navigate: 'scroll',//buttons  scroll
            scale: "days",// months  weeks days  hours
            maxScale: "months",
            minScale: "days",
            itemsPerPage: itemEverPage,
            onItemClick: function (data) {
                console.log(data);
            },
           // onAddClick: function (dt, rowId) {
           //     alert("Empty space clicked - add an item!");
           // },
            onRender: function () {
                if (window.console && typeof console.log === "function") {
                    console.log("chart rendered");
                }
            }
        });


        // //弹窗功能
        // $(".gantt").popover({
        //     selector: ".bar",
        //     title: "I'm a popover",
        //     content: "And I'm the content of said popover.",
        //     trigger: "hover",
        //     placement: "auto right"
        // });


//        prettyPrint();
    });


</script>

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
        for (var i = 1; i <= 5; ++i) {
            color.push("ganttColor" + i);
        }
        var height = $(window).height() - 189;
        var itemEverPage = parseInt(height / 24);

        var orderTableDate = [];
        var resourceTableDate = [];
        var ganttSource = [];
        $.ajax({
            url: "<%=basePath%>order/selectAll",
            type: "get",
            async: false,
            success: function (result) {
                orderTableDate = result;
            }
        });
        $.ajax({
            url: "<%=basePath%>resource/selectAll"
            , type: "get"
            , async: false
            , success: function (result) {
                resourceTableDate = result;
            }
        });

        $.each(resourceTableDate, function (key, value) {
            var t1 = '2018-04-03' + ' 00:00:00',
                t2 = '2018-04-06'+ ' 00:00:00';
            var T1 = new Date(t1).getTime(),
                T2 = new Date(t2).getTime();
            var time = T1;
            var count = Math.floor(Math.random()*10+1);
            $.each(orderTableDate, function (t, data) {
                var time1 = time,
                    time2 = time+(86400000*count);
                time=time2+86400000;
                console.log(time1+":"+ time2);
                if (t === 0) {
                    ganttSource.push({
                        name: value.resourceCode, desc: data.orderCode, values: [{
                            from: time1,
                            to: time2,
                            label: "产品数量:" + data.orderQuantity + ";品目:" + data.items,
                            customClass: color[key+1]
                        }]
                    })
                }
                else {
                    ganttSource.push({
                        name: value.resourceCode, desc: data.orderCode, values: [{
                            from: time1,
                            to: time2,
                            label: "产品数量:" + data.orderQuantity + ";品目:" + data.items,
                            customClass: color[key+1]
                        }]
                    })
                }
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

    });


</script>

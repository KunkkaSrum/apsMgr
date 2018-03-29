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
    <link rel="stylesheet" href="<%=basePath%>control/jquery-gantt/css/style.css" />
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css" />
    <link href="<%=basePath%>control/jquery-gantt/css/prettify.min.css" rel="stylesheet" />
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

        "use strict";
        var height = $(window).height() - 189;
        var itemEverPage = parseInt(height/24);
        alert($(window).height());
        //初始化gantt
        $(".gantt").gantt({
            source: [
                {
                    name: "task  1",
                    desc: "",
                    values: [{
                        from: "1320192000000",
                        to: "1320592000000",
                        label: "",
                        customClass: "ganttColor1"
                    }]
                }, {
                    name: "task  2",
                    desc: "这是描述",
                    values: [{
                        from: "1322611200000",
                        to: "1323302400000",
                        label: "",
                        customClass: "ganttColor2"
                    }]
                }, {
                    name: "task  3",
                    desc: "",
                    values: [{
                        from: "1323802400000",
                        to: "1325685200000",
                        label: "",
                        customClass: "ganttColor3"
                    }]
                }, {
                    name: "task  4",
                    desc: "描述",
                    values: [{
                        from: "1325685200000",
                        to: "1325695200000",
                        label: "",
                        customClass: "ganttColor4"
                    }]
                }, {
                    name: "task  5",
                    desc: "",
                    values: [{
                        from: "1326785200000",
                        to: "1325785200000",
                        label: "",
                        customClass: "ganttColor5"
                    }]
                }, {
                    name: "task  6",
                    desc: "",
                    values: [{
                        from: "1328785200000",
                        to: "1328905200000",
                        label: "",
                        customClass: "ganttColor6"
                    }]
                }, {
                    name: "task  7",
                    desc: "",
                    values: [{
                        from: "1330011200000",
                        to: "1336611200000",
                        label: "",
                        customClass: "ganttColor5"
                    }]
                }, {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor4"
                    }]
                },{
                    name: "task  9",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor3"
                    }]
                },
                {
                    name: "task  10",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor2"
                    }]
                },
                {
                    name: "task  11",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor1"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor4"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor3"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor5"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor6"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor1"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor2"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor4"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor3"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor5"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor6"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor2"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor4"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor3"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor1"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor4"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor5"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor6"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor2"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor3"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor5"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor6"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor2"
                    }]
                },
                {
                    name: "task  8",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor3"
                    }]
                },
                {
                    name: "task 9",
                    desc: "",
                    values: [{
                        from: "1336611200000",
                        to: "1338711200000",
                        label: "",
                        customClass: "ganttColor4"
                    }]
                },


                {
                    name: "more",
                    desc: "",
                    values: [
                        {
                            from: "1322611200000",
                            to: "1323302400000",
                            label: "",
                            customClass: "ganttColor2"
                        },
                        {
                            from: "1323802400000",
                            to: "1325685200000",
                            label: "",
                            customClass: "ganttColor4"
                        },
                        {
                            from: "1328785200000",
                            to: "1328905200000",
                            label: "",
                            customClass: "ganttColor5"
                        },

                    ]
                }],
            navigate: 'scroll',//buttons  scroll
            scale: "days",// months  weeks days  hours
            maxScale: "months",
            minScale: "days",
            itemsPerPage: itemEverPage,
            onItemClick: function (data) {
                alert("Item clicked - show some details");
            },
//            onAddClick: function (dt, rowId) {
//                alert("Empty space clicked - add an item!");
//            },
            onRender: function () {
                if (window.console && typeof console.log === "function") {
                    console.log("chart rendered");
                }
            }
        });



        //弹窗功能
        $(".gantt").popover({
            selector: ".bar",
            title: "I'm a popover",
            content: "And I'm the content of said popover.",
            trigger: "hover",
            placement: "auto right"
        });


//        prettyPrint();
    });


</script>

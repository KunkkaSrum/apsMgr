<%--
  Created by IntelliJ IDEA.
  User: 黄益华
  Date: 2018/3/21
  Time: 15:45
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
    <link rel="stylesheet" href="<%=basePath%>css/order.css">
    <link rel="stylesheet" href="<%=basePath%>css/common.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap3-editable/css/bootstrap-editable.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
</head>
<body>
<div class="container-fluid">
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default" onclick="insertRow()">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_delete" type="button" class="btn btn-default" onclick="deleteRow()">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
                <button id="btn_edit" type="button" class="btn btn-default" onclick="saveTable()">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>保存
                </button>
            </div>
            <div class="table-background table-responsive">
                <table id="orderTable" class="table text-nowrap"></table>
            </div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>js/order.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript"
        src="<%=basePath%>control/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>
<script>
    $(function () {
        // 初始化表格
        var oTable = new tableInit();
        oTable.init();
    });


    var tableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.init = function () {
            $("#orderTable").bootstrapTable({
                url: '<%=basePath%>order/selectAll',
                height: $(window).height() - 100,
                toolbar: '#toolbar',
                type: 'get',
                showColumns: true,    //是否显示所有的列
                showRefresh: true,     //是否显示刷新按钮
                minimumCountColumns: 2,    //最少显示的列
                clickToSelect: false,
                showExport: true,
                exportDataType: 'all',
                exportTypes: ['csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf'],
                columns: [
                    {checkbox: true}
                    , {field: 'orderNo', title: 'orderNo', visible: false}
                    , {
                        field: 'orderCode', title: '订单代码', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'orderType', title: '订单种类', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'orderDiffrence', title: '订单区分', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'items', title: '品目', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'orderTime', title: '订货时间', editable: {
                            type: 'date', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'deliveryTime', title: '交货期', editable: {
                            type: 'date', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'orderQuantity', title: '订单数量', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'customer', title: '客户', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'priority', title: '优先度', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'dispalyColor', title: '显示颜色', editable: {
                            type: 'select', title: '指令有效条件',
                            source: [{value: '1', text: '颜色1'}, {value: '2', text: '颜色2'},{value: '3', text: '颜色3'},{value: '4', text: '颜色4'}
                            ,{value: '5', text: '颜色5'},{value: '6', text: '颜色6'}],
                        }
                    }
                    , {
                        field: 'remarks', title: '备注', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'startTime', title: '计划开始时间', editable: {
                            type: 'date', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'endTime', title: '计划结束时间', editable: {
                            type: 'date', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'earliestTime', title: '最早开始时间', editable: {
                            type: 'date', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'latestTime', title: '最迟结束时间', editable: {
                            type: 'date', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'orderStatus', title: '订单状态', editable: {
                            type: 'select', title: '指令有效条件',
                            source:[{value:"1",text:"已完成"},{value:"2",text:"正在生产"},{value:"3", text:"逾期"}]
                        }
                    }
                    , {
                        field: 'produceEffic', title: '制造效率', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'actualStart', title: '实际开始时间', editable: {
                            type: 'date', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'actualEnd', title: '实际结束时间', editable: {
                            type: 'date', title: '指令有效条件'
                        }
                    }
                    , {
                        field: 'actualQuantity', title: '实际完成数量', editable: {
                            type: 'text', title: '指令有效条件'
                        }
                    }
                ],

                //编辑时触发
                onEditableSave: function (field, row, oldValue, $el) {
                    $("#orderTable").bootstrapTable("resetView");
                    $.ajax({
                        type: "post",
                        url: "<%=basePath%>order/update",
                        data: row,
                        success: function (data, status) {
                        },
                        error: function () {
                        }
                    });
                },
//                rowStyle: function (row, index) {
//                    var style = "";
//                    style = {};
//                    return {classes: style}
//                },
            });
            // $.fn.editable.defaults.mode = 'inline';
            $.fn.editable.defaults.placement = 'bottom';

        };
        return oTableInit;
    };

    function insertRow() {
        var timeDiffer = new Date().getTime() - new Date("2018-01-01 00:00:00").getTime();
        var orderNo = "order" + timeDiffer;
        var data = {
            orderNo: orderNo
        };
        $("#orderTable").bootstrapTable('insertRow', {
            index: $('#orderTable').bootstrapTable('getData').length,
            row: data
        });
        console.log(data);
        $.ajax({
            url: "<%=basePath%>order/insert"
            , type: "post"
            , data: data
            , success: function (result) {
                console.log("添加成功！");
            }
        })
    }

    function saveTable() {
        var tableData = $('#orderTable').bootstrapTable('getData');
        $.ajax({
            url: "<%=basePath%>"
            , type: "post"
            , data: {orderTable: tableData}
            , success: function (result) {

            }
        })
    }

    function deleteRow() {
        var ids = $.map($('#orderTable').bootstrapTable('getSelections'), function (row) {
            return row.orderNo;
        });
        console.log(ids);
        $('#orderTable').bootstrapTable('remove', {
            field: 'orderNo',
            values: ids
        });


        $.ajax({
            url: "<%=basePath%>order/delete"
            , type: "post"
            , data: {"list": ids}
            , traditional: true
            , success: function (result) {

            }
        })
    }

</script>

</body>
</html>
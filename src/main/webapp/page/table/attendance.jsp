<%--
  Created by IntelliJ IDEA.
  User: 黄益华
  Date: 2018/3/24
  Time: 10:08
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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="<%=basePath%>css/attendance.css">
    <link rel="stylesheet" href="<%=basePath%>css/common.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap3-editable/css/bootstrap-editable.css">
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
            <div class="table-background ">
                <table id="attendanceTable" class="table "></table>
            </div>
        </div>
</div>

<script type="text/javascript" src="<%=basePath%>js/attendance.js"></script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>js/attendance.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
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
            $("#attendanceTable").bootstrapTable({
                url: '<%=basePath%>attendance/selectAll',
                height: $(window).height() - 100,
                toolbar: '#toolbar',
                showColumns: true,    //是否显示所有的列
                showRefresh: true,     //是否显示刷新按钮
                minimumCountColumns: 2,    //最少显示的列
                clickToSelect: false,
                showExport: true,
                exportDataType: 'all',
                exportTypes: ['csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf'],
                columns: [
                    {checkbox: true}
                    , {field: "attendanceNo", title: "attendanceNo", visible: false}
                    , {
                        field: 'attendanceCode', title: '出勤模式代码', editable: {
                            type: 'text',
                            title: '出勤模式代码'
                        }
                    }
                    , {
                        field: 'attendanceMode', title: '模式',editable: {
                            type: 'text',
                            title: '模式'
                        }
                    }
                    , {
                        field: 'objectId', title: '对象ID', editable: {
                            type: 'text',
                            title: '对象ID'
                        }
                    }
                    , {
                        field: 'remarks', title: '备注', editable: {
                            type: 'text',
                            title: '备注'
                        }
                    }
                    , {
                        field: 'classDefine', title: '类定义', editable: {
                            type: 'text',
                            title: '类定义'
                        }
                    }
                    , {
                        field: 'updateTime', title: '更新日期', editable: {
                            type: 'date',
                            title: '更新日期', format: 'yyyy-mm-dd'
                        }
                    }
                    , {
                        field: 'produceResource', title: '生产日历资源', editable: {
                            type: 'text',
                            title: '生产日历资源',
                        }
                    }
                ],

                //编辑时触发
                onEditableSave: function (field, row, oldValue, $el) {
                    $("#attendanceTable").bootstrapTable("resetView");
                    $.ajax({
                        type: "post",
                        url: "<%=basePath%>attendance/update",
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

    $(function(){
        $('#username').editable({
            title: 'Enter username'
        });
    });
    function insertRow() {
        var timeDiffer = new Date().getTime() - new Date("2018-01-01 00:00:00").getTime();
        var attendanceNo = "atte" + timeDiffer;
        var data = {
            attendanceNo: attendanceNo,
        };
        $("#attendanceTable").bootstrapTable('insertRow', {
            index: $('#attendanceTable').bootstrapTable('getData').length,
            row: data
        });
        $.ajax({
            url: "<%=basePath%>attendance/insert"
            , type: "post"
            , data: data
            , success: function (result) {
                console.log("添加成功！");
            }
        })
    }

    function saveTable() {
        var tableData = $('#attendanceTable').bootstrapTable('getData');
        $.ajax({
            url: "<%=basePath%>"
            , type: "post"
            , data: {attendanceTable: tableData}
            , success: function (result) {

            }
        })
    }

    function deleteRow() {
        var ids = $.map($('#attendanceTable').bootstrapTable('getSelections'), function (row) {
            return row.attendanceNo;
        });
        $('#attendanceTable').bootstrapTable('remove', {
            field: 'attendanceNo',
            values: ids
        });

        $.ajax({
            url: "<%=basePath%>attendance/delete"
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
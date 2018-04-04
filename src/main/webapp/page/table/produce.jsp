<%--
  Created by IntelliJ IDEA.
  User: 黄益华
  Date: 2018/3/22
  Time: 11:12
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
    <link rel="stylesheet" href="<%=basePath%>css/produce.css">
    <link rel="stylesheet" href="<%=basePath%>css/common.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>control/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
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
            <div class="table-background table-responsive">
                <table id="produceTable" class="table text-nowrap"></table>
            </div>

</div>

<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
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

    var attendanceDate = [];
    var sourceCode = [];
    $.ajax({
        url: "<%=basePath%>attendance/selectAll"
        ,type: "get"
        ,async: false
        ,success: function (result) {
            attendanceDate = result;
            $.each(result, function (key, value) {
                sourceCode.push({value:key,text:value.attendanceCode});
            })
        }
    });


    var tableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.init = function () {
            $("#produceTable").bootstrapTable({
                url: '<%=basePath%>produce/selectAll',
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
                    , {field: 'produceNo', title: 'produceNo', visible: false}
                    , {field: 'resource', title: '资源', editable: {
                            type: 'text', title: '资源'
                        }}
                    , {field: 'produceTime', title: '日期/星期', editable: {
                            type: 'text', title: '日期/星期'
                        }}
                    , {field: 'attendanceCode', title: '出勤模式代码', editable: {
                            type: 'select', title: '出勤模式代码', source:sourceCode
                        }}
                    , {field: 'priority', title: '优先级', editable: {
                            type: 'text', title: '优先级'
                        }}
                    , {field: 'resAmout', title: '资源量', editable: {
                            type: 'text', title: '资源量'
                        }}
                    , {field: 'remark', title: '备注', editable: {
                            type: 'text', title: '备注'
                        }}
                    , {field: 'showName', title: '显示名', editable: {
                            type: 'text', title: '显示名'
                        }}
                    , {field: 'otherName', title: '别名', editable: {
                            type: 'text', title: '别名'
                        }}
                    , {field: 'commonRemark', title: '备注(共通)', editable: {
                            type: 'text', title: '备注(共通)'
                        }}
                    , {field: 'object', title: '对象', editable: {
                            type: 'text', title: '对象'
                        }}
                    , {field: 'objDefine', title: '类定义', editable: {
                            type: 'text', title: '类定义'
                        }}
                    , {field: 'defaultMarker', title: '不正确标记', editable: {
                            type: 'text', title: '不正确标记'
                        }}
                    , {field: 'reasonDefMarker', title: '立不正确标志的理由', editable: {
                            type: 'text', title: '立不正确标志的理由'
                        }}
                    , {field: 'changeMarkerInside', title: '变更标记(内部)', editable: {
                            type: 'text', title: '变更标记(内部)'
                        }}
                    , {field: 'changeMarkerOutside', title: '变更标记(外部)', editable: {
                            type: 'text', title: '变更标记(外部)'
                        }}
                    , {field: 'changeDate', title: '更新日期', editable: {
                            type: 'text', title: '更新日期'
                        }}
                    , {field: 'parentObject', title: '父对象', editable: {
                            type: 'text', title: '父对象'
                        }}
                    , {field: 'subObject', title: '子对象', editable: {
                            type: 'text', title: '子对象'
                        }}
                    , {field: 'importedObject', title: '导入的对象', editable: {
                            type: 'text', title: '导入的对象'
                        }}
                    , {field: 'rightInputObjID', title: '右侧输入指令对象ID', editable: {
                            type: 'text', title: '右侧输入指令对象ID'
                        }}
                    , {field: 'leftAssociatedObjID', title: '关联对象的左对象ID', editable: {
                            type: 'text', title: '关联对象的左对象ID'
                        }}
                ],

                //编辑时触发
                onEditableSave: function (field, row, oldValue, $el) {
                    console.log(row)
                    $("#produceTable").bootstrapTable("resetView");
                    $.ajax({
                        type: "post",
                        url: "<%=basePath%>produce/update",
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
            $.fn.editable.defaults.mode = 'inline';
        };
        return oTableInit;
    };

    function insertRow() {
        var timeDiffer = new Date().getTime() - new Date("2018-01-01 00:00:00").getTime();
        var produceNo = "pro" + timeDiffer;
        var data = {
            produceNo: produceNo,
        };
        $("#produceTable").bootstrapTable('insertRow', {
            index: $('#produceTable').bootstrapTable('getData').length,
            row: data
        });
        $.ajax({
            url: "<%=basePath%>produce/insert"
            ,type: "post"
            ,data: data
            ,success: function (result) {
                console.log("添加成功！");
            }
        })
    }

    function saveTable() {
        var tableData = $('#produceTable').bootstrapTable('getData');
        $.ajax({
            url: "<%=basePath%>"
            , type: "post"
            , data: {produceTable: tableData}
            , success: function (result) {

            }
        })
    }

    function deleteRow() {
        var ids = $.map($('#produceTable').bootstrapTable('getSelections'), function (row) {
            return row.produceNo;
        });
        $('#produceTable').bootstrapTable('remove', {
            field: 'produceNo',
            values: ids
        });
        $.ajax({
            url: "<%=basePath%>produce/delete"
            ,type: "post"
            ,data: {"list":ids}
            ,traditional: true
            ,success: function (result) {

            }
        })
    }

</script>
</body>
</html>
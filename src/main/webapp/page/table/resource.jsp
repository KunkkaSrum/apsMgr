<%--
  Created by IntelliJ IDEA.
  User: 黄益华
  Date: 2018/3/24
  Time: 13:08
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
    <link rel="stylesheet" href="<%=basePath%>control/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/resource.css">
    <link rel="stylesheet" href="<%=basePath%>css/common.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>control/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap3-editable/css/bootstrap-editable.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4" style="padding-left: 0px">
            <div style="display: flex">
                <div class="tree-bg">
                    <ul id="treeObj" class="ztree"></ul>
                </div>
                <div class="tree-bg">
                    <ul id="treeProperty" class="ztree"></ul>
                </div>
            </div>
            <div class="panel-property table-background">
                <table id="propertyTable" class="layui-table" lay-filter="propertyEdit"></table>
            </div>
        </div>
        <div class="col-md-8" style="padding-left: 5px">
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
            <div class="table-background">
                <table id="resourceTable" lay-filter="resourceEdit"></table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/resource.js"></script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"> </script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath%>control/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
<script type="text/javascript"
        src="<%=basePath%>control/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>
<script>

    /**
     * 表内编辑//https://www.cnblogs.com/songjl/p/7088356.html
     */

    $(function () {
        // 初始化表格
        var oTable = new tableInit();
        oTable.init();
    });


    var tableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.init = function () {
            $("#resourceTable").bootstrapTable({
                url: '<%=basePath%>resource/selectAll',
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
                    , {field: 'resourceNo', title: 'resourceNo', visible: false}
                    , {field: 'resourceCode', title: '资源'}
                    , {field: 'resourceName', title: '日期/星期'}
                    , {field: 'resourceBatch', title: '出勤模式代码'}
                    , {field: 'resourceDifference', title: '优先级'}
                    , {field: 'resourceType', title: '资源量'}
                    , {field: 'resourceConstraint', title: '备注'}
                    , {field: 'typeOfCost', title: '显示名'}
                    , {field: 'remarks', title: '别名'}
                    , {field: 'displayColor', title: '备注(共通)'}
                    , {field: 'bottleneckResource', title: '对象'}
                    , {field: 'invaildResource', title: '类定义'}
                    , {field: 'produceEffic', title: '不正确标记'}
                ],

                //编辑时触发
                onEditableSave: function (field, row, oldValue, $el) {
                    $("#resourceTable").bootstrapTable("resetView");
                    $.ajax({
                        type: "post",
                        url: "<%=basePath%>resource/update",
                        data: row,
                        dataType: 'JSON',
                        success: function (data, status) {
                            if (status == "success") {
                            }
                        },
                        error: function () {
                        }
                    });
                },
            });
            $.fn.editable.defaults.mode = 'inline';
        };
        return oTableInit;
    };

    function insertRow() {
        var timeDiffer = new Date().getTime() - new Date("2018-01-01 00:00:00").getTime();
        var resourceNo = "res" + timeDiffer;
        var data = {
            resourceNo: resourceNo
        };
        $("#resourceTable").bootstrapTable('insertRow', {
            index: $('#resourceTable').bootstrapTable('getData').length,
            row: data
        });
        $.ajax({
            url: "<%=basePath%>resource/insert"
            ,type: "post"
            ,data: data
            ,success: function (result) {
                console.log("添加成功！");
            }
        })
    }

    function saveTable() {
        var tableData = $('#resourceTable').bootstrapTable('getData');
        $.ajax({
            url: "<%=basePath%>"
            , type: "post"
            , data: {resourceTable: tableData}
            , success: function (result) {

            }
        })
    }

    function deleteRow() {
        var ids = $.map($('#resourceTable').bootstrapTable('getSelections'), function (row) {
            return row.resourceNo;
        });
        $('#resourceTable').bootstrapTable('remove', {
            field: 'resourceNo',
            values: ids
        });
        $.ajax({
            url: "<%=basePath%>resource/delete"
            ,type: "post"
            ,data: {"list":ids}
            ,traditional: true
            ,success: function (result) {

            }
        })
    }

</script>
<script type="text/javascript">
    layui.use('table', function () {
        var table = layui.table;


        table.render({
            elem: '#propertyTable',
            url : '<%=basePath%>json/instruction/ins_attendance.json',
            height: 'full-340',
            size: 'sm',
            // skin: 'line',
            even: true,
            page: false,
            cols: [[ //标题栏
                {field: 'property', title: '属性', width: 120}
                , {field: 'value', title: '值', width: 180}
                , {field: 'instruction', title: '说明'}
            ]]
        });
    });
</script>
<script type="text/javascript">
    var objUrl = "<%=basePath%>json/explain.json";
    var propertyUrl = "<%=basePath%>json/property.json";
    var objNodes = getTreeData(objUrl);
    var propertyNodes = getTreeData(propertyUrl);
    var setting = {
        data: {
            key: {
                title: "t"
            },
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: onClick
        }
    };

    // var log, className = "dark";
    //
    // function beforeClick(treeId, treeNode, clickFlag) {
    //     className = (className === "dark" ? "" : "dark");
    //     showLog("[ " + getTime() + " beforeClick ]&nbsp;&nbsp;" + treeNode.asd);
    //     return (treeNode.click != false);
    // }

    function onClick(event, treeId, treeNode, clickFlag) {
        showLog("[ " + getTime() + " onClick ]&nbsp;&nbsp;clickFlag = " + clickFlag + " (" + (clickFlag === 1 ? "普通选中" : (clickFlag === 0 ? "<b>取消选中</b>" : "<b>追加选中</b>")) + ")");
    }

    function showLog(str) {
        if (!log) log = $("#log");
        log.append("<li class='" + className + "'>" + str + "</li>");
        if (log.children("li").length > 8) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }
    //
    // function getTime() {
    //     var now = new Date(),
    //         h = now.getHours(),
    //         m = now.getMinutes(),
    //         s = now.getSeconds();
    //     return (h + ":" + m + ":" + s);
    // }

    $(document).ready(function () {
        $.fn.zTree.init($("#treeObj"), setting, objNodes);
        $.fn.zTree.init($("#treeProperty"), setting, propertyNodes);
    });
    //-->
</script>
</body>
</html>
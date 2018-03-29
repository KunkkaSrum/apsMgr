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
    <title></title>
    <link rel="stylesheet" href="<%=basePath%>control/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/produce.css">
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
            <div class="table-background table-responsive">
                <table id="produceTable" class="table text-nowrap"></table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
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
            $("#produceTable").bootstrapTable({
                url: '<%=basePath%>json/tableJson/produce_json.json',
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
                    , {field: 'id', title: 'ID', visible: false}
                    , {field: 'resource', title: '资源'}
                    , {field: 'date', title: '日期/星期'}
                    , {field: 'attendanceCode', title: '出勤模式代码'}
                    , {field: 'priority', title: '优先级'}
                    , {field: 'resAmount', title: '资源量'}
                    , {field: 'remark', title: '备注'}
                    , {field: 'showName', title: '显示名'}
                    , {field: 'OtherName', title: '别名'}
                    , {field: 'commonRemark', title: '备注(共通)'}
                    , {field: 'object', title: '对象'}
                    , {field: 'objDefine', title: '类定义'}
                    , {field: 'defaultMarker', title: '不正确标记'}
                    , {field: 'reasonDefMarker', title: '立不正确标志的理由'}
                    , {field: 'changeMarkerInside', title: '变更标记(内部)'}
                    , {field: 'changeMarkerOutside', title: '变更标记(外部)'}
                    , {field: 'changeDate', title: '更新日期'}
                    , {field: 'parentObject', title: '父对象'}
                    , {field: 'subObject', title: '子对象'}
                    , {field: 'ImportedObject', title: '导入的对象'}
                    , {field: 'rightInputObjID', title: '右侧输入指令对象ID'}
                    , {field: 'leftAssociatedObjID', title: '关联对象的左对象ID'}
                ],

                //编辑时触发
                onEditableSave: function (field, row, oldValue, $el) {
                    $("#produceTable").bootstrapTable("resetView");
                    $.ajax({
                        type: "",
                        url: "",
                        data: row,
                        dataType: 'JSON',
                        success: function (data, status) {
                            if (status == "success") {
                                alert('提交数据成功');
                            }
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
        var id = "produce" + timeDiffer;
        var data = {
            id: id,
            resource: "",
            date: "",
            attendanceCode: "",
            priority: "",
            resAmount: "",
            remark: "",
            showName: "",
            OtherName: "",
            commonRemark: "",
            object: "",
            objDefine: "",
            defaultMarker: "",
            reasonDefMarker: "",
            changeMarkerInside: "",
            changeMarkerOutside: "",
            changeDate: "",
            parentObject: "",
            subObject: "",
            ImportedObject: "",
            rightInputObjID: "",
            leftAssociatedObjID:""
        };
        $("#produceTable").bootstrapTable('insertRow', {
            index: $('#produceTable').bootstrapTable('getData').length,
            row: data
        });
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
            return row.id;
        });
        $('#produceTable').bootstrapTable('remove', {
            field: 'id',
            values: ids
        });
    }

</script>
<script type="text/javascript">

    // var tableData = [];

    layui.use('table', function () {
        var table = layui.table;

        <%--$.ajax({--%>
            <%--url: '<%=basePath%>json/tableJson/produce_json.json'--%>
            <%--, type: "get"--%>
            <%--, async: false--%>
            <%--, success: function (result) {--%>
                <%--tableData = result;--%>
            <%--}--%>
        <%--});--%>
        <%--//第一个实例--%>
        <%--table.render({--%>
            <%--elem: '#produceTable'--%>
            <%--, height: 'full-100'--%>
            <%--, cellMinWidth: 120--%>
            <%--, page: false //开启分页--%>
            <%--, size: 'sm'--%>
            <%--, cols: [[ //表头--%>
                <%--{field: 'id', title: 'ID', align: 'center', fixed: 'left'}--%>
                <%--, {field: 'resource', title: '资源', edit: 'text', align: 'center'}--%>
                <%--, {field: 'date', title: '日期/星期', edit: 'text', align: 'center'}--%>
                <%--, {field: 'attendanceCode', title: '出勤模式代码', align: 'center', edit: 'text'}--%>
                <%--, {field: 'priority', title: '优先级', align: 'center', edit: 'text'}--%>
                <%--, {field: 'resAmount', title: '资源量', align: 'center', edit: 'text'}--%>
                <%--, {field: 'remark', title: '备注', align: 'center', edit: 'text'}--%>
                <%--, {field: 'showName', title: '显示名', align: 'center', edit: 'text'}--%>
                <%--, {field: 'OtherName', title: '别名', align: 'center', edit: 'text'}--%>
                <%--, {field: 'commonRemark', title: '备注(共通)', align: 'center', edit: 'text'}--%>
                <%--, {field: 'object', title: '对象', align: 'center', edit: 'text'}--%>
                <%--, {field: 'objDefine', title: '类定义', align: 'center', edit: 'text'}--%>
                <%--, {field: 'defaultMarker', title: '不正确标记', align: 'center', edit: 'text'}--%>
                <%--, {field: 'reasonDefMarker', title: '立不正确标志的理由', align: 'center', edit: 'text'}--%>
                <%--, {field: 'changeMarkerInside', title: '变更标记(内部)', align: 'center', edit: 'text'}--%>
                <%--, {field: 'changeMarkerOutside', title: '变更标记(外部)', align: 'center', edit: 'text'}--%>
                <%--, {field: 'changeDate', title: '更新日期', align: 'center', edit: 'text'}--%>
                <%--, {field: 'parentObject', title: '父对象', align: 'center', edit: 'text'}--%>
                <%--, {field: 'subObject', title: '子对象', align: 'center', edit: 'text'}--%>
                <%--, {field: 'ImportedObject', title: '导入的对象', align: 'center', edit: 'text'}--%>
                <%--, {field: 'rightInputObjID', title: '右侧输入指令对象ID', align: 'center', edit: 'text'}--%>
                <%--, {field: 'leftAssociatedObjID', title: '关联对象的左对象ID', align: 'center', edit: 'text'}--%>
            <%--]]--%>
            <%--, data: tableData.data--%>
            <%--, limit: tableData.count--%>
        <%--});--%>

        table.render({
            elem: '#propertyTable',
            url: '<%=basePath%>json/instruction/ins_attendance.json',
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

        // //监听单元格编辑
        // table.on('edit(produceEdit)', function (obj) {
        //     var value = obj.value //得到修改后的值
        //         , data = obj.data //得到所在行所有键值
        //         , field = obj.field; //得到字段
        //     layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
        // });

        // $("#tableAdd").click(function () {
        //     var addData = table.cache["produceTable"];
        //     var oneData = {
        //         "id": 1022,
        //         "resource": "",
        //         "date": "",
        //         "attendanceCode": "",
        //         "priority": "",
        //         "resAmount": "",
        //         "remark": "",
        //         "showName": "",
        //         "OtherName": "",
        //         "commonRemark": "",
        //         "object": "",
        //         "objDefine": "",
        //         "defaultMarker": "",
        //         "reasonDefMarker": "",
        //         "changeMarkerInside": "",
        //         "changeMarkerOutside": "",
        //         "changeDate": "",
        //         "parentObject": "",
        //         "subObject": "",
        //         "ImportedObject": "",
        //         "rightInputObjID": "",
        //         "leftAssociatedObjID": ""
        //     };
        //     addData.push(oneData);
        //     table.reload("produceTable", {
        //         data: addData
        //     })
        // });
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
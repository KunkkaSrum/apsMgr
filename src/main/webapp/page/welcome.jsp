<%--
  Created by IntelliJ IDEA.
  User: 黄益华
  Date: 2018/3/21
  Time: 11:08
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
    <link rel="stylesheet" href="<%=basePath%>css/bom.css">
    <link rel="stylesheet" href="<%=basePath%>css/common.css">
    <%--<link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css">--%>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap-table/bootstrap-table.min.css">


    <script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>control/bootstrap-table/bootstrap-table.min.js"></script>
    <%--<script type="text/javascript" src="<%=basePath%>control/bootstrap3-editable/js/bootstrap-editable.min.js"></script>--%>
    <script type="text/javascript"
            src="<%=basePath%>control/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>
    <%--<link rel="stylesheet" href="<%=basePath%>control/bootstrap3-editable/css/bootstrap-editable.css">--%>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-4">

        </div>
        <div class="col-sm-12">
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_edit" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
            </div>
            <div class="table-background">
                <table id="bomTable" class="table-responsive"></table>
            </div>

        </div>
    </div>
</div>




<%--<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>--%>
<%--<script type="text/javascript" src="<%=basePath%>control/bootstrap/js/bootstrap.min.js"></script>--%>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bom.js"></script>

<%--<script type="text/javascript" src="<%=basePath%>control/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>--%>

<%--<script>--%>
    <%--$(function () {--%>
        <%--// 初始化表格--%>
        <%--var oTable = new tableInit();--%>
        <%--oTable.init();--%>
    <%--});--%>


    <%--var tableInit = function () {--%>
        <%--var oTableInit = new Object();--%>
        <%--//初始化Table--%>
        <%--oTableInit.init = function () {--%>
            <%--$("#bomTable").bootstrapTable({--%>
                <%--url: '<%=basePath%>bom/all',--%>
                <%--height: $(window).height() - 100,--%>
                <%--toolbar: '#toolbar',--%>
                <%--type: 'get',--%>
                <%--showColumns: true,    //是否显示所有的列--%>
                <%--showRefresh: true,     //是否显示刷新按钮--%>
                <%--minimumCountColumns: 2,    //最少显示的列--%>
                <%--clickToSelect: false,--%>
                <%--showExport: true,--%>
                <%--exportDataType: 'all',--%>
                <%--exportTypes: ['csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf'],--%>
                <%--columns: [--%>
                    <%--{checkbox: true}--%>
                    <%--, {field: "bomNo", title: "bomNo", visible: false}--%>
                    <%--, {--%>
                        <%--field: 'items', title: '品目', width: 200, editable: {--%>
                            <%--type: 'text', title: '品目'--%>
                        <%--}--%>
                    <%--}--%>
                    <%--, {--%>
                        <%--field: 'procedureNumber', title: '工序编号',--%>
                        <%--editable: {--%>
                            <%--type: 'date',--%>
                            <%--title: '工序编号'--%>
                        <%--}--%>
                    <%--}--%>
                    <%--, {--%>
                        <%--field: 'procedureCode', title: '工序代码', editable: {--%>
                            <%--type: 'text', title: '工序代码'--%>
                        <%--}--%>
                    <%--}--%>
                    <%--, {--%>
                        <%--field: 'resources', title: '资源', width: 200, editable: {--%>
                            <%--type: 'text', title: '资源'--%>
                        <%--}--%>
                    <%--}--%>
                    <%--, {--%>
                        <%--field: 'resourcePriority', title: '资源优先度', width: 200, editable: {--%>
                            <%--type: 'text', title: '资源优先度'--%>
                        <%--}--%>
                    <%--}--%>
                    <%--, {--%>
                        <%--field: 'frontSet', title: '前设置', editable: {--%>
                            <%--type: 'text', title: '前设置'--%>
                        <%--}--%>
                    <%--}--%>
                <%--],--%>

                <%--//编辑时触发--%>
                <%--onEditableSave: function (field, row, oldValue, $el) {--%>
                    <%--$("#bomTable").bootstrapTable("resetView");--%>
                    <%--$.ajax({--%>
                        <%--type: "post",--%>
                        <%--url: "<%=basePath%>bom/update",--%>
                        <%--data: row,--%>
                        <%--success: function (data, status) {--%>
                        <%--},--%>
                        <%--error: function () {--%>
                        <%--}--%>
                    <%--});--%>
                <%--},--%>
<%--//                rowStyle: function (row, index) {--%>
<%--//                    var style = "";--%>
<%--//                    style = {};--%>
<%--//                    return {classes: style}--%>
<%--//                },--%>
            <%--});--%>
            <%--$.fn.editable.defaults.mode = 'inline';--%>
        <%--};--%>
        <%--return oTableInit;--%>
    <%--};--%>

    <%--function insertRow() {--%>
        <%--var timeDiffer = new Date().getTime() - new Date("2018-01-01 00:00:00").getTime();--%>
        <%--var bomNo = "bom" + timeDiffer;--%>
        <%--var data = {--%>
            <%--bomNo: bomNo,--%>

        <%--};--%>
        <%--$("#bomTable").bootstrapTable('insertRow', {--%>
            <%--index: $('#bomTable').bootstrapTable('getData').length,--%>
            <%--row: data--%>
        <%--});--%>
        <%--$.ajax({--%>
            <%--url: "<%=basePath%>bom/insert"--%>
            <%--, type: "post"--%>
            <%--, data: data--%>
            <%--, success: function (result) {--%>
                <%--console.log("添加成功！");--%>
            <%--}--%>
        <%--})--%>
    <%--}--%>

    <%--function saveTable() {--%>
        <%--var tableData = $('#bomTable').bootstrapTable('getData');--%>
        <%--$.ajax({--%>
            <%--url: "<%=basePath%>"--%>
            <%--, type: "post"--%>
            <%--, data: {bomTable: tableData}--%>
            <%--, success: function (result) {--%>

            <%--}--%>
        <%--})--%>
    <%--}--%>

    <%--function deleteRow() {--%>
        <%--var ids = $.map($('#bomTable').bootstrapTable('getSelections'), function (row) {--%>
            <%--return row.bomNo;--%>
        <%--});--%>
        <%--console.log(ids);--%>
        <%--$('#bomTable').bootstrapTable('remove', {--%>
            <%--field: 'bomNo',--%>
            <%--values: ids--%>
        <%--});--%>

        <%--$.ajax({--%>
            <%--url: "<%=basePath%>bom/delete"--%>
            <%--, type: "post"--%>
            <%--, data: {"list": ids}--%>
            <%--, traditional: true--%>
            <%--, success: function (result) {--%>

            <%--}--%>
        <%--})--%>
    <%--}--%>

<%--</script>--%>


</body>
</html>
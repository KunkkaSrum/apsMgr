<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/13
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>客户列表</title>
    <link rel="stylesheet" href="<%=basePath%>control/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/common.css">
</head>
<div class="body-border">
    <div style="width: 100%;height:90%">
        <fieldset class="layui-elem-field field-style" style="width: 100%;height:100%">
            <legend>用户组列表</legend>
            <div class="layui-btn-group table-btn">
                <button class="layui-btn" onclick="addUser()">增加</button>
                <button class="layui-btn">删除</button>
            </div>
            <div style="margin-left: 10px;margin-right:10px">
                <table id="clientTable" lay-filter="clientListen"></table>
            </div>
        </fieldset>
    </div>
    <div>

    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script>
    layui.use(['table', 'element', 'form'], function () {
        var table = layui.table,
            form = layui.form,
            element = layui.element,
            $ = layui.jquery;
        table.render({
            elem: '#clientTable'
            , url: '<%=basePath%>json/basedate/client.json'
            , type: 'get'
            , height: 'full-150'
            , page: false
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'clientNo', title: '客户编号'}
                , {field: 'clientName', title: '客户姓名'}
                , {field: 'clientPhone', title: '客户电话'}
                , {field: 'clientCompany', title: '所属公司'}
                , {field: 'clientMail', title: '电子邮箱'}
                , {field: 'orderNo', title: '订单编号'}
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]
        });
    });
</script>
</body>
</html>

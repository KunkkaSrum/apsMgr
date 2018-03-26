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
    <link rel="stylesheet" href="<%=basePath%>css/bom.css">
</head>
<body>
<div class="table-btn">
    <button class="layui-btn">新增</button>
    <button class="layui-btn">删除</button>
    <button class="layui-btn">保存</button>
    <button class="layui-btn">导入</button>
    <button class="layui-btn">导出</button>
</div>
<div class="table-div">
    <table id="bomTable" lay-filter="test"></table>
</div>


<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bom.js"></script>
<script type="text/javascript">
    layui.use('table', function () {
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#bomTable'
            , height: 'full-100'
            , cellMinWidth: 150
            , url: '<%=basePath%>json/bomData.json' //数据接口
            , page: false //开启分页
            , cols: [[ //表头
                {field: 'id', title: 'ID', sort: true, edit: 'text', align: 'center', fixed: 'left'}
                , {field: 'username', title: '用户名', edit: 'text', align: 'center'}
                , {field: 'sex', title: '性别', edit: 'text', align: 'center', sort: true}
                , {field: 'city', title: '城市', align: 'center', edit: 'text'}
                , {field: 'sign', title: '签名', align: 'center', edit: 'text'}
                , {field: 'experience', title: '积分', align: 'center', edit: 'text', sort: true}
                , {field: 'score', title: '评分', align: 'center', edit: 'text', sort: true}
                , {field: 'classify', title: '职业', align: 'center', edit: 'text'}
                , {field: 'wealth', title: '财富', align: 'center', edit: 'text', sort: true}
            ]]
        });

        //监听单元格编辑
        table.on('edit(test)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
        });
    });
</script>
</body>
</html>
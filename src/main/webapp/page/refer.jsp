<%--
  Created by IntelliJ IDEA.
  User: 黄益华
  Date: 2018/4/1
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>control/layui/css/layui.css">
    <%--<link rel="stylesheet" href="<%=basePath%>css/common.css">--%>
    <link rel="stylesheet" href="<%=basePath%>control/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style type="text/css">
        .refer-body {
            width: 800px;
            height: 400px;
        }

        .tree-bg {
            /*display: flex;*/
            /*width: calc(50% - 5px);*/
            background-color: white;
            overflow: auto;
            height: 300px;
            margin-top: 10px;
            margin-right: 10px;
            margin-left: 5px;
            /*border-radius: -5px;*/
            -moz-box-shadow: 1px 1px 5px #474747;
            -webkit-box-shadow: 1px 1px 5px #474747;
            box-shadow: 1px 1px 5px #474747;
        }
    </style>
</head>
<body>
<div class="layui-container refer-body">
    <div class="layui-row" style="padding-left: 0px">
        <div class="layui-col-sm4">
            <div class="tree-bg">
                <ul id="treeObj" class="ztree"></ul>
            </div>
        </div>
        <div class="layui-col-sm8">
            <table id="propertyTable" style="margin-top: 0;padding-top: 0" class="layui-table" lay-filter="propertyEdit"></table>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>control/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript">
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#propertyTable',
            url: '<%=basePath%>json/instruction/td000.json',
            height: 'full',
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
    var objNodes = getTreeData(objUrl);
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


    function onClick(event, treeId, treeNode, clickFlag) {
        // showLog("[ " + getTime() + " onClick ]&nbsp;&nbsp;clickFlag = " + clickFlag + " (" + (clickFlag === 1 ? "普通选中" : (clickFlag === 0 ? "<b>取消选中</b>" : "<b>追加选中</b>")) + ")");
        var table = layui.table;
        table.reload('propertyTable', {url:"<%=basePath%>json/instruction/"+treeNode.tableId+".json"});
    }

    function showLog(str) {
        if (!log) log = $("#log");
        log.append("<li class='" + className + "'>" + str + "</li>");
        if (log.children("li").length > 8) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }

    $(document).ready(function () {
        $.fn.zTree.init($("#treeObj"), setting, objNodes);
    });
    //-->
</script>
</body>
</html>

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
    <%--<link rel="stylesheet" href="<%=basePath%>css/demo.css" type="text/css">--%>
    <link rel="stylesheet" href="<%=basePath%>css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.ztree.excheck.js"></script>
</head>
<body>


    <div class="zTreeDemoBackground left">
        <ul id="treeDemo" class="ztree"></ul>
    </div>
    <button class="layui-btn" onclick="onclickget()">点击</button>


<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
<script>
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };
    var data = [
        {
            "id": 10000,
            "username": "user-0",
            "sex": "女",
            "city": "城市-0",
            "sign": "签名-0",
            "experience": 255,
            "logins": 24,
            "wealth": 82830700,
            "classify": "作家",
            "score": 57
        },
        {
            "id": 10001,
            "username": "user-1",
            "sex": "男",
            "city": "城市-0",
            "sign": "签名-1",
            "experience": 884,
            "logins": 58,
            "wealth": 64928690,
            "classify": "词人",
            "score": 27
        },
        {
            "id": 10002,
            "username": "user-2",
            "sex": "女",
            "city": "城市-1",
            "sign": "签名-2",
            "experience": 650,
            "logins": 77,
            "wealth": 6298078,
            "classify": "酱油",
            "score": 31
        },
        {
            "id": 10003,
            "username": "user-3",
            "sex": "女",
            "city": "城市-1",
            "sign": "签名-3",
            "experience": 362,
            "logins": 157,
            "wealth": 37117017,
            "classify": "诗人",
            "score": 68
        },
        {
            "id": 10004,
            "username": "user-4",
            "sex": "男",
            "city": "城市-1",
            "sign": "签名-4",
            "experience": 807,
            "logins": 51,
            "wealth": 76263262,
            "classify": "作家",
            "score": 6
        },
        {
            "id": 10005,
            "username": "user-5",
            "sex": "女",
            "city": "城市-1",
            "sign": "签名-5",
            "experience": 173,
            "logins": 68,
            "wealth": 60344147,
            "classify": "作家",
            "score": 87
        },
        {
            "id": 10006,
            "username": "user-6",
            "sex": "女",
            "city": "城市-2",
            "sign": "签名-6",
            "experience": 982,
            "logins": 37,
            "wealth": 57768166,
            "classify": "作家",
            "score": 34
        },
        {
            "id": 10007,
            "username": "user-7",
            "sex": "男",
            "city": "城市-2",
            "sign": "签名-7",
            "experience": 727,
            "logins": 150,
            "wealth": 82030578,
            "classify": "作家",
            "score": 28
        }
    ];
    var zNodes = [];
    var city = ["城市-0", "城市-1", "城市-2"];
    for (var j = 0; j < city.length; ++j) {
        zNodes.push({id: 1 + "" + j, pId: -1, name: city[j]});
    }
    for (var i = 0; i < data.length; ++i) {
        for (var j = 0; j < city.length; ++j) {
            if (data[i].city === city[j]) {
                zNodes.push({id: "city" + j, pId: 1 + "" + j, personId: data[i].id, name: data[i].username})
            }
        }
    }

    var code;

//    function setCheck() {
//        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
//            py = $("#py").attr("checked") ? "p" : "",
//            sy = $("#sy").attr("checked") ? "s" : "",
//            pn = $("#pn").attr("checked") ? "p" : "",
//            sn = $("#sn").attr("checked") ? "s" : "",
//            type = {"Y": py + sy, "N": pn + sn};
//        zTree.setting.check.chkboxType = type;
//        showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
//    }
//
//    function showCode(str) {
//        if (!code) code = $("#code");
//        code.empty();
//        code.append("<li>" + str + "</li>");
//    }

    $(document).ready(function () {
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
//        setCheck();
//        $("#py").bind("change", setCheck);
//        $("#sy").bind("change", setCheck);
//        $("#pn").bind("change", setCheck);
//        $("#sn").bind("change", setCheck);
    });

    function onclickget() {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var c = [];
        for (var i = 0; i < nodes.length; i++) {
            if (nodes[i].isParent != true) {
//                c += nodes[i].id + ",";
                c.push(nodes[i].personId);
//                alert(c);
            }
        }


    }

</script>
</body>
</html>
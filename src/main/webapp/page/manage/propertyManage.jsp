<%--
  Created by IntelliJ IDEA.
  User: 黄益华
  Date: 2018/3/22
  Time: 21:42
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
    <link rel="stylesheet" href="<%=basePath%>css/common.css">
    <link rel="stylesheet" href="<%=basePath%>control/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
<div class="body-border">
    <div style="width: 100%;height:90%">
        <fieldset class="layui-elem-field field-style" style="width: 100%;height:100%">
            <legend>权限管理</legend>
            <div class="layui-btn-group table-btn">
                <button class="layui-btn" onclick="addUser()">增加</button>
                <button class="layui-btn">删除</button>
            </div>
            <div style="margin-left: 10px;margin-right:10px">
                <table id="roleTable" lay-filter="roleListen"></table>
            </div>
        </fieldset>
    </div>
    <div>

    </div>
</div>
<div id="addRole" style="display: none">
    <form class="layui-form layui-form-pane" action="" style="padding:10px">
        <div class="layui-form-item" style="display: none">
            <div class="layui-input-block">
                <input name="roleNo" class="layui-input" type="text" autocomplete="off" value="0">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色名</label>
            <div class="layui-input-block">
                <input name="roleName" class="layui-input" type="text" placeholder="请输入角色名" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <ul id="treeObj" class="ztree"></ul>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-filter="submitAddRole" lay-submit="">立即提交</button>
                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
            </div>
        </div>
    </form>
</div>
<div id="editRole" style="display: none">
    <form class="layui-form layui-form-pane" action="" style="padding:10px">
        <div class="layui-form-item" style="display: none">
            <div class="layui-input-block">
                <input id="roleNo" name="roleNo" class="layui-input" type="text" autocomplete="off" value="0">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色名</label>
            <div class="layui-input-block">
                <input id="roleName" name="roleName" class="layui-input" type="text" placeholder="请输入角色名" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <ul id="treeEdit" class="ztree"></ul>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-filter="submitRole" lay-submit="">立即提交</button>
                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="status">
    <input type="checkbox" name="lock" value="{{d.roleNo}}" title="启用" lay-filter="lockDemo" {{ d.roleStatus== 1
           ? 'checked' : '' }}>
</script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=basePath%>control/zTree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script>

    var objUrl = "<%=basePath%>userResource/selectAll";
    var objNodes = getTreeData(objUrl);
    var data = [{id:"role", pId:-1, name:"角色列表", open:true}];
    $.each(objNodes, function (key, value) {
        data.push({id:value.resourceNo,pId:"role", name:value.resourceText, resourceNo: value.resourceNo});
    });

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



    $(document).ready(function () {
        $.fn.zTree.init($("#treeObj"), setting, data);
        $.fn.zTree.init($("#treeEdit"), setting, data);
    });
</script>
<script>

    $.ajax({
        url: '<%=basePath%>role/selectAll'
        , type: 'get'
        , async: false
        , success: function (result) {
            var data = result.data;
            var html = "<option value=''></option>";
            $.each(data, function (key, value) {
                html += "<option value=" + value.roleNo + ">" + value.roleName + "</value>"
            });
            $("#roleNames").html(html);
        }
    });


    layui.use(['table', 'element', 'form'], function () {
        var table = layui.table,
            form = layui.form,
            element = layui.element,
            $ = layui.jquery;


        table.render({
            elem: '#roleTable'
            , url: '<%=basePath%>role/selectAll'
            , type: 'get'
            , height: 'full-150'
            , page: false
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'roleNo', title: '角色ID'}
                , {field: 'roleName', title: '角色名称'}
                , {field: 'roleStatus', title: '启用状态', templet: '#status'}
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        table.on('tool(roleListen)', function (obj) {
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url: '<%=basePath%>role/delete?roleNo='+obj.data.roleNo
                        , type: 'post'
                        , success: function (result) {

                        }
                    })
                });
            } else if (layEvent === 'edit') {
                $("#roleName").val(data.roleName);
                $("#roleNo").val(data.roleNo);
                layer.open({
                    type: 1
                    , title: '修改用户信息'
                    , shade: 0.3
                    , area: ['500px', '500px']
                    , id: 'LAY_layuipro'
                    , moveType: 1
                    , content: $('#editRole')
                });
            }
        });

        form.on('submit(submitRole)', function (data) {
            var zTree = $.fn.zTree.getZTreeObj("treeEdit");
            var nodes=zTree.getChangeCheckedNodes(true);
            var resourceNoList = [];
            $.each(nodes, function (key, value) {
                if(value.level === 1) {
                    resourceNoList.push(value.resourceNo);
                }
            });
            $.ajax({
                url: '<%=basePath%>role/updateRoleResource?roleNo='+data.field.roleNo+'&resourceNoList='+resourceNoList
                , type: 'post'
                , success: function (result) {
                    console.log("修改成功")
                }
            })
            return true;
        });

        form.on('submit(submitAddRole)', function (data) {
            var timeDiffer = new Date().getTime() - new Date("2018-01-01 00:00:00").getTime();
            var roleNo = "role" + timeDiffer;
            var zTree = $.fn.zTree.getZTreeObj("treeObj");
            var nodes=zTree.getChangeCheckedNodes(true);
            var resourceNoList = [];
            $.each(nodes, function (key, value) {
                if(value.level === 1) {
                    resourceNoList.push(value.resourceNo);
                }
            });

            $.ajax({
                url: '<%=basePath%>role/insert?roleNo='+roleNo+'&roleName='+data.field.roleName+'&resourceNoList='+resourceNoList
                , type: 'post'
                , success: function (result) {
                    console.log("新增成功")
                }
            });

        });

        form.on('checkbox(lockDemo)', function (obj) {
            var t = 0;
            if (obj.elem.checked) {
                t = 1;
            }
            var roleBo = {roleNo: this.value, roleStatus: t};
            $.ajax({
                url: "<%=basePath%>role/update"
                , type: "post"
                , data: roleBo
                , success: function (result) {
                    console.log(result);
                }
            })
        });
    });

    function addUser() {
        layer.open({
            type: 1
            , title: '新增用户'
            , shade: 0.3
            , area: ['500px', '500px']
            , id: 'LAY_USER'
            , moveType: 1
            , content: $('#addRole')
        });
    }
</script>

</body>
</html>

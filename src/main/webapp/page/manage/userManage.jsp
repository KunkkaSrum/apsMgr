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
    <style type="text/css">

    </style>
</head>
<body>
<div class="body-border">
    <div style="width: 100%;height:90%">
        <fieldset class="layui-elem-field field-style" style="width: 100%;height:100%">
            <legend>用户组列表</legend>
            <div class="layui-btn-group table-btn">
                <button class="layui-btn" onclick="addUser()">增加</button>
                <button class="layui-btn">删除</button>
            </div>
            <div style="margin-left: 10px;margin-right:10px">
                <table id="userTable" lay-filter="userListen"></table>
            </div>
        </fieldset>
    </div>
    <div>

    </div>
</div>
<div id="addUser" style="display: none">
    <form class="layui-form layui-form-pane" action="" style="padding:10px">
        <div class="layui-form-item">
            <label class="layui-form-label">用户权限</label>
            <div class="layui-input-inline">
                <select id="roleNames" name="roleNo">
                    <option></option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input name="userName" class="layui-input" type="text" placeholder="请输入用户名" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">用户ID</label>
            <div class="layui-input-block">
                <input name="userNo" class="layui-input" type="text"  autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-block">
                <input name="realName" class="layui-input" type="text" placeholder="请输入真实姓名" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">公司名</label>
            <div class="layui-input-block">
                <input name="companyName" class="layui-input" type="text" placeholder="请输入公司名" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单位地址</label>
            <div class="layui-input-block">
                <input name="companyAddress" class="layui-input" type="text" placeholder="请输入单位地址" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input name="telephone" class="layui-input" type="text" placeholder="请输入手机号" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input name="mail" class="layui-input" type="text" placeholder="请输入邮箱" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-filter="submitAddUser" lay-submit="">立即提交</button>
                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
            </div>
        </div>
    </form>
</div>
<div id="editUser" style="display: none">
    <form class="layui-form layui-form-pane" action="" style="padding:10px">
        <div class="layui-form-item">
            <label class="layui-form-label">用户权限</label>
            <div class="layui-input-inline">
                <select id="roleName" name="roleNo">
                    <option value="0">请选择省</option>
                    <option value="1" selected="">浙江省</option>
                    <option value="2">江西省</option>
                    <option value="3">福建省</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input id="userName" name="userName" class="layui-input" type="text" placeholder="请输入用户名" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">用户ID</label>
            <div class="layui-input-block">
                <input id="userNo" name="userNo" class="layui-input" type="text"  autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-block">
                <input id="realName" name="realName" class="layui-input" type="text" placeholder="请输入真实姓名" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">公司名</label>
            <div class="layui-input-block">
                <input id="companyName" name="companyName" class="layui-input" type="text" placeholder="请输入公司名" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单位地址</label>
            <div class="layui-input-block">
                <input id="companyAddress" name="companyAddress" class="layui-input" type="text" placeholder="请输入单位地址" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input id="telephone" name="telephone" class="layui-input" type="text" placeholder="请输入手机号" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input id="mail" name="mail" class="layui-input" type="text" placeholder="请输入邮箱" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-filter="submitUser" lay-submit="">立即提交</button>
                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script>

    $.ajax({
        url: '<%=basePath%>role/selectAll'
        ,type: 'get'
        ,async: false
        ,success: function (result) {
            var data = result.data;
            var html = "<option value=''></option>";
            $.each(data, function (key, value) {
                html+="<option value="+value.roleNo+">"+value.roleName+"</value>"
            });
            $("#roleNames").html(html);
            console.log(html)
        }
    });


    layui.use(['table', 'element', 'form'], function () {
        var table = layui.table,
            form = layui.form,
            element = layui.element,
            $ = layui.jquery;


        table.render({
            elem: '#userTable'
            , url: '<%=basePath%>user/selectAll'
            , type: 'get'
            , height: 'full-150'
            , page: false
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'userName', title: '用户名'}
                , {field: 'realName', title: '真实姓名'}
                , {field: 'companyName', title: '公司名'}
                , {field: 'companyAddress', title: '单位地址'}
                , {field: 'telephone', title: '电话'}
                , {field: 'mail', title: '邮箱'}
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        table.on('tool(userListen)', function (obj) {
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url: '<%=basePath%>user/delete'
                        , type: 'post'
                        , data: obj.data
                        , success: function (result) {

                        }
                    })
                });
            } else if (layEvent === 'edit') {
                $("#roleName").val(data.roleNo);
                $("#userNo").val(data.userNo);
                $("#userName").val(data.userName);
                $("#realName").val(data.realName);
                $("#companyName").val(data.companyName);
                $("#companyAddress").val(data.companyAddress);
                $("#telephone").val(data.telephone);
                $("#mail").val(data.mail);
                layer.open({
                    type: 1
                    , title: '修改用户信息'
                    , shade: 0.3
                    , area: ['500px','500px']
                    , id: 'LAY_layuipro'
                    , moveType: 1
                    , content: $('#editUser')
                });
            }
        });

        form.on('submit(submitUser)', function(data){
            $.ajax({
                url: '<%=basePath%>user/update'
                ,type: 'post'
                ,data: data.field
                ,success: function (result) {
                    console.log("修改成功")
                }
            })
            return true;
        });

        form.on('submit(submitAddUser)', function(data){
            var timeDiffer = new Date().getTime() - new Date("2018-01-01 00:00:00").getTime();
            var userNo = "user" + timeDiffer;
            var data=data.field;
            data.userNo =userNo;
            console.log(data);
            $.ajax({
                url: '<%=basePath%>user/insert'
                ,type: 'post'
                ,data: data
                ,success: function (result) {
                    console.log("修改成功")
                }
            })
            return true;
        });
    });
    function addUser() {
        layer.open({
            type: 1
            , title: '新增用户'
            , shade: 0.3
            , area: ['500px','500px']
            , id: 'LAY_USER'
            , moveType: 1
            , content: $('#addUser')
        });
    }
</script>

</body>
</html>

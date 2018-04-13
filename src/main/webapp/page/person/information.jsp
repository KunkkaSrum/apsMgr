<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>control/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/information.css">
</head>
<body>
<div style="text-align: center">
    <div class="layui-tab layui-tab-brief div-tab-info" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li class="layui-this">个人信息</li>
            <li>帐号安全</li>
            <li>数据管理</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">用户名</label>
                        <div class="col-sm-4">
                            <input type="text" id="userName" autocomplete="off" class="form-control" placeholder="用户名"
                                   disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">真实姓名</label>
                        <div class="col-sm-4">
                            <input type="text" id="realName" class="form-control" lay-verify="name" name="realName"
                                   placeholder="真实姓名">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">企业名称</label>
                        <div class="col-sm-4">
                            <input type="text" id="companyName" class="form-control" name="companyName"
                                   placeholder="企业名称">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">单位地址</label>
                        <div class="col-sm-4">
                            <input type="text" id="address" class="form-control" name="address" placeholder="单位地址">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">手机号</label>
                        <div class="col-sm-4">
                            <input type="text" id="telephone" lay-verify="telephone" autocomplete="off"
                                   class="form-control" name="telephone" placeholder="手机号">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">邮箱</label>
                        <div class="col-sm-4">
                            <input type="text" id="mail" lay-verify="mail" class="form-control" name="mail"
                                   placeholder="邮箱">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">注册时间</label>
                        <div class="col-sm-4">
                            <input type="text" id="registerTime" class="form-control" placeholder="2018-01-12" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button class="btn btn-primary" lay-submit="" lay-filter="demo1">保存</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="layui-tab-item">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">旧密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="oldPassword" lay-verify="oldPassword"  placeholder="请输入旧密码"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="newPassword" lay-verify="newPassword" placeholder="请输入新密码"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="againPassword" lay-verify="againPassword" placeholder="再次输入密码"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button class="btn btn-primary" lay-submit="" lay-filter="demo1">确认修改</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="layui-tab-item">

            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<%--<script type="text/javascript" src="<%=basePath%>js/information.js"></script>--%>
<script type="text/javascript" src="<%=basePath%>control/bootstrap/js/bootstrap.min.js"></script>
<script>
    var data = [];
    function init() {
        $.ajax({
            url: "<%=basePath%>json/basedate/user.json"
            , type: 'get'
            , async: false
            , success: function (result) {
                data = result
            }
        });

        $("#userName").val(data.userName);
        $("#realName").val(data.realName);
        $("#companyName").val(data.companyName);
        $("#address").val(data.address);
        $("#telephone").val(data.telephone);
        $("#mail").val(data.mail);
        $("#registerTime").val(data.registerTime);
    }

    init();
    layui.use(['form', 'element', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //自定义验证规则
        form.verify({
            telephone: function (value) {
                if ((value.length != 0 && value.length < 7) || value.length > 12) {
                    return "手机号不正确！";
                }
            }
            , mail: [/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/, "邮箱不正确"]
            , oldPassword: function (value) {
                if(value !==data.password) {
                    return "旧密码输入不正确"
                }
            }
        });
        //监听提交
        form.on('submit(demo1)', function (data) {
            var userVo = data.field;
            $.ajax({
                url: "<%=basePath%>user/update"
                , type: "post"
                , success: function (result) {
                    layer.alert(result);
                }
            })
            return false;
        });
    });
</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/26
  Time: 13:55
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
    <link rel="stylesheet" href="<%=basePath%>css/information.css">
    <link rel="stylesheet" href="<%=basePath%>control/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div style="text-align: center">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li class="layui-this">个人信息</li>
            <li>帐号安全</li>
            <li>数据管理</li>
        </ul>
        <div class="layui-tab-content" style="height: 100px;">
            <div class="layui-tab-item layui-show">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label  class="col-sm-2 layui-form-label">用户名</label>
                        <div class="col-sm-4">
                            <input type="text" autocomplete="off" class="form-control" placeholder="用户名" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">真实姓名</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" lay-verify="name"  name="realName" placeholder="真实姓名">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">企业名称</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="companyName" placeholder="企业名称">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">单位地址</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="address" placeholder="单位地址">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">手机号</label>
                        <div class="col-sm-4">
                            <input type="text" lay-verify="telephone" autocomplete="off"  class="form-control" name="telephone" placeholder="手机号">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">邮箱</label>
                        <div class="col-sm-4">
                            <input type="text"  lay-verify="mail" class="form-control" name="mail" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="col-sm-2 layui-form-label">注册时间</label>
                        <div class="col-sm-4">
                            <input type="text"  class="form-control"  placeholder="2018-01-12" disabled>
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
                        <label class="layui-form-label">单行输入框</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">验证必填项</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">验证手机</label>
                            <div class="layui-input-inline">
                                <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">验证邮箱</label>
                            <div class="layui-input-inline">
                                <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">多规则验证</label>
                            <div class="layui-input-inline">
                                <input type="text" name="number" lay-verify="required|number" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">验证日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">验证链接</label>
                            <div class="layui-input-inline">
                                <input type="tel" name="url" lay-verify="url" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">验证身份证</label>
                        <div class="layui-input-block">
                            <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">自定义验证</label>
                        <div class="layui-input-inline">
                            <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
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
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;


        //自定义验证规则
        form.verify({
            telephone: function (value) {
                if((value.length!=0&&value.length <7)||value.length>12) {
                    return "手机号不正确！";
                }
            }
            ,mail: [/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,"邮箱不正确"]

        });



        //监听提交
        form.on('submit(demo1)', function(data){
            var userVo = data.field;
            $.ajax({
                url: "<%=basePath%>user/update?userBo="+ userVo
                ,type: "post"
                ,success: function (result) {
                    layer.alert(result);
                }
            })
        });

    });
</script>
</body>
</html>

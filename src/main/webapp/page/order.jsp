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
    <link rel="stylesheet" href="<%=basePath%>css/order.css">
</head>
<body>
<form class="layui-form layui-form-pane" action="">
    <div></div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input name="title" autocomplete="off" placeholder="请输入标题" class="layui-input" type="text">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">短输入框</label>
        <div class="layui-input-inline">
            <input name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input"
                   type="text">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">日期选择</label>
            <div class="layui-input-block">
                <input name="date" id="date1" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">行内表单</label>
            <div class="layui-input-inline">
                <input name="number" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input name="password" placeholder="请输入密码" autocomplete="off" class="layui-input" type="password">
        </div>
        <div class="layui-form-mid layui-word-aux">请务必填写用户名</div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">范围</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input name="price_min" placeholder="￥" autocomplete="off" class="layui-input" type="text">
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline" style="width: 100px;">
                <input name="price_max" placeholder="￥" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">单行选择框</label>
        <div class="layui-input-block">
            <select name="interest" lay-filter="aihao">
                <option value=""></option>
                <option value="0">写作</option>
                <option value="1" selected="">阅读</option>
                <option value="2">游戏</option>
                <option value="3">音乐</option>
                <option value="4">旅行</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">行内选择框</label>
        <div class="layui-input-inline">
            <select name="quiz1">
                <option value="">请选择省</option>
                <option value="浙江" selected="">浙江省</option>
                <option value="你的工号">江西省</option>
                <option value="你最喜欢的老师">福建省</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <select name="quiz2">
                <option value="">请选择市</option>
                <option value="杭州">杭州</option>
                <option value="宁波" disabled="">宁波</option>
                <option value="温州">温州</option>
                <option value="温州">台州</option>
                <option value="温州">绍兴</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <select name="quiz3">
                <option value="">请选择县/区</option>
                <option value="西湖区">西湖区</option>
                <option value="余杭区">余杭区</option>
                <option value="拱墅区">临安市</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">开关-开</label>
        <div class="layui-input-block">
            <input checked="" name="open" lay-skin="switch" lay-filter="switchTest" title="开关" type="checkbox">
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input name="sex" value="男" title="男" checked="" type="radio">
            <input name="sex" value="女" title="女" type="radio">
            <input name="sex" value="禁" title="禁用" disabled="" type="radio">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">文本域</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交</button>
    </div>
</form>
<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/order.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });


    });
</script>
</body>
</html>
基础
系统管理：
个人中心：
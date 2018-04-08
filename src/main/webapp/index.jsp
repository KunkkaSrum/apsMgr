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
    <title>欢迎使用计划排程系统</title>
    <link rel="stylesheet" href="<%=basePath%>control/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>control/static/css/style.css">
    <link rel="icon" href="<%=basePath%>control/static/image/code.png">
</head>
<body>

<!-- layout admin -->
<div class="layui-layout layui-layout-admin">
    <!-- header -->
    <div class="layui-header my-header">
        <a href="index.html">
            <!--<img class="my-header-logo" src="" alt="logo">-->
            <div class="my-header-logo">计划排程系统</div>
        </a>
        <div class="my-header-btn">
            <button class="layui-btn layui-btn-small btn-nav btn-color"><i class="layui-icon">&#xe617;</i></button>
        </div>

        <!-- 顶部左侧添加选项卡监听 -->
        <ul class="layui-nav" lay-filter="side-top-left">
        </ul>

        <!-- 顶部右侧添加选项卡监听 -->
        <ul class="layui-nav my-header-user-nav" lay-filter="side-top-right">
            <li class="layui-nav-item">
                <a class="name" href="javascript:;"><img src="<%=basePath%>control/static/image/universe.jpg" alt="logo"> Admin </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" href-url="<%=basePath%>page/person/information.jsp"><i class="layui-icon">&#xe621;</i>个人中心</a></dd>
                    <dd><div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                        <button data-method="setTop" class="layui-btn">录入说明</button>
                    </div></dd>
                    <dd><a href="<%=basePath%>login.jsp"><i class="layui-icon">&#xe621;</i>退出</a>
                </dl>
            </li>
        </ul>
    </div>
    <!-- side -->
    <div class="layui-side my-side">
        <div class="layui-side-scroll">
            <!-- 左侧主菜单添加选项卡监听 -->
            <ul class="layui-nav layui-nav-tree" lay-filter="side-main">
             </ul>
        </div>
    </div>
    <!-- body -->
    <div class="layui-body my-body">
        <div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="1"><span><i class="layui-icon">&#xe638;</i>首页</span></li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe id="iframe" src="<%=basePath%>page/welcome.jsp" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <div class="layui-footer my-footer">
        <p>2018 © copyright 2014211420</p>
    </div>
</div>


<!-- 右键菜单 -->
<div class="my-dblclick-box none">
    <table class="layui-tab dblclick-tab">
        <tr class="card-refresh">
            <td><i class="layui-icon">&#x1002;</i>刷新当前标签</td>
        </tr>
        <tr class="card-close">
            <td><i class="layui-icon">&#x1006;</i>关闭当前标签</td>
        </tr>
        <tr class="card-close-all">
            <td><i class="layui-icon">&#x1006;</i>关闭所有标签</td>
        </tr>
    </table>
</div>

<script type="text/javascript" src="<%=basePath%>control/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>control/static/js/vip_comm.js"></script>
<script type="text/javascript">
    layui.use(['layer','vip_nav'], function () {

        // 操作对象
        var layer       = layui.layer
            ,vipNav     = layui.vip_nav
            ,$          = layui.jquery;

        <%--// 顶部左侧菜单生成 [请求地址,过滤ID,是否展开,携带参数]--%>
        <%--vipNav.top_left('<%=basePath%>/json/nav_top_left.json','side-top-left',false);--%>
        // 主体菜单生成 [请求地址,过滤ID,是否展开,携带参数]
        vipNav.main('<%=basePath%>json/nav_main.json','side-main',true);
        var active = {
            setTop: function() {
                var that = this;
                // you code ...
                layer.open({
                    type: 2 //此处以iframe举例
                    , title: '信息说明'
                    , area: ['800px', '400px']
                    , shade: 0
                    , maxmin: true
                    , offset: [ //为了演示，随机坐标
                        $(window).height() - 400
                        , $(window).width() - 800
                    ]
                    , content: '<%=basePath%>page/refer.jsp'
                    // , btn: ['继续弹出', '全部关闭'] //只是为了演示
                    , yes: function () {
                        $(that).click();
                    }
                    , btn2: function () {
                        layer.closeAll();
                    }

                    , zIndex: layer.zIndex //重点1
                    , success: function (layero) {
                        layer.setTop(layero); //重点2
                    }
                });

            }
        }
        $('#layerDemo .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
</script>
</body>
</html>
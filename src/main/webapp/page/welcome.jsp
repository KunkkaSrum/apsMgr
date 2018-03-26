<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/9
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>首页</title>
</head>
<body onload="init()">
<iframe src="qwe.jsp" frameborder="0"></iframe>
<script type="text/javascript" src="<%=basePath%>control/dahua/ocxfun.js"></script>
<object id="DPSDK_OCX" classid="CLSID:D3E383B6-765D-448D-9476-DFD8B499926D"
        style="position: absolute;width: 45%;left:0px;top:70px;height:65%;z-index: 999;"
        codebase="DpsdkOcx.cab#version=1.0.0.0"></object>
</body>
</html>

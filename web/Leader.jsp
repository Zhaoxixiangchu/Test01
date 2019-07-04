<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/26
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>领导个人后台</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.js"></script>
    <%
        if(session.getAttribute("id")==null) {
/*            PrintWriter pw = response.getWriter();
            pw.println("<script>alert('非法访问，请先登录！');</script>");*/
            response.sendRedirect("index.jsp");
        }
    %>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">领导个人后台</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><span>当前用户：</span>${name}</li>
            <li class="layui-nav-item" style="padding-left: 30px"><span>职位：</span>${identify}</li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!--左侧导航-->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <dl class="layui-nav-child">
                        <dd data-name="Info">
                            <a href="LeaderInfo?user_id=${id}" target="main">查看个人信息</a>
                        </dd>
                        <dd>
                            <a href="LeaderApproval" target="main">审批申请查阅</a>
                        </dd>
                        <dd>
                            <a href="PersonnelMatters" target="main">员工人事调整</a>
                        </dd>
                        <dd>
                            <a href="index.jsp">退出</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body" id="LAY_app_body">
        <!--内容主体-->
        <div style="padding: 15px;height: 90%;">
            <iframe id="main" name="main" src="" style="overflow: visible" scrolling="no" frameborder="no" width="100%" height="100%"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!--底部-->
        &copy;刘朋雨制作
    </div>
</div>

<script>
    layui.use('element',function () {
        var element = layui.element;
    });

    layui.use('form',function () {
        var form = layui.form;

        form.render({

        })
    })
</script>
</body>
</html>

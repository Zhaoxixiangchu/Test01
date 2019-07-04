<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/25
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工个人审批情况</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="js/jquery-3.3.1.js"></script>
    <%
        if(session.getAttribute("id")==null) {
/*            PrintWriter pw = response.getWriter();
            pw.println("<script>alert('非法访问，请先登录！');</script>");*/
            response.sendRedirect("index.jsp");
        }
    %>
</head>
<body>
<div>
    <button class="layui-btn layui-btn-danger" type="button" onclick="Insert_Approval()">新建审批</button>
</div>

<blockquote class="layui-elem-quote layui-text" style="margin-top: 20px">
    个人审批情况查看
</blockquote>

<div style="width: 1350px;">
    <table  class="layui-hide" id="demo" lay-filter="test"></table>
</div>



<script src="layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['table','layer'],function () {
        var table = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer;

        table.render({
            elem:'#demo',
            height:321,
            url:'${pageContext.request.contextPath}/Appr?user_id=${id}',
            page:true,
            cols:[[
                {field:'worker_approval_id',title:'审批编号',width:100,align:'center'},
                {field:'worker_id',title:'申请人编号',width:100,align:'center'},
                {field:'worker_name',title:'申请人',width:100,align:'center'},
                {field:'worker_approval',title:'审批标题',width:140,align:'center'},
                {field:'worker_date',title:'申请时间',width:130,align:'center'},
                {field:'worker_reason',title:'原因',width:240,align:'center'},
                {field:'worker_status',title:'审批状态',width:130,align:'center'},
                {field:'worker_dept',title:'部门',width:200,align:'center'},
                {field:'worker_address',title:'地址',width:200,align:'center'}
            ]],

            done:function (res) {
                console.log(res);
            }
        });
    });

    function Insert_Approval () {
        layer.open({
            type:2,
            title:'新建审批',
            area:["700px","640px"],
            shadeClose:0,
            content: "Insert_Approval.jsp"
        });
    }
</script>


</body>
</html>

<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/26
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>审批申请查阅</title>
    <link href="layui/css/layui.css" rel="stylesheet" media="all">
    <script src="layui/layui.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
    <STYLE type="text/css">
        .laytable-cell-radio {
            padding: 14px 15px 0 15px;
        }
    </STYLE>

    <%
        if(session.getAttribute("id")==null) {
/*            PrintWriter pw = response.getWriter();
            pw.println("<script>alert('非法访问，请先登录！');</script>");*/
            response.sendRedirect("index.jsp");
        }
    %>

</head>


<body>

<blockquote class="layui-elem-quote layui-text" style="margin-top: 20px">
    审批申请查阅-------点击审批状态栏进行修改，点击保存可以对审批结果进行保存
</blockquote>
<div style="width: 76%;">
    <table  class="layui-hide" id="demo" lay-filter="test"></table>
</div>

<script type="text/html" id="toolbars">
    <%--<div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="Modify">审核审批</button>
    </div>--%>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="save" lay-submit="save" lay-filter="save">保存</a>

</script>






<script type="text/javascript">
    layui.use(['table','layer'],function () {
        var table = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer;



        table.render({
            elem:'#demo',
            height:470,
            url:'${pageContext.request.contextPath}/FindApproval',
            toolbar:'#toolbar',
            page:true,
            cols:[[
                // {type:'radio',width:60},
                {field:'worker_approval_id',title:'审批编号',width:100,align:'center'},
                {field:'worker_id',title:'申请人编号',width:100,align:'center'},
                {field:'worker_name',title:'申请人',width:100,align:'center'},
                {field:'worker_approval',title:'审批标题',width:140,align:'center'},
                {field:'worker_date',title:'申请时间',width:130,align:'center'},
                {field:'worker_reason',title:'原因',width:220,align:'center'},
                {field:'worker_dept',title:'部门',width:130,align:'center'},
                {field:'worker_address',title:'地址',width:130,align:'center'},
                {field:'worker_status',title:'审批状态',width:130,align:'center',edit:'text'},
                {title:'操作',align:'center',toolbar:'#toolbars'}
            ]]
              /*  done:function (res) {
                console.log(res);
            }*/


        });


        table.on('tool(test)',function (obj) {
            /*var value = data.value;
            var field = data.field;*/
            var data = obj.data;
            if(obj.event=='save'){
                // layer.alert('查看:<br>'+JSON.stringify(data));
                $.ajax({
                    url:'${pageContext.request.contextPath}/Save',
                    type:"post",
                    data:{'worker_approval_id':data.worker_approval_id,'worker_status':data.worker_status},
                    async:true,
                    dataType:"json",
                    success:function (data) {
                        if(data.msg!='0'){
                            console.log(data);
                            layer.alert('保存审批成功!',{
                                icon:1,
                                shadeClose:0,
                                title:'提示'
                            },function () {
                                layer.close(layer.index);
                                // window.parent.location.reload();
                            });
                        }else {
                            layer.alert('保存审批失败!',{
                                icon:5,
                                title:'提示'
                            });
                        }
                        table.render();
                    }
                });
            }
        });

      /*  table.on('submit(save)',function (data) {
            console.log(JSON.stringify(data.worker_status));
            $.ajax({
                url:'${pageContext.request.contextPath}/save',
                type:"post",
                data:{'worker_approval_id':data.worker_approval_id,'worker_status':data.worker_status},
                async:false,
                dataType:"json",
                success:function (data) {
                    if(data.msg!='0'){
                        console.log(data);
                        layer.alert('保存审批成功!',{
                            icon:1,
                            title:'提示'
                        },function () {
                            layer.close(layer.index);
                            window.parent.location.reload();
                        });
                    }else {
                        layer.alert('保存审批失败!',{
                            icon:5,
                            title:'提示'
                        });
                    }
                    table.render();
                }
            });
            return false;
        });*/
    });
</script>

</body>

</html>

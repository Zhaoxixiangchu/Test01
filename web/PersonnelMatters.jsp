<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/28
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>员工人事调整</title>
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
    员工人事调整-------点击部门栏和职位栏、工作地点可以进行编辑，点击保存可以对调整结果进行保存
</blockquote>
<div style="width: 79%;">
    <table  class="layui-hide" id="demo" lay-filter="test"></table>
</div>

<script type="text/html" id="toolbars">

    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="save" lay-submit="save" lay-filter="save">保存</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="del" lay-submit="del" lay-filter="del">删除</a>

</script>
<%--
<script type="text/html" id="selection">
    <select name="Dept">
        <option value="">--请选择部门--</option>
        <option value="技术部">技术部</option>
        <option value="人事部">人事部</option>
        <option value="策划部">策划部</option>
    </select>
</script>--%>




<script type="text/javascript">
    layui.use(['table','layer'],function () {
        var table = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer;



        table.render({
            elem:'#demo',
            height:470,
            url:'${pageContext.request.contextPath}/FindAllInfo',
            toolbar:'#toolbar',
            page:true,
            cols:[[
                // {type:'radio',width:60},
                {field:'worker_id',title:'员工编号',width:100,align:'center',sort:true},
                {field:'worker_name',title:'姓名',width:100,align:'center'},
                {field:'worker_gen',title:'性别',width:100,align:'center'},
                {field:'worker_age',title:'年龄',width:140,align:'center'},
                {field:'worker_dept',title:'部门',width:130,align:'center',edit:'text'},
                {field:'worker_position',title:'职位',width:220,align:'center',edit:'text'},
                {field:'worker_address',title:'工作地点',width:130,align:'center',edit:'text'},
                {field:'worker_phone',title:'联系电话',width:130,align:'center'},
                {field:'worker_email',title:'邮箱',width:130,align:'center'},
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
                layer.confirm('确定要保存该员工信息吗？',{btn:['确定','取消'],title:'提示'},function () {
                $.ajax({
                    url:'${pageContext.request.contextPath}/SaveInfo',
                    type:"post",
                    data:{'worker_id':data.worker_id,'worker_dept':data.worker_dept,'worker_position':data.worker_position,'worker_address':data.worker_address},
                    async:false,
                    dataType:"json",
                    success:function (data) {
                        if(data.msg!='0'){
                            console.log(data);
                            layer.alert('保存成功!',{
                                icon:1,
                                title:'提示'
                            },function () {
                                layer.close(layer.index);
                                // window.parent.location.reload();
                            });
                        }else {
                            layer.alert('保存失败!',{
                                icon:5,
                                title:'提示'
                            });
                        }
                        table.render();
                    }
                });
                });
            }

            else{
                layer.confirm('确定要删除该员工吗？',{btn:['确定','取消'],title:'提示'},function () {
                    $.ajax({
                        url:'${pageContext.request.contextPath}/Del',
                        type:"post",
                        data:{'worker_id':data.worker_id},
                        async:false,
                        dataType:"json",
                        success:function (data) {
                            if(data.msg!='0'){
                                console.log(data);
                                layer.alert('删除成功!',{
                                    icon:1,
                                    title:'提示'
                                },function () {
                                    layer.close(layer.index);
                                    // $(".layui-laypage-btn")[0].click()
                                    obj.del();
                                    // table.reload();
                                    // window.parent.location.reload();
                                });
                            }else {
                                layer.alert('删除失败!',{
                                    icon:5,
                                    title:'提示'
                                });
                            }
                            table.render();
                        }
                    });
                });
            }
        });
    });
</script>

</body>

</html>

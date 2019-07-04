<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/25
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新建审批</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
</head>
<%
    if(session.getAttribute("id")==null) {
/*            PrintWriter pw = response.getWriter();
            pw.println("<script>alert('非法访问，请先登录！');</script>");*/
        response.sendRedirect("index.jsp");
    }
%>
<body>

<!--新建审批-->
<div class="layui-row" style="margin-top: 10px;">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">员工编号</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" required lay-verify="required" name="worker_id" value="${id}" readonly>
            </div>
            <div class="layui-form-mid layui-word-aux">不可修改</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">申请人</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" required lay-verify="required" readonly value="${name}" name="worker_name">
            </div>
            <div class="layui-form-mid layui-word-aux">不可修改</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">部门</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" required lay-verify="required" name="worker_dept">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" required lay-verify="required"  name="worker_address">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" required lay-verify="required" name="worker_approval">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">时间</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" required id="worker_date" name="worker_date">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">原因</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea" type="text" required lay-verify="required" name="worker_reason"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 15%;margin-top: 60px">
            <button class="layui-btn layui-btn-warm" lay-submit="sub" lay-filter="sub">添加</button>
            <button type="reset" class="layui-btn layui-btn-normal">重置</button>
        </div>
    </form>
</div>





<script>
    layui.use(['form','layedit','laydate'],function () {
        form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        laydate.render({
            elem:'#worker_date'
        });
        form.render();




        //监听提交
        form.on('submit(sub)',function (data) {
            // layer.alert(JSON.stringify(data.field ));
            // console.log(JSON.stringify(data.field));
            //提交表单发送请求
            $.ajax({
                url:"${pageContext.request.contextPath}/InsertApproval",
                type:"post",
                async:false,
                data:data.field,
                dataType:"json",
                success:function (data) {
                    if(data.msg!='0'){
                        console.log(data);
                        layer.alert('新建审批成功!',{
                            icon:1,
                            title:'提示'
                        },function () {
                            layer.close(layer.index);
                            window.parent.location.reload();
                        });
                    }else {
                        layer.alert('新建审批失败!',{
                            icon:5,
                            title:'提示'
                        });
                    }
                    form.render();
                }
            });
            return false;
        });
    });
</script>
</body>
</html>

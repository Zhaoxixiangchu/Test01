<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/26
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>领导个人信息</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.all.js"></script>
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
<div class="layui-card-header">查看修改个人信息</div>
<div class="layui-card-body">
    <form class="layui-form" action="">
        <c:forEach items="${list}" var="l">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="leader_name" value="${l.leader_name}" readonly>
                </div>
                <div class="layui-form-mid layui-word-aux">不可修改</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <input name="leader_gen" type="text" class="layui-input" value="${l.leader_gen}" readonly>
                </div>
                <div class="layui-form-mid layui-word-aux">不可修改</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">编号</label>
                <div class="layui-input-inline">
                    <input name="leader_id" type="text" class="layui-input" value="${l.leader_id}" readonly>
                </div>
                <div class="layui-form-mid layui-word-aux">不可修改</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input name="leader_pwd" type="text" class="layui-input" required lay-verify="pass" value="${l.leader_pwd}" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-inline">
                    <input name="leader_age" type="text" class="layui-input" required value="${l.leader_age}" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-inline">
                    <input name="leader_phone" type="text" class="layui-input" required lay-verify="phone" value="${l.leader_phone}" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input name="leader_email" type="text" class="layui-input" required lay-verify="email" value="${l.leader_email}" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">职位</label>
                <div class="layui-input-inline">
                    <input name="leader_position" type="text" class="layui-input" required value="${l.leader_position}" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身份证号码</label>
                <div class="layui-input-inline">
                    <input name="leader_IDNUM" type="text" class="layui-input" required lay-verify="identity" value="${l.leader_IDNUM}" >
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="sub" lay-filter="sub" id="test9">修改</button>
                </div>
            </div>
        </c:forEach>

    </form>
</div>


<script>
    layui.use(['form','layedit'],function () {
        form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;

        form.render();

        //自定义验证
        form.verify({
            pass:[/(.+){6,16}$/,'密码必须在6到16位之间']
            ,content:function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(sub)',function (data) {
            // layer.alert(JSON.stringify(data.field ));
            console.log(JSON.stringify(data.field));
            //提交表单发送请求
            $.ajax({
                url:"${pageContext.request.contextPath}/EditLeader",
                type:"post",
                async:false,
                data:data.field,
                dataType:"json",
                success:function (data) {
                    if(data.msg!='0'){
                        console.log(data);
                        layer.alert('修改成功!',{
                            icon:1,
                            title:'提示'
                        },function () {
                            layer.close(layer.index);
                            // window.parent.location.reload();
                        });
                    }else {
                        layer.alert('修改失败!',{
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

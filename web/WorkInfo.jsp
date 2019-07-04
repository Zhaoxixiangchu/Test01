<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/24
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工个人信息</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.all.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
    <style type="text/css">
        .layui-input{
           height: 30px;
        }
        .layui-btn,layui-btn-sm{
            margin-top: -10px;
        }
    </style>
</head>
<%
    if(session.getAttribute("id")==null) {
/*            PrintWriter pw = response.getWriter();
            pw.println("<script>alert('非法访问，请先登录！');</script>");*/
        response.sendRedirect("index.jsp");
    }
%>
<body>
<%--    <div class="layui-card-header">查看修改个人信息</div>--%>
    <div class="layui-card-body">
        <form class="layui-form" action="">
            <c:forEach items="${list}" var="l">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="worker_name" value="${l.worker_name}" readonly>
                    </div>
                    <div class="layui-form-mid layui-word-aux">不可修改</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-inline">
                        <input name="worker_gen" type="text" class="layui-input" value="${l.worker_gen}" readonly>
                    </div>
                    <div class="layui-form-mid layui-word-aux">不可修改</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">编号</label>
                    <div class="layui-input-inline">
                        <input name="worker_id" type="text" class="layui-input" value="${l.worker_id}" readonly>
                    </div>
                    <div class="layui-form-mid layui-word-aux">不可修改</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input name="worker_pwd" type="text" class="layui-input" required lay-verify="pass" value="${l.worker_pwd}" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-inline">
                        <input name="worker_age" type="text" class="layui-input" required lay-verify="required" value="${l.worker_age}" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-inline">
                        <input name="worker_phone" type="text" class="layui-input" required lay-verify="phone" value="${l.worker_phone}" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-inline">
                        <input name="worker_email" type="text" class="layui-input" required lay-verify="email" value="${l.worker_email}" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">职位</label>
                    <div class="layui-input-inline">
                        <input name="worker_position" type="text" class="layui-input" required lay-verify="required" value="${l.worker_position}" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">部门</label>
                    <div class="layui-input-inline">
                        <input name="worker_dept" type="text" class="layui-input" required lay-verify="required" value="${l.worker_dept}" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">地址</label>
                    <div class="layui-input-inline">
                        <input name="worker_address" type="text" class="layui-input" required lay-verify="required" value="${l.worker_address}" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">身份证号码</label>
                    <div class="layui-input-inline">
                        <input name="worker_IDNUM" type="text" class="layui-input" required  lay-verify="identity" value="${l.worker_IDNUM}" >
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-sm" lay-submit="sub" lay-filter="sub" id="test9">修改</button>
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
                    url:"${pageContext.request.contextPath}/EditWorker",
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

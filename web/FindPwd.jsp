<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/24
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    session.invalidate();
%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <base href="<%=basePath%>">
    <title>找回密码</title>
</head>
<link href="css/main.css" rel="stylesheet">
<link href="layui/css/layui.css" rel="stylesheet">
<script src="layui/layui.all.js"></script>

<body>

<script type="text/javascript">
    var flag = "${flag}";
    console.log(flag)
    if(flag==null){

    }
    if(flag == "true"){
        layer.alert('重置成功！',{
            icon:1,
            title:"提示"
        });
    }
    if(flag=="false"){
        layer.alert('重置失败，请检查ID，用户名，身份证号码是否正确！',{
            icon:5,
            title:'提示'
        });
    }
</script>




<form class="layui-form" action="${pageContext.request.contextPath}/FindPWD" method="post" >
    <div class="container">
        <div class="layui-form-mid layui-word-aux " style="margin-left: 45%">
            <label>密码找回</label>
        </div>
        <div class="layui-form-item" style="margin-left: 20px;">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="user_name" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 20px;">
            <label class="layui-form-label">编 &nbsp;&nbsp;号</label>
            <div class="layui-input-inline">
                <input type="text" name="user_id" required  lay-verify="required" placeholder="请输入编号" autocomplete="off" class="layui-input verity">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 20px;">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="user_pwd" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 20px;">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-inline">
                <input type="text" name="user_idnum" required lay-verify="identity" placeholder="请输入身份证号码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" style="margin-left: 40px;">身 &nbsp;&nbsp;份</label>
            <div class="layui-input-inline">
                <select name="identify" required lay-verify="required">
                    <option value="">请选择身份</option>
                    <option value="领导">领导</option>
                    <option value="员工">员工</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit >找回密码</button>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
</script>

</body>
</html>
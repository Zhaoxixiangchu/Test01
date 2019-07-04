<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/24
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户注册</title>
</head>
<link rel="stylesheet" href="layui/css/layui.css">
<script src="layui/layui.all.js"></script>
<body>
<script type="text/javascript">
    var flag = "${flag}";
    if(flag == null){

    }
    if(flag == "true"){
        layer.alert('恭喜你，注册成功，快去登录吧！',{
            icon:1,
            title:'提示'
        });
    }
    if(flag == "false"){
        layer.alert('注册失败，编号或者身份证号码已存在，请核对后再进行注册!',{
            icon:5,
            title:'提示'
        });
    }
</script>

<%--border: black solid 1px;width: 50%;height: auto;margin-top: 5%;--%>
<div class="layui-form" style="margin-left: 28%;">
    <form name="Register" action="${pageContext.request.contextPath}/Register" method="post" onsubmit="return Verify()">
        <div style="float: left;">
            <div class="layui-form-item" style="padding-top: 10px;">
                <label class="layui-form-label" style="font-size: 18px;">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="Name" class="layui-input" required lay-verify="required" style="width: 100px;height: 35px;" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">性别</label>
                <div  class="layui-input-block" >
                    <input type="radio" name="sex" value="男" title="男">
                    <input type="radio" name="sex" value="女" title="女" checked>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">年龄</label>
                <div class="layui-input-block">
                    <input type="text" name="Age" class="layui-input" style="width: 50px;height: 35px;" required lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">编号</label>
                <div class="layui-input-block">
                    <input type="text" name="Id" class="layui-input" style="width: 150px;height: 35px;" required lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">职位</label>
                <div class="layui-input-block">
                    <input type="text" name="Position" class="layui-input" style="width: 150px;height: 35px;" required lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">部门</label>
                <div class="layui-input-block">
                    <input type="text" name="dept" class="layui-input" style="width: 150px;height: 35px;" required lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">地址</label>
                <div class="layui-input-block">
                    <input type="text" name="address" class="layui-input" style="width: 150px;height: 35px;" required lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="Email"  required lay-verify="email" class="layui-input" style="width: 200px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">电话</label>
                <div class="layui-input-block">
                    <input type="text" name="Phone" required lay-verify="phone" class="layui-input" style="width: 150px;height: 35px;" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">身份证号</label>
                <div class="layui-input-block">
                    <input type="text" name="IDNUM"  required lay-verify="identity" class="layui-input" style="width: 150px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="Pwd" id="Pwd" class="layui-input" style="width: 150px;height: 35px;" required lay-verify="pass">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">确认密码</label>
                <div class="layui-input-block">
                    <input type="password" name="ConfirmPwd" required lay-verify="required" id="ConfirmPwd" class="layui-input" style="width: 150px;height: 35px;" >
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 20%;margin-top: 10%;">
                <button class="layui-btn layui-btn-danger" type="submit" lay-submit>注册</button>
                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function Verify() {
            if(document.Register.Pwd.value!=document.Register.ConfirmPwd.value){
                layer.alert('请确保两次输入的密码一致',{
                    icon:5,
                    title:'提示'
                });
                return false;
            }
        }

        layui.use('form',function(){
            var form = layui.form;
            //刷新界面 所有元素
            form.render();

            form.verify({
                pass:[/(.+){6,16}$/,'密码必须在6到16位之间']
                ,content:function (value) {
                    layedit.sync(editIndex);
                }
            });

        });
    </script>


</div>
</body>
</html>

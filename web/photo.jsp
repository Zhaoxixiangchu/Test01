<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/6/29
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .layui-upload-img{
            width: 92px; height: 92px; margin: 0 10px 10px 0;
        }
    </style>
</head>
<link href="layui/css/layui.css" rel="stylesheet" media="all">
<script src="layui/layui.js" charset="utf-8"></script>
<script src="js/jquery-3.3.1.js"></script>




<div class="layui-upload">
    <button type="button" class="layui-btn" id="test1">上传图片</button>
    <div class="layui-upload-list">
        <img class="layui-upload-img" id="demo1">
        <p id="demoText"></p>
    </div>
</div>

<script>
    layui.use('upload',function () {
       var $ = layui.jquery
       ,upload = layui.upload;

       var  uploadInst = upload.render({
           elem:'#test1',
           url:'/upload',
           accept:'images',
           exts:'jpg|png|gif|bmp|jpeg',
           before:function (obj) {
               obj.preview(function (index,file,result) {
                   $('#demo1').attr('src',result);
               });
           }
           ,done:function (res) {
               if(res.code>0){
                   return layer.msg('上传失败');
               }else {
                   return layer.msg('上传成功');
               }
           }
           ,error:function () {
               var demoText = $('#demoText');
               demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
               demoText.find('demo-reload').on('click',function () {
                   uploadInst.upload();
               });

           }
       });
    });
</script>
</body>
</html>

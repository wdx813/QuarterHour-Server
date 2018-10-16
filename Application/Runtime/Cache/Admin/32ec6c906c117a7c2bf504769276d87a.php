<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录--一刻钟·婚礼服务后台管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="/Public/admin/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/Public/admin/css/login.css" media="all" />
	<link rel="icon" href="/Public/admin/images/favicon.ico">
</head>
<body>
	<video class="video-player" preload="auto" autoplay="autoplay" loop="loop" data-height="1080" data-width="1920" height="1080" width="1920">
	    <source src="/Public/admin/video/login.mp4" type="video/mp4">
	    <!-- 此视频文件为支付宝所有，在此仅供样式参考，如用到商业用途，请自行更换为其他视频或图片，否则造成的任何问题使用者本人承担，谢谢 -->
	</video>
	<div class="video_mask"></div>
	<div class="login">
	    <h1>一刻钟·婚礼服务后台管理</h1>
	    <form class="layui-form">
	    	<div class="layui-form-item">
				<input class="layui-input" name="username" placeholder="用户名" lay-verify="required" type="text" autocomplete="off">
		    </div>
		    <div class="layui-form-item">
				<input class="layui-input" name="password" placeholder="密码" lay-verify="required" type="password" autocomplete="off">
		    </div>
		    <div class="layui-form-item form_code">
				<input class="layui-input" name="code" placeholder="验证码" lay-verify="required" type="text" autocomplete="off">
				<div class="code"><img id="imgCode" src="/login/verify_create" width="116" height="36"></div>
		    </div>
			<button class="layui-btn login_btn" lay-submit="" lay-filter="login">登录</button>
		</form>
	</div>
	<script type="text/javascript" src="/Public/admin/layui/layui.js"></script>
	<script type="text/javascript">
        layui.config({
            base : "js/"
        }).use(['form','layer'],function(){
            var form = layui.form(),
                layer = parent.layer === undefined ? layui.layer : parent.layer,
                $ = layui.jquery;
            //video背景
            // $(window).resize(function(){
            //     if($(".video-player").width() > $(window).width()){
            //         $(".video-player").css({"height":$(window).height(),"width":"auto","left":-($(".video-player").width()-$(window).width())/2});
            //     }else{
            //         $(".video-player").css({"width":$(window).width(),"height":"auto","left":-($(".video-player").width()-$(window).width())/2});
            //     }
            // }).resize();

            // 点击图片更换验证码
            $("#imgCode").click(function () {
                $("#imgCode").attr("src", "/login/verify_create");
            });

            //登录按钮事件
            form.on("submit(login)",function(data){
				$.ajax({
                    url: "/login/login_check",
					type: "POST",
					data: data.field,
					dataType: 'JSON',
					success: function (res) {
						console.log('登录成功', res);
						if(res.result_code == "error") {
						    layer.msg(res.result_msg);
						} else {
                            window.location.href = "/index/index";
						}
                    },
					error: function (res) {
						console.log('登录失败', res);
                    }
				});
                return false;
            })
        })

	</script>
</body>
</html>
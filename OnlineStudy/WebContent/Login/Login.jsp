<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆界面</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/OnlineStudy/static/css/login.css">
<link rel="stylesheet" href="/OnlineStudy/static/css/bootstrap.min.css">
<style>
	body {
		
	}
	#banner {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		width: 26vw;
		background-color:black;
		opacity:0.6;
		border-radius:23px 24px 25px 26px;
		padding:30px;
		
	}
	
	.fullscreen-bg {
      position: fixed;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      overflow: hidden;
      z-index: -100;
  }
  .fullscreen-bg .vid {
    position: absolute;
    top: 50%;
    left: 50%;
    width: auto;
    height: auto;
    min-width: 100%;
    min-height: 100%;
    transform: translate(-50%, -50%)
  }
  #banner h1 {
  	color: #fff
  }
  form {
  	font-size: 20px;
  	color: white;
  
  }
  @media screen and (max-device-width: 800px) {
  html { background: url(https://thenewcode.com/assets/images/polina.jpg) #000 no-repeat center center fixed; }
  #bgvid { display: none; }
}
	
</style>
</head>
<body>
<div class="fullscreen-bg">
    <video src="/OnlineStudy/static/images/galaxy.mp4" class="vid" autoplay loop ></video>
  </div>
<DIV ALIGN=center id="banner"><h1>开启你的学习之旅</h1><hr>
		 <FORM ACTION="/OnlineStudy/login" method="post" name="form" >
		 <p>用户名: <input type="text" name="user_name" placeholder="username"></p>
		 <p>密      码: <input type="password" name="password"  placeholder="password"></p>
		 <INPUT TYPE="button" VALUE="登录" onclick="zy();" class="waves-effect btn red accent-3">
		 <INPUT TYPE="reset" VALUE="重置"  class="waves-light btn red accent-3">
		 <INPUT TYPE="button" VALUE="注册" ONCLICK="onclick_reg(this.form);" class="waves-light btn red accent-3">
		 </FORM>
		</DIV>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
<script>
function zy(){
	if(form.user_name.value==""){
		alert("请输入用户名");
		return;
	}
	if(form.password.value==""){
		alert("请输入密码");
		return;
	}
	form.submit();
}
function onclick_reg(form){
	form.action="/OnlineStudy/Register/Register.jsp";
	form.submit();
}
</script>
</html>
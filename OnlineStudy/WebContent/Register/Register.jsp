<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册界面</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>
<FORM ACTION="/OnlineStudy/reg" method="post" name="f1">
<table ALIGN=center WIDTH=60%><caption>用户注册</caption>
<tr><TD COLSPAN=2 ALIGN=left >基本资料</TD></tr>
<tr><TD ALIGN=left WIDTH=95></TD><TD ALIGN=left><INPUT TYPE="hidden" SIZE=30 NAME="rolenames" value="3"></TD></tr>
<tr><TD ALIGN=left WIDTH=95>用户名</TD><TD ALIGN=left><INPUT TYPE="text" SIZE=30 NAME="user_name">*用户名不能为空</TD></tr>
<tr><TD ALIGN=left WIDTH=95>密码</TD><TD ALIGN=left><INPUT TYPE="password" SIZE=30 NAME="password">*长度在6到12位之间</TD></tr>
<tr><TD ALIGN=left WIDTH=95>确认密码 </TD><TD ALIGN=left><INPUT TYPE="password" SIZE=30 NAME="againpass">*再次输入密码 </TD></tr>
<tr><TD ALIGN=left WIDTH=95>性别</TD><TD><INPUT TYPE="radio"  NAME="sex" Value="男" checked>男
                                                         <INPUT TYPE="radio" NAME="sex" Value="女">女</TD></tr>
<tr><TD ALIGN=left WIDTH=95>电话</TD><TD ALIGN=left><INPUT TYPE="text" SIZE=30 NAME="phone">*</TD></tr>
<tr><TD COLSPAN=2 ALIGN=center ><INPUT TYPE="button" VALUE=提交 onclick="onclick_cmdok();">
                                    <INPUT TYPE=reset VALUE=重置></TD>
</tr>
</TABLE>
</FORM>
<script>
function onclick_cmdok(){
	//验证用户名
	if(f1.user_name.value==""){
		alert("用户名不能为空");
		return;
	}
	//
	//验证密码
	if(f1.password.value.length<6 || f1.password.value.length>12){
		alert("密码的长度必须在6-12位");
		return;
	}
	//验证两次密码是否相同
	if(f1.password.value!=f1.againpass.value){
		alert("两次输入的密码必须相同");
		return;
	}
	//验证成功后跳转
	alert("验证成功");
	f1.submit();
}
</script>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
             <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
<%
	//获得session中的查询结果
	ArrayList<Role> roleList=(ArrayList<Role>)session.getAttribute("roles");
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加用户</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<div id="banner">
	<p><font style="font-size:10pt">新增用户</font></p>
<FORM ACTION="/OnlineStudy/addUserAction" method="post" name="f2">
<table ALIGN=center WIDTH=100%>
<tr><TD COLSPAN=2 ALIGN=left >基本资料</TD></tr>
<tr><TD ALIGN=left >用户名</TD><TD ALIGN=left><INPUT TYPE="text" SIZE=30 NAME="user_name">*长度在6到10位之间</TD></tr>
<tr><TD ALIGN=left >密码</TD><TD ALIGN=left><INPUT TYPE="password" SIZE=30 NAME="password">*长度在6到18位之间</TD></tr>
<tr><TD ALIGN=left >确认密码 </TD><TD ALIGN=left><INPUT TYPE="password" SIZE=30 NAME="againpass">*再次输入密码 </TD></tr>
<tr><TD ALIGN=left >性别</TD><TD><INPUT TYPE="radio"  NAME="sex" Value="男" checked>男
<INPUT TYPE="radio" NAME="sex" Value="女">女</TD></tr>
<tr><TD ALIGN=left >电话</TD><TD ALIGN=left><INPUT TYPE="text" SIZE=30 NAME="phone">*</TD></tr><br>
<tr><TD ALIGN=left >角色</TD><td><%
if(roleList!=null){
for(int i=0;i<roleList.size();i++){%>		 
	<input type="checkbox" name="rolenames" value="<%=((Role)roleList.get(i)).getRole_id()%>"><%=((Role)roleList.get(i)).getRole_name()%>
<%}%>
<%}%>
	</td></tr>	
</TABLE>
</FORM>
	
	<div style="margin-left: 30px; margin-right: 0px">
	<table border="0" cellpadding="0" cellspacing="0" width="95%">
		<tr>
			<td width="10%"><input type="button" value="保存" class="waves-light btn red accent-3" onclick="onclick_cmdok();"/>
			<input type="button" class="waves-light btn red accent-3" value="返回" onclick="history.go(-1);"/>
			</td>
			
		</tr>
	</table>
	</div>

</div>
<script>
function onclick_cmdok(){
	//验证用户名
	if(f2.user_name.value==""){
		alert("用户名不能为空");
		return;
	}
	//
	//验证密码
	if(f2.password.value.length<6 || f2.password.value.length>12){
		alert("密码的长度必须在6-12位");
		return;
	}
	//验证两次密码是否相同
	if(f2.password.value!=f2.againpass.value){
		alert("两次输入的密码必须相同");
		return;
	}
	//验证成功后跳转
	alert("验证成功");
	f2.submit();
}
</script>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
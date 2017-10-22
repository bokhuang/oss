<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
     <%@page import="domain.*" %>
<html>
<head>
<% 
User user=(User)session.getAttribute("modifyuser");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<FORM ACTION="/OnlineStudy/modifyPwd" method="post" WIDTH=100%  name="f1">
<table ALIGN=center >
${requestScope.user.user_id}
<tr><INPUT TYPE="hidden" SIZE=30  NAME="user_id"  value="<%=user.getUser_id() %>"></tr>
<tr><TD ALIGN=left>旧密码:<%=user.getPassword()%></TD></tr>
<tr><TD ALIGN=left>新密码<INPUT TYPE="text" NAME="password">*长度在6到12位之间</TD></tr>
<tr>
<td>
<input type="button"  value="保存" class="waves-light btn red accent-3"  onclick="onclick_cmdok();"/>
<input type="button" class="waves-light btn red accent-3" value="返回" onclick="history.go(-1);"/></td></tr>
</TABLE>
</FORM>
<script>
function onclick_cmdok(){
	//验证密码
	if(f1.password.value.length<6 || f1.password.value.length>12){
		alert("密码的长度必须在6-12位");
		return;
	}
	f1.submit();
}
</script>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
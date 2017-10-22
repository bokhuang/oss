<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                 <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%
	//获得session中的查询结果
	ArrayList<Power> powerList=(ArrayList<Power>)session.getAttribute("powers");
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加角色</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<div>增加角色</div>
<FORM ACTION="/OnlineStudy/addRoleAction" method="post" WIDTH=100%>
<table ALIGN=center >
<tr><TD ALIGN=left>角色名<INPUT TYPE="text" NAME="role_name"></TD></tr>
<tr><TD ALIGN=left >功能<%
if(powerList!=null){
for(int i=0;i<powerList.size();i++){
%>
<input type="checkbox" name="powernames" value="<%=((Power)powerList.get(i)).getPower_id()%>">
	<%=((Power)powerList.get(i)).getPower_name()%>
<%}%>
<%}%></TD>
	</tr>	
<tr>
<td>
<input type="submit" value="保存" class="waves-light btn red accent-3" />
<input type="button" class="waves-light btn red accent-3" value="返回" onclick="history.go(-1);"/></td></tr>
</TABLE>
</FORM>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
             <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//获得session中的查询结果
	ArrayList<Course> courseList=(ArrayList<Course>)session.getAttribute("courses");
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批次增加页面</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<div>增加批次</div>
<FORM ACTION="/OnlineStudy/addBatchAction" method="post" WIDTH=100%>
<table ALIGN=center >
<tr><TD ALIGN=left>批次名:<INPUT TYPE="text" NAME="batch_name"></TD></tr>
<tr><TD ALIGN=left >课程:<%
if(courseList!=null){
for(int i=0;i<courseList.size();i++){%>
<input type="checkbox" name="coursenames" value="<%=((Course)courseList.get(i)).getCourse_id()%>">
	<%=((Course)courseList.get(i)).getCourse_name()%>
<%}}%></TD>
	</tr>

<tr><TD ALIGN=left>状态:<INPUT TYPE="radio"  NAME="statement" Value="1">激活
<INPUT TYPE="radio" NAME="statement" Value="0" checked>禁止</TD></tr>
<tr>
<td>
<input type="submit" value="保存" class="waves-effect btn red accent-3" />
<input type="button" class="waves-light btn red accent-3" value="返回" onclick="history.go(-1);"/></td></tr>
</TABLE>
</FORM>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
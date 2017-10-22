<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改课件</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<div>修改课件</div>
<form:form action="/OnlineStudy/updateCourseWareAction" method="post" modelAttribute="modifycourseware">
	<table border="0" cellpadding="1" cellspacing="1" width="95%">
	<tr>
			<td width="20%">
				<form:hidden path="courseware_id" />
			</td>
	</tr>
		<tr>
			<td align="right" width="10%" nowrap="nowrap">课件名</td>
			<td width="20%">
				<form:input path="courseware_name" cssClass="TextInput"></form:input>
			</td>
			</tr>
			<tr>
			<td align="right" width="10%" nowrap="nowrap">课件链接</td>
			<td width="20%">
				<form:input path="url" cssClass="TextInput"></form:input>
			</td>
			</tr>
			<tr>
			<td align="right" width="10%" nowrap="nowrap">所属课程</td>
			<td width="20%">
				<form:select path="course_id" items="${courses}" style="display: inline-block" />
			</td>
			</tr>
	</table>


	<p></p>
	<div style="margin-left: 30px; margin-right: 0px">
	<table border="0" cellpadding="0" cellspacing="0" width="95%">
		<tr>
			<td width="10%"><input type="submit" value="保存" class="waves-light btn red accent-3"/></td>
			<td width="10%"><input type="button" class="waves-light btn red accent-3" value="返回" onclick="history.go(-1);"/></td>
			<td width="80%">&nbsp;</td>
		</tr>
	</table>
	</div>
</form:form>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
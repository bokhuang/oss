<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<%
	if (request.getAttribute("courseware") == null) {
		CourseWare courseware = new CourseWare();
		request.setAttribute("courseware", courseware);
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加课件</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<div>增加课件</div>
<form:form action="/OnlineStudy/addCourseWareAction" method="post" modelAttribute="courseware" enctype="multipart/form-data">
	<table border="0" cellpadding="1" cellspacing="1" width="95%">
		<tr>
			<td align="right" width="10%" nowrap="nowrap">课件名</td>
			<td width="20%">
				<form:input path="courseware_name" cssClass="TextInput"></form:input>
			</td>
			</tr>
			<tr>
			<td align="left" width="10%" nowrap="nowrap">所属课程</td>
			<!--  -->
			<td width="20%">
				
				<form:select path="course_id" items="${courses}" style="display: inline-block"/>
			</td>
			</tr>
			<br>
			<br>
			<br>
			<tr>
			<td align="right" width="10%" nowrap="nowrap">上传信息</td>
			<td width="20%">
				文件: <input type="file" name="file"/>
			</td>
			</tr>
	</table>


	<p></p>
	<div style="margin-left: 30px; margin-right: 0px">
	<table border="0" cellpadding="0" cellspacing="0" width="95%">
		<tr>
			<td width="10%"><input type="submit" value="上传" class="waves-light btn red accent-3"/></td>
			<td width="10%"><input type="button" class="waves-light btn red accent-3" value="返回" onclick="history.go(-1);"/></td>
			<td width="80%">&nbsp;</td>
		</tr>
	</table>
	</div>
</form:form>



<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
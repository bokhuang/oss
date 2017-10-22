<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                 <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//获得session中的查询结果
String batch_name=(String)session.getAttribute("batch_name");
ArrayList<Course> coursesList=(ArrayList<Course>)session.getAttribute("coursesList");
ArrayList<CourseWare> coursewaresList=(ArrayList<CourseWare>)session.getAttribute("coursewaresList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详情查看</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<%=batch_name+":"%>
<br>
<div>课程:</div>
<%
if(coursesList!=null){
for(int i=0;i<coursesList.size();i++){%>		 
	<%=i+1+"、"+((Course)coursesList.get(i)).getCourse_name()%>
<%}%>
<%}%>
<div>课件:</div>
<%
if(coursewaresList!=null){
for(int i=0;i<coursewaresList.size();i++){%>		 
	<%=i+1+"、"+((CourseWare)coursewaresList.get(i)).getCourseware_name()%><br>
<%}%>
<%}%>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
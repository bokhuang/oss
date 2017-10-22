<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
			//获得单条课程数据
			Course modifycourse=(Course)session.getAttribute("modifycourse");
			//已选的课件
			ArrayList<CourseWare> coursewares=(ArrayList<CourseWare>)session.getAttribute("coursewares");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看课程详情</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<form method="post" action="">
<span>查看课程详情</span>
			<table  width="800px" border="1" cellpadding="0" cellspacing="0" id="form"  style="text-align:center;">
				<tr>
					<td class='listTitleMain' colspan=4>
						课程详情
						<br>
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						课程名
					</td>
					<td class='cardOddlineData' colspan=3>
<%=modifycourse.getCourse_name()%>
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						包含课件:
					</td>
					<td class='cardOddlineData'>
				<%for(int i=0;i<coursewares.size();i++){%>
			<%=i+1+"、"+((CourseWare)coursewares.get(i)).getCourseware_name()%><br>
			<%}%>		
		</td>
				</tr>
			</table>
<input type="button" name="cmdOK" value="返  回"
							class="defaultButton" onclick="history.go(-1);">
		</form>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
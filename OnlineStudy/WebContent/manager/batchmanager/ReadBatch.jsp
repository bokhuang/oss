<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
			//获得修改的批次数据
			Batch modifybatch=(Batch)session.getAttribute("modifybatch");
			//已选的课程id
			ArrayList<Integer> courseids=(ArrayList<Integer>)session.getAttribute("courseids");
			//所有的课程记录
			ArrayList<Course> courses=(ArrayList<Course>)session.getAttribute("courses");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批次查看详情</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<form method="post" action="">
		<span>查看批次详情</span>
			<table  width="800px" border="1" cellpadding="0" cellspacing="0" id="form"  style="text-align:center;">
				<tr>
					<td class='listTitleMain' colspan=4>
						批次详情
						<br>
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						批次名
					</td>
					<td class='cardOddlineData' colspan=3>
						<%=modifybatch.getBatch_name()%>
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						包含课程
					</td>
					<td class='cardOddlineData'>
		<%
					for(int i=0;i<courses.size();i++){
						for(int j=0;j<courseids.size();j++){
						 if((Integer)courseids.get(j)==(Integer)((Course)courses.get(i)).getCourse_id()){%>
				<%=j+1+"、"+((Course)courses.get(i)).getCourse_name()%><%}}} %>
					
		</td>
				</tr>
				
						<tr>
				<td class='cardOddlineLabel'>
						状态
					</td><td>
				<%if(modifybatch.getStatement().equals(0)){%>
					关闭
					<%}if(modifybatch.getStatement().equals(1)){%>开启
					<% }%></td>
				</tr>
			</table>
<input type="button" name="cmdOK" value="返  回"
							class="waves-light btn teal accent-3" onclick="history.go(-1);">
		</form>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
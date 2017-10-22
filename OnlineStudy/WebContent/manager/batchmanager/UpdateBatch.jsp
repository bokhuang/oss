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
<title>批次修改页面</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<form method="post" action="/OnlineStudy/updateBatchAction">
			<table class='cardBody'>
			<tr>
					<td>
						<input type=hidden name="batch_id"  value="<%=modifybatch.getBatch_id()%>"/>
					</td>
			</tr>
				<tr>
					<td class='listTitleMain' colspan=4>
						修改批次
						<br>
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						批次名
					</td>
					<td class='cardOddlineData' colspan=3>
						<input type=text class="defaultInput" name='batch_name'
							value="<%=modifybatch.getBatch_name()%>">
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						课程
					</td>
					<td class='cardOddlineData'>
		<%if(courseids.size()==0){
			for(int i=0;i<courses.size();i++){%>
			<input type="checkbox" name="coursenames" value="<%=((Course)courses.get(i)).getCourse_id()%>">
			<%=((Course)courses.get(i)).getCourse_name()%>
			<% }}
				else if(courseids.size()>0&&courseids.size()<courses.size()){
					for(int i=0;i<courses.size();i++){
						int n=0;
						for(int j=0;j<courseids.size();j++){
						 if((Integer)courseids.get(j)==(Integer)((Course)courses.get(i)).getCourse_id()){%>
					<input type="checkbox" name="coursenames" value="<%=((Course)courses.get(i)).getCourse_id()%>" checked>
				<%=((Course)courses.get(i)).getCourse_name()%><%n=999999;}}
						if(n<courseids.size()){%>
				<input type="checkbox" name="coursenames" value="<%=((Course)courses.get(i)).getCourse_id()%>">
			<%=((Course)courses.get(i)).getCourse_name()%>
				<%n=0;}}}else{
				for(int i=0;i<courses.size();i++){%>
			<input type="checkbox" name="coursenames" value="<%=((Course)courses.get(i)).getCourse_id()%>" checked>
			<%=((Course)courses.get(i)).getCourse_name()%>
			<%}}%>		
		</td>
				</tr>
				
			<tr>
				<td class='cardOddlineLabel'>
						状态
					</td><td>
				<%if(modifybatch.getStatement().equals(0)){%>
					<input type="radio" name='statement' Value="0" checked>禁止
					<input type="radio" name='statement' Value="1">激活
					<%}if(modifybatch.getStatement().equals(1)){%>
					<input type="radio" name='statement' Value="0" >禁止
					<input type="radio" name='statement' Value="1" checked>激活
					<% }%></td>
				</tr>
				
				<tr>
					<td class='cardFooter' colspan="4">
						<input type="submit" name="cmdOK" value="提  交"
							class="defaultButton">
						&nbsp;
						&nbsp;
						<input type="button" name="cmdOK" value="返  回"
							class="defaultButton" onclick="history.go(-1);">
					</td>
				</tr>

			</table>

		</form>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
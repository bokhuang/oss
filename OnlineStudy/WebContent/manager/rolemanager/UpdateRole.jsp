<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
			//获得修改的角色数据
			Role modifyrole=(Role)session.getAttribute("modifyrole");
			//已选的功能id
			ArrayList<Integer> powerids=(ArrayList<Integer>)session.getAttribute("powerids");
			//所有的功能记录
			ArrayList<Power> powers=(ArrayList<Power>)session.getAttribute("powers");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改角色</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<form method="post" action="/OnlineStudy/updateRoleAction">
			<table class='cardBody'>
			<tr>
					<td>
						<input type=hidden name="role_id"  value="<%=modifyrole.getRole_id()%>"/>
					</td>
			</tr>
				<tr>
					<td class='listTitleMain' colspan=4>
						修改角色
						<br>
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						角色名
					</td>
					<td class='cardOddlineData' colspan=3>
						<input type=text class="defaultInput" name='role_name'
							value="<%=modifyrole.getRole_name()%>">
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						功能
					</td>
					<td class='cardOddlineData'>	
		<%if(powerids.size()==0){
			for(int i=0;i<powers.size();i++){%>
			<input type="checkbox" name="powernames" value="<%=((Power)powers.get(i)).getPower_id()%>">
			<%=((Power)powers.get(i)).getPower_name()%>
			<% }}
				else if(powerids.size()>0&&powerids.size()<powers.size()){
					for(int i=0;i<powers.size();i++){
						int n=0;
						for(int j=0;j<powerids.size();j++){
						 if((Integer)powerids.get(j)==(Integer)((Power)powers.get(i)).getPower_id()){%>
					<input type="checkbox" name="powernames" value="<%=((Power)powers.get(i)).getPower_id()%>" checked>
				<%=((Power)powers.get(i)).getPower_name()%><%n=999999;}}
						if(n<powerids.size()){%>
				<input type="checkbox" name="powernames" value="<%=((Power)powers.get(i)).getPower_id()%>">
			<%=((Power)powers.get(i)).getPower_name()%>
				<%n=0;}}}else{
				for(int i=0;i<powers.size();i++){%>
			<input type="checkbox" name="powernames" value="<%=((Power)powers.get(i)).getPower_id()%>" checked>
			<%=((Power)powers.get(i)).getPower_name()%>
			<%}}%>		
		</td>
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
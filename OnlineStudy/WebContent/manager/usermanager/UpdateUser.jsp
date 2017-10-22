<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="domain.*" %>
     <%@page import="java.util.ArrayList"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
<%
			//获得修改的用户数据
				User modifyuser=(User)session.getAttribute("modifyuser");	
			//已选的角色id
				ArrayList<Integer> roleids=(ArrayList<Integer>)session.getAttribute("roleids");
			//所有的角色记录
			ArrayList<Role> roles=(ArrayList<Role>)session.getAttribute("roles");
			
%>
</head>
<body>
<form method="post" action="/OnlineStudy/userUpdateAction">
			<table class='cardBody'>
			<tr>
					<td>
						<input type=hidden name="user_id"  value="<%=modifyuser.getUser_id()%>"/>
					</td>
			</tr>
				<tr>
					<td class='listTitleMain' colspan=4>
						修改用户
						<br>
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						用户姓名
					</td>
					<td class='cardOddlineData' colspan=3>
						<input type=text class="defaultInput" name='user_name'
							value="<%=modifyuser.getUser_name()%>">
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						密码
					</td>
					<td class='cardOddlineData' colspan=3>
						<input type=text class="defaultInput" name="password" value="<%=modifyuser.getPassword()%>">
					</td>
				</tr>	
				<tr>
					<td class='cardOddlineLabel'>
						联系方式
					</td>
					<td class='cardOddlineData' colspan=3>
						<input type=text class="defaultInput" name="phone" value="<%=modifyuser.getPhone()%>">
					</td>
				</tr>			
				<tr>
				<td class='cardOddlineLabel'>
						性别
					</td><td>
				<%if(modifyuser.getSex().equals("男")){%>
					<input type="radio" name='sex' Value="男" checked><%=modifyuser.getSex()%>
					<input type="radio" name='sex' Value="女">女
					<%}if(modifyuser.getSex().equals("女")){%>
					<input type="radio" name='sex' Value="女" checked><%=modifyuser.getSex()%>
					<input type="radio" name='sex' Value="男">男
					<% }%></td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						角色
					</td>
					<td class='cardOddlineData'>	
		<%if(roleids.size()==0){
			for(int i=0;i<roles.size();i++){%>
			<input type="checkbox" name="rolenames" value="<%=((Role)roles.get(i)).getRole_id()%>">
			<%=((Role)roles.get(i)).getRole_name()%>
			<% }}
				else if(roleids.size()>0&&roleids.size()<roles.size()){
					for(int i=0;i<roles.size();i++){
						int n=0;
						for(int j=0;j<roleids.size();j++){
						 if((Integer)roleids.get(j)==(Integer)((Role)roles.get(i)).getRole_id()){%>
					<input type="checkbox" name="rolenames" value="<%=((Role)roles.get(i)).getRole_id()%>" checked>
				<%=((Role)roles.get(i)).getRole_name()%><%n=999999;}}
						if(n<roleids.size()){%>
				<input type="checkbox" name="rolenames" value="<%=((Role)roles.get(i)).getRole_id()%>">
			<%=((Role)roles.get(i)).getRole_name()%>
				<%n=0;}}}else{
				for(int i=0;i<roles.size();i++){%>
			<input type="checkbox" name="rolenames" value="<%=((Role)roles.get(i)).getRole_id()%>" checked>
			<%=((Role)roles.get(i)).getRole_name()%>
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
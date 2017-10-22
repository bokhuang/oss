<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="domain.*" %>
     <%@page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看用户详情</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
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
<form method="post" action="" >
<span>查看用户详情</span>
			<table width="500px" border="1" cellpadding="0" cellspacing="0" id="form"  style="text-align:center;">
				<tr>
					<td class='cardOddlineLabel'>
						用户姓名
					</td>
					<td class='cardOddlineData' colspan=3>
							<%=modifyuser.getUser_name()%>
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						密码
					</td>
					<td class='cardOddlineData' colspan=3>
						<%=modifyuser.getPassword()%>
					</td>
				</tr>	
				<tr>
					<td class='cardOddlineLabel'>
						联系方式
					</td>
					<td class='cardOddlineData' colspan=3>
						<%=modifyuser.getPhone()%>
					</td>
				</tr>			
				<tr>
				<td class='cardOddlineLabel'>
						性别
					
					</td><td>
					<%=modifyuser.getSex()%></td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						角色
					</td>
					<td class='cardOddlineData'>	
				<%for(int i=0;i<roles.size();i++){
						for(int j=0;j<roleids.size();j++){
						 if((Integer)roleids.get(j)==(Integer)((Role)roles.get(i)).getRole_id()){%>
						<%=j+1+"、"+((Role)roles.get(i)).getRole_name()%><%}}} %>
		</td>
				</tr>

			</table>
<input type="button" name="cmdOK" value="返  回"
							class="defaultButton" onclick="history.go(-1);">
		</form>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
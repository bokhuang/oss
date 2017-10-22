<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />

<%
if (request.getAttribute("role") == null) {
	Role role = new Role();
	request.setAttribute("role",role);
}
%>


<script language="javascript">
function deleteRecord(url) {
	if (window.confirm("确定要删除选中的记录吗？")) {
		window.location=url;
	}
	}

function addRole(url){
	window.location=url;
}
</script>
</head>
<body>
<div id="banner">
<p><font style="font-size: 10pt;">角色管理</font></p>
<form:form action="/OnlineStudy/rolesAction" method="post" modelAttribute="role">
	<table border="0" cellpadding="1" cellspacing="1" width="95%">
		<tr>
			<td align="right" width="10%">角色名称</td>
			<td width="20%"><form:input path="role_name" cssClass="TextInput"></form:input></td>
		</tr>
		
			
			
		</tr>
	</table>

	<p></p>
	<div style="margin-left: 30px; margin-right: 0px">
	<table border="0" cellpadding="0" cellspacing="0" width="95%">
		<tr>
			<td width="10%"><input type="submit" value="搜索用户角色"
				class="waves-light btn red accent-3" />
			</td>
			<td width="10%">
			<input type="button" value="添加角色" class="waves-light btn red accent-3" onclick="addRole('/OnlineStudy/findallpowersAction')"/>
			</td>
			<td width="10%"><input type="reset" value="清空输入" class="waves-light btn red accent-3" /></td>
			<td width="60%">&nbsp;</td>
		</tr>
	</table>
	</div>

	<p></p>

	<div style="margin-left: 30px; margin-right: 0px">
	<table width="90%" class="bordered striped" border="1" cellpadding="0" cellspacing="0" id="form" style="text-align:center;">
		<tr>
			<td width="5%" class="td_title">删除角色</td>
			<td width="5%" class="td_title">编辑角色</td>
			<td width="5%" class="td_title">查看角色详情</td>
			<td width="5%" class="td_title">角色id</td>
			<td width="8%" class="td_title">角色名称</td>
		</tr>
		<c:if test="${!empty requestScope.roles}">
			<c:forEach items="${requestScope.roles}" var="roles">
				<tr>
					<td class="td_border" align="center">
						<a href="javascript:deleteRecord('/OnlineStudy/deleteRoleByIdAction?role_id=${roles.role_id}')">
							<i class="material-icons">backspace</i>
						</a>
					</td>
					<td class="td_border" align="center">
						<a href="/OnlineStudy/findRoleByIdAction?role_id=${roles.role_id}&flag=0">
							<i class="material-icons">brush</i>
						</a>
					</td>
										<td class="td_border" align="center">
						<a href="/OnlineStudy/findRoleByIdAction?role_id=${roles.role_id}&flag=1">
							<i class="material-icons">brush</i>
						</a>
					</td>
					<td class="td_border">${roles.role_id}</td>
					<td class="td_border">${roles.role_name}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	</div>
</form:form>
</div>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
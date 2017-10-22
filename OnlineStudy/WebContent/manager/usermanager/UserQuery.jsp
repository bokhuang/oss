<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />

<%
if (request.getAttribute("user") == null) {
	User user = new User();
	request.setAttribute("user",user);
}
%>


<script language="javascript">
function deleteRecord(url) {
	if (window.confirm("确定要删除选中的记录吗？")) {
		window.location=url;
	}
	}

function addUser(url){
	window.location=url;
}
</script>
</head>
<body>
<div id="banner">
<p><font style="font-size: 10pt;">用户管理</font></p>
<form:form action="/OnlineStudy/userAction" method="post" modelAttribute="user">
	<table border="0" cellpadding="1" cellspacing="1" width="95%">
		<tr>
			<td align="right" width="10%">搜索用户名</td>
			<td width="20%"><form:input path="user_name" cssClass="TextInput"></form:input></td>
			<td align="right" width="10%">搜索电话号码</td>
			<td width="20%"><form:input path="phone" cssClass="TextInput"></form:input></td>
			<td width="40%">&nbsp;</td>
		</tr>
		
			
			
		</tr>
	</table>

	<p></p>
	<div style="margin-left: 30px; margin-right: 0px">
	<table border="0" cellpadding="0" cellspacing="0" width="95%">
		<tr>
			<td width="10%"><input type="submit" value="查询用户"
				class="waves-light btn red accent-3" />
			</td>
			<td width="10%">
			<input type="button" value="添加用户" class="waves-light btn red accent-3" onclick="addUser('/OnlineStudy/findAllRoles')"/>
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
			<td width="5%" class="td_title">移除此用户</td>
			<td width="5%" class="td_title">修改用户信息</td>
			<td width="6%" class="td_title">查看用户详情</td>
			<td width="7%" class="td_title">用户名</td>
			<td width="8%" class="td_title">性别</td>
			<td width="8%" class="td_title">电话</td>
		</tr>
		<c:if test="${!empty requestScope.users}">
			<c:forEach items="${requestScope.users}" var="users">
				<tr>
					<td class="td_border" align="center">
						<a href="javascript:deleteRecord('/OnlineStudy/deleteUserByIdAction?user_id=${users.user_id}')">
							<i class="material-icons">backspace</i>
						</a>
					</td>
					<td class="td_border" align="center">
						<a href="/OnlineStudy/findUserByIdAction?user_id=${users.user_id}&flag=0">
							<i class="material-icons">brush</i>
						</a>
					</td>
							<td class="td_border" align="center">
						<a href="/OnlineStudy/findUserByIdAction?user_id=${users.user_id}&flag=1">
							<i class="material-icons">brush</i>
						</a>
					</td>		
					<td class="td_border">${users.user_name}</td>
					<td class="td_border">${users.sex}</td>
					<td class="td_border">${users.phone}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
</form:form>
</div>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
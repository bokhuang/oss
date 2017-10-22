<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>功能管理</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
<%
	//获得session中的查询结果
	//ArrayList<Power> powerList=(ArrayList<Power>)session.getAttribute("powers");
%>
<%
if (request.getAttribute("power") == null) {
	Power power = new Power();
	request.setAttribute("power",power);
}
%>
<script language="javascript">
function deleteRecord(url) {
	if (window.confirm("确定要删除选中的记录吗？")) {
		window.location=url;
	}
	}

function addPower(url){
	window.location=url;
}
</script>
</head>
<body>
<div id="banner">
<p><font style="font-size: 10pt;">功能管理</font></p>
<form:form action="/OnlineStudy/powersAction" method="post" modelAttribute="power">
	<table border="0" cellpadding="1" cellspacing="1" width="95%">
		<tr>
			<td align="right" width="10%">功能名称</td>
			<td width="20%"><form:input path="power_name" cssClass="TextInput"></form:input></td>
		</tr>
		
			
			
		</tr>
	</table>

	<p></p>
	<div style="margin-left: 30px; margin-right: 0px">
	<table border="0" cellpadding="0" cellspacing="0" width="95%">
		<tr>
			<td width="10%"><input type="submit" value="搜索功能"
				class="waves-light btn red accent-3" />
			</td>
			<td width="10%">
			<input type="button" value="添加功能" class="waves-light btn red accent-3" onclick="addPower('/OnlineStudy/manager/powermanager/AddPower.jsp')"/>
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
			<td width="5%" class="td_title">删除功能</td>
			<td width="5%" class="td_title">编辑功能</td>
			<td width="7%" class="td_title">查看功能详情</td>
			<td width="4%" class="td_title">功能id</td>
			<td width="8%" class="td_title">功能名称</td>

		</tr>
		
		<c:if test="${!empty requestScope.powers}">
			<c:forEach items="${requestScope.powers}" var="po">
				<tr>
					<td class="td_border" align="center">
						<a href="javascript:deleteRecord('/OnlineStudy/deletePowerByIdAction?power_id=${po.power_id}')">
							<i class="material-icons">backspace</i>
						</a>
					</td>
					<td class="td_border" align="center">
						<a href="/OnlineStudy/findPowerByIdAction?power_id=${po.power_id}&flag=0">
							<i class="material-icons">brush</i>
						</a>
					</td>
					<td class="td_border" align="center">
						<a href="/OnlineStudy/findPowerByIdAction?power_id=${po.power_id}&flag=1">
							<i class="material-icons">brush</i>
						</a>
					</td>
					<td class="td_border">${po.power_id}</td>
					<td class="td_border">${po.power_name}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	</div>
</form:form>
</div>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
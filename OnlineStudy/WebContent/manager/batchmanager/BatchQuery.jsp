<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
             <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if (request.getAttribute("batch") == null) {
	Batch batch = new Batch();
	request.setAttribute("batch",batch);
}
%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批次管理</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
<script src="/OnlineStudy/static/js/jquery-3.2.0.min.js"></script>
<script language="javascript">
function deleteRecord(url) {
	if (window.confirm("确定要删除选中的记录吗？")) {
		window.location=url;
	}
	}

function addBatch(url){
	window.location=url;
}
</script>
<script language="javascript">
		 function OpStart(str,flag){
			   var url="updateStatementAction?batch_id="+str+"&statement="+flag;
			   var res = $.ajax({url:url,async:false});
			   if(flag==0&&res){
				   $("#btn" + str).attr('value','激活');
				   }
			   if(flag==1&&res){
						$("#btn" + str).attr('value','可申请...');
				   }
			 
			 }
</script>
</head>
<body>
<div id="banner">
<p><font style="font-size: 10pt;">批次管理界面</font></p>
<form:form action="/OnlineStudy/batchsAction" method="post" modelAttribute="batch">
	<table border="0" cellpadding="1" cellspacing="1" width="95%">
		<tr>
			<td align="right" width="10%">批次名称</td>
			<td width="20%"><form:input path="batch_name" cssClass="TextInput"></form:input></td>
		</tr>
	</table>

	<p></p>
	<div style="margin-left: 30px; margin-right: 0px">
	<table   border="0" cellpadding="0" cellspacing="0" width="95%">
		<tr>
			<td width="10%"><input type="submit" value="搜索批次"
				class="waves-light btn red accent-3" />
			</td>
			<td width="10%">
			<input type="button" value="添加新的批次" class="waves-light btn red accent-3" onclick="addBatch('/OnlineStudy/findAllCourses')"/>
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
			<td width="5%" class="td_title">删除批次</td>
			<td width="5%" class="td_title">修改批次</td>
			<td width="6%" class="td_title">查看批次详情</td>
			<td width="5%" class="td_title">批次id</td>
			<td width="8%" class="td_title">批次名称</td>
			<td width="8%" class="td_title">当前申请状态</td>
		</tr>
		<c:if test="${!empty requestScope.batchs}">
			<c:forEach items="${requestScope.batchs}" var="bat">
				<tr>
					<td class="td_border" align="center">
						<a href="javascript:deleteRecord('/OnlineStudy/deleteBatchByIdAction?batch_id=${bat.batch_id}')">
							<i class="material-icons">backspace</i>
						</a>
					</td>
					<td class="td_border" align="center">
						<a href="/OnlineStudy/findBatchByIdAction?batch_id=${bat.batch_id}&flag=0">
							<i class="material-icons">brush</i>
						</a>
					</td>
					<td class="td_border" align="center">
						<a href="/OnlineStudy/findBatchByIdAction?batch_id=${bat.batch_id}&flag=1">
							<i class="material-icons">brush</i>
						</a>
					</td>
					<td class="td_border">${bat.batch_id}</td>
					<td class="td_border">${bat.batch_name}</td>
					<td class="td_border">
					<c:if test="${bat.statement =='1'}">
<input id="btn${bat.batch_id}"  type="button" class="waves-light btn black" value="当前可申请" onclick="return OpStart(${bat.batch_id},1);"/>
					</c:if>
					
					<c:if test="${bat.statement =='0'}">
<input id="btn${bat.batch_id}" type="button" class="waves-light btn black" value="开启申请" onclick="return OpStart(${bat.batch_id},1);"/>
					</c:if>
					<input type="button" value="关闭申请" class="waves-light btn black" onclick="return OpStart(${bat.batch_id},0);"/>
					</td>
						
				</tr>
			</c:forEach>
		</c:if>
	</table>

	</div>
</form:form>
</div>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
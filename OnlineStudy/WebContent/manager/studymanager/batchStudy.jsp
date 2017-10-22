<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
             <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if (request.getAttribute("batch") == null) {
	BatchRecorder batch = new BatchRecorder();
	request.setAttribute("batch",batch);
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请批次</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
<script src="/OnlineStudy/static/js/jquery-3.2.0.min.js"></script>

<script language="javascript">
function OpStart(state,recorder_id){
	   var url="changeFlag?recorder_id="+recorder_id;
	   var res = $.ajax({url:url,async:false});
	   if(state==0){
		   $("#btn"+recorder_id).attr('value','审核中');
		   }
	   if(state==1){
		   $("#btn"+recorder_id).attr('value','申请成功');
		   }
	 }
	 
function updateflag(url){
	window.location=url;
}
</script>


</head>
<body>
<div id="banner">
<p><font style="font-size: 10pt;">申请批次</font></p>

<form:form action="/OnlineStudy/findRecord" method="post" modelAttribute="batch">
	<table border="0" cellpadding="1" cellspacing="1" width="95%">
		<tr>
			<td align="right" width="10%">批次名称</td>
			<td width="20%"><form:input path="batch_name" cssClass="TextInput"></form:input></td>
		</tr>
		
			
			
		</tr>
	</table>

	<p></p>
	<div style="margin-left: 30px; margin-right: 0px">
	<table border="0" cellpadding="0" cellspacing="0" width="95%">
		<tr>
			<td width="10%"><input type="submit" value="搜索批次"
				class="waves-light btn red accent-3" />
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
			<td width="6%" class="td_title">查看批次详情</td>
			<td width="5%" class="td_title">批次id</td>
			<td width="8%" class="td_title">批次名称</td>
			<td width="8%" class="td_title">当前申请状态</td>
		</tr>
		<c:if test="${!empty requestScope.batchs}">
			<c:forEach items="${requestScope.batchs}" var="bat">
			
				<tr>
					<td class="td_border" align="center">
						<a href="/OnlineStudy/findBatchDetailRead?batch_id=${bat.batch_id}&batch_name=${bat.batch_name}&flag=0&recorder_id=${bat.recorder_id}">
							<i class="material-icons">brush</i>
						</a>
					</td>
					<td class="td_border">${bat.batch_id}</td>
					<td class="td_border">${bat.batch_name}</td>
					
				<td class="td_border">				
					<c:if test="${bat.statement =='0'&&bat.flag=='1'}">
				<input id="btn${bat.batch_id}" type="button" value="待审核" class="waves-light btn black"/>
					</c:if>
					
					<c:if test="${bat.statement =='0'&&bat.flag=='0'}">
<input id="btn${bat.recorder_id}" type="button" value="申请" class="waves-light btn black" onclick="return OpStart(${bat.statement},${bat.recorder_id});"/>
					</c:if>
					
					<c:if test="${bat.statement =='1'&&bat.flag=='1'}">
					<input id="btn${bat.batch_id}" type="button" class="waves-light btn black" value="申请成功"/>
					</c:if>	
		<c:if test="${bat.statement =='1'&&bat.flag=='0'}">
<input id="btn${bat.recorder_id}" type="button" class="waves-light btn black" value="申请" onclick="return OpStart(${bat.statement},${bat.recorder_id});"/>
					</c:if>
					<input type="button"  class="waves-light btn black" value="撤销申请" onclick="updateflag('/OnlineStudy/updateFlag?recorder_id=${bat.recorder_id}')"/>
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
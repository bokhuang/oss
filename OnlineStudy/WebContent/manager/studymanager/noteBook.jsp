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
<title>我的学习</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<div id="banner">
<p><font style="font-size: 10pt;">我的学习</font></p>
<form:form action="/OnlineStudy/findRecord" method="post" modelAttribute="batch">
	<div style="margin-left: 30px; margin-right: 0px">
	<table width="60%" border="1" cellpadding="0" cellspacing="0" id="form" style="text-align:center;">
		<tr>
			<td width="8%" class="td_title">批次名称</td>
			<td width="8%" class="td_title">进度</td>
			<td width="8%" class="td_title">去学习</td>
		</tr>
		<c:if test="${!empty requestScope.BatchRecorderList}">
			<c:forEach items="${requestScope.BatchRecorderList}" var="bat">	
				<tr>
					<td class="td_border">${bat.batch_name}</td>
					<td class="td_border">${bat.progress}秒</td>
				<td class="td_border">
			<a href="/OnlineStudy/findBatchDetailRead?batch_id=${bat.batch_id}&flag=1&batch_name=${bat.batch_name}"">去学习</a>
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
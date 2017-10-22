<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课件管理界面</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
<%
if (request.getAttribute("cwarecoursechoice") == null) {
	CWareCourseChoice cwarecoursechoice = new CWareCourseChoice();
	request.setAttribute("cwarecoursechoice",cwarecoursechoice);
}
%>
<script language="javascript">
function deleteRecord(url) {
	if (window.confirm("确定要删除选中的记录吗？")) {
		window.location=url;
	}
	}

function addCourseWare(url){
	window.location=url;
}
</script>
</head>
<body>
<div id="banner">
<p><font style="font-size: 10pt;">课件管理</font></p>
<form:form action="/OnlineStudy/coursewaresAction" method="post" modelAttribute="cwarecoursechoice">
	<table border="0" cellpadding="1" cellspacing="1" width="95%">
		<tr>
			<td align="right" width="10%">课件名称</td>
			<td width="20%"><form:input path="courseware_name"></form:input></td>
			<td align="right" width="10%">课程名称</td>
			<td width="20%"><form:input path="course_name"></form:input></td>
		</tr>
		
			
			
		</tr>
	</table>

	<p></p>
	<div style="margin-left: 30px; margin-right: 0px">
	<table border="0" cellpadding="0" cellspacing="0" width="95%">
		<tr>
			<td width="10%"><input type="submit" value="搜索课件"
				class="waves-light btn red accent-3" />
			</td>
			<td width="10%">
			<input type="button" value="添加课件" class="waves-light btn red accent-3" onclick="addCourseWare('/OnlineStudy/addpreCourseAction')"/>
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
			<td width="5%" class="td_title">删除课件</td>
			<td width="5%" class="td_title">编辑课件</td> 
			<td width="4%" class="td_title">课件id</td>
			<td width="8%" class="td_title">课件名称</td>
			<td width="7%" class="td_title">所属课程</td>
			<td width="4%" class="td_title">查看课件详情</td>
		</tr>
		
		<c:if test="${!empty requestScope.coursewares}">
			<c:forEach items="${requestScope.coursewares}" var="wares">
				<tr>
					<td class="td_border" align="center">
						<a href="javascript:deleteRecord('/OnlineStudy/deleteCourseWareByIdAction?courseware_id=${wares.courseware_id}')">
							<i class="material-icons">backspace</i>
						</a>
					</td>
				 	<td class="td_border" align="center">
						<a href="/OnlineStudy/findCourseWareByIdAction?courseware_id=${wares.courseware_id}">
							<i class="material-icons">brush</i>
						</a>
					</td> 
					<td class="td_border">${wares.courseware_id}</td>
					<td class="td_border">${wares.courseware_name}</td>
					<td class="td_border">${wares.course_name}</td>
					<td class="td_border" align="center">
					<a href="/OnlineStudy/manager/studymanager/check.jsp?url=${wares.url} ">
					预览</a>
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
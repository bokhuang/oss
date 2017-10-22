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
<title>角色详情</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
</head>
<body>
<form method="post" action="">
<span>查看角色详情</span>
			<table  width="800px" border="1" cellpadding="0" cellspacing="0" id="form"  style="text-align:center;">
				<tr>
					<td class='cardOddlineLabel'>
						角色
					</td>
					<td class='cardOddlineData' >
<%=modifyrole.getRole_name()%>
					</td>
				</tr>
				<tr>
					<td class='cardOddlineLabel'>
						功能
					</td>
					<td class='cardOddlineData'>	
		<%
					for(int i=0;i<powers.size();i++){
						if(powers.get(i).getParentId()!=0&&powers.get(i).getParentId()!=13){
						for(int j=0;j<powerids.size();j++){
						 if((Integer)powerids.get(j)==(Integer)((Power)powers.get(i)).getPower_id()){%>
				<%=j+1+"、"+((Power)powers.get(i)).getPower_name()%><%}}}} %>
							
		</td>
				</tr>
			</table>
<input type="button" name="cmdOK" value="返  回"
							class="defaultButton" onclick="history.go(-1);">
		</form>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
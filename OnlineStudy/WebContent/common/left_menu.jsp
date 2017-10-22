<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/OnlineStudy/static/css/bootstrap.min.css">
<title>左菜单</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
	<%
	//获得session中的查询结果
	ArrayList<Power> powerList=(ArrayList<Power>)session.getAttribute("powers");
	%>
	<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		.dropdown {
			width: 100vw;
		}
	</style>
</head>
<body>

			<div class="dropdown">
    <button type="button" class="btn btn-lg dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">主题
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"> 
    <%
    if(powerList!=null){
for(int i=0;i<powerList.size();i++){%>
        <li role="presentation">
              <a href="<%=(String)((Power)powerList.get(i)).getPower_url()%>" target="content">
        <%=(String)((Power)powerList.get(i)).getPower_name()%></a>
        </li>
        <%}} %>
    </ul>
</div>	

<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
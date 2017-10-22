<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="domain.*" %>
         <%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头顶栏</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
<%
	//获得session中的查询结果
	ArrayList<Power> powerList=(ArrayList<Power>)session.getAttribute("powers");
	%>
<style type="text/css">
        body{
        background:url("/OnlineStudy/static/images/star2.png");
            background-color: #b6b3ae;
            color:#012d31;
            font-weight: bold;
        }
        .name{
            color:#012d31;
            font-size: 35px;
        }
        h1{
            color:#012d31;
            float:left;
            margin-left:520px;
            font-size:34px;
        }
        .box{
        float:right;
        }
        
        
        .sidenav {
    height: 0; /* 100% Full-height */
    width: 100%; /* 0 width - change this with JavaScript */
    position: fixed; /* Stay in place */
    z-index: 1; /* Stay on top */
    left: 0;
    right: 0;
    bottom: 0;
    opacity: 0;
    background: black; /* Black*/
    opacity: 0;
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 60px; /* Place content 60px from the top */
    transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
    display: flex;
    justify-content: space-around;
}

/* The navigation menu links */
.sidenav a {
    padding: 8px 32px 8px 8px;
    text-decoration: none;
    font-size: 25px;
    color: #fafafa;
    display: inline-block;
    transition: 0.3s
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover, .offcanvas a:focus{
    color: #9e9e9e;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 18px;
    font-size: 30px;
    padding: 0;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main {
    transition: margin-left .5s;
    padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
}
</style>
</head>
<body class=" black">

<nav class=" grey darken-3">
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Online Study System</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="/OnlineStudy/quitAction" style="font-size:16px" target="_top" class="waves-light btn grey">注销登录</a></li>
        <li><a onclick="openNav()" class="waves-light btn red accent-3">立即开始</a></li>
      </ul>
    </div>
  </nav>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <%
    if(powerList!=null){
for(int i=0;i<powerList.size();i++){%>
  <a href="<%=(String)((Power)powerList.get(i)).getPower_url()%>" target="content">
        <%=(String)((Power)powerList.get(i)).getPower_name()%></a>
        <%}} %>
</div>

<script>
/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
    document.getElementById("mySidenav").style.height = "80px";
    document.getElementById("mySidenav").style.opacity = "0.5";
   // document.getElementById("main").style.marginLeft = "250px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.height = "0";
    document.getElementById("mySidenav").style.opacity = "0";
}
</script>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
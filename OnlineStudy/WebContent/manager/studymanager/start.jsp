<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>播放界面</title><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /><link href="https://cdn.bootcss.com/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" />
<script type="text/javascript" src="/OnlineStudy/static/js/jquery.min.js"></script>

</head>
<body>
<span>温馨提示：点击”退出“按钮查看本次学习进度</span>
<div style="text-align:center;width:100%;height:600px;">
  <video id="myVideo" controls="controls" width="800px" height="500px" autoplay="autoplay">
        <source src="<%=request.getParameter("url")%>" type="video/mp4"/>
    </video>
    <br>
<!--<button onClick="document.getElementById('myVideo').play()">播放</button>  -->
<button onClick="return OpStart();">退出</button>
<button onClick="document.getElementById('myVideo').volume+=0.1">音量+</button>
<button onClick="document.getElementById('myVideo').volume-=0.1">音量-</button>
<button onClick="document.getElementById('myVideo').muted=true">静音</button>
<button onClick="document.getElementById('myVideo').muted=false">取消静音</button> 
</div>
<div class="progressTime">
当前播放时长:<span class="current"></span>
视频时长:<span class="duration"></span>
</div>
<form ACTION="/OnlineStudy/changeProgress" method="post" name="f1">
<input type="hidden"  name="progress"  id="progress" />
</form>

<script>
	//返回jquery对象
	var video=$('#myVideo');
	//返回视频时长
	video.on('loadedmetadata',function(){
		$('.duration').text(video[0].duration);
	});
	//更新当前播放时间
	video.on('timeupdate',function(){
		$('.current').text(video[0].currentTime);
	});
	function OpStart(){
		var videos=document.getElementById('myVideo');
		if(!videos.paused){
			videos.pause();
		}
		$('#progress').val(parseInt($('.current').text()));
		alert("您本次学习了"+$('#progress').val()+"秒");
		f1.submit();
}
</script>

<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script><script src="https://cdn.bootcss.com/materialize/0.100.2/js/materialize.min.js"></script></body>
</html>
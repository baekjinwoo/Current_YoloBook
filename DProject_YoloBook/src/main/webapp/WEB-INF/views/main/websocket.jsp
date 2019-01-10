<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 고객 문의 서비스 </title>
</head>
<body>

<b><font size="5"> 고객 문의 서비스 </font></b> &nbsp;
<%
	 Date now = new Date();
	 SimpleDateFormat sf1 = new SimpleDateFormat("(hh:mm)");
	 SimpleDateFormat sf2 = new SimpleDateFormat("hh");
	 String today1 = sf1.format(now);
	 String today2 = sf2.format(now);
	 int today3= Integer.parseInt(today2);
%>
현재시간: <input type=text id=time value='<%= today1 %>' size="6"><br>
<input type=text id=nickname value='${member.m_name }' readonly="readonly" size="8">님 환영합니다.<br>
---------------------------------------------------------------------<br>
<div id='chatBox'>
	<div id="chatMessageArea">  
		<% 
		  if(today3 > 13  && today3 < 14){
			  %> 
			 <p>죄송합니다.
			지금은 점심시간입니다. 
			오후 1시부터 2시까지는 점심시간이며 점심시간 외 업무시간에 상담을 도와드리겠습니다.</p> <%
		  } else if(today3 > 9  && today3 < 17){
			  %> 
			 <p>안녕하세요!
			 YoloBook쇼핑몰입니다.
			  실시간 채팅상담은 평일 오전 9시부터 오후 5시까지입니다. 
			  무엇을 도와드릴까요?</p> <%
		  } else {
			  %>
			  <p>죄송합니다. 
			  지금은 업무시간이 종료되었습니다.
			업무시간은 평일 오전10시부터 오후 5시까지입니다. 업무시간에 연락주시면 친절히
			도와드리겠습니다. 감사합니다.</p>
			 <%
		  }
		%>
	</div>
	<input type=text id=message autofocus="autofocus">
	<input type=button id=sendBtn value=메시지전송>
	<input type= button id=exitBtn value=나가기><br>
</div>

<script src="resources/jquery-3.2.1.min.js"></script>
<script>
	var websocket; 
	websocket = new WebSocket("ws://70.12.109.119:9080/program/chatws"); 
	websocket.onopen= onOpen; 
	websocket.onclose=onClose;
	websocket.onmessage= onMessage; 
	
	$(function(){ 
		$("#exitBtn").on("click",function(){		
			websocket.close();  
			window.close();
		});
		
		$("#sendBtn").on("click",function(){ 		
			var nick = $("#nickname").val(); 
			var msg = $("#message").val();  
			var time = $('#time').val();
			websocket.send(nick+": "+msg+":  "+time); 
			$("#message").val(''); 
		});
	});
	
	function onOpen(){
		console.log("웹소켓 연결성공"); 
	}
	
	function onClose(){
		console.log("웹소켓 해제성공"); 
	}
	
	function onMessage(evt){
		console.log("웹소켓서버로부터 수신성공");
		var data = evt.data;
		$("#chatMessageArea").append(data+"<br>") 
		
		document.getElementById('chatBox').scrollIntoView(false);
	}
	
	$('#message').keypress(function(e){
	    if(e.which == 13)
	        $('#sendBtn').click();
	});
</script>
</body>
</html>
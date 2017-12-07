<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your First WebSocket!</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>
	<script type="text/javascript">
	
		var wsUri = "ws://192.168.0.2:8090/nanum/chat";
		//var wsUri = "ws://localhost:8090/websocket/websocket/echo.do";
		//websocket.*** 웹소켓 뒤에 붙는 함수는 제공하는 합수
		//페이지가 시작되면 WebSocket 객체를 생성해서 onopen함수를 통해 세션을 시작한다
		$(document).ready(function() {
			websocket = new WebSocket(wsUri);
			websocket.onopen = function(evt) {
				onOpen(evt)
			};
			websocket.onerror = function(evt) {
				onError(evt)
			};
			websocket.onmessage = function(evt) {
				onMessage(evt)
			};

		});

		//센드를 클릭하면 text값을 dosend함수에 보내준다
		function send_message() {			
			websocket.send(textID.value);
		}

		function init() {
			output = document.getElementById("output");
		}

		function onOpen(evt) {
			writeToScreen("Connected to Endpoint!");

		}

		//입력받은것을 화면에 보여준다
		function onMessage(evt) {
			console.log(JSON.parse(evt.data));
			var jsonMsg =JSON.parse(evt.data);				
			jsonMsg.forEach( function( v, i ){
				writeToScreen(v.name + " : " + v.msg);
			});
			
			
		}
		function onError(evt) {
			writeToScreen('ERROR: ' + evt.data);
		}	
		
		function writeToScreen(message) {
			var pre = document.createElement("p");
			pre.style.wordWrap = "break-word";
			pre.innerHTML = message;

			output.appendChild(pre);
		}
		window.addEventListener("load", init, false);
	</script>
	<h1 style="text-align: center;">Hello World WebSocket Client</h1>
	<br>
	<div style="text-align: center;">
		<form action="">			
			<input onclick="send_message()" value="Send" type="button"> 
			<input id="textID" name="textID" value="Hello WebSocket!" type="text"><br>
			
		</form>
	</div>
	<div id="output"></div>
</body>
</html>
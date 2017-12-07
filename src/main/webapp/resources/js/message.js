$(document).ready(function(){
	    $(".btn-default").click(function(){
	        //클릭되었으면
	         if($("input[id=check]").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[id=check]").prop("checked",false);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[id=check]").prop("checked",true);
	        } 
	    });
	    
	    $("#btn-delete").click(function(){
	    	var checked = "";
	    	if($("input[id=check]:checked").val() == null){
    			alert("삭제하실 내용이 없습니다.");
    			return false;
    		}
	    	
	    	$("input[id=check]:checked").each(function(index){
	    		if(checked == ""){
	    			checked += $(this).val();
	    		}else{
	    		checked += ","+$(this).val();
	    		}
	    	});
	    	$.ajax({
	    		type : "post",
	    		url : "messageDelete.nn",
	    		data : {"member_id": checked},
	    		success : function(data){
	    			swal({title: "삭제중 입니다",text:"잠시 기다려 주세요",timer: 2000,showConfirmButton: false});
	    			
	    		},
	    		error : function(xhr){
	    			alert(xhr.status);
	    		}
	    	});
	    	setTimeout("window.location.reload()",2000);
	    });
	    
	    //메시지 디테일
		//push Client설정
		console.log("typeof:" + typeof (EventSource));
		var ch;
		var sender_no = $(".sender_no").attr('title');
		var inMessage = 0;
		document.addEventListener('DOMContentLoaded', function() {
			if (Notification.permission !== "granted")
				Notification.requestPermission();
		});
		
		//push를 받을 수 있는 브라우저인지 판단 (타입오브 -> 객체의 타입확인)
		if (typeof (EventSource) != "undefined") {
			var eventSource = new EventSource("message_get.nn?sender_no="+sender_no, {
				withCredentials : true 
			});
			// EventSource EventListener의 종류
			// onmessage : 서버가 보낸 push 메세지가 수신되면 발생(리스너)
			// onerror : 서버가 보낸 push에서 에러가 발생되었을 때 발생
			// onopen : 서버가 연결이 되었을 때 발생
			eventSource.onmessage = function(event) { //리스너형식으로 돌아가고 있는 콜백함수
				/* if (ch != event.data) {
					if (!Notification) {
						alert('Desktop notifications not available in your browser. Try Chromium.');
						return;
					}
	
					if (Notification.permission !== "granted")
						Notification.requestPermission();
					else {
						var notification = new Notification(
								'쪽지 알림',
								{
									icon : 'http://cdn.sstatic.net/stackexchange/img/logos/so/so-icon.png',
									body : "쪽지가 도착했습니다.",
								});
	
						notification.onclick = function() {
							window.alert("쪽지 페이지로 이동합니다");
						};
					}
				}
				ch = event.data; */
				/* $(".message-div-item").empty(); */
				$("#message-div").html(event.data);
				if(inMessage != event.data){
					$("#message-scroll").scrollTop($("#message-scroll")[0].scrollHeight); //스크롤 자동 내리기
					//inMessage++;
				}
				inMessage = event.data;
				
		//setTimeout(function() {
					//알람 메시지 닫기
					//notification.close();
				//}, 5000);
			};
		} else {
			$("#message-div").html("해당 브라우저는 지원이 안됩니다.");
		}
	
	// Ajax로 사용자의 데이터를 보내는 쪽 
	//사용자가 입력한 내용을 서버에 저장
	$("#message-btn").click(function message(){
		var text = $("#messagetext").val().replace(/\n/g, "<br>");
		var board_no = $("#message_board_no").val();
		if(board_no == null || board_no == ""){
			board_no = 0;
		}
			$.ajax({
				type : "post",
				url : "message_insert.nn",
				data : {"text" : text,"sender_no":sender_no,"board_no":board_no}
			});
			$("#message-scroll").scrollTop($("#message-scroll")[0].scrollHeight); //스크롤 자동 내리기
			$("#messagetext").val('');
	});
		return false;//서브밋후에 페이지가 안바뀌도록 false리턴
		
	$('#messagetext').keypress(function(e) {  //엔터 누를시 전송
		if(e.which == 13) { 
			 $(this).blur(); 
			 $('#message-btn').focus().click();
			 $('#messagetext').val('').blur();
			 //$('#messagetext').focus();
		} 
	});
});
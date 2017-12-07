// JavaScript Document





/*======================로딩=========================*/
/*function loading_st(){ 
    //var ct_left = (parseInt(window.screen.width)-400)/2; 
    //var ct_top = (parseInt(window.screen.height))/3; 
    //alert(ct_left);
    //alert(ct_top);
   //로딩시 뒤에 화면 배경 넣은
   //layer_str = "<div id='loading_layer' style='width:100%; background-color:rgba(255,255,255,0.80); height:100%; position:fixed; top:0; left:0; z-index:999;'>" +
    //      "<div style='position:absolute; left:50%; margin-left:-50px; margin-top:50px; top:40%; width:100px; z-index:1000;'><img style='width:100%;' src='"+ getContextPath() +"/resources/images/ajax-loader.gif'></div></div>" ;
   //로딩만
   layer_str = "<div id='loading_layer' style='position:absolute; left:50%; margin-left:-50px; margin-top:50px; top:40%; width:100px; z-index:1000;'><img style='width:100%;' src='"+ getContextPath() +"/resources/images/ajax-loader.gif'></div>" 
   document.write(layer_str); 
} 
function loading_ed(){ 
   var ta = document.getElementById('loading_layer'); 
   ta.style.display='none';
} 
loading_st(); 
window.onload = loading_ed;*/



$(document).ready(function(e) {
   //page 로딩시 
   //root ContextPath
   function getContextPath() {
      var hostIndex = location.href.indexOf(location.host) + location.host.length;
      return location.href.substring(hostIndex, location.href.indexOf('/',
            hostIndex + 1));
   };
   
   
   //나눔 등록 글
   $('.board-write1').show();//첫번째 탭 보임
   $('.board-write2 , .board-write3').hide();
   //첫번째 탭이 선택된 모양 - 생략^^
            
   $('#board-write-nav>div>ul>li>a').on('click',function(){
      index = $(this).parent().index() + 1;
      $('#board-write-nav>div>ul>li>a').removeClass('active')
      $('.board-panel').hide();
      $('.board-write'+ index).fadeIn();
      $(this).addClass('active');
   });
   
   
   
   //메시지 자동알림
   /*$.ajax({
        type : "post",
        url : getContextPath()+"/message/msgNotificationCheck.htm",
        data: {"receiver" : "${sessionScope.user_num}"},
        success : function(data) {
           if(data != ''){
              for(var i=0; i<data.length; i++){
                   //notificationMessage.removeAttr('disabled');
                   //notificationButton.removeAttr('disabled');
                 var option = {
                          body : "",  //
                          icon : ""   //파일 이미지 경로
                    }
                   var notification = new Notification(data[i].sender + "님이 쪽지보냄", option);
                   $.ajax({
                       type : "post",
                       url : getContextPath()+ "/message/changeNotificationState.htm",
                       data : {"receiver" : "${sessionScope.user_num}", "message_num" : data[i].message_num},
                       success : function() {
                          
                       }
                    });
              }
           }
        }
     });*/
   
 //push Client설정
   
	console.log("typeof:" + typeof (EventSource));
	var messagenum;
	 
	document.addEventListener('DOMContentLoaded', function() {
		if (Notification.permission !== "granted")
			Notification.requestPermission();
	});
	
	//push를 받을 수 있는 브라우저인지 판단 (타입오브 -> 객체의 타입확인)
	if (typeof (EventSource) != "undefined") {
		
		//alert(sender_no);
		var eventSource = new EventSource("messagecheck.nn", {
			withCredentials : true 
		});
		// EventSource EventListener의 종류
		// onmessage : 서버가 보낸 push 메세지가 수신되면 발생(리스너)
		// onerror : 서버가 보낸 push에서 에러가 발생되었을 때 발생
		// onopen : 서버가 연결이 되었을 때 발생
		eventSource.onmessage = function(event) { //리스너형식으로 돌아가고 있는 콜백함수
			 /*if (event.state == messagenum && event.data != 0) {
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
				
			}*/
			
			 $("#message_alarm>p").text(event.data);
			if(event.data == 0){
				$("#message_alarm").css('display','none');
			}else{
				$("#message_alarm").css('display','block');
			}
			
			 messagenum = event.data; 
			 
			/* $(".message-div-item").empty(); */
			 
	/*setTimeout(function() {
				알람 메시지 닫기
				notification.close();
			}, 3000);*/
		};
	} else {
		$("#message-div").html("해당 브라우저는 지원이 안됩니다.");
	}
});


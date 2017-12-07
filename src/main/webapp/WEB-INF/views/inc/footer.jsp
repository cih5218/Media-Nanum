<!-- 

   @FileName : footer.jsp
   @Project : NANUM
   

-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
      <meta charset="UTF-8">
          <!-- reset -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	  <!-- sweet alert 추가 0626-->
	  <script src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script> 
	  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sweetalert.css">
   

</head>
<footer>
   <div class="footer-box">
       <div class="footer-left">
           <img src="${pageContext.request.contextPath}/resources/images/header-logo.png" alt="">
           <div>
                지역 근처를 기반으로 자신의 재능 나눔을 통해 다른 사용자들과 소통하는 나눔플랫폼서비스 입니다
            </div>
        </div>
        <div class="footer-center">
           <div>- 대표 : 차돌박이</div>
           <div>- 회사명 : (주)나눔</div>
            <div>- 이메일 : Nanum@nanum.com</div>
            <div>- 주소 : 아주대학교</div>
        </div>
        <div class="footer-right">
           <div><a href="#">- NANUM 팀</a></div>
           <div><a href="#">- 이용약관</a></div>
            <div><a href="#">- 개인정보 취급방침</a></div>
            <div><a href="#">- 고객센터</a></div>
        </div>
    </div>
</footer>




<!--===========================불필요시 페이지 분리=============================-->
<!-- ==========================채팅 script============================= -->
<script type="text/javascript">
	$(function(){
	    $(".chatting-x").click(function(){
	       $(".chatting-container").css('display','none');
	    });
	    
	    $(".chatting-icon").click(function(){
	       $(".chatting-container").toggle();
	       $(".chatting-div").scrollTop($(".chatting-div")[0].scrollHeight);
	    });
	    
	    $(".basket-icon").click(function(){
	       $(".basket-container").css('left','0px');
	    });
	    
	    $(".basket-x").click(function(){
	       $(".basket-container").css('left','-202px');
	    });
	    
	 });
      var wsUri = "ws://192.168.43.111:8090/nanum/chat";
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
            //처음 채팅 시작을 하면 스크롤을 바닥으로 붙인다.
         };
      });
      //센드를 클릭하면 text값을 dosend함수에 보내준다
      function send_message() {  
    	  
    	 var txtmsg = { txtmsg : document.getElementById("myTextarea").value}; 
         websocket.send(JSON.stringify(txtmsg));
         document.getElementById("myTextarea").value="";
      }
     
      function onOpen(evt) {
      }
      function onError(evt) {
      }  

      //입력받은것을 화면에 보여준다
      function onMessage(evt) {
         
         var jsonMsg =JSON.parse(evt.data);        
         console.log(jsonMsg);
         //console.log(jsonMsg2);
         jsonMsg.forEach( function( v, i ){
        	 var msgobj =JSON.parse(v.msg);
        	 if(msgobj.txtmsg != null){        	 	         	 
        		 if(v.email == email.value){
        	            $('#chat-div').append(
        	               '<div>'+
        	                  '<div class="track-buyer">'+
        	                  '<div class="track-buyer-right">'+
        	                     '<div class="inline-block float-left margin-5">'+
        	                        '<img src="${pageContext.request.contextPath}/resources/images/track_buyer.png" alt="">'+
        	                     '</div>'+
        	                  '</div>'+
        	                  '<div class="inline-block track-buyer-left">'+
        	                     '<div class="message inline-block">'+
        	                     msgobj.txtmsg +
        	                     '</div>'+
        	                     '<div class="track-buyer-time inline-block">'+
        	                        v.time+
        	                     '</div>'+
        	                  '</div>'+
        	               '</div>'+
        	            '</div>');
        	            }else{
        	               $('#chat-div').append(
        	               '<div>'+
        	                  '<div class="track-seller">'+
        	                     '<div class="track-seller-left">'+
        	                        '<div class="inline-block">'+
        	                           '<a href="profile.nn?member_id='+v.id +'">'+
        	                              '<img class="border-round track-profile" src="${pageContext.request.contextPath}/resources/upload/'+v.img+'" alt="">'+
        	                           '</a>'+
        	                        '</div>'+
        	                        '<div class="inline-block float-right margin-5">'+
        	                           '<img src="${pageContext.request.contextPath}/resources/images/track_seller.png" alt="">'+
        	                        '</div>'+
        	                     '</div>'+
        	                     '<div class="inline-block track-seller-right">'+
        	                        '<div class="message inline-block">'+
        	                        msgobj.txtmsg +
        	                        '</div>'+
        	                        '<div class="track-seller-time inline-block">'+
        	                           v.time+
        	                        '</div>'+
        	                     '</div>'+
        	                  '</div>'+
        	               '</div>');
        	            }  
        	 }else{
        		 //alert(msgobj.img); //게시물 이미지
        		 //alert(msgobj.subject);//게시물 제목
        		 //alert(msgobj.href);//게시물 링크
        		 //alert(v.email);//
        		 //alert(v.time);
        		 //alert(v.img);//사람 프로필 이미지 
        		 //alert(v.id);//사용자 아이디
        		 
        		 if(v.email == email.value){
        			 $('#chat-div').append(
          	               '<div>'+
          	                  '<div class="track-buyer">'+
          	                  '<div class="track-buyer-right">'+
          	                     '<div class="inline-block float-left margin-5">'+
          	                        '<img src="${pageContext.request.contextPath}/resources/images/track_buyer.png" alt="">'+
          	                     '</div>'+
          	                  '</div>'+
          	                  '<div class="inline-block track-buyer-left">'+
          	                     '<div class="message inline-block">'+
          	                     '<div><a href="'+msgobj.href+'"><img src="'+msgobj.img+'"></a>'+
          	                     '<h5>'+msgobj.subject+'</h5></div>'+
          	                     '</div>'+
          	                     '<div class="track-buyer-time inline-block">'+
          	                        v.time+
          	                     '</div>'+
          	                  '</div>'+
          	               '</div>'+
          	            '</div>');
        		 }else{
        			 $('#chat-div').append(
          	               '<div>'+
          	                  '<div class="track-seller">'+
          	                     '<div class="track-seller-left">'+
          	                        '<div class="inline-block">'+
          	                           '<a href="profile.nn?member_id='+v.id +'">'+
          	                              '<img class="border-round track-profile" src="${pageContext.request.contextPath}/resources/upload/'+v.img+'" alt="">'+
          	                           '</a>'+
          	                        '</div>'+
          	                        '<div class="inline-block float-right margin-5">'+
          	                           '<img src="${pageContext.request.contextPath}/resources/images/track_seller.png" alt="">'+
          	                        '</div>'+
          	                     '</div>'+
          	                     '<div class="inline-block track-seller-right">'+
          	                        '<div class="message inline-block">'+
          	                        '<div><a href="'+msgobj.href+'"><img src="'+msgobj.img+'"></a>'+
          	                        '<h5>'+msgobj.subject+'</h5></div>'+
          	                        '</div>'+
          	                        '<div class="track-seller-time inline-block">'+
          	                           v.time+
          	                        '</div>'+
          	                     '</div>'+
          	                  '</div>'+
          	               '</div>');
        		 }
        		 $(".chatting-div").scrollTop($(".chatting-div")[0].scrollHeight);
        			 return false;
        		
        		 
        		 
        	 }
            
            $(".chatting-div").scrollTop($(".chatting-div")[0].scrollHeight);
      });
      }
</script>
<style>
.message{}
.message>div>a>img{width: 160px; height: 120px;}
</style>

<!--  icon -->
<div class="chatting-icon">
   <img alt="" src="${pageContext.request.contextPath}/resources/images/chatting-icon.png">
</div>

<!-- 채팅 container -->
<div class="chatting-container shadow-box" ondrop="chatting_drop(event)" ondragover="chatting_dragover(event)" ondragenter="chatting_dragenter(event)">
            <input id="email"type="hidden" value="${sessionScope.Member.member_email}">
               <div class="message-detail-inbox">
                  <div class="">
                  <div class="chatting-i-top">
                     <div class="inline-block">
                        <div class="inline-block">
                           <img style="opacity:0;" class="chatting-back" src="${pageContext.request.contextPath}/resources/images/back.png" alt="">
                        </div>
                        <div class="inline-block chatting-i-top-room float-right">
                           <p class="color-8">
                              <c:if test="${empty sessionScope.Location.location_name}">
                                  지역 정보 없음
                              </c:if>
                              <c:if test="${not empty sessionScope.Location.location_name}">
                                  ${sessionScope.Location.location_name}
                              </c:if>
                           </p>
                        </div>
                     </div>
                     <div class="inline-block float-right">
                        <div class="inline-block">
                           <img class="chatting-x" src="${pageContext.request.contextPath}/resources/images/x.png" alt="">
                        </div>
                     </div>
                  </div>
                  
                  <!-- chatting-div -->  
                  <div class="float-left chatting-div" style="top:48px;">
                     <div class="message-div-item" id="chat-div">
                        		
                     </div>
                  </div> 
               </div>
                   
               <!-- 하단 내용 -->
               <div class="row chatting-input-box">
                  <div class="width-100 shadow-box">
                     <div class="send-div">
                        <div class="tab-content">
                           <div class="position-relative">
                              <textarea id="myTextarea"rows="5" placeholder="메시지는 엔터(enter)키로 전송, 쉬프트(shift)+엔터(enter)키로 줄바꿈 가능합니다." rows="" cols=""></textarea>
                           </div>
                           <div class="row">
                              <div class="inline-block float-right padding-10">
                                 <button class="btn btn-block btn-primary" onclick="send_message()">
                                    보내기
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>   
            </div>
</div>
<!-- chatting End.. -->

<style>
/* 장바구니 */
.basket-container{width: 200px; height: 100%; position: fixed; top: 0; left: -202px; z-index: 100; transition:all ease-out 0.3s; min-height: 550px;}
.basket-i-top{padding: 7px; background-color: #fff; border-bottom: solid #e5e5e5 1px;}
.basket-i-top p{font-size: 13px;}
.basket-x{cursor: pointer;}

.basket-middle{position: absolute; top: 300px; left: 0; height: 100%; width: 100%; box-sizing:border-box;}
.basket-middle-top{width: 100%;}
.basket-middle-top button{width: 100%; background: inherit;}

.basket-middle-bottom{width: 100%; position: absolute; bottom: 300px; box-sizing:border-box;}
.basket-middle-bottom button{width: 100%; background: inherit;}
.basket-middle-middle{position: absolute; width: 100%; bottom:336px; height: auto; box-sizing:border-box; background-color:#eeeeee; }
.basket-middle-middle:after{content: ""; display: block; clear: both;}
.basket-content{box-sizing:border-box; position:relative; width:100%; height: 100%; z-index: 101; overflow: hidden;}
.basket-content-div{position: relative;}

.basket-bottom{height:258px; box-sizing:border-box;}
.basket-icon{position: relative; left: 201px; box-sizing:border-box; display: inline-block; z-index: 99;}
.basket-icon>img{cursor: pointer; border-radius:0 12px 12px 0; border: 1px solid #c8eaeb; box-sizing:border-box;
    box-shadow: 0 6px 13px 0 rgba(0,0,0,.23); background-color: #19d1d4;}
.basket-item{background-color: #fff; max-height: 180px; height:180px; box-sizing:border-box; text-align:center; overflow: hidden; padding-bottom: 5px; position: relative;}
.basket-item>a>img{max-height: 151px; max-width: 200px; width: 200px; height: 151px;}
.basket-item h5{font-weight: 400; padding: 3px 5px;}
.basket-item-close{cursor:pointer; font-size: 14px; background-color: #fff; padding: 2px 8px; position: absolute; top: -30px; right: 0;}
.basket-item:hover .basket-item-close{top: -3px; transition: all ease-in-out 0.3s;}
</style>

<script type="text/javascript">
	
	/* 장바구니 */
	$(function(){
		//basket-middle-top
		$('.basket-middle-top').click(function(){
			if ($(".basket-content-div").height() > $('.basket-content').height()) {
				$(this).attr('disabled','disabled');
				$(".basket-content-div>.basket-item").first().appendTo('.basket-content-div');
				$('.basket-content-div').animate({
					marginTop : '-180px'
				},0, "swing",function(){
					$(".basket-content-div").css('margin-top','0px');
					$(".basket-middle-top").removeAttr('disabled');
				});
			}
		});
		
		//basket-middle-bottom
		$('.basket-middle-bottom').click(function(){
			if ($(".basket-content-div").height() > $('.basket-content').height()) {
				$(".basket-content-div>.basket-item").last().prependTo('.basket-content-div');
				$(this).attr('disabled','disabled');
				$('.basket-content-div').animate({
					marginTop : '180px'
				},0, "swing",function(){
					$(".basket-content-div").css('margin-top','0');
					$('.basket-middle-bottom').removeAttr('disabled');
				});
			}
		});
		if(!$("#email").val() == "" || !$("#email").val() == null){
			$.ajax({
				type : "post",
				url : "basket_select.nn",
				data: "basket_select",
				success : function(data) {				
					$.each(JSON.parse(data).basket_select ,function(index , element){
						$(".basket-content-div").append(
			         		'<div class="basket-item shadow-box">'+
		                 		'<div class="shadow-box basket-item-close" id="'+element.board_no+'">x</div>'+
		                  		'<a target="_blank" href="board_detail.nn?board_no='+ element.board_no +'">'+
		                  			'<img src="${pageContext.request.contextPath}/resources/upload/' +element.board_image_title+'" alt="">'+
		                  		'</a>'+
		                  		'<div class="row font-13 text-left">'+
		                  			'<h5>'+ element.board_title +'</h5>'+
		                  		'</div>'+
		                  '</div>');
					});
					
					//DOM 일단 두개 만들고 수정 ㅠㅠ 
					$(".basket-item-close").click(function(){
						$.ajax({
							type : "post",
							url : "basket_delete.nn",
							data : {"board_no" : $(this).attr('id')},
							success : function(data) {
								$("#"+JSON.parse(data).board_no).parent().remove();
							},error : function(xhr) {
								alert(xhr.status);
							}
						})
					});
					//DOM 일단 두개 만들고 수정 ㅠㅠ 
				},
				error : function(xhr) {
					alert(xhr.status);
				}
			});
		}
	});
</script>
<script type="text/javascript">
/* 드래그앤 드롭 */   
 var content_imgSrc;		//드래그 이미지
 var content_subject;		//드래그 제목
 var content_href;			//드래그 하이퍼링크

 //드래그를 시작 할 때
 function content_dragstart(event){
	content_imgSrc = event.path[3].children[0].children[0].children[1].attributes[4].value;
	content_subject = event.path[3].children[1].children[0].innerText;
	content_href = event.path[3].children[0].attributes[0].value;
 }
 
//Drag된 데이터가 놓여질때 호출된다.
function content_drag(event){
	event.preventDefault();
} 

//Drag된 데이터를 놓을 장소를 지정한다.
function content_dragover(event) {
	event.preventDefault();
}
//chatting
function chatting_dragover(event){
	event.preventDefault();
}
 
//Drag된 데이터가 해당 구역에 들어오게 될 경우 호출된다.
function content_dragenter(event){
	//console.log(event);
}
//Drag된 데이터가 해당 구역에 들어오게 될 경우 호출된다.
function chatting_dragenter(event){
	//console.log(event);
}

function content_drop(event){
	content_input();
	event.stopPropagation();   //이벤트 막기
} 

function chatting_drop(event){
	chatting_input();
	event.stopPropagation();   //이벤트 막기
}

//드랍을 했을시 호출된 함수
function chatting_input(){
	var data = {					    
		    	img: content_imgSrc,
		    	subject: content_subject,
		    	href: content_href
		  };
	websocket.send(JSON.stringify(data));
}

//드랍을 했을시 호출된 함수
function content_input(){
	var board = content_href.split('=')[1];	 //=로 자른뒤 오른쪽 부분을 가져온다.
	var board_no = board.split('&')[0];
	$.ajax({
	      url : "basket_item.nn",
	      type : "post",	     
	      data : { 'board_no' : board_no},
	      success : function(data) {
	    	  if (JSON.parse(data).basket_item == "fail") {
	    		  //스윗얼렀으로
				 //alert('중복된 게시글');
			  }else if(JSON.parse(data).basket_item == "success"){
	         	$(".basket-content-div").append(
	         		'<div class="basket-item shadow-box">'+
                 		'<div class="shadow-box basket-item-close" id="'+board_no+'">x</div>'+
                  		'<a target="_blank" href="'+ content_href +'">'+
                  			'<img src="'+content_imgSrc+'" alt="">'+
                  		'</a>'+
                  		'<div class="row font-13 text-left">'+
                  			'<h5>'+ content_subject +'</h5>'+
                  		'</div>'+
                  '</div>');
			  }
	    	  
	    		//DOM 일단 두개 만들고 수정 ㅠㅠ 
				$(".basket-item-close").click(function(){
					$.ajax({
						type : "post",
						url : "basket_delete.nn",
						data : {"board_no" : $(this).attr('id')},
						success : function(data) {
							$("#"+JSON.parse(data).board_no).parent().remove();
						},error : function(xhr) {
							alert(xhr.status);
						}
					})
				});
				//DOM 일단 두개 만들고 수정 ㅠㅠ 
	      },
	      error : function(xhr) {
	         alert(xhr.status);
	      }
	   });
}
</script>
<!-- basket -->
<div class="basket-container shadow-box">
   <div>
      <div class="basket-i-top">
         <div class="inline-block">
            <div class="inline-block float-right">
               <p class="color-8">
                  장 바구니
               </p>
            </div>
         </div>
         <div class="inline-block float-right">
            <div class="inline-block">
               <img class="basket-x" src="${pageContext.request.contextPath}/resources/images/x.png" alt="">
            </div>
         </div>
      </div>
      <div class="basket-middle">
         <div class="basket-middle-top">
            <button class="shadow-box">
               <img src="${pageContext.request.contextPath}/resources/images/up-btn.png" alt="">
            </button>
         </div>
         
         <div class="basket-middle-middle float-left" style="top: 36px;">
            <div class="basket-content" ondrop="content_drop(event)" ondragover="content_dragover(event)" ondragenter="content_dragenter(event)">
            <!-- <div class="basket-content"> -->
               <div class="basket-content-div">
                  
                  <!-- 여기서 부터 드래그로 넣는다 -->
                  
                  <!-- 여기서 부터 드래그로 넣는다 -->
                  
               </div>
            </div>
         </div>
         
         <div class="basket-middle-bottom">
            <button class="shadow-box">
               <img src="${pageContext.request.contextPath}/resources/images/down-btn.png" alt="">
            </button>
         </div>
      </div>
      
      <!-- 상단에 뭐를 넣을까? -->
      <div class="basket-bottom">
         
      </div>
      <!-- 상단에 뭐를 넣을까? -->
      
      <div class="basket-icon">
         <img src="${pageContext.request.contextPath}/resources/images/basket-icon.png" alt="">
      </div>
   </div>
</div>


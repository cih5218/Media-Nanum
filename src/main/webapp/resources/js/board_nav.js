// JavaScript Document

$(function(){
   $("#board-write-section").parent("div").
   prepend('<div id="board-write-nav" class="board-write-nav">'+
         '<div class="shadow-box new-list">'+
             '<h4><b class="board-nav-title">나눔</b></h4>'+
             '<h5>'+
             	'<div>'+
                    '<a href="message_list.nn">메시지관리</a>'+
                '</div>'+
             '</h5>'+
             '<h5>'+
                '<div>'+
                    '<a href="my_profile.nn">프로필</a>'+
                 '</div>'+
             '</h5>'+
             '<h5>'+
	             '<div>'+
	                 '<a href="board_request_list.nn">나눠주세요</a>'+
	             '</div>'+
	         '</h5>'+
          '</div>'+
          '<div class="shadow-box new-list">'+
              '<h4><b class="board-nav-title">구매</b></h4>'+
                  '<h5>'+
                     '<div>'+
                     	'<a href="#">구매 관리</a>'+
                     '</div>'+
                  '</h5>'+
          '</div>'+
          '<div class="shadow-box new-list">'+
              '<h4><b class="board-nav-title">판매</b></h4>'+
                  '<h5>'+
                     '<div>'+
                    	'<a href="board_write.nn">나눔 재능등록</a>'+
                     '</div>'+
                  '</h5>'+
                  '<h5>'+
                  	'<div>'+
                       '<a href="#">나눔 함</a>'+
                    '</div>'+
                  '</h5>'+
                  '<h5>'+
                    '<div>'+
                       '<a href="#">나의 나눔</a>'+
                    '</div>'+
                  '</h5>'+
          '</div>'+
      '</div>');       		
});
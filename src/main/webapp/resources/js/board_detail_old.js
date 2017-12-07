$(function(){
	//root ContextPath
   function getContextPath() {
      var hostIndex = location.href.indexOf(location.host) + location.host.length;
      return location.href.substring(hostIndex, location.href.indexOf('/',
            hostIndex + 1));
   };
	// 등록 게시글 수정 script detail 299
	if ($('#user_email').val() == $('#user_id').val()) {
		$('#request_submit').css('display', 'none');
		$('#modify_submit').css('display', 'block');
		$('#delete_submit').css('display', 'block');
	} else {
		$('#request_submit').css('display', 'block');
		$('#delete_submit').css('display', 'none');
		$('#modify_submit').css('display', 'none');
	}
	
	//
	$(".request-open").click(function(){
		$(".request-close").css('border-radius','5px 5px 0 0');
		$(this).css('display','none');
		$('.request-close').css('display','block');
		$(".iphone-wrap").css('display','block');
	});
	
	$(".request-close").click(function(){
		
		$(this).css('display','none');
		$('.request-open').css('display','block');
		$(".iphone-wrap").css('display','none');
	});
	
	$('#check_submit').click(function(){
		$.ajax({
			url : "check_board.nn",
			type : "get",
			dataType:"json",
			data : { 
				board_no : $("#board_no").val(), 
				check_content : $('#check_content').val(), 
				check_score : $('#check_score').val()
			},
			success : function(data) {
				var star = null;
				if(data.check.check_score == 1){
					star = "★☆☆☆☆";
				}else if(data.check.check_score == 2){
					star = "★★☆☆☆";
				}else if(data.check.check_score == 3){
					star = "★★★☆☆";
				}else if(data.check.check_score == 4){
					star = "★★★★☆";
				}else if(data.check.check_score == 5){
					star = "★★★★★";
				}
				$('#re_board_list').append('<div class="comment">'+
            	'<div class="margin-15 shadow-box">'+
            	'<div class="detail-comment">'+
                	'<div class="detail-comment-img">'+
                    	'<img src="'+getContextPath()+'/resources/images/login-logo.png" alt="" class="border-round">'+
                    '</div>'+
                    '<div class="detail-comment-text">'+
                    	'<div>'+
                        	'<a href="#">'+data.userid+'</a>'+
                       '</div>'+
                        '<div class="color-8">'+
                        	data.check.check_content+
                        '</div>'+
                        '<div class="margin-10">'+
                        	'<h6 class="inline-block color-8">'+data.check_date+'</h6>'+
                            '<div class="inline-block float-right">'+
                            	'<div class="comment-star">'+
                            		star+
                                '</div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
                '<div class="detail-comment detail-comment-seller">'+
                	'<div class="detail-comment-img">'+
                    	'<img src="'+getContextPath()+'/resources/images/login-logo.png" alt="" class="border-round">'+
                    '</div>'+
                    '<div class="detail-comment-text">'+
                    	'<div>'+
                        	'<a href="#">'+$('#user_id').val()+'</a>'+
                        '</div>'+
                        '<div class="color-8">'+
                        	' '
                        +'</div>'+
                        '<div class="margin-10">'+
                        	'<h6 class="inline-block color-8">&nbsp;</h6>'+
                            '<h6 class="inline-block color-8 float-right">나눔 판매자</h6>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>'+
        '</div>')
        $('#check_content').val("");
		$('#check_score').val("");
			},
			error : function(xhr) {
				alert(xhr.status);
			}
		});
	});
});
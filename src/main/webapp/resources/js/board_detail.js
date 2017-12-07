$(function(){
	for(var j = 0 ; j < $('#listlength').val() ; j ++){
		for(var i = 0 ; i < $('#checkrelist').val() ; i ++){
			if($('.request' + j + ' #check_id').val()==$('.request' + i + ' #checkre_no').val()){
				$('.request' + j + ' #checkre_content').css('display','none');
				$('.request' + j + ' #'+j).css('display','none');
				$('.request' + j + ' #checkre').html($('.request' + i + ' #checkre_cont').val());
			}
		}
	}
	//root ContextPath
   function getContextPath() {
      var hostIndex = location.href.indexOf(location.host) + location.host.length;
      return location.href.substring(hostIndex, location.href.indexOf('/',
            hostIndex + 1));
   };
   // 등록 게시글 수정 script detail 299
   if($('#user_email').val()==$('#user_id').val()){
	   $('#request_submit').css('display','none');
	   $('#declare_submit').css('display','none');
	   $('#modify_submit').css('display','block');
	   $('#delete_submit').css('display','block');
   }else{
	   $('#request_submit').css('display','block');
	   $('#declare_submit').css('display','block');
	   $('#delete_submit').css('display','none');
	   $('#modify_submit').css('display','none');
   }
   if($('#result').val()!=0){
	   $('#equals').css('display','none');
	   $('#check_content').attr('readonly','readonly');
	   $('#check_score').attr('readonly','readonly');
	   $('#check_submit').css('display','none');
   }
   if($('#str').val()=="sussece"){
	   $('#equals').css('display','none');
   }else{
	   $('.submitindex').css('display','none');
	   $('.checkre_content').css('display','none');
   }
   //나눔요청을 클릭해쓸떄 
	$(".request-open").click(function(){
		$.ajax({
			url : "overlap_exist.nn",
			type : "post",
			data : {
				board_no : $("#board_no").val(),
				member_id :$("#member_id").val()
			},
			success : function(data) {
				data = JSON.parse(data);
				if(data.result==0){
					//값이 존재하지 않는다! 그러니까 등록가능
					$(".request-close").css('border-radius','5px 5px 0 0');
					$(".request-open").css('display','none');
					$('.request-close').css('display','block');
					$(".iphone-wrap").css('display','block');
					
				}
				else{
				//값이 존재한다
					alert("이미 요청한 게시글입니다.\n 요청한 나눔 회원이 응답이 없을경우, 문의 메뉴를 이용해 주세요.")

				}
			},
			error : function(xhr) {
				alert(xhr.status);
			}
		});
		
		
	});
	//나눔 요청을 또 눌렀을때 
	$(".request-close").click(function(){
			
		$(this).css('display','none');
		$('.request-open').css('display','block');
		$(".iphone-wrap").css('display','none');
	});
   $(".click_check").click(function() {
		var index = $(this).attr('id');
		if($('.request' + index + ' #checkre_content').val() == ""){
			swal("확인해주세요!","답글 내용이 비어있습니다.")
			return false;
		}
		$.ajax({
			url : "checkre_insert.nn",
			type : "post",
			data : {
				checkre_content : $('.request' + index + ' #checkre_content').val(),
				check_id : $('.request' + index + ' #check_id').val()
			},
			success : function(data) {
				data = JSON.parse(data);
				//alert(data.result);
				if(data.result!=0){
					//$('.request' + index + ' #checkre_content').html("");
					$('.request' + index + ' #checkre').html(data.checkre_content);
					$('.request' + index + ' #checkre_content').attr('display','none');
					$('.request' + index + ' #'+index).css('display','none');
				}
			},
			error : function(xhr) {
				alert(xhr.status);
			}
		});
	});
	$('#check_submit').click(function(){
		if($('#check_content').val() == "" || $('#check_score').val() == ""){
			if($('#check_content').val() == ""){
				swal("확인해주세요!","후기 내용이 비어있습니다.")
				return false;
			}else if ($('#check_score').val() == ""){
				swal("확인해주세요!","후기 점수가 비어있습니다.")
				return false;
			}
		}
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
                    	'<img src="'+getContextPath()+'/resources/upload/'+data.sender_member.member_image+'" alt="" class="border-round">'+
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
                    	'<img src="'+getContextPath()+'/resources/upload/'+data.receiver_member.member_image+'" alt="" class="border-round">'+
                    '</div>'+
                    '<div class="detail-comment-text">'+
                    	'<div>'+
                        	'<a href="#">'+$('#user_email').val()+'</a>'+
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
        $('#equals').css('display','none');
			},
			error : function(xhr) {
				alert(xhr.status);
			}
		});
	});
});
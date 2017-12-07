$(function(){
	//root ContextPath
	   function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
		
	
	   };
	   
	
	// 등록 게시글 수정 script detail 299


	$('.request-tab>li').click(function(){
    $(".request-tab>li").removeClass('request-tab-selected');
	   $(this).addClass('request-tab-selected');
	      var selectTitle = $(".request-tab-selected").attr('title');
	        
	      
	      
	      $.ajax({
	        	type : "post",
				url : "board_request_list.nn",
				data : {"selectTitle": selectTitle},
				success : function(data){
					
					data = JSON.parse(data);
					$('.request-content').empty();
					$('.request-none').empty();
					
					if(data.boardrequestlist!=null && data.boardrequestlist!=""){
						
						for(i=0; i<=data.boardrequestlist.length;i++){
							var suppose='<a id="request_submit" href="message_detail.nn?Sender='+data.boardrequestlist[i].member_id+'" class="btn request-head-btn btn-info">'+
	                     	 '제안하기</a>';
	                        var modify='<a id="modify_submit" href="board_request_modify.nn?board_no='+data.boardrequestlist[i].help_no+'" class="btn request-head-btn btn-info">'+       
	                     	 '수정</a>';
	                        
	                        var board_delete='<a id="modify_delete" href="board_request_delete.nn?board_no='+data.boardrequestlist[i].help_no+'" class="modify_delete'+i+' btn request-head-btn btn-info">'+'삭제</a>';
	                        
								  
	                        var req_board_btn ="";
	                        var req_board_del ="";
							if(data.member[i].member_id==data.user_id.member_id){
			
								req_board_btn=modify;
								req_board_del=board_delete;
							}else{
								//여기 들어오면 제안하기 
								req_board_btn=suppose; 
							}
						
						$('.request-content').append('<div class="margin-30">'+
	                     '<div class="shadow-box">'+
	                          	'<div class="request-content-top">'+
	                              	'<div class="row">'+
	                                  	'<div>'+
	                                      	'<div class="row">'+
	                                              '<div class="width-45 inline-block">'+
	                                              	'<div class="inline-block request-profile">'+
	                                                  	'<a href="#">'+
	                                                      	'<img class="border-round" src="'+getContextPath()+'/resources/upload/'+data.member[i].member_image+'" alt="">'+
	                                                      '</a>'+
	                                                  '</div>'+
	                                              	'<div class="inline-block">'+
	                                                  	'<a class="request-a" href="profile.nn?member_id='+data.member[i].member_id+'">'+data.member[i].member_name+'</a>'+
	                                                  '</div>'+
	                                              '</div>'+
	                                              '<div class="width-50 float-right inline-block margin-5">'+
	                                              	'<div class="text-right color-8 font-13">'+
	                                                  	data.boardrequestlist[i].request_category+
	                                                  '</div>'+
	                                              '</div>'+
	                                          '</div>'+
	                                      '</div>'+
	                                      '<h4 class="margin-10">'+
	                                      	'<b>'+data.boardrequestlist[i].request_title+'</b>'+
	                                      '</h4>'+
	                                      '<h5 class="margin-10 font-13">'+
	                                      	'<div class="request-text">'+
	                                          	'<a href="#">'+
	                                          		data.boardrequestlist[i].request_content+
	                                              '</a>'+
	                                          '</div>'+
	                                          '<div class="text-right">'+
	                                          	'<a href="#" class="request-a">'+
	                                              	'<span>'+
	                                                  	'더 보기'+
	                                                  '</span>'+
	                                              '</a>'+
	                                          '</div>'+
	                                      '</h5>'+
	                                      '<div class="margin-15 request-file">'+
	                                      	'<div class="inline-block request-profile">'+
	                                             '<a href="#">'+
	                                               '<img class="border-round" src="'+getContextPath()+'/resources/images/main_1.png" alt="">'+
	                                             '</a>'+
	                                          '</div>'+
	                                          '<div class="inline-block">'+
	                                              '<a class="request-a" href="#">nanum.jpg</a>'+
												'</div>'+
	                                      '</div>'+
	                                  '</div>'+
	                                  '<div class="margin-15 request-sal">'+
	                                  	'<div class="row">'+
	                                          '<h4 class="width-50 inline-block">'+
	                                              '<span class="color-8">희망금액</span>&nbsp;&nbsp;'+
	                                              '<b>&#8361;&nbsp;'+data.boardrequestlist[i].request_account+'</b>'+
	                                          '</h4>'+
	                                          '<div class="text-right inline-block float-right">'+req_board_btn+req_board_del+
	                                          '</div>'+
	                                      '</div>'+
	                                  '</div>'+                         
	                              '</div>'+
	                              '<div class="request-content-bottom font-13">'+
	                              	'<div class="row">'+
	                                  	'<div class="color-8 width-50 inline-block">'+
	                                  		data.boardrequestlist[i].request_term +'까지'+
	                                     '</div>'+
	                                      '<div class="text-right inline-block float-right font-13">'+
	                                      	'<span class="request-a">0명</span>이&nbsp;제안 했습니다.'+
	                                     ' </div>'+
	                                 ' </div>'+
	                              '</div>'+
	                          '</div>'+
	                      '</div>'
	                      );
						
						  $(".modify_delete"+i).click(function(){
							  swal('글이 삭제되었습니다!');
					       });
						


						}
					
						
					}else{
	                    	  $('.request-none').append('<div class="shadow-box">'+
	                              	'<div class="row">'+
	                                  	'<div class="text-center">'+
	                                      	'<img src="'+getContextPath()+'/resources/images/nothing_massage.png" alt="">'+
	                                          '<h4 class="mar_30">'+
	                                          	'해당되는 정보가 없습니다'+
	                                          '</h4>'+
	                                      '</div>'+
	                                  '</div>'+
	                             '</div>'
	                    	  );
	                      }
				  },
				  error : function(xhr){
					  alert(xhr.status);
				  }
	        });

    	});
    	/* 시작시 클릭 */
     	$(".request-tab-selected").trigger('click');
     	
     	
     	

});	
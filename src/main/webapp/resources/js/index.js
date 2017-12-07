// JavaScript Document

var latitude="";
var longitude="";
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
    	alert('단말기에서 현재 위치를 사용할 수 없습니다.');
    }
}
function showPosition(position) {
	latitude = position.coords.latitude;
	longitude =  position.coords.longitude;   
}
$(function() {
	//root ContextPath
	getLocation();
	function getContextPath() {
	   var hostIndex = location.href.indexOf(location.host) + location.host.length;
	   return location.href.substring(hostIndex, location.href.indexOf('/',
	        hostIndex + 1));
	};
	
	//scroll head 스크롤에 따른 헤더영역 표시
	$(window).scroll(function(e) {
		if($(this).scrollTop() >= 500){
			$(".head-scroll-box").css({
				'margin-top':'0px'
			});
		}else if($(this).scrollTop() < 500){
			$(".head-scroll-box").css({
				"margin-top" : "-60px"							
			});
		}
	});
	
	
	//modal
	$(".index-back-photo .open-modal").click(function() {
		$(".modal-content").animate({'opacity' : '1' , 'top' : '0'},500);
		$(".modal-wrap").css({'display': 'block'});
		$("html").css('overflow-y', 'hidden');
	});
	
	$(".modal-back").click(function() {
		$(".modal-content").animate({'top' : '-350px' ,'opacity' : '0'},500);
		$(".modal-wrap").css('display', 'none');
		$("html").css('overflow-y', 'scroll');
	});

	//슬라이드로 개발하기
	$(".modal-next").click(function() {
	});
	
	
	// 인덱스 페이지 에서 문구 자동 슬라이드
	setInterval(function(){
		$(".head-index-slider").animate({
			right : '100%'
		},800,function(){
			$(".head-index-slider>div:first-child").appendTo(".head-index-slider");
			$(".head-index-slider").css('right','0');
		});
	},5000);
	
	
	//자동 실행
	//추후에 버튼을 눌렀을때에는 정지 하게 만들기 
	//최태호 16.06.15
	var setIn = setInterval(function(){
		$(".btn-next").trigger('click');	
	},5000);
	
	//slide btn
	$(".btn-pre").click(function(){
		$(this).attr('disabled','disabled');
		$(".review-slider").animate({
			marginLeft : '100%'
		},500, "swing",function(){
			$(".review-slider>div").last().prependTo(".review-slider");
			$(".review-slider").css("margin-left", "0px");
			$(".btn-pre").removeAttr('disabled');
		});
	});
	
	$(".btn-next").click(function(){
		$(this).attr('disabled','disabled');
		$(".review-slider").animate({
			marginLeft : '-100%'
		},500, "swing",function(){
			$(".review-slider>div").eq(0).appendTo(".review-slider");
			$(".review-slider").css("margin-left","0px");
			$(".btn-next").removeAttr('disabled');
		});
	});
	//인덱스 글 더보기
	$(".container-btn>a").click(function(){
        var selectTitle = $(".container-list-selected").attr('title');
        $(".container-btn>a").attr('href','board_list.nn?title='+selectTitle+'&latitude='+latitude+'&longitude='+longitude);
    });
	
	//검색
	$(".index-search-btn-a").click(function(){
		var selectSearch = $("#search").val();
		$(this).attr('href','board_list.nn?search='+selectSearch+'&latitude='+latitude+'&longitude='+longitude);	
		//return false;
	});
	
	$(".container-list>ul>li>a").click(function(){
		$(".container-list>ul>li>a").removeClass('container-list-selected');
		$(this).addClass('container-list-selected');
	});
	
	
	
	//인덱스 글 목록
          $(".container-list>ul>li>a").click(function(){
              $(".container-list>ul>li>a").removeClass('container-list-selected');
 	          $(this).addClass('container-list-selected');
              var selectTitle = $(".container-list-selected").attr('title');
              $.ajax({
            	  type : "post",
				  url : "list.nn",
				  data : {"selectTitle": selectTitle},
				  success : function(data) {  
						data = JSON.parse(data);
						$('#category-content').empty();
						for(var i = 0; i < 8; i++){    //8개 까지만 띄운다
							$("#category-content").append(
						'<div class="category-content">'+
                              '<div class="margin-20 shadow-box">'+
                                   '<a href="board_detail.nn?board_no='+data.list[i].board_no+'">'+
                                       '<div class="category-img">'+
                                           '<div class="category-price">'+
                                               '<span>&#8361;&nbsp;'+data.list[i].board_account+'</span>'+
                                           '</div>'+
                                           '<img id="content_img" ondragstart="content_dragstart(event)" draggable="true" ondrag="content_drag(event)" src="'+getContextPath()+'/resources/upload/'+data.list[i].board_image_title+'" alt="">'+
                                       '</div>'+
                                   '</a>'+
                                   '<div class="padding-10">'+
                                       '<h5 class="category-content-title">'+
                                           '<a href="board_detail.nn?board_no='+data.list[i].board_no+'" target="_blank" class="color-3">'+
                                           		data.list[i].board_title+
                                           '</a>'+
                                       '</h5>'+
                                       '<div class="margin-15 position-relative">'+
                                       		'<div class="category-profile">'+
                                               '<div class="position-relative">'+
                                                   '<div class="category-profile-body"></div>'+
                                                   '<div class="category-profile-img">'+
                                                   	   '<a href="profile.nn?member_id='+data.list2[i].member_id+'">'+
                                                   	   	'<img src="'+getContextPath()+'/resources/upload/'+data.list2[i].member_image+'" alt="">'+
                                                       '</a>'+
                                                   '</div>'+
                                               '</div>'+
                                           '</div>'+
                                           '<h6 class="category-id">'+
                                               '<a href="#" class="color-8">'+
                                               		data.list2[i].member_name+
                                               '</a>'+
                                           '</h6>'+
                                           '<div class="category-star">'+
                                               '<h6>'+
                                                   '<div class="inline-block color-8">'+
                                                       '<div>★★★★★</div>'+
                                                   '</div>'+
                                                   '<div class="inline-block color-8">('+data.list[i].board_like+')</div>'+
                                               '</h6>'+
                                           '</div>'+
                                       '</div>'+
                                   '</div>'+
                               '</div>'+
                           '</div>');
							}
						},
					error: function(xhr){						
					alert(xhr.status);
				}
              }
           );
        });
        /* 시작시 클릭 */
      	$(".container-list>ul>li>a").first().trigger('click');
});


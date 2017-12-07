<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 글 상세</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/GPS.css">
    <script src="${pageContext.request.contextPath}/resources/js/GPS_Line.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/board_detail.js"></script>
</head>
<div class="container-body">
<input type="hidden" id="location_name" value="${location.location_name}">
<input type="hidden" id="mylocation_name" value="${mylocation.location_name}">
<input type="hidden" id="user_id" value="${userid}">
<input type="hidden" id="user_email" value="${user_email}">
<input type="hidden" id="result" value="${result}">
<input type="hidden" id="str" value="${str}">
<input type="hidden" id="checkrelist" value="${fn:length(checkrelist)}">
<input type="hidden" id="listlength" value="${fn:length(list)}">

	<div class="container">
    	<div class="row margin-30">
        
        	<!-- board-detail-box-->
        	<div class="board-detail-box inline-block">
            
            	<!-- board top box -->
            	<div class="row">
                	<div>
                    	<div class="shadow-box">
                        	<div class="position-relative">
                            	<div class="text-center">
                                	<img src="${pageContext.request.contextPath}/resources/upload/${boardnn.board_image_title}" alt="" class="board-detail-main-img" title="게시글 제목으로">
                                </div>
                            </div>
                            
                            <div class="board-detail-left">
                            	<div class="row">
                                	<h3>${boardnn.board_title}</h3>
									<div class="like-div">
										<div class="like_empty like float-right">
											<img src="${pageContext.request.contextPath}/resources/images/like_empty.png" alt="">
										</div>

										<div class="like_full like float-right">
											<img src="${pageContext.request.contextPath}/resources/images/like_full	.png" alt="">
										</div>
										<ul class="inline-block">
											<li class="color-o font-13">좋아요</li>
											<li class="board_like_total"></li><span>&nbsp;명</span>
										</ul>
									</div>
									<style>
									.like-div{position: absolute;top: 0; right: 0px;}
									.like-div>ul{float: right; margin-right: 15px;}
									.like-div>ul>li{float: left; list-style: none; padding: 0 5px 0 10px;}
									.like-div>ul>li:first-child{padding-top: 2px;}
									.like_empty, .like_full {display: none; margin-top: -5px;}
									</style>
								</div>
                                
                                <div class="row">
                                	<h6 class="inline-block width-50">
                                    	<div class="margin-15">
                                        	카테고리&nbsp;&nbsp;>&nbsp;&nbsp; 
                                            ${boardnn.board_category}
                                        </div>
                                    </h6>
                                    <h3 class="inline-block float-right">
                                    	<div class="default-price account">
                                        	&#8361;&nbsp;<b></b>
                                        </div>
                                        <input type="hidden" id="account" value="${boardnn.board_account}">
                                        <script type="text/javascript">
                                        	$(function() {
                                        		var str = $('#account').val().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                        		$('.account>b').html(str);
											});
                                        </script>
                                    </h3>
                                </div>
                                <div class="detail-info margin-15 font-14">
                                    <div class="row margin-10">
                                    	<div class="inline-block color-8 width-50">기본 작업일</div>
                                        <div class="inline-block text-right float-right">D${boardnn.board_term} 일</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- board top box -->
                
                
                <!-- 나눔 글-->
                <div class="row">
                    
                    <!-- 나눔설명 -->
                    <div class="margin-30">
                    	<h3>
                        	<b>나눔설명</b>
                        </h3>
                        <div class="shadow-box margin-15">
                        	<div class="board-detail-text font-14">
                            	${boardnn.board_content}<br><br>
                            </div>
                            
                            <div class="board-detail-images text-center">
                            	<iframe src="${boardnn.board_movie_url}" width="642" height="400"></iframe>
                                <div>
                                	<img src="${pageContext.request.contextPath}/resources/upload/${boardnn.board_image_detail}" alt="" class="board-detail-main-img">
                                </div>
                                <!-- 지도 -->
                                <input type="hidden" id="wedo" value="${location.location_wedo}">
                                <input type="hidden" id="kyoungdo" value="${location.location_kyoungdo}">
                                <div>
                                	${location.location_name}
                                </div>
                                <div class="margin-10">
									<div id="map_canvas" style="width: 100%;"></div>
								</div>
								<div id="controls">
									<input type="radio" name="type" value="establishment"
										onclick="search()" checked="checked" style="display: none" />
									<br />
								</div>
								<div><b>태그</b></div>
                                <div class="font-14">
                                	<c:choose>
                                		<c:when test="${taginfo.size()!=0}">
                                			<c:forEach items="${taginfo}" var="i">
												&#35;${i.tag_name}
                                			</c:forEach>
                                		</c:when>
                                		<c:otherwise>
                                			태그가 없습니다.
                                		</c:otherwise>
                                	</c:choose>
                                </div>
								<div id="listing">
									<table id="results"></table>
								</div>
							</div>
                        </div>
                    </div>
                    <!-- 나눔설명 -->
                    
                    
                    <!-- 나눔평가 -->
                    <div class="margin-55" id="re_board_list">
                    	<h3>
                        	<b>나눔평가</b>
                        </h3>
                    
                        <!-- star -->
                        <div>
                            <div class="margin-15 text-center">
                                <div class="board-detail-star width-100">
                                    <div class="margin-0-auto width-50">
                                        <div>★★★★★</div>
                                    </div>
                                </div>
                                <h5>
                                    <b>${list.size()}</b>&nbsp;
                                    개의 평가
                                </h5>
                            </div>
                        </div>
                        <!-- star -->
                        
                        
                        <!-- 댓글 1-->
                        <c:forEach var="i" items="${list}" varStatus="e">
                        	<input type="hidden" id="count" value="${e.count}">
                        	<div class="comment request${e.index}">
                        	<input type="hidden" id="checkre_no" value="${checkrelist[e.index].check_no}">
                        	<input type="hidden" id="checkre_cont" value="${checkrelist[e.index].checkre_content}">
                        		<input type="hidden" id="check_id" value="${i.check_no}">
                        		<input type="hidden" id="member_email" value="${i.member_email}">
	                        	<div class="margin-15 shadow-box">
	                            	<div class="detail-comment">
	                                	<div class="detail-comment-img">
	                                    	<img src="${pageContext.request.contextPath}/resources/upload/${i.member_image}" alt="" class="border-round">
	                                    </div>
	                                    <div class="detail-comment-text">
	                                    	<div>
	                                        	<a href="profile.nn?member_id=${i.member_id}">${i.member_email}</a>
	                                        </div>
	                                        <div class="color-8">
	                                        	${i.check_content}
	                                        </div>
	                                        <div class="margin-10">
	                                        	<h6 class="inline-block color-8">${i.check_date}</h6>
	                                            <div class="inline-block float-right">
	                                            	
	                                            	<div class="comment-star" id="star${e.index}">
	                                            		<input type="hidden" id="check_score_list${e.index}" value="${i.check_score}">
	                                                	<script type="text/javascript">
	                                                		if($('#check_score_list${e.index}').val()==1){
	                                                			$('#star${e.index}').html('★☆☆☆☆');
	                                                		}else if($('#check_score_list${e.index}').val()==2){
	                                                			$('#star${e.index}').html('★★☆☆☆');
	                                                		}else if($('#check_score_list${e.index}').val()==3){
	                                                			$('#star${e.index}').html('★★★☆☆');
	                                                		}else if($('#check_score_list${e.index}').val()==4){
	                                                			$('#star${e.index}').html('★★★★☆');
	                                                		}else if($('#check_score_list${e.index}').val()==5){
	                                                			$('#star${e.index}').html('★★★★★');
	                                                		}else{
	                                                			$('#star${e.index}').html('★★★★★');
	                                                		};
	                                                	</script>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="detail-comment detail-comment-seller">
	                                	<div class="detail-comment-img">
	                                    	<img src="${pageContext.request.contextPath}/resources/upload/${membernn.member_image}" alt="" class="border-round">
	                                    </div>
	                                    <div class="detail-comment-text">
	                                    	<div>
	                                        	<a href="profile.nn?member_id=${membernn.member_id}">${user_email}</a>
	                                        	<h6 class="inline-block color-8 float-right">나눔 판매자</h6>
	                                        </div>
	                                        <div class="color-8" id="checkre">
	                                        	<textarea id="checkre_content" rows="3" class="width-100 form-control checkre_content"><%-- ${checkrelist[e.index].checkre_content} --%></textarea>
	                                        </div>
	                                        <div class="margin-10">
	                                            <div class="inline-block float-right" style="width: 140px;">
	                                                <input type="button" value="등록" class="btn btn-primary btn-block submitindex click_check" id="${e.index}">
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                        <!-- 댓글1 -->
                        
                        <!-- 댓글 폼 -->
                    </div>
                    <div class="comment" id="equals">
	                                        <security:authorize access="hasAnyRole('ROLE_재능회원','ROLE_관리자')">
                        	<div class="margin-15 shadow-box">
                            	<div class="detail-comment">
                                	<div class="detail-comment-img">
                                		<!-- 사용자 프로필 사진 가져오기 -->
                                    	<img src="${pageContext.request.contextPath}/resources/upload/${writernn.member_image}" alt="" class="border-round">
                                    </div>
                                    <div class="detail-comment-text">
                                    
				                        
                                    	<!-- <form action="check_board.nn" method="post"> -->
                                    		<input type="hidden" value="${boardnn.board_no}" id="board_no">
											<input type="hidden" value="${sessionScope.Member.member_id}" id="member_id">
	                                    	<div>
	                                    		<!-- 현재 사용자 이메일 뿌려주기 -->
	                                        	<a href="#">${userid}</a>
	                                        </div>
	                                        <div class="color-8 margin-10">
	                                        	<textarea id="check_content" rows="3" class="width-100 form-control"></textarea>
	                                        </div>
	                                        <div class="margin-10">
	                                        	<h6 class="inline-block color-8"></h6>
	                                            <div class="inline-block float-right">
	                                            	<div class="comment-star">
	                                                	★★★★★<input type="text" id="check_score" class="form-control" style="width:60px" placeholder="1~5">
	                                                </div>
	                                                <div class="margin-10">
	                                                	<input type="button" value="등록" class="btn btn-primary btn-block" id="check_submit">
	                                                </div>
	                                            </div>
	                                        </div>
                                        <!-- </form> -->
                                    </div>
                                </div>
                            </div>
	                                     </security:authorize>
                        </div>
                    
                </div>
                <!-- 나눔 글-->
            </div>
            <!-- board-detail-box-->
            
            
            
            
            
            
            
            <!-- board-detail-profile -->
            <div class="float-right board-detail-profile">
            	
                <!-- 상단 -->
                <div class="profile-div">
                	<div class="shadow-box margin-55">
                    	<div class="position-relative profile-div-top b">
                        	<div class="profile-div-top-body">
                            	<a href="profile.nn?member_id=${member.member_id}">
                                	<img src="${pageContext.request.contextPath}/resources/upload/${membernn.member_image}" class="border-round" alt="">
                                </a>
                            </div>
                        </div>
                        
                        <!-- 중간 -->
                        <div class="text-center profile-div-middle">
                        	<div>
                            	<h3>${member.member_email}</h3>
                            	<security:authorize access="hasAnyRole('ROLE_재능회원','ROLE_관리자')">
                                <div class="margin-10 div-middle">
                                	<a href="message_detail.nn?Sender=${member.member_id}&board_no=${boardnn.board_no}" class="btn btn-info">
                                    	문의
                                    </a>
                                </div>
                                </security:authorize>
                            </div>
                        </div>
                        <!-- 중간 -->
                        
                        <div class="profile-seller-body">
                        	<div class="profile-seller-info">
                            	<div class="row">
                                	<div class="text-left inline-block width-45 color-8 font-14">작업수</div>
                                    <div class="text-right inline-block width-50"><b>${count}</b>&nbsp;개</div>
                                </div>
                                <div class="row margin-10">
                                	<div class="text-left inline-block width-45 color-8 font-14">만족도</div>
                                    <div class="text-right inline-block width-50"><b>0</b>&nbsp;%</div>
                                </div>
                                <div class="row margin-10">
                                	<div class="text-left inline-block width-45 color-8 font-14">추천수</div>
                                    <div class="text-right inline-block width-50"><b>0</b>&nbsp;개</div>
                                </div>
                                <div class="row margin-10">
                                	<div class="text-left inline-block width-45 color-8 font-14">마지막 로그인</div>
                                    <div class="text-right inline-block width-50">${member.member_lastdate}</div>
                                </div>
                            </div>
                            
                            <div class="margin-15 text-left profile-seller-text">
                            	<div class="color-8 font-14">판매자 소개</div>
                                <div class="margin-15 text-left font-14">
                                	${membernn.member_about}
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <style>
.iphone-wrap{display:none; border:3px solid #FF4B4E; background-color:#fff; opacity:0.8; border-radius:0 0 5px 5px; padding: 25px; box-sizing:border-box;}
.phone-container{overflow:hidden; background-color: #fff;}
.phone-container>button{width:23%; background-color:#19D1D4; color:#fff; border:1px solid #07AFB1;}
.phone-container>textarea{height:130px; width:207px; resize:none; font-size:18px;}
.phone-bottom{border:1px solid #000000; box-sizing:border-box; height:135px; border:1px solid #888888;}
.phone-text{width:72%; padding: 3px;}
.iphone{position: relative; background: #fff; border: 2px solid #5B5B5B; height: 392px; width: 219px; border-radius: 25px; margin: 0 auto;}
.other{position: absolute; background: #474747; width: 5px; height: 5px; border-radius: 50%; top: 10px; left: 112px;}
.camera {position: absolute; width: 7px; height: 7px; border-radius: 50%; top: 24px; left: 45px;}
.screen {position: absolute; background: mintcream; border: 1px solid silver; width: 207px; top: 50px; left: 5px;}
.home {position: absolute; border: 1px solid black; background: white; border-radius: 50%; height: 30px; width: 30px; bottom: 6px; left: 50%; margin-left: -15px;}
.volumeup {position: absolute; background: #474747; width: 2px; height: 30px; border-top-left-radius: 3px 3px; border-bottom-left-radius: 3px 3px; left: -4px; top: 120px;}
.volumedown {position: absolute; background: #474747; width: 2px; height: 30px; border-top-left-radius: 3px 3px; border-bottom-left-radius: 3px 3px; left: -4px; top: 155px;}
.speaker {position: absolute; background: #474747; width: 50px; height: 5px; border-radius: 16px; top: 26px; left: 89px;}
.silent {position: absolute; background: #474747; width: 3px; height: 25px; top: 55px; left: -3px; border-top-left-radius: 3px 3px; border-bottom-left-radius: 3px 3px;}
.sleep {position: absolute; background: #474747; width: 3px; height: 35px; top: 100px; left: 217px; border-top-right-radius: 3px 3px; border-bottom-right-radius: 3px 3px;}   
</style>
                    
                    <!-- 클릭 버튼-->
                    <div class="margin-20 profile-buy">
                    	<security:authorize access="hasAnyRole('ROLE_재능회원','ROLE_관리자')">
                    	<div>
                        <a href="report_write.nn?board_no=${param.board_no}" id="declare_submit" class="btn btn-block btn-primary">
					                        신고하기
                        </a>
                        </div>
                    	<button id="request_submit" class="btn btn-block btn-primary request-open margin-10">
                           나눔 요청
                        </button>
                        <button style="display: none;" class="btn btn-block btn-primary request-close margin-10">
                           나눔 요청 닫기
                        </button>
                        
                        
                        </security:authorize>
                        <section id="" class="iphone-wrap">
						    <div class="">
						  		<div class="iphone">
						            <div class="screen">
						                <input name="" type="hidden" value="">
						                <input type="hidden" value="">
						                <div class="phone-container">
						                    <textarea placeholder="요청하기 메시지 입력" name="board_msg" id="board_msg"></textarea>
						                    <input class="phone-text" type="text" readonly placeholder="작성후 요청을 누르세요.">
						                       <button class="insert_sms">요청</button>
						                    <div class="phone-bottom">
						                    	<img src="${pageContext.request.contextPath}/resources/images/iphone-keyboard.png" alt="">
						                    </div>
						                </div>
						            </div>
						            <div class="home"></div>
						            <div class="volumeup"></div>
						            <div class="other"></div>
						            <div class="volumedown"></div>
						            <div class="speaker"></div>
						            <div class="camera"></div>
						            <div class="silent"></div>
						            <div class="sleep"></div>
						 		 </div>
							</div>
						</section>
                        <a id="modify_submit" href="board_modify.nn?board_no=${boardnn.board_no}" class="btn btn-block btn-primary" style="display:none;">
                        	나눔 수정
                        </a>
                    </div>
                    <div class="margin-20 profile-buy">
                    	<a id="delete_submit" href="board_delete.nn?board_no=${boardnn.board_no}" class="btn btn-block btn-primary" style="display:none;">
                        	나눔 삭제
                        </a>
                    </div>
                </div>
                <!-- --------------------- -->
                    <script>
                
                    //게시글 전체 좋아요 수랑 , 로그인 한 사용자의 좋아요 유무를 보여준다.
                    $(function(){
                    	//이거는 체크 상태 확인해서 like display 해줘야함
                    	//일단 전체 좋아요 뿌려주어야 하니까 여기서도 게시판 좋아요 갯수 가져와야함
                    	$.ajax({	
  				    	  type: "get",
  				    	  url: "board_like_state.nn",
  				    	  data: {"member_id":$("#member_id").val(),  
  				    		  	 "board_no":$("#board_no").val()   
  				    	  		}, 
  				    	  success : function(data) {
  				    		  data = JSON.parse(data);
  				    
  				    		  $('.board_like_total').text(data.like_board_total);
  				    		  if(data.like_state==0){//사용자가 좋아요를 안한경우  
  		                    		$(".like_full").css("display","none");
  		                    		$(".like_empty").css("display","block");
  		                    		    		            			  
  				    		  }else{ //사용자가 좋아요를 한 경우
  		                    		$(".like_empty").css("display","none");
  		                    		$(".like_full").css("display","block");
                     

  				    		  }
  				    		 }
  				    	  });               		     	
               
  					//좋아요 클릭할 때 db값 바뀜
                   	//여기서 게시판 총 좋아요 갯수 가져오자 
                    $(".like").click(function(){   
        				
                     	$.ajax({	
    				    	  type: "get",
    				    	  url: "board_like.nn",
    				    	  data: {"member_id":$("#member_id").val(),  
    				    		  	 "board_no":$("#board_no").val()   
    				    	  		}, 
    				    	  success : function(data) {
    				    		  data = JSON.parse(data);
    				    		  if(data.like_exist==0){//사용자가 좋아요를 안한경우  
      		                    		$(".like_full").css("display","block");
      		                    		$(".like_empty").css("display","none");
      		                    	  	$('.board_like_total').text(data.like_board_total+1);	

      				    		  }else{ //사용자가 좋아요를 한 경우
      		                    		$(".like_empty").css("display","block");
      		                    		$(".like_full").css("display","none");
      		                    	  	$('.board_like_total').text(data.like_board_total-1);	
      		                   		  
      				    		  }
    				    		
  	 				    		 }
    				    	  });               		     	
                    	});
                  
                    });
                    
                    $('.insert_sms').click(function(){
                    	$.ajax({	
    				    	  type: "post",
    				    	  url: "board_sms_insert.nn",
    				    	  data: {"member_id":$("#member_id").val(),  
    				    		  	 "board_no":$("#board_no").val(), 
    				    		  	 "board_msg":$("#board_msg").val()
    				    	  		}, 
    				    	  success : function(data) {
    				    		swal('문자 전송이 완료되었습니다!');
    				    
    				       	  }
                    		});
                    	});
                    </script>
                
                
                
            </div>
            
            <!-- board-detail-profile -->
            <!-- 비슷한 나눔-->
            <div class="row margin-55">
                	<div>
                    	<h3>
                        	<b>비슷한 나눔</b>
                        </h3>
                    </div>
                    
                    <div class="rows margin-0-auto">
                        <!--4개 반복으로 뿌려주기 비슷한-->
                        <c:forEach items="${connectboardlist}" var="connectboardlist" end="3" varStatus="i">
                        <div class="category-content">
                            <div class="margin-30 shadow-box">
                                <a href="board_detail.nn?board_no=${connectboardlist.board_no}&category=${connectboardlist.board_category}">
                                    <div class="category-img">
                                        <div class="category-price">
                                            <span>&#8361;&nbsp;${connectboardlist.board_account}</span>
                                        </div>
                                        
                                        <img src="${pageContext.request.contextPath}/resources/upload/${connectboardlist.board_image_title}" alt="">
                                    </div>
                                </a>
                                <div class="padding-10">
                                    <h5 class="category-content-title">
                                        <a href="board_detail.nn?board_no=${connectboardlist.board_no}&category=${connectboardlist.board_category}" target="_blank" class="color-3">
                                            ${connectboardlist.board_title}
                                        </a>
                                    </h5>
                                    <div class="margin-15 position-relative">
                                    	<div class="category-profile">
                                            <div class="position-relative">
                                                <div class="category-profile-body"></div>
                                                <div class="category-profile-img">
                                                	<a href="profile.nn?member_id=${connectboardmember[i.index].member_id}">
                                                    <img src="${pageContext.request.contextPath}/resources/upload/${connectboardmember[i.index].member_image}" alt="">
                                                	</a>
                                                </div>
                                            </div>
                                        </div>
                                        <h6 class="category-id">
                                            <a href="profile.nn?member_id=${connectboardmember[i.index].member_id}" class="color-8">
                                                ${connectboardmember[i.index].member_name}
                                            </a>
                                        </h6>
                                        <div class="category-star">
                                            <h6>	
                                                <div class="inline-block color-8">
                                                    <div>★★★★★</div>
                                                </div>
                                                <div class="inline-block color-8">(${connectboardlist.board_hit})</div>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!--4개 반복으로 뿌려주기 비슷한-->
                        
                        
                        
                    </div>
                </div>
           		<!-- 비슷한 나눔-->
            
            
        </div>
    </div>
</div>


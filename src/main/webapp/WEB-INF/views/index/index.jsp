<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!-- reset -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/etc.js"></script>
	<title>NANUM</title>
</head>
<body>
   <header class="background-index">
      <div class="head-top">
          <div class="head-logo">
              <a href="index.nn">
                 <img src="${pageContext.request.contextPath}/resources/images/header-logo-white.png" alt="head-logo">
               </a>
           </div>
           
           <!-- 시큐리티 세션 추가 -->
           <!-- 비로그인 -->
           <se:authorize access="isAnonymous()">
	           <div class="head-right color-f">
	               <div><a href="login.nn">로그인</a></div>
	               <div><a href="signup.nn">무료 회원가입</a></div>
	           </div>
           </se:authorize>
	       <!-- 비로그인 -->
            <se:authentication property="name" var="LoingUser" />
		
           <!-- 로그인 했을시 -->
            <se:authorize access="isAuthenticated()">
	        <div class="head-right">
	        	<div class="header-icon-box">
					<div class="inline-block header-icon" title="메시지">
						<!--  여기에 메시지를 읽지 않은 수 나타냄 -->
						<div id="message_alarm" class="message-alarm">
							<p></p>
						</div> 
						<!--  여기에 메시지를 읽지 않은 수 나타냄 -->
						<a href="message_list.nn">
							<img class="" src="${pageContext.request.contextPath}/resources/images/header-msg.png" alt="">
						</a>
						<div class="push-icon">
							
						</div>
					</div>
				</div>
	            <div class="inline-block header-top-image">
					<h5 class="position-relative">
						<a href="profile.nn?member_id=${sessionScope.Member.member_id}">
						<c:choose>
							<c:when test="${sessionScope.Membernn.member_image == null}">
								<img class="border-round" src="${pageContext.request.contextPath}/resources/images/plus.jpg" alt="">
							</c:when>
							<c:otherwise>
								<img class="border-round" src="${pageContext.request.contextPath}/resources/upload/${sessionScope.Membernn.member_image}" alt="">
							</c:otherwise>
						</c:choose>
						<span class="header-top-id">${sessionScope.Member.member_email}</span>
							
						</a>
						<div class="header-top-menu">
						<div>
							<!-- 상단 화살표 이미지 -->
							<div class="position-relative">
								<img class="main-top-arrow" src="${pageContext.request.contextPath}/resources/images/main-top-arrow.png" alt="">
							</div>
							<!-- 여기서부터 메뉴 뿌리기 -->
							<a href="message_list.nn" class="color-3">
								<div class="header-user-menu">
									메시지관리
								</div>
							</a>
							<a href="board_nanum_list.nn?member_id=${sessionScope.Member.member_id}" class="color-3">
								<div class="header-user-menu">
									나눔함
								</div>
							</a>
							<a href="profile.nn?member_id=${sessionScope.Member.member_id}" class="color-3">
								<div class="header-user-menu">
									나의 나눔
								</div>
							</a>
							<div class="header-user-line"></div>
							<a href="my_profile.nn" class="color-3">
								<div class="header-user-menu">
									프로필
								</div>
							</a>
							<div class="header-user-line"></div>
							<a href="board_request_list.nn" class="color-3">
								<div class="header-user-menu">
									나눠주세요
								</div>
							</a>
							<a href="board_write.nn" class="color-3">
								<div class="header-user-menu">
									나눔 재능등록
								</div>
							</a>
							<a href="nanum_check.nn" class="color-3">
								<div class="header-user-menu">
									나눔 재능인증
								</div>
							</a>
							<a href="nanum_check_list.nn" class="color-3">
								<div class="header-user-menu">
									나눔 재능목록
								</div>
							</a>
							<div class="header-user-line"></div>
							<a href="security/logout" class="color-3">
								<div class="header-user-menu">
									로그 아웃
								</div>
							</a>
						</div>
					</div>
					</h5>
				</div>
	        </div>
	        </se:authorize>
	        <!-- 로그인 했을시 -->
       </div>
       <div class="head-index-middle">
          <div class="head-index-text">
              <h1>
               나눌수록 커지는 나의 가치 NANUM
               </h1>
               <div>
                  NANUM은 내가 좋아하는 '무언가'를 더욱더 가치있게 만드는 공간입니다 
               </div>
           </div>
       </div>
       <div class="position-relative b-f">
          <div class="head-index-search">
              <div class="head-index-cotainer margin-0-auto">
                  <div class="row margin-30">
                      <div class="width-30 color-f inline-block float-left">
                          <div class="position-relative overflow-h">
                              <!-- slide-->
                               <div class="head-index-slider">
                                  <div class="item active">
                                      <div class="inline-block">
                                          <div class="index-search-icon"><img src="${pageContext.request.contextPath}/resources/images/bottom_notice-w_2.png" alt=""></div>
                                       </div>
                                       <div class="inline-block color-f">
                                          <div>I.NANUM.U</div>
                                           <div class="">
                                              	나와 너의 NANUM
                                           </div>
                                       </div>
                                   </div>
                                   <div class="item">
                                      <div class="inline-block">
                                          <div class="index-search-icon"><img src="${pageContext.request.contextPath}/resources/images/bottom_notice-w_3.png" alt=""></div>
                                       </div>
                                       <div class="inline-block color-f">
                                          <div>HAPPY NANUM!</div>
                                           <div class="">
                                              	NANUM을 통해 커지는 나의 가치
                                           </div>
                                       </div>
                                   </div>
                                   <div class="item">
                                      <div class="inline-block">
                                          <div class="index-search-icon"><img src="${pageContext.request.contextPath}/resources/images/bottom_notice-w_4.png" alt=""></div>
                                       </div>
                                       <div class="inline-block color-f">
                                          <div>LOCAL NANUM</div>
                                           <div class="">
                                           	LBS를 통해 가까운 곳에서 연결되는 NANUM!
                                           </div>
                                       </div>
                                   </div>
                                   <div class="item">
                                      <div class="inline-block">
                                          <div class="index-search-icon"><img src="${pageContext.request.contextPath}/resources/images/bottom_notice-w_5.png" alt=""></div>
                                       </div>
                                       <div class="inline-block color-f">
                                          <div>소통하는 NANUM!</div>
                                           <div class="">
				                                              채팅을 통한 NANUM인들과의 소통!
                                           </div>
                                       </div>
                                   </div>
                                  
                               </div>
                           </div>
                       </div>
                       <div class="width-70 inline-block float-right text-right">
                           <div class="inline-block">
                               <h4>
                                   <input id="search" name="search" class="index-search-input" placeholder="어떤 나눔을 원하시나요?">
                               </h4>
                           </div>
                           <div class="index-search-submit inline-block">
                               <a class="index-search-btn-a" href=""><button class="index-search-btn btn-primary" style="font-size: 16px;" >나눔 검색</button></a>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       <div class="head-scroll-box">
          <div class="head-top-scroll">
               <div class="head-logo">
                   <a href="index.nn">
                       <img src="${pageContext.request.contextPath}/resources/images/header-logo.png" alt="head-logo">
                   </a>
               </div>
               <div class="head-search">
                   <form action="" method="">
                       <div class="head-search-box">
                           <span>
                               <input type="image" class="sub-img" src="${pageContext.request.contextPath}/resources/images/search.png" width="20">
                               <!--<img src="images/search.png" alt="search">-->
                           </span>
                       
                           <input type="text" class="form-control" placeholder="검색어를 입력해 주세요">
                       </div>
                   </form>
               </div>
               
               <!-- 비로그인 -->
               <se:authorize access="isAnonymous()">
               <div class="head-right">
                    <div><a href="login.nn">로그인</a></div>
               		<div><a href="signup.nn">무료 회원가입</a></div>
               </div>
               </se:authorize>
               <!-- 비로그인 -->
               
                <!-- 로그인 했을시 -->
                <se:authorize access="isAuthenticated()">
		        <div class="head-right">
		        	<div class="header-icon-box">
						<div class="inline-block header-icon" title="메시지">
							<!--  여기에 메시지를 읽지 않은 수 나타냄 -->
							<div id="message_alarm" class="message-alarm">
								<p></p>
							</div> 
							<!--  여기에 메시지를 읽지 않은 수 나타냄 -->
							<a href="message_list.nn">
								<img class="" src="${pageContext.request.contextPath}/resources/images/header-msg.png" alt="">
							</a>
							<div class="push-icon">
								
							</div>
						</div>
					</div>
		            <div class="inline-block header-top-image">
						<h5 class="position-relative">
							<a href="profile.nn?member_id=${sessionScope.Member.member_id}">
							<c:choose>
								<c:when test="${sessionScope.Membernn.member_image == null}">
									<img class="border-round" src="${pageContext.request.contextPath}/resources/images/plus.jpg" alt="">
								</c:when>
								<c:otherwise>
									<img class="border-round" src="${pageContext.request.contextPath}/resources/upload/${sessionScope.Membernn.member_image}" alt="">
								</c:otherwise>
							</c:choose>
								<span class="header-top-id">${sessionScope.Member.member_email}</span>
							</a>
							<div class="header-top-menu">
						<div>
							<!-- 상단 화살표 이미지 -->
							<div class="position-relative">
								<img class="main-top-arrow" src="${pageContext.request.contextPath}/resources/images/main-top-arrow.png" alt="">
							</div>
							<!-- 여기서부터 메뉴 뿌리기 -->
							<a href="message_list.nn" class="color-3">
								<div class="header-user-menu">
									메시지관리
								</div>
							</a>
							<a href="board_nanum_list.nn?member_id=${sessionScope.Member.member_id}" class="color-3">
								<div class="header-user-menu">
									나눔함
								</div>
							</a>
							<a href="profile.nn?member_id=${sessionScope.Member.member_id}" class="color-3">
								<div class="header-user-menu">
									나의 나눔
								</div>
							</a>
							<div class="header-user-line"></div>
							<a href="my_profile.nn" class="color-3">
								<div class="header-user-menu">
									프로필
								</div>
							</a>
							<div class="header-user-line"></div>
							<a href="board_request_list.nn" class="color-3">
								<div class="header-user-menu">
									나눠주세요
								</div>
							</a>
							<a href="board_write.nn" class="color-3">
								<div class="header-user-menu">
									나눔 재능등록
								</div>
							</a>
							<a href="nanum_check.nn" class="color-3">
								<div class="header-user-menu">
									나눔 재능인증
								</div>
							</a>
							<a href="nanum_check_list.nn" class="color-3">
								<div class="header-user-menu">
									나눔 재능목록
								</div>
							</a>
							<div class="header-user-line"></div>
							<a href="security/logout" class="color-3">
								<div class="header-user-menu">
									로그 아웃
								</div>
							</a>
						</div>
					</div>
						</h5>
					</div>
		        </div>
		        </se:authorize>
		        <!-- 로그인 했을시 -->
            </div>
       </div>
   </header>
   <div class="container-body">
      <div class="container">
          <!-- menu -->
           <div class="container-text row margin-55" id="container-text">
              <div class="text-center">
                  <h1>최신 NANUM</h1>
               </div>
               <div class="margin-10">
                  <h5>나눔인들이 제공하는 서비스를 소개합니다</h5>
               </div>
               <div class="margin-15">
                  <div class="inline-block"></div>
                   <div class="inline-block">
                      
                   </div>
                   <div class="inline-block"></div>
               </div>
           </div>
           <div class="row container-list margin-55">
              <ul>
                   <li><a class="container-list-selected" title="뷰티" href="#container-text"><h5>뷰티</h5></a></li>
                   <li><a href="#container-text" title="스포츠/레져" ><h5>스포츠/레져</h5></a></li>
                   <li><a href="#container-text" title="미디어" ><h5>미디어</h5></a></li>
                   <li><a href="#container-text" title="예술/공예" ><h5>예술/공예</h5></a></li>
                   <li><a href="#container-text" title="패션" ><h5>패션</h5></a></li>
                   <li><a href="#container-text" title="생활" ><h5>생활</h5></a></li>
                   <li><a href="#container-text" title="컴퓨터" ><h5>컴퓨터</h5></a></li>
                   <li><a href="#container-text" title="문서" ><h5>문서</h5></a></li>
                   <li><a href="#container-text" title="기타" ><h5>기타</h5></a></li>
               </ul>
           </div>
           
          <!-- 나눔-->
         <div class="row margin-20">
            <div class="rows margin-0-auto" id="category-content">
            <!-- 인덱스 글 목록 -->
            </div>                 
         </div>
         <div class="row margin-30 container-btn">
            <a href="#" class="btn btn-block btn-primary">더보기</a>
         </div>
         <!-- 나눔-->
       </div>

       <!-- 뒷 배경 -->
       <div class="index-back-photo">
       		<div class="row container margin-0-auto text-center">
       			<h1>
       				나눔 이용방법을 알아볼까요?
       			</h1>
       			<button class="open-modal">
       				나눔 이용방법
       			</button>
       		</div>
       </div>
       
       <!-- 구매 후기 -->
	   <div class="index-white">
	    	<div class="container">
	    		<!-- menu -->
	    		<div class="container-text row margin-55">
	              <div class="text-center">
	                  <h1>구매후기</h1>
	               </div>
	               <div class="margin-10">
	                  <h5>상세 글을 설명</h5>
	               </div>
	               <div class="margin-15">
	                  <div class="inline-block"></div>
	                   <div class="inline-block">
	                      
	                   </div>
	                   <div class="inline-block"></div>
	               </div>
	           </div>
	    		<div class="row">
	    			<div class="">
	    				<div class="review-box">
	    					<div class="row width-100">
	    						<div class="review-slider row">
	    							<!-- 여기서 부터 10개 반복 -->
	    							<!--  -->
	    							<c:forEach var="checked" end="9" items="${getchecked}" varStatus="i">
	    							<div class="text-center">
	    								<div class="row">
	    									<div class="review-top">
	    										<div class="padding-50">
	    											<h4 class="color-8">
														${checked.check_content}
													</h4>
													<div class="margin-0-auto review-star">
														<h6 class="margin-30">
															<div>★★★★★</div>
														</h6>
													</div>
													<div class="font-12">
														<b>${getname[i.index].member_name}</b>
													</div>
													<div class="text-center color-8 font-12">
														${getdate[i.index].check_date}
													</div>
												</div>
	    									</div>
	    									<div class="review-bottom">
	    										<div class="inline-block">
	    											<a href="profile.nn?member_id=${getboard[i.index].member_id}">
	    												<img alt="" src="${pageContext.request.contextPath}/resources/images/plus.jpg">
	    											</a>
	    										</div>
	    										<div class="inline-block">
	    											<h5>
	    												<a href="board_detail.nn?board_no=${getdate[i.index].board_no}" class="color-3">
	    													${getboard[i.index].board_title}
	    												</a>
	    											</h5>
	    											<h6>
	    												<div class="text-left">
		    												<a href="board_detail.nn?board_no=${getdate[i.index].board_no}" class="color-3">
		    													${getboard[i.index].board_category}
		    												</a>
	    												</div>
	    											</h6>
	    										</div>
	    									</div>
	    								</div>
	    							</div>
	    							</c:forEach>
	    							<!--  -->
	    						</div>
	    					</div>
	    				</div>
	    				
	    				<div class="review-btn-box">
	    					<div>
	    						<button class="btn-pre">
	    							<img src="${pageContext.request.contextPath}/resources/images/btn_pre.png" alt="">
	    						</button>
	    						<button class="btn-next">
	    							<img src="${pageContext.request.contextPath}/resources/images/btn_next.png" alt="">
	    						</button>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	   </div>
       
        <!-- index-section-title-->
      	<div class="index-section-title">
      		<!-- menu -->
		    <div class="container-text row margin-55">
		        <div class="text-center">
		            <h1>ABOUT NANUM</h1>
		        </div>
			    <div class="margin-10">
			        <h5>나눔:NANUM 은 내가 가진 ‘무언가’를 나누는 위치 기반 가치 창출 서비스입니다.<br> 
			        	<!-- 현재의 재능 마켓들은 전문적/상업적 기반에 초점이 맞춰져 있습니다.<br>
			        	하지만 --> 나눔은 전문적 지식이아닌 자신의 취향인 ‘무언가’를 공유하고<br> 
			        	소통함으로써 사람들이 즐겁게 이용할 수 있는 사이트를 서비스하고자 합니다.
					</h5>
			    </div>
			    <div class="margin-15">
			    	<div class="inline-block"></div>
			    	<div class="inline-block">
			                      
			        </div>
			        <div class="inline-block"></div>
			    </div>
		    </div>
		    <div class="row index-section-title-box">
		    	<div>
		    		<div class="title-left">
		    			<img alt="" src="${pageContext.request.contextPath}/resources/images/index_icon2.png">
		    		</div>
		    		<div class="title-right">
		    			<h4>취미를 가치로 NANUM</h4>
		    			<p>
		    			좋아하는 누군가에게 알려주기엔 애매한 취미,<br>
		    			관심은 있는데 배워보기엔 애매한 호기심<br>
		    			당신도 이런 애매한 '무언가'를 가지고있나요?<br>
		    			이런 '무언가'를 나눠 당신의 가치로 만들어보세요!		    			
		    			</p>
		    		</div>
		    	</div>
		    	<div>
		    		<div class="title-left">
		    			<img alt="" src="${pageContext.request.contextPath}/resources/images/index_icon3.png">
		    		</div>
		    		<div class="title-right">
		    			<h4>Location NANUM</h4>
		    			<p>당신의 가까운 곳에도 나눔인들이 존재합니다.<br>
						    위치 기반 서비스를 통해 나눔인들을 만나보세요!<br>
						    바쁜 하루지만 동네에서 함께하는 나눔!:)<br>
						    당신의 가치를 효율적으로 높일수 있습니다.
		    			</p>
		    		</div>
		    	</div>
		    	<div>
		    		<div class="title-left">
		    			<img alt="" src="${pageContext.request.contextPath}/resources/images/index_icon1.png">
		    		</div>
		    		<div class="title-right">
		    			<h4>신뢰할수 있는 NANUM</h4>
		    			<p>이상한 재능들이 올라올 것 같다구요? <br>
		    			    걱정하지마세요! :-D<br>
		    			    나눔은 평가를 통해 합격한 사람만 이용가능합니다.<br>
		     			    나눔 대기 회원을 평가하고 관심 나눔을 찾아보세요!
		    			</p>
		    		</div>
		    	</div>
		    	<div>
		    		<div class="title-left">
		    			<img alt="" src="${pageContext.request.contextPath}/resources/images/index_icon4.png">
		    		</div>
		    		<div class="title-right">
		    			<h4>나눠주세요!</h4>
		    			<p>
		    			관심있는 나눔글이 없나요?<br>
		    			나눠주세요! 게시판에 배우고 싶은걸 요청해보세요 <br>
		    			그 분야에 관심있는 나눔인들의 연락을 받을 수 있어요!<br>
		    			나눔인들은 당신의 호기심을 채워줄거에요! <br>
		    			
		    			</p>
		    		</div>
		    	</div>
		    </div>
      	</div>
      	
      	
      <%-- 기존 화면 살리면됨 
      <div class="index-section-title">
      	<!-- menu -->
	    <div class="container-text row margin-55">
	        <div class="text-center">
	            <h1>나눔 스타일</h1>
	        </div>
		    <div class="margin-10">
		        <h5>상세 글을 설명</h5>
		    </div>
		    <div class="margin-15">
		    	<div class="inline-block"></div>
		    	<div class="inline-block">
		                      
		        </div>
		        <div class="inline-block"></div>
		    </div>
	    </div>
         <div class="row">
            <div>
               <div class="text-center">
                  <a href="#" class="color-3">
                     <img src="${pageContext.request.contextPath}/resources/images/main_1.png" alt="">
                  </a>
                  <h4 class="margin-30">
                     <b>도와드려요</b>
                  </h4>
                  <h5 class="margin-10">
                     도와드려요 도와드려요<br>
                     도와줄께요태호가 도와드려요
                  </h5>
               </div>
            </div>
            <div>
               <div class="text-center">
                  <a href="#" class="color-3">
                     <img src="${pageContext.request.contextPath}/resources/images/main_1.png" alt="">
                  </a>
                  <h4 class="margin-30">
                     <b>도와드려요</b>
                  </h4>
                  <h5 class="margin-10">
                     도와드려요 도와드려요<br>
                     도와줄께요태호가 도와드려요
                  </h5>
               </div>
            </div>
            <div>
               <div class="text-center">
                  <a href="#" class="color-3">
                     <img src="${pageContext.request.contextPath}/resources/images/main_1.png" alt="">
                  </a>
                  <h4 class="margin-30">
                     <b>도와드려요</b>
                  </h4>
                  <h5 class="margin-10">
                     도와드려요 도와드려요<br>
                     도와줄께요 도와드려요
                  </h5>
               </div>
            </div>
         </div>
      </div> --%>
      
      
	  <!-- index-bottom-category -->
	 <!--새로 하는 곳-->
    <div class="index-bottom">
    	<!-- menu -->
	    <div class="container-text row margin-55">
	        <div class="text-center">
	            <h1>NANUM SERVICE</h1>
	        </div>
		    <div class="margin-10">
		        <h5>NANUM에서 제공하는      를 한눈에 파악해 보세요!</h5>
		    </div>
		    <div class="margin-15">
		    	<div class="inline-block"></div>
		    	<div class="inline-block">
		                      
		        </div>
		        <div class="inline-block"></div>
		    </div>
	    </div>
    	<div class="row index-bottom-category shadow-box">
 			<ul>
            	<li><h5 class="index-bottom-category-title"><b>서비스 카테고리</b></h5></li>
                <li><a href="board_list.nn?title=뷰티"><h5>뷰티</h5></a></li>
                <li><a href="board_list.nn?title=스포츠/레져"><h5>스포츠/레져</h5></a></li>
                <li><a href="board_list.nn?title=미디어"><h5>미디어</h5></a></li>
                <li><a href="board_list.nn?title=예술/공예"><h5>예술/공예</h5></a></li>
                <li><a href="board_list.nn?title=패션"><h5>패션</h5></a></li>
            </ul>
            <ul>
                <li><h5 class="index-bottom-category-title">　</h5></li>
                <li><a href="board_list.nn?title=생활"><h5>생활</h5></a></li>
                <li><a href="board_list.nn?title=컴퓨터"><h5>컴퓨터</h5></a></li>
                <li><a href="board_list.nn?title=문서"><h5>문서</h5></a></li>
                <li><a href="board_list.nn?title=기타"><h5>기타</h5></a></li>
            </ul>
            <ul>
                <li><h5 class="index-bottom-category-title"><b>고객센터</b></h5></li>
                <li><a href="#"><h5>이용안내</h5></a></li>
                <li><a href="#"><h5>1:1 문의</h5></a></li>
               <!--  <li><a href="#"><h5>공지사항</h5></a></li> -->
            </ul>
            <ul>
                <li><h5 class="index-bottom-category-title"><b>마이페이지</b></h5></li>
                <li><a href="message_list.nn"><h5>메시지관리</h5></a></li>
                <li><a href="board_nanum_list.nn?member_id=${sessionScope.Member.member_id}"><h5>나눔함</h5></a></li>
         		<li><a href="profile.nn?member_id=${sessionScope.Member.member_id}"><h5>나의 나눔</h5></a></li>
                <li><a href="my_profile.nn"><h5>프로필</h5></a></li>
                <li><a href="board_request_list.nn"><h5>나눠주세요</h5></a></li>
            </ul>
            <ul>
                <li><h5 class="index-bottom-category-title">　</h5></li>
                <li><a href="board_write.nn"><h5>나눔 재능등록</h5></a></li>
                <li><a href="nanum_check.nn"><h5>나눔 재능인증</h5></a></li>
                <li><a href="nanum_check_list.nn"><h5>나눔 인증목록</h5></a></li>
            </ul>
        </div>
    </div>
      
   </div>
   
   
   <!-- modal -->
   <div class="modal-wrap">
   		<div>
   			<div class="modal-back"></div>
   			<div class="modal-content">
   				<div class="position-relative">
   					<!-- 하단 아이콘 -->
   					<ul class="modal-icon">
   						<li></li>
   						<li></li>
   						<li></li>
   						<li></li>
   						<li></li>
   					</ul>
   					
   					<!-- 실제 컨텐츠 -->
   					<div class="text-center modal-inner">
   						<div>
   							<div class="modal-inner-top">
   								<img src="${pageContext.request.contextPath}/resources/images/photo-page01.jpg" alt="">
   							</div>
   							<div class="modal-inner-text">
   								<h2>나눔이란?</h2>
   								<h4 class="margin-20">
   									<div>
   										나눔은 누구나 손쉽게 재능을 사고 팔 수 있는 재능마켓입니다.
   									</div>
   								</h4>
   							</div>
   						</div>
   					</div>
   					<button class="modal-pre">
   						<img alt="" src="${pageContext.request.contextPath}/resources/images/btn_pre.png">
   					</button>
   					<button class="modal-next">
   						<img alt="" src="${pageContext.request.contextPath}/resources/images/btn_next.png">
   					</button>
   				</div>
   			</div>
   		</div>
   </div>
</body>
</html>
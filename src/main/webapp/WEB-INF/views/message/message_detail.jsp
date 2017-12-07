<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 메시지</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/message.js"></script>
</head>

<div class="container-body">
	<div class="container">
        <div class="margin-30">
        	<!-- nav 들어올 자리-->
        	<div class="message-detail-left">
        		<div class="shadow-box">
        			<div class="inbox-seller">
        				<div class="text-center">
        					<a href="#" class="color-3">
        						<div class="position-relative">
        							<img class="border-round message-left-image" src="${pageContext.request.contextPath}/resources/upload/${membernn.member_image}" alt="">
        						</div>
        						<h4 class="margin-10">
        							${membernn.member_name}
        						</h4>
        					</a>
        				</div>
        			</div>
        		</div>
        		<input type="hidden" value="${requestboard.board_no}" id="message_board_no">
        		<c:choose>
        		<c:when test="${requestboard.board_title == null}">
        		</c:when>
        		<c:otherwise>
        		<div class="shadow-box margin-30">
        			<div class="message-left-sub-title">
        				문의한 나눔글
        			</div>
        			<div class="message-left-sub-bottom">
        				<div class="position-relative">
        					<div class="inbox-nanum-image">
        						<img src="${pageContext.request.contextPath}/resources/upload/${requestboard.board_image_title}" alt="">
        					</div>
        					<h6 class="inbox-nanum-right">
        						<a href="board_detail.nn?board_no=${requestboard.board_no}">${requestboard.board_title}</a>
        					</h6>
        					<h6 class="text-right">
        						&#8361;&nbsp;<b>${requestboard.board_account}</b>
        					</h6>
        				</div>
        			</div>
        		</div>
        		</c:otherwise>
        		</c:choose>
        	</div>
        	
            <!-- section -->
            <div id="board-write-section">
            	<div class="shadow-box message-detail-inbox">
            		<div class="">
						<div class="message-i-top">
							<div class="inline-block">
								<div class="inline-block">
									<img src="${pageContext.request.contextPath}/resources/upload/${sendername.member_image}" alt="">
								</div>
								<div class="inline-block message-i-top-id float-right">
									<a href="profile.nn?member_id=${Sender}" class="color-8">
										${sendername.member_name}
									</a>
									<input type="hidden" class="sender_no" title="${Sender}">
								</div>
							</div>
							<div class="inline-block float-right">
								<!-- 이전대화 보기 주석 처리  -->
								<%-- <div class="inline-block">
									<button class="btn btn-default">
										<img style="width:15px;" src="${pageContext.request.contextPath}/resources/images/nothing_massage.png" alt="">
									</button>
								</div>
								<div class="inline-block float-right" style="margin-top:-3px;">
									<button class="btn btn-default">이전 대화 보기</button>
								</div> --%>
							</div>
						</div>
						
						<!-- message_div -->  
						<div class="float-left message-div" id="message-scroll">
							<div class="message-div-item" id="message-div">
								
								<!-- 구매자 -->
								<%-- <div>
									<div class="track-buyer">
										<div class="track-buyer-right">
											<div class="inline-block float-left margin-5">
												<img src="${pageContext.request.contextPath}/resources/images/track_buyer.png" alt="">
											</div>
										</div>
										<div class="inline-block track-buyer-left">
											<div class="message inline-block">
												구매의 메시지 내용
											</div>
											<div class="track-buyer-time inline-block">
												
											</div>
										</div>
									</div>
								</div> --%>
								
								
								<!-- 판매자 -->
								<%-- <div>
									<div class="track-seller">
										<div class="track-seller-left">
											<div class="inline-block">
												<a href="#">
													<img class="border-round track-profile" src="${pageContext.request.contextPath}/resources/images/nothing_massage.png" alt="">
												</a>
											</div>
											<div class="inline-block float-right margin-5">
												<img src="${pageContext.request.contextPath}/resources/images/track_seller.png" alt="">
											</div>
										</div>
										<div class="inline-block track-seller-right">
											<div class="message inline-block">
												판매자의 메시지 내용
											</div>
											<div class="track-seller-time inline-block">
												
											</div>
										</div>
										
									</div>
								</div> --%>
							</div>
						</div> 
	                </div>
	                
					<!-- 하단 내용 -->
					<div class="row">
						<div class="width-100 float-left shadow-box">
							<div class="send-div">
								<div class="tab-content">
									<div class="position-relative">
										<textarea rows="5" placeholder="메시지는 엔터(enter)키로 전송, 쉬프트(shift)+엔터(enter)키로 줄바꿈 가능합니다." rows="" cols="" id="messagetext"></textarea>
									</div>
									<div class="row">
										<div class="inline-block float-right padding-10">
											<button class="btn btn-block btn-primary" id="message-btn" onkeydown="javascript:if(event.keyCode==13) message();">
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
            <!-- section -->
            
        </div>
    </div>
</div>
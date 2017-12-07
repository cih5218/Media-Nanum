<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 나눔함</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script src="${pageContext.request.contextPath}/resources/js/board_nav.js"></script>
</head>
<script>
$(function(){
	$('.board-write1').show();//첫번째 탭 보임
	$('.board-write2 , .board-write3').hide();
	//첫번째 탭이 선택된 모양 - 생략^^
	         
	$('.board-nanum-tab>div').on('click',function(){
	   index = $(this).index() + 1;
	   $('.board-nanum-tab>div').removeClass('board-nanum-tab-select')
	   $('.board-panel').hide();
	   $('.board-write'+ index).fadeIn();
	   $(this).addClass('board-nanum-tab-select');
	});
});
</script>
<div class="container-body">
	<div class="container">
    	<div class="margin-20 board-write-top top-l">
        	<h2>나눔함</h2>
        </div>
        <div class="margin-55">
        	<!-- nav 들어올 자리-->
        	<style>
        	.board-nanum-section{margin-top: -44px;}
        	.board-nanum-tab{position:relative; width: 188px; margin-left: 25%; box-sizing:border-box; top: -44px; height: 45px; background-color: #fff; overflow: hidden;}
        	.board-nanum-tab>div{cursor:pointer; float:left; padding: 10px 25px; font-size: 13px; font-weight: 400; color: #888; top: -38px; border-left: solid #e5e5e5 1px;
    border-right: solid #e5e5e5 1px; border-top: solid #e5e5e5 1px; box-shadow: 0 1px 2px #ccc;}
    		.board-nanum-tab>div:last-child{left: 70px;}
    		.board-nanum-tab-select, .board-nanum-tab-select>h3{background-color:#19D1D4; color: #fff;}
    		
    		.nanum-list-none{}
    		.nanum-list-none>div>div>div{padding: 30px 0;}
    		.nanum-list-none h4{font-size: 14px; color: #333; font-weight: 400;}
        	
        	.nanum-list-container{border-bottom: 1px solid #e5e5e5;}
        	.nanum-list-have{position: relative; overflow: hidden;}
        	.nanum-list-img{width: 15%;}
        	.nanum-list-img{display: block; border: 0; margin: 0;}
        	.nanum-list-img>img{width: 78px; height: 78px; padding: 15px 15px 15px 18px; margin-top: 5px;}
        	.nanum-list-subject{border-left: 1px solid #E5E5E5; border-right:1px solid #E5E5E5; width: 60%; position: absolute; top: 0; left: 15%; height: 100%; padding: 0 5px 0 20px;}
        	.nanum-list-subject>div:first-child{height: 65px; margin-top: 14px; overflow: hidden;}
        	.nanum-list-subject>div h4{font-weight: 400; padding-top: 5px;}
        	.nanum-list-subject>div h5{font-weight: 400;}
        	.nanum-list-subject>div:last-child{}
        	.nanum-list-right>div:first-child{margin-top: 14px; overflow: hidden; padding: 15px 0 10px 40px;}
        	.nanum-list-right{width: 20%; position: absolute; top: 0; right: 0;}
        	.nanum-list-right>div:last-child{padding: 15px 0 10px 40px; text-align: left;}
        	.nanum-list-right>div h4{font-weight: 500;}
        	.nanum-list-right>div h5{font-weight: 400;}
        	.nanum-list-right span{position: absolute; left: 0; font-weight: 400; font-size: 13px;}
        	</style>
        	<div class="board-nanum-tab">
        		<div class="board-nanum-tab-select"><h3>나눔함</h3></div>
        		<div class=""><h3>구매함</h3></div>
        	</div>
        	
            <!-- section -->
            <div id="board-write-section" class="board-nanum-section">
            	<div>
                    <!-- 1 content 판매함 뿌리는데 -->
                	<div class="board-panel board-write1 width-100" style="display: none;">
						<!-- 있을때 -->
						<c:choose>
						<c:when test="${!empty buy_result}">
						<div class="nanum-list-have">
							<div class="shadow-box">
							
								<%-- 한개씩 넣기 --%>
								<c:forEach items="${buy_result}" var="i" varStatus="e">								
								<div class="row nanum-list-container">
									<a href="board_detail.nn?board_no=${i.board_no}">
										<div class="nanum-list-img inline-block">
											<img src="${pageContext.request.contextPath}/resources/upload/${i.board_image_title}" alt="">
										</div>
										<div class="nanum-list-subject inline-bloc">
											<div>
												<h4>${i.board_title}</h4>
											</div>
											<div>
												<h5 class="color-o">판매한사람: ${i.sms_email}</h5>
											</div>
										</div>
										<div class="nanum-list-right">
											<div class="position-relative">
												<span>금액&nbsp;:</span>
												<h5>
													<b>${i.board_account}</b> 원
												</h5>
											</div>
											<div class="position-relative">
												<span>날짜&nbsp;:</span>
												<h5 class="color-o">${i.sms_date}</h5>
											</div>
										</div>
									</a>
								</div>
								</c:forEach>													
							</div>
						</div>
						</c:when>
						
						<%-- 있을때 --%>
						
						<%-- 없을때 --%>
						<c:otherwise>
						<div class="nanum-list-none">
							<div class="shadow-box">
								<div class="row">
									<div class="text-center">
										<img src="/nanum/resources/images/nothing_massage.png" alt="">
										<h4 class="mar_30">구매 정보가 없습니다</h4>
									</div>
								</div>
							</div>
						</div>
						</c:otherwise>
						</c:choose>
						<!-- 없을때 -->
					</div>
                    <%-- 1 content--%>
                    
                    <%-- 2 content 구매함 뿌리는데	--%>
                	<div class="board-panel board-write2 width-100" style="display: none;">
                    	<!-- 있을때 -->
						<c:choose>
						<c:when test="${!empty sell_result}">
						<div class="nanum-list-have">
							<div class="shadow-box">	
								<!-- 한개씩 넣기 -->
								<c:forEach items="${sell_result}" var="i" varStatus="e">								
									<div class="row nanum-list-container">
										<a href="board_detail.nn?board_no=${i.board_no}">
											<div class="nanum-list-img inline-block">
												<img src="${pageContext.request.contextPath}/resources/upload/${i.board_image_title}" alt="">
											</div>
											<div class="nanum-list-subject inline-bloc">
												<div>
													<h4>${i.board_title}</h4>
												</div>
												<div>
													<h5 class="color-o"></h5>
												</div>
											</div>
											<div class="nanum-list-right">
												<div class="position-relative">
													<span>금액&nbsp;:</span>
													<h5>
														<b>${i.board_account}</b> 원
													</h5>
												</div>
												<div class="position-relative">
													<span>날짜&nbsp;:</span>
													<h5 class="color-o">${i.sms_date}</h5>
												</div>
											</div>
										</a>
									</div>
									</c:forEach>
							</div>
						</div>
						</c:when>
                    	<c:otherwise>
                    	<%-- 없을때 --%>
						<div class="nanum-list-none">
							<div class="shadow-box">
								<div class="row">
									<div class="text-center">
										<img src="/nanum/resources/images/nothing_massage.png" alt="">
										<h4 class="mar_30">나눔 정보가 없습니다</h4>
									</div>
								</div>
							</div>
						</div>
						</c:otherwise>
						</c:choose>
                    </div>
                    <%-- 2 content--%>
                </div>
            </div>
            <%-- section --%>
            
        </div>
    </div>
</div>
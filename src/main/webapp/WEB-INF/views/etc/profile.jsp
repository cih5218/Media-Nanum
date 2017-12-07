<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 프로필</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/etc.css">
</head>

<div class="container-body">
	<div class="container">
        <div class="margin-30">
        	<div class="profile-left">
	        	<div class="shadow-box">
					<div class="position-relative profile-left-top">
						<div>
							<a href="#" >
								<img class="border-round" src="${pageContext.request.contextPath}/resources/upload/${membernn.member_image}" alt="">
							</a>
						</div>
					</div>
					<div class="profile-left-mid text-center">
						<div>
							<h3>${membernn.member_name}</h3>
							<h6 class="margin-5 color-8"></h6>
							<div class="profile-left-mid-msg margin-10">
		  						<c:choose>
								<c:when test="${sms.sms_level == 0 && sms.receive_id == sessionScope.Member.member_id}">
										<a href="send_sms.nn?sms_no=${sms.sms_no}&member_id=${membernn.member_id}" class="btn btn-info">번호주기</a>																	
								</c:when>
								<c:otherwise>
								  	<a href="message_detail.nn?Sender=${membernn.member_id}" class="btn btn-info">문의</a>	
							</c:otherwise>
							</c:choose>		 
							</div>
						</div>
					</div>
					<table class="width-100">
						<tbody class="profile-left-bottom">
							<tr>
								<td>
									<div class="profile-left-bottom-div text-center">
										<h4>
											<b>${nanumsize}</b>
										</h4>
										<div class="color-8">
											나눔수
										</div>
									</div>
								</td>
								<td>
									<div class="profile-left-bottom-div text-center">
										<h4 class="inline-block">
											<b>100</b>
										</h4>
										<div class="inline-block profile-left-bottom-div-per">%</div>
										<div class="color-8">
											만족도
										</div>
									</div>
								</td>
								<td>
									<div class="profile-left-bottom-div text-center">
										<h4>
											 <b>${like}</b>
										</h4>
										<div class="color-8">

											좋아요
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
	        	</div>
        	</div>
        	
        	
<style>
/* 상대 profile*/
.profile-left{width: 25%; box-sizing: border-box; float: left; padding: 0 15px; margin-bottom: 50px;}
.profile-left>div:first-child{margin-top: 45px;}
.profile-left-top{width: 100px; margin: 0 auto;}
.profile-left-top>div{position: absolute;; top: -50px;}
.profile-left-top>div>a>img{width: 100px; height:100px; padding: 2px; border: 1px solid #e5e5e5; background-color: #fff;}
.profile-left-mid{padding: 60px 10px 10px;}
.profile-left-mid h3{font-weight: 400;}
.profile-left-mid-msg a{padding: 5px 22px 6px;}
.profile-left-bottom{background-color: #fbfbfb; border-top: solid #e5e5e5 1px;}
.profile-left-bottom td{width: 33.33%;}
.profile-left-bottom-div{padding: 10px 0;}
.profile-left-bottom-div>div{margin-top: 2px; font-size: 10px;}
.profile-left-bottom-div-per{margin: 3px 0 0 1px; font-size: 10px;}


.profile-right{width: 75%; box-sizing: border-box; float: left; margin-bottom: 70px;}
.profile-right-top-title{padding: 15px; background-color: #fbfbfb; border-bottom: solid #e5e5e5 1px;}
.profile-right-top-title h4{font-weight: 400;}
.profile-right-top-text{font-size: 13px; font-weight: 400;}
.profile-right-top-text{padding: 15px; line-height: 20px;}
.profile-category-content{float: left; position: relative;; width: 33.33%; min-height: 1px;
    box-sizing: border-box; padding: 0 15px;}

</style>
        	
            <!-- section -->
            <div class="profile-right page-min-height">
            	<div class="shadow-box">
            		<div class="profile-right-top-title">
            			<h4>나눔인 소개</h4>
            		</div>
            		<div class="profile-right-top-text">



            			${membernn.member_about}
            		</div>
            	</div>
            	
            	<div class="margin-55">
            		<h3>

            			<b>${membernn.member_name}님의 나눔</b>
            		</h3>
            	</div>
            	
            	<div class="row margin-30">
            		<c:forEach var="profile" items="${profile}">
            		<div class="profile-category-content">
                              <div class="margin-20 shadow-box">

                                   <a href="board_detail.nn?board_no=${profile.board_no}">
                                       <div class="category-img">
                                           <div class="category-price">
                                               <span>&#8361;&nbsp;${profile.board_account}</span>
                                           </div>
                                           <img src="${pageContext.request.contextPath}/resources/upload/${profile.board_image_title}" alt="">
                                       </div>
                                   </a>
                                   <div class="padding-10">
                                       <h5 class="category-content-title">
                                           <a href="#" target="_blank" class="color-3">${profile.board_title}
                                           </a>
                                       </h5>
                                       <div class="margin-15 position-relative">
                                       		<div class="category-profile">
                                               <div class="position-relative">
                                                   <div class="category-profile-body"></div>
                                                   <div class="category-profile-img">
                                                       <img src="${pageContext.request.contextPath}/resources/upload/${membernn.member_image}" alt="">
                                                   </div>
                                               </div>
                                           </div>
                                           <h6 class="category-id">
                                               <a href="#" class="color-8">${membernn.member_name}
                                               </a>
                                           </h6>
                                           <div class="category-star">
                                                <h6>
                                                   <div class="inline-block color-8">
                                                       <div>★★★★★</div>
                                                   </div>
                                                   <div class="inline-block color-8">(${profile.board_like})</div>
                                               </h6>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
            		</c:forEach>
            	</div>
            	
            </div>
            <!-- section -->
            
        </div>
    </div>
</div>
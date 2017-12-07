<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NANUM 인증 목록</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/etc.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/etc.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/nanum_check_list.js"></script>
</head>
<div class="container-body">
<input type="hidden" id="mymember_no" value="${mymember_no}">
<input type="hidden" id="mymember_email" value="${mymember_email}">
<input type="hidden" id="listlength" value="${fn:length(list)}">
<input type="hidden" id="check_eva_listlength" value="${fn:length(check_eva_list)}">
<c:forEach items="${check_eva_list}" var="j" varStatus="f">
	<div class="request2${f.index}" style="display: none;">
		<input type="hidden" id="you_member_id" value="${j.you_member_id}">
		<input type="hidden" id="me_member_id" value="${j.me_member_id}">
	</div>
</c:forEach>
	<div class="request-list">
	
		<!-- 상단 이미지와 버튼-->
		<div class="request-head nanum-check-list-head">
			<div>
				<div class="row padding-50 text-center">
					<div class="width-100">
						<h1 class="request-shadow color-f margin-15">
							<b>나눔 인증목록</b>
						</h1>
						<h4 class="request-shadow margin-15 color-f">
							나눔 회원님들! 다른 회원님의 재능을 평가해 주세요!<br> 나눔은 회원님들이 만들어 가는 거예요!
						</h4>
						<div class="margin-30 request-ing">
							<div>
								현재 인증대기 중인 재능 <b class="color-o">${list.size()}</b> 건
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${list.size()!=0}">
				<%-- request-container --%>
				<div id="request-container" class="container">
					<div class="request-main-title">
						<div class="width-100">

							<%-- 요청 리스트 반복..jstl-el --%>
							<%-- <form action="nanum_check_best.nn" method="post"> --%>
							<input type="hidden" id="list_size" value="${list.size()}">
							<c:forEach items="${list}" var="i" varStatus="e">
								<div class="request-content request${e.index}">
								<input type="hidden" id="member_id" value="${i.member_id}">
								<input type="hidden" id="check_no" value="${i.check_no}">
									<div class="margin-30" id="finalstr">
										<div class="shadow-box">
											<div class="request-content-top">
												<div class="row">
													<div>
														<div class="row">
															<div class="width-45 inline-block">
																<div class="inline-block request-profile">
																	<a href="profile.nn?member_id=${i.member_id}"> 
																		<img class="border-round" src="${pageContext.request.contextPath}/resources/upload/${i.member_image}" alt="">
																	</a>
																</div>
																<div class="inline-block">
																	<a class="request-a" href="profile.nn?member_id=${i.member_id}">${i.member_email}</a>
																</div>
															</div>
															<div class="width-50 float-right inline-block margin-5">
																<div class="text-right color-8 font-13">
																	<div>★★★★★</div>
																</div>
															</div>
														</div>
													</div>
													<h4 class="margin-10">
														<b>${i.best_title}</b>
													</h4>

													<h5 class="margin-10 font-13 nanum-check-inner-box">
														<div class="nanum-check-text inline-block">
															<a href=""> ${i.best_about}

															</a>
														</div>
														<div class="inline-block nanum-check-photo">
															<div>
																<img alt="" src="${pageContext.request.contextPath}/resources/upload/${i.best_image}">
															</div>
														</div>
													</h5>
													<div class="text-center nanum-check-inner-btn">
														<button class="request-a">내용보기</button>
													</div>
												</div>
												<div class="margin-15 request-sal">
													<div class="row" id="count">
														<input type="hidden" name="member_email" id="member_email" value="${i.member_email}">
														<input type="hidden" name="check_score" id="star">
														<div class="text-right inline-block float-right">
															<button class="btn request-head-btn btn-info click_check" id="${e.index}">평가하기</button>
														</div>
														<div class="inline-block float-left">
															<div
																class="color-o inline-block float-left nanum-check-input-title">
																평가 내용</div>
														</div>
														<div
															class="inline-block float-left nanum-check-list-input">
															<input type="text" name="check_content" id="check_content" size="40"
																placeholder="평가 내용을 간략히 작성해주세요."
																class="form-control inline-block">
														</div>
														<div class="inline-block float-left">
															<div
																class="color-o inline-block float-left nanum-check-input-title">
																평가 점수</div>
														</div>
														<div class="inline-block float-left nanum-check-list-star">
															<ul>
																<li>★</li>
																<li>★</li>
															</ul>
															<ul>
																<li>★</li>
																<li>★</li>
															</ul>
															<ul>
																<li>★</li>
																<li>★</li>
															</ul>
															<ul>
																<li>★</li>
																<li>★</li>
															</ul>
															<ul>
																<li>★</li>
																<li>★</li>
															</ul>
														</div>
													</div>
												</div>

											</div>
											<div class="request-content-bottom font-13">
												<div class="row">
													<div class="color-8 width-50 inline-block">${i.best_date}
														일</div>
													<div class="text-right inline-block float-right font-13">
														<span class="request-a" id="counter">0명</span>이&nbsp;평가 했습니다.
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<%-- </form> --%>
							<%-- 요청 리스트 --%>

						</div>
					</div>
				</div>
			</c:when>

			<%-- request-none   없을때 띄워주기 --%>
			<c:otherwise>
				<div class="request-none margin-30">
					<div class="shadow-box">
						<div class="row">
							<div class="text-center">
								<img
									src="${pageContext.request.contextPath}/resources/images/nothing_massage.png"
									alt="">
								<h4 class="mar_30">현재 인증대기 중인 재능이 없습니다.</h4>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
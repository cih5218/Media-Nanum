<!-- 

	@FileName : header.jsp
	@Project : NANUM
	

-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- reset -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsQdn3-I0yy6ctogfGtHLtVQYCt68jyGc&libraries=places"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<title>Insert title here</title>
</head>
<header>
	<div class="head-top">
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
        
        <!-- 비 로그인 -->
        <se:authorize access="isAnonymous()">
        <div class="head-right">
        	<div><a href="login.nn">로그인</a></div>
            <div><a href="signup.nn">무료 회원가입</a></div>
        </div>
        </se:authorize>
        <!-- 비 로그인 -->
        
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
    <div class="head-bottom">
    	<div class="head-category">
        	<ul>
            	<li><a href="board_list.nn?title=뷰티"><h5>뷰티</h5></a></li>
                <li><a href="board_list.nn?title=스포츠/레져"><h5>스포츠/레져</h5></a></li>
                <li><a href="board_list.nn?title=미디어"><h5>미디어</h5></a></li>
                <li><a href="board_list.nn?title=예술/공예"><h5>예술/공예</h5></a></li>
                <li><a href="board_list.nn?title=패션"><h5>패션</h5></a></li>
                <li><a href="board_list.nn?title=생활"><h5>생활</h5></a></li>
                <li><a href="board_list.nn?title=컴퓨터"><h5>컴퓨터</h5></a></li>
                <li><a href="board_list.nn?title=문서"><h5>문서</h5></a></li>
                <li><a href="board_list.nn?title=기타"><h5>기타</h5></a></li>
            </ul>
        </div>
    </div>
</header>

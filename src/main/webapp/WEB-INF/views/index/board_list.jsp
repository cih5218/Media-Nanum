<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <!-- reset -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/list.js"></script>
</head>
<header class="background-list">
	<script type="text/javascript">
        	//main image chenge
			var arr = ['login-bg.jpg','login-bg-s.jpg','etc.jpg','banner_photo.jpg'];
			$(function(){
				var ranImages = Math.floor(Math.random() * arr.length);
				console.log('ranImages : ' + ranImages);
				var i = ranImages;
				$("header.background-list").css("background-image", "url(${pageContext.request.contextPath}/resources/images/" + arr[i] + ")").css('transition','ease-in-out 0.3s');
				setInterval(function(){
					i++;
					if(i == arr.length){
						i = 0;
					}
					$("header.background-list").css("background-image", "url(${pageContext.request.contextPath}/resources/images/" + arr[i] + ")").css('transition','ease-in-out 0.3s');
				},5000);
			});	
	</script>
	<div class="head-top">
    	<div class="head-logo">
        	<a href="index.nn">
        		<img src="${pageContext.request.contextPath}/resources/images/header-logo-white.png" alt="head-logo">
            </a>
        </div>
        <!-- 비로그인 -->
        <se:authorize access="isAnonymous()">
        <div class="head-right color-f">
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
    <div class="head-bottom-white">
    	<div class="head-category-white">
        	<ul>
            	<li><a class="container-list-selected" href="#" title="뷰티"><h5>뷰티</h5></a></li>
                   <li><a href="#" title="스포츠/레져"><h5>스포츠/레져</h5></a></li>
                   <li><a href="#" title="미디어"><h5>미디어</h5></a></li>
                   <li><a href="#" title="예술/공예"><h5>예술/공예</h5></a></li>
                   <li><a href="#" title="패션"><h5>패션</h5></a></li>
                   <li><a href="#" title="생활"><h5>생활</h5></a></li>
                   <li><a href="#" title="컴퓨터"><h5>컴퓨터</h5></a></li>
                   <li><a href="#" title="문서"><h5>문서</h5></a></li>
                   <li><a href="#" title="기타"><h5>기타</h5></a></li>
            </ul>
        </div>
    </div>
    <div class="head-middle">
    	<div class="row">
        	<div class="text-center color-f">
            	<h1 title="${title}">${title}&nbsp;${cityName} 
            	<c:if test="${gooName != 'undefined'}">
            	${gooName}
            	</c:if>
            	</h1>
            	<h1 title="${search}">${search}</h1>
            	<h1 title="${cityName}"></h1>
            	<h1 title="${gooName}"></h1>
                <h4 class="margin-10">인기 태그</h4>
                <div class="head-tag-top" id="tag-top">
                	<c:forEach var="topTag" items="${tag}" end="9">
	                    <div class="head-tag-list">
								<a href="#" class="btn btn-category" title="${topTag}">${topTag}</a>
						</div>
					</c:forEach>
                </div>
            </div>
        </div>
        <!-- tab-->
        <div class="row">
        	<div id="tab-container">
                <div class="tab-header">
                    <div class="tab-right">
                        <div>지역</div>
                    </div>
                </div>
                    
                <div class="checkpage-box">
                	
                	<script type="text/javascript">
                    	$(function(){
							$(".checkpage-none").find('ul').css('display','none');
							var dropIndex;
							
							$(".checkpage-city button").click(function(e) {
                                $(this).siblings('ul').toggle();
                            });
							
							$(".checkpage-none button").click(function(e) {
                                $(this).siblings('ul').eq(dropIndex).toggle();
                            });
							
							$(".checkpage ul li").click(function(e) {
								var text = $(this).html();
								dropIndex = $(this).index();
								$(this).parent().siblings('button').html(text);
								
                                $(".checkpage button").siblings('ul').css('display','none');
                            });
							
							
						});
                    </script>
                    <!-- 1번째 페이지 -->
                    <div class="checkpage t1">
                    	<!--도/시-->
                    	<div class="inline row checkpage-city">
                            <button class="btn btn-block btn-category text-left">
                            	도 / 시 검색
                            </button>
                            <ul class="check-dropdown check-dropdown-menu" id="city-name">
                                <li><a href="javascript:void(0);">서울특별시</a></li>
                                <li><a href="javascript:void(0);">부산광역시</a></li>
                                <li><a href="javascript:void(0);">인천광역시</a></li>
                                <li><a href="javascript:void(0);">대구광역시</a></li>
                                <li><a href="javascript:void(0);">광주광역시</a></li>
                                <li><a href="javascript:void(0);">대전광역시</a></li>
                                <li><a href="javascript:void(0);">울산광역시</a></li>
                                <li><a href="javascript:void(0);">세종특별자치시</a></li>
                                <li><a href="javascript:void(0);">경기도</a></li>
                                <li><a href="javascript:void(0);">강원도</a></li>
                                <li><a href="javascript:void(0);">충청남도</a></li>
                                <li><a href="javascript:void(0);">충청북도</a></li>
                                <li><a href="javascript:void(0);">경상북도</a></li>
                                <li><a href="javascript:void(0);">경상남도</a></li>
                                <li><a href="javascript:void(0);">전라북도</a></li>
                                <li><a href="javascript:void(0);">전라남도</a></li>
                                <li><a href="javascript:void(0);">제주도</a></li>
                            </ul>
                        </div>
                        
                        
                        <div class="inline row checkpage-none">
                            <button class="btn btn-block btn-category text-left">
                               시 / 군 / 구 검색
                            </button>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                                <li><a href="javascript:void(0);">강남구</a></li>
                                <li><a href="javascript:void(0);">강동구</a></li>
                                <li><a href="javascript:void(0);">강북구</a></li>
                                <li><a href="javascript:void(0);">강서구</a></li>
                                <li><a href="javascript:void(0);">관악구</a></li>
                                <li><a href="javascript:void(0);">광진구</a></li>
                                <li><a href="javascript:void(0);">구로구</a></li>
                                <li><a href="javascript:void(0);">금천구</a></li>
                                <li><a href="javascript:void(0);">노원구</a></li>
                                <li><a href="javascript:void(0);">도봉구</a></li>
                                <li><a href="javascript:void(0);">동대문구</a></li>
                                <li><a href="javascript:void(0);">동작구</a></li>
                                <li><a href="javascript:void(0);">마포구</a></li>
                                <li><a href="javascript:void(0);">서대문구</a></li>
                                <li><a href="javascript:void(0);">서초구</a></li>
                                <li><a href="javascript:void(0);">성동구</a></li>
                                <li><a href="javascript:void(0);">성북구</a></li>
                                <li><a href="javascript:void(0);">송파구</a></li>
                                <li><a href="javascript:void(0);">양천구</a></li>
                                <li><a href="javascript:void(0);">영등포구</a></li>
                                <li><a href="javascript:void(0);">용산구</a></li>
                                <li><a href="javascript:void(0);">은평구</a></li>
                                <li><a href="javascript:void(0);">종로구</a></li>
                                <li><a href="javascript:void(0);">중구</a></li>
                                <li><a href="javascript:void(0);">중랑구</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">강서구</a></li>
                                <li><a href="javascript:void(0);">금정구</a></li>
                                <li><a href="javascript:void(0);">기장군</a></li>
                                <li><a href="javascript:void(0);">남구</a></li>
                                <li><a href="javascript:void(0);">동구</a></li>
                                <li><a href="javascript:void(0);">동래구</a></li>
                                <li><a href="javascript:void(0);">부산진구</a></li>
                                <li><a href="javascript:void(0);">북구</a></li>
                                <li><a href="javascript:void(0);">사상구</a></li>
                                <li><a href="javascript:void(0);">사하구</a></li>
                                <li><a href="javascript:void(0);">서구</a></li>
                                <li><a href="javascript:void(0);">수영구</a></li>
                                <li><a href="javascript:void(0);">연제구</a></li>
                                <li><a href="javascript:void(0);">영도구</a></li>
                                <li><a href="javascript:void(0);">중구</a></li>
                                <li><a href="javascript:void(0);">해운대구</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">강화군</a></li>
                                <li><a href="javascript:void(0);">계양구</a></li>
                                <li><a href="javascript:void(0);">남구</a></li>
                                <li><a href="javascript:void(0);">남동구</a></li>
                                <li><a href="javascript:void(0);">동구</a></li>
                                <li><a href="javascript:void(0);">부평구</a></li>
                                <li><a href="javascript:void(0);">서구</a></li>
                                <li><a href="javascript:void(0);">연수구</a></li>
                                <li><a href="javascript:void(0);">웅진군</a></li>
                                <li><a href="javascript:void(0);">중구</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">남구</a></li>
                                <li><a href="javascript:void(0);">달서구</a></li>
                                <li><a href="javascript:void(0);">달성군</a></li>
                                <li><a href="javascript:void(0);">동구</a></li>
                                <li><a href="javascript:void(0);">북구</a></li>
                                <li><a href="javascript:void(0);">서구</a></li>
                                <li><a href="javascript:void(0);">수성구</a></li>
                                <li><a href="javascript:void(0);">중구</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">광산구</a></li>
                                <li><a href="javascript:void(0);">남구</a></li>
                                <li><a href="javascript:void(0);">동구</a></li>
                                <li><a href="javascript:void(0);">북구</a></li>
                                <li><a href="javascript:void(0);">서구</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">대덕구</a></li>
                                <li><a href="javascript:void(0);">동구</a></li>
                                <li><a href="javascript:void(0);">서구</a></li>
                                <li><a href="javascript:void(0);">유성구</a></li>
                                <li><a href="javascript:void(0);">중구</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">남구</a></li>
                                <li><a href="javascript:void(0);">동구</a></li>
                                <li><a href="javascript:void(0);">북구</a></li>
                                <li><a href="javascript:void(0);">울주군</a></li>
                                <li><a href="javascript:void(0);">중구</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <!-- <li><a href="#">세종대왕만세</a></li> -->
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">가평군</a></li>
                                <li><a href="javascript:void(0);">고양시</a></li>
                                <li><a href="javascript:void(0);">고양시 덕양구</a></li>
                                <li><a href="javascript:void(0);">고양시 일산동구</a></li>
                                <li><a href="javascript:void(0);">고양시 일산서구</a></li>
                                <li><a href="javascript:void(0);">과천시</a></li>
                                <li><a href="javascript:void(0);">광명시</a></li>
                                <li><a href="javascript:void(0);">광주시</a></li>
                                <li><a href="javascript:void(0);">구리시</a></li>
                                <li><a href="javascript:void(0);">군포시</a></li>
                                <li><a href="javascript:void(0);">김포시</a></li>
                                <li><a href="javascript:void(0);">남양주시</a></li>
                                <li><a href="javascript:void(0);">동두천시</a></li>
                                <li><a href="javascript:void(0);">부천시</a></li>
                                <li><a href="javascript:void(0);">부천시 소사구</a></li>
                                <li><a href="javascript:void(0);">부천시 오정구</a></li>
                                <li><a href="javascript:void(0);">부천시 원미구</a></li>
                                <li><a href="javascript:void(0);">성남시</a></li>
                                <li><a href="javascript:void(0);">성남시 분당구</a></li>
                                <li><a href="javascript:void(0);">성남시 수정구</a></li>
                                <li><a href="javascript:void(0);">성남시 중원구</a></li>
                                <li><a href="javascript:void(0);">수원시</a></li>
                                <li><a href="javascript:void(0);">수원시 권선구</a></li>
                                <li><a href="javascript:void(0);">수원시 영통구</a></li>
                                <li><a href="javascript:void(0);">수원시 장안구</a></li>
                                <li><a href="javascript:void(0);">수원시 팔달구</a></li>
                                <li><a href="javascript:void(0);">시흥시</a></li>
                                <li><a href="javascript:void(0);">안산시</a></li>
                                <li><a href="javascript:void(0);">안산시 단원구</a></li>
                                <li><a href="javascript:void(0);">안산시 상록구</a></li>
                                <li><a href="javascript:void(0);">안성시</a></li>
                                <li><a href="javascript:void(0);">안양시</a></li>
                                <li><a href="javascript:void(0);">안양시 동안구</a></li>
                                <li><a href="javascript:void(0);">안양시 만안구</a></li>
                                <li><a href="javascript:void(0);">양주시</a></li>
                                <li><a href="javascript:void(0);">양평군</a></li>
                                <li><a href="javascript:void(0);">여주시</a></li>
                                <li><a href="javascript:void(0);">연천군</a></li>
                                <li><a href="javascript:void(0);">오산시</a></li>
                                <li><a href="javascript:void(0);">용인시</a></li>
                                <li><a href="javascript:void(0);">용인시 기흥구</a></li>
                                <li><a href="javascript:void(0);">용인시 수지구</a></li>
                                <li><a href="javascript:void(0);">용인시 수지구</a></li>
                                <li><a href="javascript:void(0);">용인시 처인구</a></li>
                                <li><a href="javascript:void(0);">의왕시</a></li>
                                <li><a href="javascript:void(0);">의정부시</a></li>
                                <li><a href="javascript:void(0);">이천시</a></li>
                                <li><a href="javascript:void(0);">파주시</a></li>
                                <li><a href="javascript:void(0);">평택시</a></li>
                                <li><a href="javascript:void(0);">포천시</a></li>
                                <li><a href="javascript:void(0);">하남시</a></li>
                                <li><a href="javascript:void(0);">화성시</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">강릉시</a></li>
                                <li><a href="javascript:void(0);">동해시</a></li>
                                <li><a href="javascript:void(0);">삼척시</a></li>
                                <li><a href="javascript:void(0);">속초시</a></li>
                                <li><a href="javascript:void(0);">원주시</a></li>
                                <li><a href="javascript:void(0);">춘천시</a></li>
                                <li><a href="javascript:void(0);">태백시</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">계룡시</a></li>
                                <li><a href="javascript:void(0);">공주시</a></li>
                                <li><a href="javascript:void(0);">논산시</a></li>
                                <li><a href="javascript:void(0);">당진시</a></li>
                                <li><a href="javascript:void(0);">보령시</a></li>
                                <li><a href="javascript:void(0);">서산시</a></li>
                                <li><a href="javascript:void(0);">아산시</a></li>
                                <li><a href="javascript:void(0);">천안시</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">제천시</a></li>
                                <li><a href="javascript:void(0);">청주시</a></li>
                                <li><a href="javascript:void(0);">충주시</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">경산시</a></li>
                                <li><a href="javascript:void(0);">경주시</a></li>
                                <li><a href="javascript:void(0);">구미시</a></li>
                                <li><a href="javascript:void(0);">김천시</a></li>
                                <li><a href="javascript:void(0);">문경시</a></li>
                                <li><a href="javascript:void(0);">상주시</a></li>
                                <li><a href="javascript:void(0);">안동시</a></li>
                                <li><a href="javascript:void(0);">영주시</a></li>
                                <li><a href="javascript:void(0);">영천시</a></li>
                                <li><a href="javascript:void(0);">포항시</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">거제시</a></li>
                                <li><a href="javascript:void(0);">김해시</a></li>
                                <li><a href="javascript:void(0);">밀양시</a></li>
                                <li><a href="javascript:void(0);">사천시</a></li>
                                <li><a href="javascript:void(0);">양산시</a></li>
                                <li><a href="javascript:void(0);">진주시</a></li>
                                <li><a href="javascript:void(0);">창원시</a></li>
                                <li><a href="javascript:void(0);">통영시</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">군산시</a></li>
                                <li><a href="javascript:void(0);">김제시</a></li>
                                <li><a href="javascript:void(0);">남원시</a></li>
                                <li><a href="javascript:void(0);">익산시</a></li>
                                <li><a href="javascript:void(0);">전주시</a></li>
                                <li><a href="javascript:void(0);">정읍시</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">광양시</a></li>
                                <li><a href="javascript:void(0);">나주시</a></li>
                                <li><a href="javascript:void(0);">목포시</a></li>
                                <li><a href="javascript:void(0);">순천시</a></li>
                                <li><a href="javascript:void(0);">여수시</a></li>
                            </ul>
                            <ul class="check-dropdown check-dropdown-menu search-goo">
                               <li><a href="javascript:void(0);">서귀포시</a></li>
                                <li><a href="javascript:void(0);">제주시</a></li>
                            </ul>
                        </div>                  
                    </div>
                            
                    <!-- 버튼 -->
                    <div class="checkpage-btn"id="checkpage"><a href="#">Search</a></div>
                </div>
            </div>
        </div>
         <!-- tab-->
    </div>
</header>

<!-- container -->
<div class="container-body background-fff" style="padding-bottom: 50px;">
	<!-- <div class="category-top">
        	<ul>
            	<li class="category-top-selected">전체</li>
                <li>최신순</li>
                <li>인기순</li>
                <li>조회순</li>
                <li>후기순</li>
                <li>거리순</li>
            </ul>
	</div> -->
	<div class="category-top">
        	<ul>
        		<c:if test="${categoryall =='all'}">
	            	<li class="category-top-selected" value="all"><a href="#">전체</a></li>
	            	<li value="newest"><a href="#">최신순</a></li>
	                <li value="like"><a href="#">인기순</a></li>
	                <li value="lookup"><a href="#">조회순</a></li>
	                <li value="review"><a href="#">후기순</a></li>
	                <li value="street"><a href="#">거리순</a></li>
                </c:if>
                <c:if test="${categoryall =='newest'}">
	            	<li value="all"><a href="#">전체</a></li>
	            	<li class="category-top-selected" value="newest"><a href="#">최신순</a></li>
	                <li value="like"><a href="#">인기순</a></li>
	                <li value="lookup"><a href="#">조회순</a></li>
	                <li value="review"><a href="#">후기순</a></li>
	                <li value="street"><a href="#">거리순</a></li>
                </c:if>
                <c:if test="${categoryall =='like'}">
	            	<li value="all"><a href="#">전체</a></li>
	            	<li value="newest"><a href="#">최신순</a></li>
	                <li class="category-top-selected" value="like"><a href="#">인기순</a></li>
	                <li value="lookup"><a href="#">조회순</a></li>
	                <li value="review"><a href="#">후기순</a></li>
	                <li value="street"><a href="#">거리순</a></li>
                </c:if>
                <c:if test="${categoryall =='lookup'}">
	            	<li value="all"><a href="#">전체</a></li>
	            	<li value="newest"><a href="#">최신순</a></li>
	                <li value="like"><a href="#">인기순</a></li>
	                <li class="category-top-selected" value="lookup"><a href="#">조회순</a></li>
	                <li value="review"><a href="#">후기순</a></li>
	                <li value="street"><a href="#">거리순</a></li>
                </c:if>
                <c:if test="${categoryall =='review'}">
	            	<li value="all"><a href="#">전체</a></li>
	            	<li value="newest"><a href="#">최신순</a></li>
	                <li value="like"><a href="#">인기순</a></li>
	                <li value="lookup"><a href="#">조회순</a></li>
	                <li class="category-top-selected" value="review"><a href="#">후기순</a></li>
	                <li value="street"><a href="#">거리순</a></li>
                </c:if>
                <c:if test="${categoryall =='street'}">
	            	<li value="all"><a href="#">전체</a></li>
	            	<li value="newest"><a href="#">최신순</a></li>
	                <li value="like"><a href="#">인기순</a></li>
	                <li value="lookup"><a href="#">조회순</a></li>
	                <li value="review"><a href="#">후기순</a></li>
	                <li class="category-top-selected" value="street"><a href="#">거리순</a></li>
                </c:if>
            </ul>
	</div>
	<div class="container">
    	
        <!-- 나눔-->
		<div class="row margin-10">
			<div class="rows margin-0-auto" id="category-contents">
				<c:forEach var="boardlist" items="${list}" varStatus="status">
				<div class="category-content">
                           <div class="margin-20 shadow-box">
                                <a href="board_detail.nn?board_no=${boardlist.board_no}">
                                    <div class="category-img">
                                        <div class="category-price">
                                            <span>&#8361;&nbsp; ${boardlist.board_account}</span>
                                        </div>
                                        <img id="content_img" ondragstart="content_dragstart(event)" draggable="true" ondrag="content_drag(event)" src="${pageContext.request.contextPath}/resources/upload/${boardlist.board_image_title}" alt="">
                                    </div>
                                    <div class="position-absolute color-o font-13" style="left: 25px; display: block;">
                                    	${boardlist.distance} km
                                    </div>
                                </a>
                                <div class="padding-10">
                                    <h5 class="category-content-title">
                                        <a href="#" target="_blank" class="color-3">
                                            	${boardlist.board_title}
                                        </a>
                                    </h5>
                                    <div class="margin-15 position-relative">
										<div class="category-profile">
                                            <div class="position-relative">
                                                <div class="category-profile-body"></div>
                                                <div class="category-profile-img">
                                                	<a href="profile.nn?member_id=${boardlist.member_id}">
                                                    	<img src="${pageContext.request.contextPath}/resources/upload/${boardlist.member_image}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <h6 class="category-id">
                                            <a href="#" class="color-8">
                                              ${boardlist.member_email}
                                            </a>
                                        </h6>
                                        <div class="category-star">
                                            <h6>
                                                <div class="inline-block color-8">
                                                    <div>★★★★★</div>
                                                </div>
                                                <div class="inline-block color-8">${boardlist.board_like}</div>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </c:forEach>
			</div>                 
		</div>
		<!-- 나눔-->
       
       	<div class="category-paging">
        	<!-- <div class="page-result">19 - 36 of 89 Search Result(s)</div> -->
        	<div class="page-pre">
        		<c:if test="${pg>block}">  <!-- 5>10 : false / 15>10 : true -->
					<a href="board_list.nn?pg=${fromPage-1}&title=${title}&category=${categoryall}&search=${search}&cityName=${cityName}&gooName=${gooName}&latitude=${latitude}&longitude=${longitude}&loc=${loc}">◀</a>	
				</c:if>
				<c:if test="${pg<=block}"> <!-- 5<=10 :true / 15<=10:false -->
					<span style="color:gray">◀</span>
				</c:if>
        	</div>
        	<c:forEach begin="${fromPage}" end="${toPage}" var="i">
				<div class="page-btn page-selected-btn">
				<c:if test="${i==pg}">${i}</c:if>
				<c:if test="${i!=pg}">
					<a href="board_list.nn?pg=${i}&title=${title}&category=${categoryall}&search=${search}&cityName=${cityName}&gooName=${gooName}&latitude=${latitude}&longitude=${longitude}&loc=${loc}">${i}</a>
				</c:if>
				</div>
			</c:forEach>
           
            <div class="page-next">
            	<c:if test="${toPage<allPage}"> <!-- 20<21 : true -->
					<a href="board_list.nn?pg=${toPage+1}&title=${title}&category=${categoryall}&search=${search}&cityName=${cityName}&gooName=${gooName}&latitude=${latitude}&longitude=${longitude}&loc=${loc}">▶</a>
				</c:if>	
				<c:if test="${toPage>=allPage}"> <!-- 21>=21 :true -->
					<span style="color:gray">▶</span>
				</c:if>	
            </div>
        </div>
    </div>
</div>
<!-- container -->
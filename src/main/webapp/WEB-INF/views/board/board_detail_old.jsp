<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 글 상세</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/board_detail.js"></script>
</head>
<div class="container-body">
<input type="hidden" id="user_email" value="${userid}">
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
                                </div>
                                <div class="row">
                                	<h6 class="inline-block width-50">
                                    	<div class="margin-15">
                                        	카테고리&nbsp;&nbsp;>&nbsp;&nbsp; 
                                            ${boardnn.board_category}
                                        </div>
                                    </h6>
                                    <h3 class="inline-block float-right">
                                    	<div class="default-price">
                                        	&#8361;&nbsp;<b>${boardnn.board_account}</b>
                                        </div>
                                    </h3>
                                </div>
                                <div class="detail-info margin-15 font-14">
                                    <div class="row margin-10">
                                    	<div class="inline-block color-8 width-50">기본 작업일</div>
                                        <div class="inline-block text-right float-right">${boardnn.board_term} 일</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- board top box -->
                
                
                <!-- 나눔 글-->
                <div class="row">
                	<!-- star -->
                    <div>
                    	<div class="margin-15 text-center">
                        	<div class="board-detail-star width-100">
                            	<div class="margin-0-auto width-50">
                                	<div>★★★★★</div>
                                </div>
                            </div>
                            <h5>
                            	<b>0</b>&nbsp;
                                개의 평가
                            </h5>
                        </div>
                    </div>
                    <!-- star -->
                    
                    <!-- 나눔설명 -->
                    <div class="margin-30">
                    	<h3>
                        	<b>나눔설명</b>
                        </h3>
                        <div class="shadow-box margin-15">
                        	<div class="board-detail-text font-14">
                            	${boardnn.board_content}<br><br>
                                
                                필독<br>
                                주문시 로고 혹은 간단한 슬로건을 투명한 배경으로된 PNG or PSD파일로 첨부해 주셔야합니다. 투명한 배경의 파일이 없을경우 옵션을 추가해주세요.
                            </div>
                            
                            <div class="board-detail-images text-center">
                            	<iframe src="${boardnn.board_movie_url}"></iframe>
                                <div>
                                	<img src="${pageContext.request.contextPath}/resources/upload/${boardnn.board_image_detail}" alt="">
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
                                    <b>0</b>&nbsp;
                                    개의 평가
                                </h5>
                            </div>
                        </div>
                        <!-- star -->
                        
                        
                        <!-- 댓글 1-->
                        <c:forEach items="${list}" var="i">
                        	<div class="comment">
	                        	<div class="margin-15 shadow-box">
	                            	<div class="detail-comment">
	                                	<div class="detail-comment-img">
	                                    	<img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="" class="border-round">
	                                    </div>
	                                    <div class="detail-comment-text">
	                                    	<div>
	                                        	<a href="#">${i.member_email}</a>
	                                        </div>
	                                        <div class="color-8">
	                                        	${i.check_content}
	                                        </div>
	                                        <div class="margin-10">
	                                        	<h6 class="inline-block color-8">${i.check_date}</h6>
	                                            <div class="inline-block float-right">
	                                            	<div class="comment-star" id="star">
	                                            		<input type="hidden" id="check_score_list" value="${i.check_score}">
	                                                	<script type="text/javascript">
	                                                		if($('#check_score_list').val()==1){
	                                                			$('#star').html('★☆☆☆☆');
	                                                		}else if($('#check_score_list').val()==2){
	                                                			$('#star').html('★★☆☆☆');
	                                                		}else if($('#check_score_list').val()==3){
	                                                			$('#star').html('★★★☆☆');
	                                                		}else if($('#check_score_list').val()==4){
	                                                			$('#star').html('★★★★☆');
	                                                		}else if($('#check_score_list').val()==5){
	                                                			$('#star').html('★★★★★');
	                                                		}else{
	                                                			$('#star').html('★★★★★');
	                                                		}
	                                                		;
	                                                	</script>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="detail-comment detail-comment-seller">
	                                	<div class="detail-comment-img">
	                                    	<img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="" class="border-round">
	                                    </div>
	                                    <div class="detail-comment-text">
	                                    	<div>
	                                        	<a href="#">${user_email}</a>
	                                        </div>
	                                        <div class="color-8">
	                                        	
	                                        </div>
	                                        <div class="margin-10">
	                                        	<h6 class="inline-block color-8">&nbsp;</h6>
	                                            <h6 class="inline-block color-8 float-right">나눔 판매자</h6>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                        <!-- 댓글1 -->
                        
                        <!-- 댓글 폼 -->
                    </div>
                    <div class="comment">
                        	<div class="margin-15 shadow-box">
                            	<div class="detail-comment">
                                	<div class="detail-comment-img">
                                		<!-- 사용자 프로필 사진 가져오기 -->
                                    	<img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="" class="border-round">
                                    </div>
                                    <div class="detail-comment-text">
                                    	<!-- <form action="check_board.nn" method="post"> -->
                                    		<input type="hidden" value="${boardnn.board_no}" id="board_no">
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
	                                                	★★★★★<input type="text" id="check_score" class="form-control" style="width:60px" placeholder="1~10">
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
                            	<a href="#">
                                	<img src="${pageContext.request.contextPath}/resources/images/login-bg-s.jpg" class="border-round" alt="">
                                </a>
                            </div>
                        </div>
                        
                        <!-- 중간 -->
                        <div class="text-center profile-div-middle">
                        	<div>
                            	<h3>사용자 이름 넣기</h3>
                                <div class="margin-10 div-middle">
                                	<a href="#" class="btn btn-info">
                                    	문의
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- 중간 -->
                        
                        <div class="profile-seller-body">
                        	<div class="profile-seller-info">
                            	<div class="row">
                                	<div class="text-left inline-block width-45 color-8 font-14">작업수</div>
                                    <div class="text-right inline-block width-50"><b>0</b>&nbsp;개</div>
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
                                    <div class="text-right inline-block width-50"><b>0</b>&nbsp;시간 전</div>
                                </div>
                            </div>
                            
                            <div class="margin-15 text-left profile-seller-text">
                            	<div class="color-8 font-14">판매자 소개</div>
                                <div class="margin-15 text-left font-14">
                                	유튜브에 '이글파이브'를 검색해주세요.<br>
                                    최고의 프로젝트 입니다.
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                    <!-- 클릭 버튼-->
                    <div class="margin-20 profile-buy">
                    	<a href="#" class="btn btn-block btn-primary">
                        	나눔 요청
                        </a>
                    </div>
                </div>
                
                
                
                
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
                        <div class="category-content">
                            <div class="margin-30 shadow-box">
                                <a href="#">
                                    <div class="category-img">
                                        <div class="category-price">
                                            <span>&#8361;&nbsp;5,000</span>
                                        </div>
                                        
                                        <img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="">
                                    </div>
                                </a>
                                <div class="padding-10">
                                    <h5 class="category-content-title">
                                        <a href="#" target="_blank" class="color-3">
                                            워드프레스를 적용하여 저렴하게 홈페이지를 만들어 드립니다
                                        </a>
                                    </h5>
                                    <div class="margin-15 position-relative">
                                    	<div class="category-profile">
                                            <div class="position-relative">
                                                <div class="category-profile-body"></div>
                                                <div class="category-profile-img">
                                                    <img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="">
                                                </div>
                                            </div>
                                        </div>
                                        <h6 class="category-id">
                                            <a href="#" class="color-8">
                                                TAEHO
                                            </a>
                                        </h6>
                                        <div class="category-star">
                                            <h6>	
                                                <div class="inline-block color-8">
                                                    <div>★★★★★</div>
                                                </div>
                                                <div class="inline-block color-8">(0)</div>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--4개 반복으로 뿌려주기 비슷한-->
                        
                        <!--4개 반복으로 뿌려주기 비슷한-->
                        <div class="category-content">
                            <div class="margin-30 shadow-box">
                                <a href="#">
                                    <div class="category-img">
                                        <div class="category-price">
                                            <span>&#8361;&nbsp;5,000</span>
                                        </div>
                                        
                                        <img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="">
                                    </div>
                                </a>
                                <div class="padding-10">
                                    <h5 class="category-content-title">
                                        <a href="#" target="_blank" class="color-3">
                                            워드프레스를 적용하여 저렴하게 홈페이지를 만들어 드립니다
                                        </a>
                                    </h5>
                                    <div class="margin-15 position-relative">
                                    	<div class="category-profile">
                                            <div class="position-relative">
                                                <div class="category-profile-body"></div>
                                                <div class="category-profile-img">
                                                    <img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="">
                                                </div>
                                            </div>
                                        </div>
                                        <h6 class="category-id">
                                            <a href="#" class="color-8">
                                                TAEHO
                                            </a>
                                        </h6>
                                        <div class="category-star">
                                            <h6>	
                                                <div class="inline-block color-8">
                                                    <div>★★★★★</div>
                                                </div>
                                                <div class="inline-block color-8">(0)</div>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--4개 반복으로 뿌려주기 비슷한-->
                        
                        <!--4개 반복으로 뿌려주기 비슷한-->
                        <div class="category-content">
                            <div class="margin-30 shadow-box">
                                <a href="#">
                                    <div class="category-img">
                                        <div class="category-price">
                                            <span>&#8361;&nbsp;5,000</span>
                                        </div>
                                        
                                        <img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="">
                                    </div>
                                </a>
                                <div class="padding-10">
                                    <h5 class="category-content-title">
                                        <a href="#" target="_blank" class="color-3">
                                            워드프레스를 적용하여 저렴하게 홈페이지를 만들어 드립니다
                                        </a>
                                    </h5>
                                    <div class="margin-15 position-relative">
                                    	<div class="category-profile">
                                            <div class="position-relative">
                                                <div class="category-profile-body"></div>
                                                <div class="category-profile-img">
                                                    <img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="">
                                                </div>
                                            </div>
                                        </div>
                                        <h6 class="category-id">
                                            <a href="#" class="color-8">
                                                TAEHO
                                            </a>
                                        </h6>
                                        <div class="category-star">
                                            <h6>	
                                                <div class="inline-block color-8">
                                                    <div>★★★★★</div>
                                                </div>
                                                <div class="inline-block color-8">(0)</div>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--4개 반복으로 뿌려주기 비슷한-->
                        
                        <!--4개 반복으로 뿌려주기 비슷한-->
                        <div class="category-content">
                            <div class="margin-30 shadow-box">
                                <a href="#">
                                    <div class="category-img">
                                        <div class="category-price">
                                            <span>&#8361;&nbsp;5,000</span>
                                        </div>
                                        
                                        <img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="">
                                    </div>
                                </a>
                                <div class="padding-10">
                                    <h5 class="category-content-title">
                                        <a href="#" target="_blank" class="color-3">
                                            워드프레스를 적용하여 저렴하게 홈페이지를 만들어 드립니다
                                        </a>
                                    </h5>
                                    <div class="margin-15 position-relative">
                                    	<div class="category-profile">
                                            <div class="position-relative">
                                                <div class="category-profile-body"></div>
                                                <div class="category-profile-img">
                                                    <img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="">
                                                </div>
                                            </div>
                                        </div>
                                        <h6 class="category-id">
                                            <a href="#" class="color-8">
                                                TAEHO
                                            </a>
                                        </h6>
                                        <div class="category-star">
                                            <h6>	
                                                <div class="inline-block color-8">
                                                    <div>★★★★★</div>
                                                </div>
                                                <div class="inline-block color-8">(0)</div>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--4개 반복으로 뿌려주기 비슷한-->
                        
                    </div>
                </div>
           		<!-- 비슷한 나눔-->
        </div>
    </div>
</div>


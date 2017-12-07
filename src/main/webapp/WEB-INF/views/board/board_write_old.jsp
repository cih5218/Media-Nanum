<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 등록</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>

<div class="container-body">
	<div class="container">
    	<div class="margin-20 board-write-top">
        	<h2>나눔등록</h2>
        </div>
        <div class="margin-30">
        	<div id="board-write-nav">
            	<div>
                	<ul>
                    	<li>
                        	<a href="#" class="active">
                            	<div class="shadow-box new-list">
                                	<div class="new-list-num">
                                    	<span>
                                        	<b>1</b>
                                        </span>
                                    </div>
                                    <h4 class="margin-left-10">기본사항</h4>
                                </div>
                            </a>
                        </li>
                        <li>
                        	<a href="#">
                            	<div class="shadow-box new-list">
                                	<div class="new-list-num">
                                    	<span>
                                        	<b>2</b>
                                        </span>
                                    </div>
                                    <h4 class="margin-left-10">가격</h4>
                                </div>
                            </a>
                        </li>
                        <li>
                        	<a href="#">
                            	<div class="shadow-box new-list">
                                	<div class="new-list-num">
                                    	<span>
                                        	<b>3</b>
                                        </span>
                                    </div>
                                    <h4 class="margin-left-10">경력 및 연락처</h4>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="new-list-btn margin-15">
                	<a href="#" class="btn btn-primary btn-block">나눔등록</a>
                </div>
            </div>
            
            <!-- section -->
            <div id="board-write-section">
            	<div>
                	<!-- 1 content-->
                	<div class="board-panel board-write1">
                    
                    
                    	<div class="shadow-box new-body">
                        	<div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>나눔 제목</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div>
                                        	<input type="text" class="form-control" placeholder="예) 마음을 담아 재미있고 개성있는 캐리커쳐를 그려 드립니다">
                                        </div>
                                        <h6 class="margin-10">
                                        	<div>최소&nbsp;10&nbsp;글자</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>카테고리</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>상위 카테고리</div>
                                        </h5>
                                    	<div class="margin-10">
                                         <select class="form-control" style="width:40%;">
                                         	<option>선택하세요</option>
                                         	<option>뷰티</option>
                                            <option>스포츠/레져</option>
                                            <option>미디어</option>
                                            <option>예술/공</option>
                                            <option>패션</option>
                                            <option>생활</option>
                                            <option>컴퓨터</option>
                                            <option>문서</option>
                                            <option>기타</option>
                                         </select>
                                     </div>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>이미지 등록</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>상위 카테고리</div>
                                        </h5>
                                    	<div class="margin-10">
                                        	<a href="#">
                                            	<label for="board-image-upload">
                                                	<div class="new-img-main">
                                                    
                                                    </div>
                                                	<img id="board-image-upload" src="" alt="">
                                                </label>
                                                <input name="file" type="file" id="board-image-upload" style="display:none;">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>동영상 등록</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div>
                                        	<input type="text" class="form-control" placeholder="예) 마음을 담아 재미있고 개성있는 캐리커쳐를 그려 드립니다">
                                        </div>
                                        <h6 class="margin-10">
                                        	<div>최소&nbsp;10&nbsp;글자</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div id="">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>재능 설명</h3>
                                        <div class="margin-15">
                                             <span class="new-select">선택</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div>
                                        	<input type="text" class="form-control" placeholder="예) 마음을 담아 재미있고 개성있는 캐리커쳐를 그려 드립니다">
                                        </div>
                                        <h6 class="margin-10">
                                        	<div>최소&nbsp;10&nbsp;글자</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        </div>                       
                        <div>
                        	<div class="board-write-btn">
                            	<div class="margin-30 new-list-btn">
                                	<a href="#" class="btn btn-primary btn-block">
                                    	저장 및 다음단계
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 1 content-->
                    
                    
                    <!-- 2 content-->
                	<div class="board-panel board-write2">
                    
                    
                    	<div class="shadow-box new-body">
                        	<div id="">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>가격 및 시간</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>기본가격</div>
                                        </h5>
                                    	<div class="margin-10">
                                        	<div class="inline-block">&#8361;&nbsp;</div>
                                            <div class="inline-block">
                                            	<input type="number" class="form-control" placeholder="5,000">
                                            </div>
                                        </div>
                                        <h6 class="margin-10">
                                        	<div>기본가격은 5,000원이상 입력해야하며 1,000원단위 만 가능합니다</div>
                                        </h6>
                                        <h5 class="color-8 margin-15">
                                        	<div>기본 작업일</div>
                                        </h5>
                                        <div class="margin-10">
                                            <div class="inline-block">
                                            	<input type="number" class="form-control" placeholder="1">
                                            </div>
                                            <div class="inline-block font-14">&nbsp;일</div>
                                        </div>
                                        <h5 class="color-8 margin-15">
                                        	<div>동시 작업 개수</div>
                                        </h5>
                                        <div class="margin-10">
                                            <div class="inline-block">
                                            	<input type="number" class="form-control" placeholder="10">
                                            </div>
                                            <div class="inline-block font-14">&nbsp;개</div>
                                        </div>
                                        <h5 class="color-8 margin-15">
                                        	<div>기본 수정 횟수</div>
                                        </h5>
                                        <div class="margin-10">
                                            <div class="inline-block">
                                            	<input type="number" class="form-control" placeholder="0">
                                            </div>
                                            <div class="inline-block font-14">&nbsp;회</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        <div>
                        	<div class="board-write-btn">
                            	<div class="margin-30 new-list-btn">
                                	<a href="#" class="btn btn-primary btn-block">
                                    	저장 및 다음단계
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 2 content-->
                    
                    
                    <!-- 3 content-->
                	<div class="board-panel board-write3">
                    
                    
                    	<div class="shadow-box new-body">
                        	<div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>연락 가능번호</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>등록 재능의 연락 가능 번호</div>
                                        </h5>
                                    	<div class="margin-10">
                                        	<input type="text" class="form-control" placeholder="연락처는 숫자만 가능합니다. 예)010-1234-1234">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>문의시간</h3>
                                        <div class="margin-15">
                                             <span class="new-select">선택</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>등록 나눔의 문의 가능 시간</div>
                                        </h5>
                                    	<div class="margin-10 time-selects">
                                        	<div style="width:40%;">
                                            	<select class="form-control">
                                                	<option>선택하세요</option>
                                                    <option>언제나 가능</option>
													<script type="text/javascript">
                                                        for(var i =1 ; i <= 24; i++){
															document.write("<option>" + i +"시 부터 가능</option>");
														}
                                                    </script>
                                                </select>
                                            </div>
                                         	<div style="width:20%;"> ~ </div>
                                            <div style="width:40%;">
                                            	<select class="form-control">
                                                	<option>선택하세요</option>
                                                    <option>언제나 가능</option>
													<script type="text/javascript">
                                                        for(var i =1 ; i <= 24; i++){
															document.write("<option>" + i +"시 까지 가능</option>");
														}
                                                    </script>
                                                </select>
                                            </div>
                                     </div>
                                   </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>판매자 정보</h3>
                                        <div class="margin-15">
                                             <span class="new-select">선택</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>프로필</div>
                                        </h5>
                                        <div class="margin-10">
                                        	<div class="position-relative">
                                            	<div class="text-center">
                                                	<img class="border-round" width="120px" height="120px" src="${pageContext.request.contextPath}/resources/images/login-bg-s.jpg" alt="">
                                                </div>
                                            </div>
                                        </div>
                                        <h5 class="color-8">
                                        	<div>경력사항</div>
                                        </h5>
                                    	<div class="margin-10 shadow-box">
                                        	<div class="new-career-section">
                                            	<div class="row">
                                                	<div class="new-career-left"><b>기간</b></div>
                                                    <div class="new-career-right"><b>내용</b></div>
                                                </div>
                                            </div>
                                            
                                            <!--추가될 부분-->
                                            <div class="new-career-section">
                                            	<div class="row">
                                                	<div class="new-career-left">
                                                        <div class="width-40 inline-block"><input type="number" placeholder="201501"></div>
                                                        <div class="width-13 inline-block text-center"> ~ </div>
                                                        <div class="width-40 inline-block"><input type="number" placeholder="201512"></div>
                                                    </div>
                                                    <div class="new-career-right">
                                                    	<div class="position-relative">
                                                        	<a href="#">삭제</a>
                                                        </div>
                                                        <input type="text" placeholder="ex) 재능 마켓 나눔">
                                                    </div>
                                                    <div class="new-career-plus">
                                                    	<a href="#">
                                                            <div class="color-8">
                                                                <div>
                                                                    + 경력사항 추가
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--추가될 부분-->
                                            
                                        </div>
                                        <h5 class="color-8 margin-30">
                                        	<div>판매자 소개</div>
                                        </h5>
                                    	<div class="margin-10">
                                        	<textarea class="form-control" rows="3" style="margin: 0px -4px 0px 0px; width: 550px; height: 91px;" placeholder="본인을 소개할 수 있는 글귀를 적어주세요.
연락처가 기재되어 있을 시 임의 삭제 처리 될 수 있습니다"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>약속해주세요</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>원활한 재능 거래 문화 형성을 위해 ‘약속’해주세요</div>
                                        </h5>
                                    	<div class="margin-15 board-write-check">
                                        	<div class="shadow-box new-pix-body">
                                            	<div>
                                                	<label>
                                                    	<input type="checkbox" class="agreeCheckbox">
                                                        구매자의 문의사항에 성실하게 응합니다
                                                    </label>
                                                </div>
                                                <div class="margin-5">
                                                	<label>
                                                    	<input type="checkbox" class="agreeCheckbox">
                                                        분쟁이 발생하였을 경우 적극적으로 문제해결에 임합니다
                                                    </label>
                                                </div>
                                                <div class="margin-5">
                                                	<label>
                                                    	<input type="checkbox" class="agreeCheckbox">
                                                        거래 중 연락이 두절 되지 않습니다
                                                    </label>
                                                </div>
                                                <div class="margin-5">
                                                	<label>
                                                    	<input type="checkbox" class="agreeCheckbox">
                                                        재능을 허위나 과장하여 등록하지 않습니다
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="text-center margin-15 font-14">
                                            	<label>
                                                	<input type="checkbox"> 위 약관에 모두 동의합니다
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        <div>
                        	<div class="board-write-btn">
                            	<div class="margin-30 new-list-btn">
                                	<a href="#" class="btn btn-primary btn-block">
                                    	나눔등록
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 3 content-->
                </div>
            </div>
            <!-- section -->
        </div>
    </div>
</div>
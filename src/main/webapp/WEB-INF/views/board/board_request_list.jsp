<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>NANUM 나눠주세요</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/board_request.js"></script>


</head>

<div class="container-body">
       <div class="request-list">
           <!-- 상단 이미지와 버튼-->
           <div class="request-head">
               <div>
                   <div class="row padding-50 text-center">
                       <div class="width-100">
                           <h1 class="request-shadow color-f margin-15">
                               <b>나눠주세요</b>
                            </h1>
                            <h4 class="request-shadow margin-15 color-f">
                               찾으시는 재능이 없으시다면<br>
                                지금 바로 나눠주세요를 요청하세요!
                            </h4>
                            <div class="margin-30">
                               <div class="">
                                   <a href="board_request.nn" class="btn btn-primary request-head-btn">요청하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 등록, 처리, 회원수 -->
            <div class="shadow-box request-acount">
               <div class="container">
                   <div class="row">
                       <div class="inline-block">
                           <div class="text-center">
                               <h4 class="color-8">
                                   현재 등록된 나눠주세요
                                </h4>
                                <h3 class="margin-10">
                                   <b>${requestprogress}</b>&nbsp;건
                                </h3>
                            </div>
                        </div>
                        <div class="inline-block">
                           <div class="text-center">
                               <h4 class="color-8">
                                   완료된 나눠주세요
                                </h4>
                                <h3 class="margin-10">
                                   <b>${requestsuccess}</b>&nbsp;건
                                </h3>
                            </div>
                        </div>
                        <div class="inline-block">
                           <div class="text-center">
                               <h4 class="color-8">
                                   나눔 재능인
                                </h4>
                                <h3 class="margin-10">
                                   <b>${membernumber}</b>&nbsp;명
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- request-container -->
            <div id="request-container" class="container">
               <div class="request-main-title">
                   <div class="width-100">
                       <ul class="request-tab">
                           <li title="my">나의요청</li>
                            <li class="request-tab-selected" title="all">전체</li>
                            <li title="뷰티">뷰티</li>
                            <li title="스포츠/레져">스포츠/레져</li>
                            <li title="미디어">미디어</li>
                            <li title="예술/공예">예술/공예</li>
                            <li title="패션">패션</li>
                            <li title="생활">생활</li>
                            <li title="컴퓨터">컴퓨터</li>
                            <li title="문서">문서</li>
                            <li title="기타">기타</li>
                        </ul>
                       <style type="text/css">
                        
                  </style>
                       
                        <!-- 요청 리스트 반복..jstl-el-->
                        <div class="request-content">
                           <%-- <div class="margin-30">
                               <div class="shadow-box">
                                   <div class="request-content-top">
                                       <div class="row">
                                           <div>
                                               <div class="row">
                                                    <div class="width-45 inline-block">
                                                       <div class="inline-block request-profile">
                                                           <a href="#">
                                                               <img class="border-round" src="${pageContext.request.contextPath}/resources/images/plus.jpg" alt="">
                                                            </a>
                                                        </div>
                                                       <div class="inline-block">
                                                           <a class="request-a" href="#">진우신</a>
                                                        </div>
                                                    </div>
                                                    <div class="width-50 float-right inline-block margin-5">
                                                       <div class="text-right color-8 font-13">
                                                           번역&작성  > 리서치 & 보고서
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <h4 class="margin-10">
                                               <b>웹드라마 OST 제작</b>
                                            </h4>
                                            <h5 class="margin-10 font-13">
                                               <div class="request-text">
                                                   <a href="#">
                                                       화장품 동영상 제작을 요청합니다.<br>
                                                                             기초제품입니다 (스킨,로션, 아이크림, 마스크팩등)<br>
                                          홍보 동영상으로 2분내외로 원합니다.<br>
                                          가격은 1,000,000원에서 1,500,000원 정도입니다.<br>
                                          그래픽 작업도 일부 들어가야 합니다. 모델도 있으면 좋겠습니다.<br>
                                          제가 샘플 동영상을 가지고 있습니다. 별첨에 파일을 첨부했습니다..<br>
                                          다른 동영상도 있습니다. 연락주시면 메일로 보내겠습니다.<br><br>
                                          우선 연락주시면 협의하도록 하겠습니다.<br><br>
                                          감사합니다.<br>
                                         이진원 010-3621-9023

                                                    </a>
                                                </div>
                                                <div class="text-right">
                                                   <a href="#" class="request-a">
                                                       <span>
                                                           더 보기
                                                        </span>
                                                    </a>
                                                </div>
                                            </h5>
                                            <div class="margin-15 request-file">
                                               <div class="inline-block request-profile">
                                                   <a href="#">
                                                     <img class="border-round" src="${pageContext.request.contextPath}/resources/images/main_1.png" alt="">
                                                   </a>
                                                </div>
                                                <div class="inline-block">
                                                    <a class="request-a" href="#">nanum.jpg</a>
                                    </div>
                                            </div>
                                        </div>
                                        <div class="margin-15 request-sal">
                                           <div class="row">
                                                <h4 class="width-50 inline-block">
                                                    <span class="color-8">희망금액</span>&nbsp;&nbsp;
                                                    <b>&#8361;&nbsp; 30,000</b>
                                                </h4>
                                                <div class="text-right inline-block float-right">
                                                    <button class="btn request-head-btn btn-info">
                                                        제안하기
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="request-content-bottom font-13">
                                       <div class="row">
                                           <div class="color-8 width-50 inline-block">
                                               2016-07-16 까지
                                            </div>
                                            <div class="text-right inline-block float-right font-13">
                                               <span class="request-a">0명</span>이&nbsp;제안 했습니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> --%>
                        </div>
                        <!-- 요청 리스트-->
                        
                    </div>
                </div>
            </div>
            
            <!-- request-none   없을때 띄워주기-->
            <div class="request-none margin-30">
               <%-- <div class="shadow-box">
                   <div class="row">
                       <div class="text-center">
                           <img src="${pageContext.request.contextPath}/resources/images/nothing_massage.png" alt="">
                            <h4 class="mar_30">
                               나의 구독 정보가 없습니다
                            </h4>
                        </div>
                    </div>
                </div> --%>
            </div>
            
            
        </div>
    
</div>
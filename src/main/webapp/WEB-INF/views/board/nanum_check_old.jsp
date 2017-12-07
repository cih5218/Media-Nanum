<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 인증 등록</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/resources/js/common.js"></script> --%>
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
                                    <h4 class="margin-left-10">프로필</h4>
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
                                    <h4 class="margin-left-10">나눔인증</h4>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="new-list-btn margin-15">
                	<a href="#" class="btn btn-primary btn-block">나눔인증 등록</a>
                </div>
            </div>
            
            <!-- section -->
            <div id="board-write-section">
            	<div>
                	<form method="" action="">
                    <!-- 1 content-->
                	<div class="board-panel board-write1">
                    
                    
                    	<div class="shadow-box new-body">
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left inline-block">
                                    	<h3>프로필</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>사진</div>
                                        </h5>
                                        <div class="margin-10">
                                        	<div class="position-relative">
                                            	<div class="text-center">
                                                	<img class="border-round" width="120px" height="120px" src="${pageContext.request.contextPath}/resources/images/login-bg-s.jpg" alt="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>이름</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>이름</div>
                                        </h5>
                                    	<div class="margin-10">
                                        <input type="text" class="form-control" name="" style="width:40%;">
                                     </div>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>연락처</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>연락처</div>
                                        </h5>
                                    	<div class="margin-10">
                                        <input type="text" class="form-control" name="" style="width:40%;">
                                     </div>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>나이</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>나이</div>
                                        </h5>
                                    	<div class="margin-10">
                                        <input type="text" class="form-control" name="" style="width:40%;">
                                     </div>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>활동 지역</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    
                                    
                                    	<h5 class="color-8">
                                        	<div>지역 선택</div>
                                        </h5>
                                    	<div class="margin-10">
                                        <input type="text" class="form-control" name="" style="width:40%;">
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
                    <!-- 1 content-->
                
                
                	<!-- 2 content-->
                	<div class="board-panel board-write2">
                    
                    
                    	<div class="shadow-box new-body">
                        	<div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>인증 제목</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>인증 제목</div>
                                        </h5>
                                    	<div class="margin-10">
                                        <input type="text" class="form-control" name="" style="width:40%;">
                                     </div>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>인증 소개</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>인증 소개</div>
                                        </h5>
                                    	<div class="margin-10">
                                        	<textarea class="form-control" rows="3" style="margin: 0px -4px 0px 0px; width: 550px; height: 91px;" placeholder="인증을 소개할 수 있는 글귀를 적어주세요."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>인증 사진</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>인증 사진</div>
                                        </h5>
                                    	<div class="margin-10">
                                        <input type="text" class="form-control" name="" style="width:40%;">
                                     </div>
                                    </div>
                                </div>
                            </div>
                          
                        </div>                       
                        <div>
                        	<div class="board-write-btn">
                            	<div class="margin-30 new-list-btn">
                                	<a href="#" class="btn btn-primary btn-block">
                                    	나눔인증 등록
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 2 content-->
                    </form>
                </div>
            </div>
            <!-- section -->
            
           
        </div>
    </div>
</div>
<!-- 

	@FileName : board_request.jsp
	@Project : NANUM
	

-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 도와주세요</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script src="${pageContext.request.contextPath}/resources/js/board_nav.js"></script>
</head>

<div class="container-body">
	<div class="container">
    	<div class="margin-20 board-write-top top-l">
        	<h2>프로필</h2>
        </div>
        <div class="margin-30">
        	<!-- nav 들어올 자리-->
        	
        	
            <!-- section -->
            <div id="board-write-section">
            	<div>
                	<form method="" action="">
                    <!-- 1 content-->
                	<div class="board-panel board-write1">
                    
                    
                    	<div class="shadow-box new-body">
                    		<!-- 한 단락 시작 -->
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
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
                                        <h6 class="margin-10">
                                        	<div>밝은 사진으로 등록해주세요. (어두우면 무서워요..)</div>
                                        </h6>
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
                                    	<div class="">
                                       		 <input type="text" class="form-control" name="" style="width:40%;">
                                    	</div>
                                    	<h6 class="margin-10">
                                        	<div>이름을 입력해주세요.</div>
                                        </h6>
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
                                    	<div class="">
                                        	<input type="text" class="form-control" name="" style="width:40%;">
                                     	</div>
                                     	<h6 class="margin-10">
                                        	<div>예) 010-1234-5678</div>
                                        </h6>
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
                            <div id="" class="new-section">
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
                                    	<h6 class="margin-10">
                                        	<div>주로 활동하는 곳을 시 / 군 / 구 로 선택해 주세요.</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>나의소개</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div class="">
                                        	<textarea class="form-control" rows="10" style="margin: 0px -4px 0px 0px; width: 550px;" placeholder="간단한 소개 글을 적어주세요."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                        	<div class="board-write-btn">
                            	<div class="margin-30 new-list-btn">
                                	<a href="#" class="btn btn-primary btn-block">
                                    	다음단계
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 1 content-->
                    </form>
                </div>
            </div>
            <!-- section -->
            
        </div>
    </div>
</div>
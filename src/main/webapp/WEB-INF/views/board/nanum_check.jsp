<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 인증 등록</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/GPS.css">
    <script src="${pageContext.request.contextPath}/resources/js/GPS.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/nanum_check.js"></script>
</head>



<div class="container-body">
	<div class="container">
    	<div class="margin-20 board-write-top">
        	<h2>나눔인증</h2>
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
                	<form id="multiform" method="post" action="nanum_checkok.nn" enctype="multipart/form-data">
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
	                                        <div class="position-relative text-center">
	                                        	<label for="member_image">
	                                            	<img id="image_profile" class="border-round" width="120px" height="120px" src="${pageContext.request.contextPath}/resources/images/login-bg-s.jpg" alt="">
	                                            </label>
                                            </div>
                                            <input name="files[0]" type="file" id="member_image" style="display:none">
                                            <!-- 아래가 원본 -->
                                        	<%-- <div class="position-relative">
                                            	<div class="text-center">
                                                	<img class="border-round" width="120px" height="120px" src="${pageContext.request.contextPath}/resources/images/login-bg-s.jpg" alt="">
                                                </div>
                                            </div> --%>
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
                                    	<h3>관심분야</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>카테고리</div>
                                        </h5>
                                    	<div class="margin-10">
                                         <select name="member_category" id="real_member_category" class="form-control" style="width:40%;">
                                         	<option>선택하세요</option>
                                         	<option>뷰티</option>
                                            <option>스포츠/레져</option>
                                            <option>미디어</option>
                                            <option>예술/공예</option>
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
                                    	<h3>이름</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div class="">
                                       		 <input type="text" class="form-control" id="real_member_name" name="member_name" style="width:40%;">
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
                                        	<input type="text" class="form-control" id="real_member_cell" name="member_cell" style="width:40%;">
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
                                        	<input type="text" class="form-control" id="real_member_age" name="member_age" style="width:40%;">
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
	                                        <div id="locationField">
												<input class="form-control" id="autocomplete" name="location_name" type="text">
											</div>
										</div>
                                    	<h6 class="margin-10">
                                        	<div>주로 활동하는 곳을 시 / 군 / 구 로 선택해 주세요.</div>
                                        </h6>
                                        <div class="margin-10">
                                        	<div id="map_canvas" style="width:100%;"></div>
                                        </div>
                                        <div id="controls">
											<input type="radio" name="type" value="establishment" onclick="search()" checked="checked" style="display: none" /> <br />
										</div>
										<div id="listing">
											<table id="results"></table>
										</div>
										<input type="hidden" id="wk" name="wk">
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
                                        	<textarea name="member_about" id="member_about" class="form-control" rows="10" style="margin: 0px -4px 0px 0px; width: 550px;" placeholder="간단한 소개 글을 적어주세요."></textarea>
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
                                        	<div>제목</div>
                                        </h5>
                                    	<div class="margin-10">
                                        <input type="text" class="form-control" id="real_best_title" name="best_title" style="width:40%;">
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
                                        	<div>인증 소개글</div>
                                        </h5>
                                    	<div class="margin-10">
                                        	<textarea name="best_about" id="real_best_about" class="form-control" rows="3" style="margin: 0px -4px 0px 0px; width: 550px; height: 91px;" placeholder="인증을 소개할 수 있는 글귀를 적어주세요."></textarea>
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
                                        <h6 class="margin-10">
                                        	<div>인증 받을 사진정보를 올려 주세요.</div>
                                        </h6>
                                    	<div class="margin-10">
                                            <label for="best_image" class="position-relative">
                                            	<img id="image_best" src="">
                                                <div class="new-img-main">
                                                	<!-- <img id="image_title_input" src=""> -->
                                                </div>
                                            </label>
                                            <input name="files[1]" type="file" id="best_image">
                                        </div>
                                    </div>
                                </div>
                            </div>
                          
                        </div>                       
                        <div>
                        	<div class="board-write-btn">
                            	<div class="margin-30 new-list-btn">
                                	<input type="submit" class="btn btn-primary btn-block" id="check_onclick" value="나눔인증 등록">
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
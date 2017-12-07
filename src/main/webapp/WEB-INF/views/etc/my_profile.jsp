<!-- 

	@FileName : board_request.jsp
	@Project : NANUM
	

-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 프로필 수정</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/GPS.css">
    <script src="${pageContext.request.contextPath}/resources/js/GPS.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/board_nav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/my_profile.js"></script>
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
                	<form id="multiform" method="post" action="my_profile_update.nn" enctype="multipart/form-data">
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
	                                            	<img id="image_profile" class="border-round" width="120px" height="120px" src="${pageContext.request.contextPath}/resources/upload/${membernn.member_image}" alt="">
	                                            </label>
                                            </div>
                                            <input name="files[0]" type="file" id="member_image" style="display:none">
                                            <input name="board_image_title" id="real_member_image" type="hidden" value="${membernn.member_image}">
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
                                         	<option <c:if test="${membernn.member_category == '뷰티'}">selected="selected"</c:if>>뷰티</option>
                                            <option <c:if test="${membernn.member_category == '스포츠/레져'}">selected="selected"</c:if>>스포츠/레져</option>
                                            <option <c:if test="${membernn.member_category == '미디어'}">selected="selected"</c:if>>미디어</option>
                                            <option <c:if test="${membernn.member_category == '예술/공예'}">selected="selected"</c:if>>예술/공예</option>
                                            <option <c:if test="${membernn.member_category == '패션'}">selected="selected"</c:if>>패션</option>
                                            <option <c:if test="${membernn.member_category == '생활'}">selected="selected"</c:if>>생활</option>
                                            <option <c:if test="${membernn.member_category == '컴퓨터'}">selected="selected"</c:if>>컴퓨터</option>
                                            <option <c:if test="${membernn.member_category == '문서'}">selected="selected"</c:if>>문서</option>
                                            <option <c:if test="${membernn.member_category == '기타'}">selected="selected"</c:if>>기타</option>
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
                                       		 <input type="text" class="form-control" id="real_member_name" name="member_name" style="width:40%;" value="${membernn.member_name}">
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
                                        	<input type="text" class="form-control" id="real_member_cell" name="member_cell" style="width:40%;" value="${membernn.member_cell}">
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
                                        	<input type="text" class="form-control" id="real_member_age" name="member_age" style="width:40%;" value="${membernn.member_age}">
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
												<input class="form-control" id="autocomplete" name="location_name" type="text" value="${location.location_name}">
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
										<input type="hidden" id=wedo value="${location.location_wedo}">
										<input type="hidden" id=kyoungdo value="${location.location_kyoungdo}">
										<input type="hidden" name="location_no" value="${location.location_no}">
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
                                        	<textarea name="member_about" id="member_about" class="form-control" rows="10" style="margin: 0px -4px 0px 0px; width: 550px;">${membernn.member_about}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                        	<div class="board-write-btn">
                            	<div class="margin-30 new-list-btn">
                                	<input type="submit" class="btn btn-primary btn-block" id="check_onclick" value="프로필 수정">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 1 content-->
                    <input type="hidden" name="profile" value="${membernn.member_image}">
                    <input type="hidden" name="file_profile" id="file_profile">
                    </form>
                </div>
            </div>
            <!-- section -->
            
        </div>
    </div>
</div>
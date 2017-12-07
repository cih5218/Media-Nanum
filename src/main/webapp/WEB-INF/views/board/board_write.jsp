<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 등록</title>
    <script src="${pageContext.request.contextPath}/resources/js/GPS.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/GPS.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <script src="${pageContext.request.contextPath}/resources/js/board_write.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<style>
	   .ui-datepicker{ font-size: 12px; width: 200px; }
	   .ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
	   .ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
   </style>
    
</head>

<div class="container-body">
	<input type="hidden" id="wedo" value="${location.location_wedo}">
	<input type="hidden" id="kyoungdo" value="${location.location_kyoungdo}">
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
                                    <h4 class="margin-left-10">나눔설명</h4>
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
                                    <h4 class="margin-left-10">가격 및 시간</h4>
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
            	<form id="multiform" action="board_writeOk.nn" method="post" enctype="multipart/form-data">
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
                                        	<input name="board_title" id="real_board_title" type="text" class="form-control" placeholder="예) 마음을 담아 재미있고 개성있는 캐리커쳐를 그려 드립니다">
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
                                         <select name="board_category" id="real_board_category" class="form-control"  style="width:40%;">
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
                            
                            
                            <div id="">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>나눔 지역</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
									<div class="col-right">
										<div id="locationField">
											<input class="form-control" id="autocomplete" name="location_name" type="text" placeholder="상세한 주소를 입력하세요.">
										</div>
										<h6 class="margin-10">
                                        	<div>나눔하는 곳을 상호명 또는 정확한 장소로 선택해 주세요.</div>
                                        </h6>
										<div style="height:30px"></div>
										<div id="map_canvas" style="width:100%;"></div>
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
                                    	<h3>이미지 등록</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>대문사진</div>
                                        </h5>
                                    	<div class="margin-10">
                                            <label for="board_title" class="position-relative">
                                            	<img id="image_title" src="">
                                                <div class="new-img-main">
                                                	<img id="image_title_input" src="">
                                                </div>
                                            </label>
                                            <input name="files[0]" type="file" id="board_title">
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
                                        	<div>상세사진</div>
                                        </h5>
                                        <div class="margin-10">
                                            <label for="board_detail" class="position-relative">
                                            	<img id="image_detail" src="">
                                                <div class="new-img-main">
                                                	<img id="image_title_input" src="">
                                                </div>
                                            </label>
                                            <input name="files[1]" type="file" id="board_detail">
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
                                        	<input name="board_movie_url" id="real_board_movie_url" type="text" class="form-control" placeholder="예) 마음을 담아 재미있고 개성있는 캐리커쳐를 그려 드립니다">
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
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div>
                                        	<textarea name="board_content" id="real_board_content" class="form-control" rows="10" style="margin: 0px -4px 0px 0px; width: 550px;" placeholder="재능의 대한 설명을 작성해주세요."></textarea>
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
                                    	<h3>태그</h3>
                                        <div class="margin-15">
                                             <span class="new-select">선택</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<h5 class="color-8">
                                        	<div>Hash Tag</div>
                                        </h5>
                                    	<div class="margin-10">
                                            <div class="inline-block">
                                            	<input name="tag_name" id="tag_name" type="text" class="form-control" placeholder="#나눔" maxlength="50">
                                            	<input type="hidden" name="tag_name_ok" id="tag_name_ok" value="fail">
                                            </div>
                                        </div>
                                        <h6 class="margin-10">
                                        	<div>여러개를 입력하실 경우 예) #나눔#재능</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        	<div id="" class="new-section">
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
                                            	<input id="real_board_account" type="text" class="form-control" placeholder="5,000">
                                            	<input type="hidden" id="board_account_split" name="board_account">
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
                                            	<input type="number" id="nanumdatepicker" name="board_term" class="form-control" readonly="readonly">
                                            </div>
                                            <div class="inline-block font-14">&nbsp;일</div>
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
                                        	<div class="shadow-box new-pix-body" id="checkSelect">
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
                                                	<input type="checkbox" id="checkAll"> 위 약관에 모두 동의합니다
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
                                	<input type="submit" class="btn btn-primary btn-block" id="check_onclick" value="나눔등록">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 3 content-->
                    </form>
                </div>
            </div>
            <!-- section -->
        </div>
    </div>
</div>

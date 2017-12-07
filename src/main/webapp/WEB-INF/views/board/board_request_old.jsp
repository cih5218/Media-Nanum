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
        	<h2>나눔 요청 등록</h2>
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
                            <div class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>나눔 요청 제목</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div>
                                        	<input type="text" class="form-control" placeholder="예) 마음을 담아 재미있고 개성있는 캐리커쳐를 그려 드립니다">
                                        </div>
                                        <h6 class="margin-10">
                                        	<div>최대글자는&nbsp;30자입니다.&nbsp;(현재&nbsp;0&nbsp;자)</div>
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
                                    	<h3>마감일</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div>
                                        	<input type="text" class="form-control" name="" style="width:40%;" value="..">
                                    	</div>
                                    	<h6 class="margin-10">
                                        	<div>최대글자는 30자입니다. (현재 0 자)</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>희망가격</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div>
                                        	<h6 class="inline-block">&#8361;&nbsp;</h6>
                                            <div class="inline-block">
                                            	<input type="number" class="form-control" placeholder="5,000">
                                            </div>
                                            <h6 class="inline-block">&nbsp;원</h6>
                                        </div>
                                        <h6 class="margin-10">
                                        	<div>희망가격을 잘 입력하셔야 성사 될 가능성이 높습니다.</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="new-section">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>도움 내용</h3>
                                        <div class="margin-15">
                                             <span class="new-must">필수</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div>
                                       	 	<textarea rows="12" class="form-control"></textarea>
                                    	</div>
                                        <h6 class="margin-10">
                                        	<div>최소 30글자 이상 입력해주세요.</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div id="" class="">
                            	<div class="row">
                                	<div class="col-left">
                                    	<h3>도움 내용</h3>
                                        <div class="margin-15">
                                             <span class="new-select">선택</span>
                                         </div>
                                    </div>
                                    <div class="col-right">
                                    	<div>
                                       	 	<input type="file" value="파일 선택">
                                    	</div>
                                        <h6 class="margin-10">
                                        	<div>디자인은 나중에 바꾸기</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                        	<div class="board-write-btn">
                            	<div class="margin-30 new-list-btn">
                                	<a href="#" class="btn btn-primary btn-block">
                                    	요청하기
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
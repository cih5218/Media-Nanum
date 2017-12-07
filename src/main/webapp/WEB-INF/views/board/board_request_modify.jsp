<!-- 

	@FileName : board_request.jsp
	@Project : NANUM
	

-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 도와주세요</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/board_nav.js"></script>
  
    
 
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
	
    
    <style>
	.ui-datepicker{ font-size: 12px; width: 200px; }
	.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
	.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
	</style>
   
</head>

<div class="container-body">
	<div class="container">
    	<div class="margin-20 board-write-top top-l">
        	<h2>나눔 요청 수정</h2>
        </div>
        <div class="margin-30">
        	<!-- nav 들어올 자리-->
        	
            <!-- section -->
            <div id="board-write-section">
            	<div>
                	<form id="frm" method="post" action="board_request_update.nn" class="form">

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
                                        	<input type="text" id="title" name="request_title" class="form-control" value="${reqdata.request_title}">
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
                                         <select class="form-control" id="category" name="request_category" style="width:40%;">
                                         	<option  <c:if test="${reqdata.request_category == '뷰티'}">selected="selected"</c:if>>뷰티</option>
                                            <option  <c:if test="${reqdata.request_category == '스포츠/레져'}">selected="selected"</c:if>>스포츠/레져</option>
                                            <option  <c:if test="${reqdata.request_category == '미디어'}">selected="selected"</c:if>>미디어</option>
                                            <option  <c:if test="${reqdata.request_category == '예술/공연'}">selected="selected"</c:if>>예술/공연</option>
                                            <option  <c:if test="${reqdata.request_category == '패션'}">selected="selected"</c:if>>패션</option>
                                            <option  <c:if test="${reqdata.request_category == '생활'}">selected="selected"</c:if>>생활</option>
                                            <option  <c:if test="${reqdata.request_category == '컴퓨터'}">selected="selected"</c:if>>컴퓨터</option>
                                            <option  <c:if test="${reqdata.request_category == '문서'}">selected="selected"</c:if>>문서</option>
                                            <option  <c:if test="${reqdata.request_category == '기타'}">selected="selected"</c:if>>기타</option>
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
                                        	<input type="text" class="form-control" name="request_term" id="nanumdatepicker" value="${reqdata.request_term}" style="width:40%;" readonly="readonly">
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
                                            	<input type="number" id="account" name="request_account" value="${reqdata.request_account}" class="form-control" placeholder="5,000">
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
                                       	 	<textarea rows="12" id="content" name="request_content" class="form-control">${reqdata.request_content}</textarea>
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
				                    <input type="submit" class="btn btn-primary btn-block" id="btn" value="요청하기">
								 	<input type="hidden" name="member_id" value="${sessionScope.Member.member_id}">
		 						 	<input type="hidden" name="help_no" value="${reqdata.help_no}">
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
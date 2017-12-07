<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NANUM 메시지</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sweetalert.css">
    <script src="${pageContext.request.contextPath}/resources/js/board_nav.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/message.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>
</head>


<div class="container-body">
	<div class="container">
    	<!-- sub page content -->
            <div class="sub-right inline-block">
            	<div class="position-relative">
                	<div class="sub-content-title margin-20">
                    	<h2>메시지</h2>
                    </div>
                    <div class="sub-content-search">
                    	<form method="" action="">
                        	<div class="position-relative">
                            	<input type="text" class="form-control" placeholder="상대방의 닉네임 또는 내용으로 검색">
                                <span>
                                	<input type="image" class="sub-img" src="${pageContext.request.contextPath}/resources/images/search.png" width="20">
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row margin-15">
                	<div class="width-50">
                    	<div class="inline-block inline-block">
                        	<a href="#" class="btn btn-default">전체선택</a>
                        </div>
                        &nbsp;
                        <div class="inline-block">
                        	<a href="#" class="btn btn-primary" id="btn-delete">선택삭제</a>
                        </div>
                    </div>
                    <div class="width-50 text-right new-msg">
                    	<div class="inline-block">
                        	<a href="#" class="btn btn-info">신규 메시지</a>
                        </div>
                    </div>
                </div>
            </div>
        <div class="margin-30">
        	<!-- nav 들어올 자리-->
        	
        	
            <!-- section -->
            <div id="board-write-section">
            	<div>
            		<div>
            			
            			<!-- 메시지가 있을때-->
            		<c:if test="${fn:length(list) > 0}">
            			<div class="shadow-box">
            				<div id="inbox-list">
            					<!-- 반복 뿌리기 -->
            					<c:forEach var="list" items="${list}" varStatus="i">
            					<div class="inbox-list">
            						<div class="inbox-left inline-block">
            							<label class="margin-10 checkbox-inline">
            								<input type="checkbox" id="check" value="${name[i.index].member_id}">
            							</label>
            							<div class="inline-block">
            								<a href="message_detail.nn?Sender=${list.member_sender}&board_no=${list.board_no}">
            									<img class="border-round inbox-profile" src="${pageContext.request.contextPath}/resources/upload/${name[i.index].member_image}" alt="">
            								</a>
            							</div>
            						</div>
            						<div class="inbox-right inline-block float-right">
            							<div>
            								<a class="request-a" href="message_detail.nn?Sender=${list.member_sender}&board_no=${list.board_no}">
            									${list.message_content}
            								</a>
            							</div>
            							<a class="color-3 inbox-content" href="message_detail.nn?Sender=${list.member_sender}&board_no=${list.board_no}">
            								<h5>
            									${name[i.index].member_name}
            								</h5>
            							</a>
            							<h6 class="color-8 text-right margin-5">
            								${list.message_date}
            							</h6>
            						</div>
            					</div>
            					</c:forEach>
            					<!-- 반복 뿌리기 -->
            				</div>
            			</div>
            		</c:if>
            			<!-- 메시지가 있을때 -->
            		
            			<!-- 메시지가 없을때  -->
            		  <c:if test="${fn:length(list) <= 0}">
	                	<div class="shadow-box noting-massage">
	                    	<div class="text-center">
	                        	<img src="${pageContext.request.contextPath}/resources/images/nothing_massage.png" alt="">
	                            <h4 class="margin-15"> 신규 메시지 내역이 없습니다. </h4>
	                        </div>
	                    </div>
	                  </c:if>
	                    <!-- 메시지가 없을때  -->
	                </div>
                </div>
            </div>
            <!-- section -->
            
        </div>
    </div>
</div>